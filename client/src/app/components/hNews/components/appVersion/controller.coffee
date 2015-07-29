angular.module 'HolmesAngularReact.controllers'
.controller "AppVersionCtrl", ($scope, $document, $timeout, $element)->
  $element.on 'click', (ev)->
    ev.stopPropagation()

  closeSelf = (ev)->
    if $scope.open
      $scope.open = false
      $scope.$apply()


  $element.on '$destroy', ->
    $document.off 'click', closeSelf
    $scope.$apply()

  $timeout ->
    $document.on 'click', closeSelf

