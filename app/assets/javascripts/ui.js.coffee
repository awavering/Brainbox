$(document).ready ->
  # add tooltip to feedback button
  $("#feedback-button").tooltip()

  # on showing the feedback modal, focus on its textarea
  $('#feedback').on 'shown', () ->
    $('#feedback_textarea').focus()

  # enable any datetime pickers
  $('.datetime-picker').datetimepicker {
      language: 'en',
      pick12HourFormat: true
    }

  # mark active section
  if window.ui
    $(".nav-list").find('a').parent('li').removeClass('active')
    elt = $(".nav-list").find("a[href^='"+window.ui['activeSection']+"']").parent('li')
    if elt.length != 0
      $(elt).addClass('active')
    else if(window.location.pathname == '/')
      $(".nav-list").find("a[href='/']").parent('li').addClass('active')

# application-wide UI functions

# level is: 'success', 'warning', 'error', or 'info'
window.showAlert = (level, notice) ->
  if ['success', 'error', 'info'].indexOf(level) >= 0
    class_to_add = 'alert-'+level
  else if level == 'warning'
    class_to_add = 'alert-box'
  else
    return

  alert_class = 'alert ' + class_to_add

  # assemble the alert
  elt = "<div class='"+alert_class+"'><button type='button' class='close' data-dismiss='alert'>&times;</button>"+notice+"</div>"

  $('#application-alert-container').append(elt)

((brainbox, $) ->
  brainbox.ui ||= {}

  brainbox.ui.main = {
    initialize: () ->
      if(document.title == "")
        document.title = "Brainbox"

    selectTab: (tabCode) ->
      tab = $("*[data-tab-code='"+tabCode+"']").first()
      if(!tab.parent().hasClass('active'))
        $('div.tab-pane').removeClass('fade in')
        $(tab).click()
        $('div.tab-pane').addClass('fade')
        $('div.tab-pane.active').addClass('in')
  }
)( window.brainbox = window.brainbox || {}, jQuery )

window.brainbox.ui.main.initialize()