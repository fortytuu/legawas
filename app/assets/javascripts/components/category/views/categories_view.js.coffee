class Application.Components.Category.Views.CategoriesView extends Backbone.View
  initialize: =>
    @topicId = @$el.data('id')
    
    @render()

  render: =>
    @$el.html('')
    
    view = new Application.Components.Category.Views.CategoryView({id: @topicId, state: 'is-new'})
    @$el.append(view.render().el)
    
    @listenTo view, 'add:category', @render

    $.ajax(
      url: "/api/topic_categories/#{@topicId}"
      type: 'GET'
      dataType: 'json'  
    ).done (response) =>
      _.each response.categories, (category) =>
        view = new Application.Components.Category.Views.CategoryView(category)
        @$el.append(view.render().el)
