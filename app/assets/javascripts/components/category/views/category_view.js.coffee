class Application.Components.Category.Views.CategoryView extends Application.View
  tagName: 'tr'

  events: 
    'change .js--select': 'select'

  spellingTasksSelector: '.js--spelling-tasks'
  
  initialize: (attributes) =>
    @attributes = attributes
    if @attributes?.state is 'is-new'
      @template = _.template("
        <td><input type='text' placeholder='Kurztitel' class='js--short-title form-control input-md'></input></td>
        <td><input type='text' placeholder='Titel ausführlich' class='js--title form-control input-md'></input></td>
        <td><input type='text' placeholder='Antwortmöglichkeiten (durch Komma getrennt)' class='js--response-options form-control input-md'></input></td>
        <td><input type='text' placeholder='Anzahl der Aufgaben' class='js--amount form-control input-md'></input></td>
        <td><input type='text' placeholder='Beschreibung' class='js--description form-control input-md'></input></td>
        <td><button class='js--save btn btn-primary' data-id='<%= id %>' data-type='topic'>Hinzufügen</button></td>
      ")
    else
      @template = _.template("
        <td><div contenteditable class='category-attribute js--short-title'><%= short_title %></div></td>
        <td><div contenteditable class='category-attribute js--title'><%= title %></div></td>
        <td><div contenteditable class='category-attribute js--response-options'><%= response_options %></div></td>
        <td><div contenteditable class='category-attribute js--amount'><%= amount %></div></td>
        <td><div contenteditable class='category-attribute js--description'><%= description %></div></td>
        <td><button class='js--destroy btn btn-danger' data-id='<%= id %>'>Löschen</button></td>
        <td><button class='js--save btn btn-success' data-id='<%= id %>' data-type='category'>Speichern</button></td>
      ")

  getRenderData: =>
    @attributes  

  afterRender: =>
    @$('.js--save').on 'click', @save
    @$('.js--destroy').on 'click', @destroy

  save: (event) =>
    event.preventDefault()

    id = $(event.currentTarget).data('id')
    type = $(event.currentTarget).data('type')
    shortTitle = if type == 'topic' then @$('.js--short-title').val() else @$('.js--short-title').html()
    title = if type == 'topic' then @$('.js--title').val() else @$('.js--title').html()
    amount = if type == 'topic' then @$('.js--amount').val() else @$('.js--amount').html()
    description = if type == 'topic' then @$('.js--description').val() else @$('.js--description').html()
    responseOptions = if type == 'topic' then @$('.js--response-options').val() else @$('.js--response-options').html()
    
    url = if type == 'topic' then "/api/categories" else "/api/categories/#{id}"

    category = {}
    category.topic_id = id if type == 'topic' 
    category.short_title = shortTitle
    category.title = title
    category.amount = amount
    category.description = description
    category.response_options = if responseOptions then responseOptions.split(',') else []

    $.ajax(
      url: url
      type: if type == 'topic' then 'POST' else 'PUT'
      dataType: 'json'
      data: 
        category: category
          
    ).done (response) =>
      @$('.js--error').remove()  
      @$('.has-error').removeClass('has-error')
      $errorElement = $("<em class='help-block js--error'></em>")
      if response.errors
        @$('.js--short-title').parent().addClass('has-error').append($errorElement.clone().html(response.errors.short_title[0])) if response.errors.short_title
        @$('.js--title').parent().addClass('has-error').append($errorElement.clone().html(response.errors.title[0])) if response.errors.title
        @$('.js--response-options').parent().addClass('has-error').append($errorElement.clone().html(response.errors.response_options[0])) if response.errors.response_options
        @$('.js--amount').parent().addClass('has-error').append($errorElement.clone().html(response.errors.amount[0])) if response.errors.amount
      else
        @trigger 'add:category'
  
  select: (event) =>
    $target = $(event.currentTarget)
    categoryId = $target.val()
    @$(@spellingTasksSelector).html('')

    return unless categoryId
    
    view = new Application.Components.SpellingTask.Views.SpellingTaskView({id: categoryId, state: 'is-new'})
    @$(@spellingTasksSelector).append(view.render().el)
    @listenTo view, 'add:spellingTask', => @select(event)

    $.ajax(
      url: "/api/category_spelling_tasks/#{categoryId}"
      type: 'GET'
      dataType: 'json'
    ).done (response) =>
      _.each response.spelling_tasks, (spelling_task) =>
        view = new Application.Components.SpellingTask.Views.SpellingTaskView(spelling_task)
        @$(@spellingTasksSelector).append(view.render().el)
  
  destroy: (event) =>
    event.preventDefault()
    
    id = $(event.currentTarget).data('id')
    $.ajax(
      url: "/api/categories/#{id}"
      type: 'DELETE'
      dataType: 'json'
    ).done (response) => 
      @remove()
