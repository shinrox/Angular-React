
# =============================================
# Modules
# =============================================
angular.module 'HolmesAngularReact.controllers' , []
angular.module 'HolmesAngularReact.filters'     , []
angular.module 'HolmesAngularReact.factories'   , ['oitozero.ngSweetAlert']
angular.module 'HolmesAngularReact.constants'   , []
angular.module 'HolmesAngularReact.services'    , []
angular.module 'HolmesAngularReact.directives'  , []
angular.module 'HolmesAngularReact.mocks'       , []
angular.module 'HolmesAngularReact.i18n'        , []
angular.module 'HolmesAngularReact.configs'     , ['angular-loading-bar']
angular.module 'HolmesAngularReact.providers'   , []
angular.module 'HolmesAngularReact.values'      , []



# =============================================
# Scripts Module
# =============================================
angular.module 'HolmesAngularReact.scripts'     , [
  'HolmesAngularReact.controllers'
  'HolmesAngularReact.constants'
  'HolmesAngularReact.filters'
  'HolmesAngularReact.factories'
  'HolmesAngularReact.services'
  'HolmesAngularReact.directives'
  'HolmesAngularReact.mocks'
  'HolmesAngularReact.i18n'
  'HolmesAngularReact.providers'
  'HolmesAngularReact.values'
  'HolmesAngularReact.configs'
]


# =============================================
# Main Module
# =============================================
angular.module 'HolmesAngularReact', [
  'ngAnimate'
  'ngCookies'
  'ngTouch'
  'ngSanitize'
  'ngResource'
  'ui.router'
  'ui.bootstrap'
  'pascalprecht.translate'
  'oitozero.ngSweetAlert'
  'HolmesAngularReact.scripts'

  'ui.grid'
  'ui.grid.expandable'
  'ui.grid.treeView'
  'ngToast'
  'angular-loading-bar'
  'ng-context-menu'
  'react'

  'ng.shims.placeholder'
  ]