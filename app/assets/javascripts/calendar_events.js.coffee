$(document).ready ->
  window.calendarRendered = false

  $('a[data-toggle="tab"]').on 'shown', (e) ->
    if $(e.target).attr('href') == "#calendar" and !window.calendarRendered
      window.calendarRendered = true
      $('#fullcalendar-container').fullCalendar({
        defaultView: 'agendaWeek'
      })
