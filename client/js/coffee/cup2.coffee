class Shape
 constructor: (@width)->
 computeArea: -> throw new Error('I am a abstract class')
class Square extends Shape
  computeArea: -> Math.pow @width,2
showArea = (shape) ->
 unless shape instanceof Shape
  throw new Error('showArea requires a Shape instance')
 console.log shape.computeArea()
showArea new Square(2)