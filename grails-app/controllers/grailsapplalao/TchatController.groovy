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
        messageService.addViewMessage(session.grails_user.id, params.id)
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

    def createResultat(Resultat res) {
        Random rand = new Random();
        res.setDateCreation(new Date())
        res.setScoreAuteur(rand.nextInt(100))
        res.setScoreDestinataire(rand.nextInt(100))
        resultatService.saveResultat(res)
        render res as JSON
    }

    def isMessageVu() {
        def res = messageService.isMessageVu(params.idLastMessage, params.idAuteur, params.idDestinataire)
        def result = "non-lu";
        if (res) {
            result = "lu"
        }
        render result
    }
}
