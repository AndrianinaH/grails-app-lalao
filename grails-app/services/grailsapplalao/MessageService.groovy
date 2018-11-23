package grailsapplalao

import grails.gorm.transactions.Transactional

@Transactional
class MessageService {

    def saveMessage(Message message) {
        message.save();
    }

    def deleteMessage(Message message) {
        message.delete();
    }

    def getMessage(idAut, idDest) {
        def listMessage = Message.where {
            (idAuteur == idAut && idDestinataire == idDest) || (idAuteur == idDest && idDestinataire == idAut)
        }
        return listMessage.list()
    }

    def getMessageById(idAut) {
//        def criteria = MessageView.createCriteria();
//        def messages = criteria{
//            or{
//                eq("idAuteur",idAut)
//                eq("idDestinataire",idAut)
//            }
//            order("dateCreation", "desc")
//        }
        def listMessage = MessageView.where {
            (idAuteur == idAut || idDestinataire == idAut)
        }
        return listMessage.list()
    }

    def getLastMessage(idAut, idDest, idLastMessage) {
        def message = Message.where {
            idAuteur == idDest && idDestinataire == idAut && id > idLastMessage
        }
        return message.list()
    }

    def addViewMessage(idAut, idDest) {
        def mes = Message.where {
            idAuteur == idDest && idDestinataire == idAut && etat == "non-lu"
        }
        def message = mes.list();
        if (message) {
            for (Message mess : message) {
                mess.setEtat("lu");
                mess.save();
            }
        }
    }

    def isMessageVu(idLastMessage, idAut, idDest) {
        def message = Message.findById(idLastMessage);
        def result = false;
        if(message.getIdAuteur() == Integer.parseInt(idAut) &&
                message.getIdDestinataire() == Integer.parseInt(idDest) && message.getEtat().equals("lu")){
            result = true;
        }
        return result;
    }
}
