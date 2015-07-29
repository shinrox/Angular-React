angular.module "HolmesAngularReact.directives"
  .directive "testDirective", () ->
    restrict: "EA"
    scope: {
      value: "="
    }
    controller: 'TestDirectiveCtrl'