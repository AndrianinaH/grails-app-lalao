package grailsapplalao

import grails.gorm.transactions.Transactional

@Transactional
class MessageService {

    def saveMessage(Message message){
        message.save();
    }

    def deleteMessage(Message message){
        message.delete();
    }

    def getMessage(idAuteur, idDestinataire){
        def listMessage = Message.where {
            ("idAuteur" == idAuteur && "idDestinataire" == idDestinataire) || ("idAuteur" == idDestinataire && "idDestinataire" == idAuteur)
        }
        return listMessage.list()
    }
}
