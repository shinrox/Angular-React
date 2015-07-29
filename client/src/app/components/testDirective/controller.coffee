angular.module "HolmesAngularReact.controllers"
.controller "TestDirectiveCtrl", ($scope, $element, $attrs, $state, $modal, $rootScope, hAlert, $timeout) ->
  ##################################
  ## Init
  ##################################
  # console.log ReactComponents
  # console.log TestComponent, React


  $scope.changed = (state)->
    $.extend true, $scope, state
    $scope.$apply()


  React.render ReactFactories.ParentComponent($scope), $element[0]

  $scope.$watch 'value', (v1, v2)->
    React.render ReactFactories.ParentComponent($scope), $element[0]

