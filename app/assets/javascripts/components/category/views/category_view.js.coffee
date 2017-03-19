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
        <td><div class='category-attribute'><%= short_title %></div></td>
        <td><div class='category-attribute'><%= title %></div></td>
        <td><div class='category-attribute'><%= response_options.map(function(o) { return o['name'] }).join() %></div></td>
        <td><div class='category-attribute'><%= amount %></div></td>
        <td><div class='category-attribute'><%= description %></div></td>
        <td><a class='btn btn-success' href=/topics/<%= topic_id %>/categories/<%= id %>/edit>Bearbeiten</a></td>
        <td><button class='js--destroy btn btn-danger' data-id='<%= id %>'>Löschen</button></td>
      ")

  getRenderData: =>
    @attributes

  afterRender: =>
    @$('.js--destroy').on 'click', @destroy

  select: (event) =>
    $target = $(event.currentTarget)
    categoryId = $target.val()
    @$(@spellingTasksSelector).html('')

    return unless categoryId

    view = new Application.Components.SpellingTask.Views.SpellingTaskView(id: categoryId, state: 'is-new')
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
