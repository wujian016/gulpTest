###
countdown = 10
h = setInterval (->countdown--), 100
do (->) until countdown is 0
clearInterval h
console.log 'surperice'
###
countdown = 15
decreat = ->
 countdown--
 console.log countdown
 if countdown is 0
  clearInterval h
  console.log 'superice'
h = setInterval decreat, 100