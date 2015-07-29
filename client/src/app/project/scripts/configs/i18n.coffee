'use strict'

# =============================================
# Module
# =============================================
angular.module 'HolmesAngularReact'

  # =============================================
  # App Config
  # =============================================
  .config [ '$translateProvider', ($translateProvider) ->

    $translateProvider.addInterpolation('$translateMessageFormatInterpolation')
    $translateProvider.useMissingTranslationHandlerLog()
    $translateProvider.useSanitizeValueStrategy('escaped')
    # $translateProvider.preferredLanguage('pt-BR')

  ]
