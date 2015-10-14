angular.module('myApp', ['ngRoute'])
.config(($routeProvider)->
	$routeProvider.when('/',{
		controller: 'WelcomeController',
		template: 'views/welcome.html'
	})
).config((ConnectionProvider)-> 
	ConnectionProvider.setApiKey('SOME_API_KEY')
).provider('Connection', {
		xkey : 'unknow'
		setApiKey : (nkey)->
			@xkey = nkey
		$get : ()->
			that = this
			return { 
				showAlert : ()->
					window.alert(that.xkey)
			}
	}
).controller('myControle',($scope,Connection)->
	$scope.test = ()->
		Connection.showAlert()
		return
)