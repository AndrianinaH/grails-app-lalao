package grailsapplalao

import grails.converters.JSON

class TchatController extends BaseController {

    def index() {
        def allModel = [ : ]
        allModel << ["destinataire" : Utilisateur.get(params.id)]
        allModel << ["messages" : messageService.getMessage(session.grails_user.id, params.id)]
        if(params.error!=null) allModel << ["error" : params.error]
        render(view : "index", model: allModel)
    }

    def sendMessage(Message message) {
        message.setDateCreation(new Date())
        messageService.saveMessage(message)
        render message.id
    }

    def getMessage() {
        render messageService.getMessage(params.idAuteur, params.idDestinataire) as JSON
    }

    def getLastMessage(){
        render messageService.getLastMessage(params.idAuteur, params.idDestinataire, params.idLastMessage) as JSON
    }

    def userDisponible(){
        render utilisateurService.userConnected(session.grails_user.id) as JSON;
    }
}
