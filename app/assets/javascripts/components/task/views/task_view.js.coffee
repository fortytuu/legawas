class Application.Components.Task.TaskView extends Backbone.View
  events:
    'click .js--check': 'check'

  initialize: ->
    $('[data-toggle="popover"]').popover()

  check: (event) =>
    @$('.js--check').addClass('disabled')
    $target = $(event.target)
    if $target.hasClass('is-true')
      $target.addClass('btn-success')
      @incrementSessionStorage('success-score')
    else
      $target.addClass('btn-danger')
      @$('.is-true').addClass('btn-success')
      @incrementSessionStorage('failure-score')

    @$('.js--next').fadeIn()
    @showScore() if @$('.js--score').length
    @$('.js--fill-in-text').hide()
    @$('.js--solution-text').fadeIn()

  showScore: ->
    @$('.js--success-score').html("Richtig: #{window.sessionStorage.getItem('success-score')}")
    @$('.js--failure-score').html("Noch üben: #{window.sessionStorage.getItem('failure-score')}")
    @$('.js--score').fadeIn()
    @$('.js--progress').css('width', '100%').html('100%')
    swal("Punkte", "Richtig: #{}" + window.sessionStorage.getItem('success-score') + "\n" + "Noch üben: " + window.sessionStorage.getItem('failure-score'))


  incrementSessionStorage: (key) ->
    score = window.sessionStorage.getItem(key)
    window.sessionStorage.setItem(key, parseInt(score) + 1)
