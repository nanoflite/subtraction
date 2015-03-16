#= require jquery
#= require mustache
#= require underscore
#= require grid

$ ->
  for i in [1..6]
    if Math.random() > 0.5
      minuend = Math.floor( Math.random() * 1001 )
      while ( ( minuend % 10 ) == 9 )
        minuend = Math.floor( Math.random() * 1001 )

      subtrahend = Math.floor( Math.random() * minuend )
      while ( subtrahend % 10 ) < ( minuend % 10 )
        subtrahend = Math.floor( Math.random() * minuend )
    else
      minuend = Math.floor( Math.random() * 1001 )
      while ( ( minuend % 10 ) == 0 )
        minuend = Math.floor( Math.random() * 1001 )

      subtrahend = Math.floor( Math.random() * minuend )
      while ( subtrahend % 10 ) > ( minuend % 10 )
        subtrahend = Math.floor( Math.random() * minuend )
    grid = new Grid minuend, subtrahend
    $('#app').append grid.draw()

