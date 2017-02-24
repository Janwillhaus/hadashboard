class Dashing.Haweather extends Dashing.Widget
  constructor: ->
    super
    @_icons =
      rain: '&#xe009',
      snow: '&#xe036',
      sleet: '&#xe003',
      wind: '&#xe021',
      fog: '&#xe01b',
      cloudy: '&#xe000',
      clear_day: '&#xe028',
      clear_night: '&#xe02d',
      partly_cloudy_day: '&#xe001',
      partly_cloudy_night: '&#xe002'

  @accessor 'climacon', ->
    new Batman.TerminalAccessible (attr) =>
      @_icons[attr]

  @accessor 'now_temp',
    get: -> if @_temp then Math.floor(@_temp) else 0
    set: (key, value) -> @_temp = value

  @accessor 'precipintensity',
    get: -> if @_precipintensity then Math.round(@_precipintensity) else 0 
    set: (key, value) -> @_precipintensity = value

  @accessor 'precip',
    get: -> if @_precip then Math.round(@_precip) else 0 
    set: (key, value) -> @_precip = value

  @accessor 'pressure',
    get: -> if @_pressure then Math.round(@_pressure) else 0 
    set: (key, value) -> @_pressure = value

  @accessor 'humidity',
    get: -> if @_humidity then Math.round(@_humidity) else 0 
    set: (key, value) -> @_humidity = value

  ready: ->
    if @get('bgcolor')
      $(@node).css("background-color", @get('bgcolor'))

  onData: (data) ->
