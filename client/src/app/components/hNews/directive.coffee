angular.module 'HolmesAngularReact.directives'
.directive 'hNews', ->
  restrict: 'AE'
  scope:
    open: "="
  templateUrl: "app/components/hNews/template.html"
  controller: 'HNewsCtrl'