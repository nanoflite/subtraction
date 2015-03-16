class Grid

  constructor: (@minuend, @subtrahend ) ->

  draw: ->
    template = $('#grid_tpl').html()
    Mustache.parse(template)
    data =
      minuend: @minuend
      subtrahend: @subtrahend
      md: @_d(@minuend)
      mh: @_h(@minuend)
      mt: @_t(@minuend)
      me: @_e(@minuend)
      sd: @_d(@subtrahend)
      sh: @_h(@subtrahend)
      st: @_t(@subtrahend)
      se: @_e(@subtrahend)
    Mustache.render( template, data );

  _d: (n) ->
    return "" if n < 1000

    m = n % 1000
    ( n - m ) / 1000

  _h: (n) ->
    return "" if n < 100

    n = n % 1000
    m = n % 100
    ( n - m ) / 100

  _t: (n) ->
    return "" if n < 10

    n = n % 1000
    n = n % 100
    m = n % 10
    ( n - m ) / 10

  _e: (n) ->
    n = n % 1000
    n = n % 100
    m = n % 10
    m

window.Grid = Grid
