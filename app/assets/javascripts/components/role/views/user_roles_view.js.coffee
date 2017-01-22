class Application.Components.Role.UserRolesView extends Backbone.View
  events:
    'click .js--check': 'check'

  check: (event) =>
    roles = []

    _.each @$('.js--role:checked'), (element) =>
      roles.push($(element).val())

    $.ajax(
      url: "/api/user_roles/#{@$el.data('id')}",
      type: 'PUT',
      dataType: 'json',
      data:
        user:
          roles: if roles.length then roles else ['']
    ).done =>
      console.log "DONE"
