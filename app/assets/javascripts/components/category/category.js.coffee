#= require_self
#
#= require_tree ./views

Application.Components.Category =
  Views: {}

$ ->
  $('.js--reset-session-storage').click ->
    window.sessionStorage.setItem('success-score', 0)
    window.sessionStorage.setItem('failure-score', 0)

  $('.js--category').each (index, el) ->
    new Application.Components.Category.Views.CategoryView(el: el)

  $('.js--categories').each (index, el) ->
    new Application.Components.Category.Views.CategoriesView(el: el)
