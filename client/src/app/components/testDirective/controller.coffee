angular.module "HolmesAngularReact.controllers"
.controller "TestDirectiveCtrl", ($scope, $element) ->
  ##################################
  ## Init
  ##################################


  # function passed to React Component to be called when something changed internally by the component
  $scope.changed = (state)->
    $.extend true, $scope, state
    $scope.$apply()

  # Render on directive load
  React.render ReactFactories.ParentComponent($scope), $element[0]

  $scope.$watch 'value', (v1, v2)->
    # Re-render after model has changed from interaction inside angular
    React.render ReactFactories.ParentComponent($scope), $element[0]

