class Dashing.Clock extends Dashing.Widget

  ready: ->
    if @get('bgcolor')
      $(@node).css("background-color", @get('bgcolor'))
    setInterval(@startTime, 500)

  startTime: =>
    today = new Date()

    locale = 'en-US'
    if navigator.languages?
      locale = navigator.languages[0]
    if @get('locale')
      locale = @get('locale')

    dateoptions = {weekday: 'long', year: 'numeric', month: 'numeric', day: 'numeric'}
    timeoptions = {hour: '2-digit', minute: 'numeric'}

    @set('date', today.toLocaleDateString(locale, dateoptions))
    @set('time', today.toLocaleTimeString(locale, timeoptions))

