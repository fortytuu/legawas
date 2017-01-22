class Application.Components.Topic.Views.TopicView extends Application.View
  tagName: 'tr'
  className: 'js--topic form-group'

  initialize: (attributes) =>
    @attributes = attributes
    if @attributes?.state is 'is-new'
      @template = _.template("
        <td><input type='text' placeholder='Titel' class='js--title form-control input-md'></input></td>
        <td><input type='text' placeholder='Beschreibung' class='js--description form-control input-md'></input></td>
        <td><button class='js--add btn btn-primary'>Hinzufügen</button></td>
      ")
    else
      @template = _.template("
        <td><%=title %></td>
        <td><%=description %></td>
        <td><button class='js--destroy btn btn-danger' data-id='<%= id %>'>Löschen</button></td>
      ")

  getRenderData: =>
    @attributes

  afterRender: =>
    console.log("Topic afterRender")
    @$('.js--add').on 'click', @add
    @$('.js--destroy').on 'click', @destroy

  add: (event) =>
    event.preventDefault()

    id = $(event.currentTarget).data('id')
    solutionText = @$('.js--title').val()
    fillInText = @$('.js--description').val()
    $.ajax(
      url:"/api/topics"
      type: 'POST'
      dataType: 'json'
      data:
        topic:
          title: solutionText
          description: fillInText
          category_id: id
    ).done (response) =>
      @$('.js--error').remove()
      @$('.has-error').removeClass('has-error')
      $errorElement = $("<em class='help-block js--error'></em>")
      if response.errors
        if response.errors.description
          @$('.js--description').parent().addClass('has-error').append($errorElement.clone().html(response.errors.description[0]))

        if response.errors.title
          @$('.js--title').parent().addClass('has-error').append($errorElement.clone().html(response.errors.title[0]))
      else
        @trigger 'add:topic'

  destroy: (event) =>
    if confirm("Willst du das Topic wirklich löschen? Alle Kategorien und Aufgaben werden damit auch entfernt!")
      event.preventDefault()

      id = $(event.currentTarget).data('id')
      $.ajax(
        url: "/api/topics/#{id}"
        type: 'DELETE'
        dataType: 'json'
      ).done (response) =>
        @remove()
