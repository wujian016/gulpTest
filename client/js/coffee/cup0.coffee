class Tribble
 constructor: ->
  @isAlive = true
  Tribble.count++

 breed: -> new Tribble if @isAlive
 die: ->
  Tribble.count-- if @isAlive
  @isAlive = false

 @count: 0
 @makeTrouble: -> console.log('Trouble!' for i in [0..@count]).join(' ')