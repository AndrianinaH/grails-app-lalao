package grailsapplalao

import grails.converters.JSON

import javax.rmi.CORBA.Util

class MessageController extends BaseController{

    def index() {
        def allModel = [ : ]
        allModel << ["color" : this.color]
        allModel << ["allMessage" : MessageView.list()]
        allModel << ["allUser" : utilisateurService.allJoueur()]
        allModel << ["utilService" : this.utilService]

        render(view : "message.gsp", model: allModel)
    }

    def save(Message message){
        messageService.saveMessage(message);
        redirect(uri:"/message")
    }

    def delete(int id){
        def message = new Message()
        message.setId(id)
        messageService.deleteMessage(message);
        redirect(uri:"/message")
    }

}
