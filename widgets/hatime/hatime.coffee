class Dashing.Hatime extends Dashing.Widget
  constructor: ->
    super
    @queryState()

  parseTime: (date) ->

    locale = 'en-US'
    if navigator.languages?
      locale = navigator.languages[0]
    if @get('locale')
      locale = @get('locale')

    timeoptions = {hour: '2-digit', minute: 'numeric'}
    date.toLocaleTimeString(locale, timeoptions)


  @accessor 'value',
    get: -> @parseTime(@_value)
    set: (key, value) -> @_value = new Date(value)

  queryState: ->
    $.get '/homeassistant/sensor',
      widgetId: @get('id'),
      deviceId: @get('device')
      (data) =>
        json = JSON.parse data
        @set 'value', json.value

  ready: ->
    if @get('bgcolor')
      $(@node).css("background-color", @get('bgcolor'))

  onData: (data) ->
