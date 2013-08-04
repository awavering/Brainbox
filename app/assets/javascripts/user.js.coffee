$(document).ready ->
  $('.easylogin').change (event) ->
    option = $('option[value='+$(this).val()+']')
    $('#user_email').val(option.attr('data-email'))
    $('#user_password').val(option.attr('data-pw'))

$(document).on 'click', '.row-user', (event) ->
  id = $(this).data('id')
  $.ajax({
    url: '/admin/users/'+id,
    success: (data) ->
      $('#show-user-modal').html(data)
      $('#show-user-modal').modal('show')
  })

$(document).on 'click', '.add-user', (event) ->
  role = $(this).data('user-type')
  console.log('clicked')
  $.ajax({
    url: '/admin/users/new',
    success: (data) ->
      $('#new-user-modal').html(data)
      $('#new-user-modal').modal('show')
  })