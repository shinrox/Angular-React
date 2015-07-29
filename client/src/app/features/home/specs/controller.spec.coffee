'use strict'

# =============================================
# HomeController
# =============================================
describe '\nController: HomeController\n', ()->

  # =============================================
  # Import modules
  # =============================================
  beforeEach module('ui.router')
  beforeEach module('HolmesAngularReact.scripts')


  # =============================================
  # Variables
  # =============================================
  $scope         = null
  HomeCtrl = null

  # =============================================
  # Inject dependencies
  # =============================================
  beforeEach inject ($controller, $rootScope) ->
    $scope = $rootScope.$new()
    HomeCtrl = $controller 'HomeCtrl',
      $scope   : $scope





