angular.module('myApp', []) 
.directive('myDirective',->
  return {
  	restrict:'A'
  	replace:true
  	scope:
  	 myUrl:'@someAttr'
  	 myLinkText:'@'
  	template:'<a href="{{myUrl}}">{{myLinkText}}</a>'
  })
 
	