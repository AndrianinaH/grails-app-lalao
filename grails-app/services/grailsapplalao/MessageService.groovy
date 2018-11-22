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

    def getMessage(idAut, idDest){
        def listMessage = Message.where {
            (idAuteur == idAut && idDestinataire == idDest) || (idAuteur == idDest && idDestinataire == idAut)
        }
        return listMessage.list()
    }

    def getLastMessage(idAut, idDest, idLastMessage){
        def message = Message.where {
            idAuteur == idDest && idDestinataire == idAut && id > idLastMessage
        }
        return message.list()
    }
}
