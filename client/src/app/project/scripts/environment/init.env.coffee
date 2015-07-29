$(document).ready ->
  window.HolmesAngularReactEnv or= {}
  setupData              = {}
  waitForSetup           = false
  hasHash                = window.location.search.indexOf('hash') > -1
  hasOpcCodigo           = window.location.search.indexOf('opc_codigo') > -1
  hasCompany             = window.location.search.indexOf('company') > -1
  hasUrl                 = window.location.search.indexOf('url') > -1
  HolmesAngularReactEnv = window.HolmesAngularReactEnv

  # Verifica query parameters
  if hasHash and hasOpcCodigo
    hash       = /hash=([^&]*)?/g.exec(window.location.search)[1]
    opc_codigo = /opc_codigo=([^&]*)?/g.exec(window.location.search)[1]

  if hasCompany and hasUrl
    setupData =
      company: /company=([^&]*)?/g.exec(window.location.search)[1]
      url: decodeURIComponent(/url=([^&]*)?/g.exec(window.location.search)[1])

    waitForSetup = true

  getSetup = ->
    $.ajax({
      type : "GET"
      url  : HolmesAngularReactEnv.API_BASE_URL + 'app/setup'
    })

  postSetup = ->
    $.ajax({
      type : "POST"
      url  : HolmesAngularReactEnv.API_BASE_URL + 'app/setup'
      contentType: "application/json; charset=utf-8"
      dataType: 'json'
      data : JSON.stringify(setupData)
    })

  # Bootstrap da aplicação
  bootstrap = ->
    angular.bootstrap(document, ['HolmesAngularReact'])
    return

  bootstrapWithLoggedUser = (result) ->
    window.HolmesAngularReactEnv.user = result
    bootstrap()

  bootstrapWithoutLoggedUser = ->
    simpleStorage.deleteKey('scanAuthorization')
    window.HolmesAngularReactEnv.user = {id: 1, name: 'admin'}

    bootstrap()


  getMe = ->
    # $.ajax({
    #   type    : "GET"
    #   url     : HolmesAngularReactEnv.API_BASE_URL + 'user/me'
    #   headers :
    #     'hash'           : hash
    #     'opc_codigo'     : opc_codigo
    # }).success(bootstrapWithLoggedUser).error(bootstrapWithoutLoggedUser)
    bootstrapWithLoggedUser()

  setupError = (message)->
    swal({
      type: 'error'
      title: "Ops!"
      text: message
      showConfirmButton: false
      allowEscapeKey: false
    })

  if waitForSetup
    getSetup()
      .success (data)->
        setupData = $.extend(true, {}, data, setupData)

        postRequest = postSetup()
        postRequest.success ->
          # remove search string from URL and reload
          window.location = "/"

        postRequest.error ->
          # remove search string from URL and reload
          setupError("Não foi possível configurar a aplicação por favor contate o administrador do sistema.")
      .error (data)->
        setupError("Não foi possível carregar as configurações da aplicação por favor contate o administrador do sistema.")


  else
    getMe()