angular.module 'HolmesAngularReact.factories'
.factory 'errorMessages', ->
  messages =
    scan:
      "scanner.not.found": "Scanner não encontrado, por favor selecione um scanner válido."
      "holmes.exception.failed.to.scan": "Ocorreu um erro ao scanner, por favor tente novamente."
      "holmes.exception.failed.to.acquire.images": "Não foi possível carregar as imagens, por favor tente novamente."
      "scan.in.progress": "Scanner está em uso, por favor tente novamente mais tarde."
      "holmes.exception.failed.to.initialize.twain": "Não foi possível iniciar o scanner, por favor tente novamente."
      "holmes.exception.failed.to.write.image": "Não foi possível criar as imagens, por favor tente novamente."
      "holmes.exception.failed.to.receive.image.event": "Scanner não encontrado, por favor selecione um scanner válido."
    setup:
      "holmes.exception.company.not.found": "Empresa não encontrada"
      "URI is not absolute" : "Url inválida, por favor confirme se a URL informada está correta."
      "invalid.protocol" : "Protocolo selecionado inválido, por favor tente novamente."
    login:
      "holmes.exception.fail.retrieve.token": "Não foi possível fazer login :("
      "invalid.credentials": "Usuário/senha inválidos, por favor tente novamente"
    userSettings:
      "error.saving": "Erro ao salvar configurações, por favor tente novamente."