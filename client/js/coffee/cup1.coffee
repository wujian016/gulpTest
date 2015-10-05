class Pet
 constructor: -> @isHungry = true
 eat: -> @isHungry = false
class Dog extends Pet
 eat: ->
   console.log '*crunch crunch*'
   super()
 featch: ->
  console.log 'Yip, Yip'
  @isHungry = true
