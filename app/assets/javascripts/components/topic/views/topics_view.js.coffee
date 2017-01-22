class Application.Components.Topic.Views.TopicsView extends Backbone.View
  initialize: =>
    @render()

  render: =>
    @$el.html('')

    view = new Application.Components.Topic.Views.TopicView({state: 'is-new'})
    @$el.append(view.render().el)

    @listenTo view, 'add:topic', @render

    $.ajax(
      url: "/api/topics/"
      type: 'GET'
      dataType: 'json'
    ).done (response) =>
      _.each response.topics, (topic) =>
        view = new Application.Components.Topic.Views.TopicView(topic)
        @$el.append(view.render().el)
