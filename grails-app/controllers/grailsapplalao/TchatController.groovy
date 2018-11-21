package grailsapplalao

import grails.converters.JSON

import java.text.SimpleDateFormat

class TchatController extends BaseController {

    def index() {
        def allModel = [ : ]
        allModel << ["destinataire" : Utilisateur.get(params.id)]
        allModel << ["utilService" : this.utilService]
        if(params.error!=null) allModel << ["error" : params.error]
        render(view : "index", model: allModel
        )
        /*def user = Utilisateur.get(params.id)
        render(view: "index", model: [destinataire: user])*/
    }

    def sendMessage(Message message) {
        message.setDateCreation(new Date(params.dateCreation))
        messageService.saveMessage(message)
        render "success"
    }

    def getMessage() {
        render messageService.getMessage(params.idAuteur, params.idDestinataire) as JSON
    }
}
