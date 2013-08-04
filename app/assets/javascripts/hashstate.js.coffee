# a simple key-value hash
((brainbox, $) ->
  brainbox.ui ||= {}

  brainbox.ui.hashstate = {
    initialize: () ->
      brainbox.ui.hashstate.bindEventHandlers()

      # trigger hashchange event
      $(window).hashchange()

    getHash: () ->
      hashString = window.location.hash.substring(1)
      if(hashString == "")
        return {}
      hash = {}
      $.each(hashString.split('&'), (index, value) ->
        parts = value.split('=')
        hash[parts[0]] = parts[1]
      )
      return hash

    setHash: (hash) ->
      string = ""
      $.each(hash, (key, val) ->
        string += key + "=" + val + "&"
      )
      window.location.hash = "#" + string.substring(0, string.length - 1)

    get: (key) ->
      return brainbox.ui.hashstate.getHash()[key]

    set: (params) ->
      hash = brainbox.ui.hashstate.getHash()
      $.each(params, (key, val) ->
        hash[key] = val
      )
      brainbox.ui.hashstate.setHash(hash)

    reset: () ->
      brainbox.ui.hashstate.setHash({})

    bindEventHandlers: () ->
      # on hashchange, respond
      $(window).hashchange ()->
        brainbox.ui.hashstate.respond()

      # change hash on clicking an a or button with class hash-change and data-hash-change
      $(document).on 'click', 'a.hash-change, button.hash-change', (evt) ->
        parts = $(this).data('hash-change').split(':')
        obj = {}
        obj[parts[0]] = parts[1]
        brainbox.ui.hashstate.set(obj)

    # define how the UI should be adjusted for each key in the hash
    respond: () ->
      $.each(brainbox.ui.hashstate.getHash(), (key, val) ->
        switch key
          when 't' then brainbox.ui.main.selectTab(val)
      )
  }
)( window.brainbox = window.brainbox || {}, jQuery )

$(document).ready ->
  window.brainbox.ui.hashstate.initialize()