class Dashing.Hatext extends Dashing.Widget
  constructor: ->
    super
    @queryState()

  @accessor 'value',
    get: -> @_value
    set: (key, value) -> @_value = value

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
