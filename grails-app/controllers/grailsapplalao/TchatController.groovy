package grailsapplalao

import grails.converters.JSON

class TchatController extends BaseController {

    def index() {
        def allModel = [ : ]
        allModel << ["color" : this.color]
        allModel << ["destinataire" : Utilisateur.get(params.id)]
        allModel << ["utilService" : utilService]
        allModel << ["messages" : messageService.getMessage(session.grails_user.id, params.id)]
        if(params.error!=null) allModel << ["error" : params.error]
        render(view : "index", model: allModel)
    }

    def sendMessage(Message message) {
        message.setDateCreation(new Date())
        messageService.saveMessage(message)
        render message as JSON
    }

    def getMessage() {
        render messageService.getMessage(params.idAuteur, params.idDestinataire) as JSON
    }

    def getLastMessage(){
        render messageService.getLastMessage(params.idAuteur, params.idDestinataire, params.idLastMessage) as JSON
    }

    def userDisponible(){
        render utilisateurService.userConnected(session.grails_user.id) as JSON
    }
}
