package grailsapplalao

import grails.gorm.transactions.Transactional
import groovy.sql.Sql

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

    def getMessageById(idAut){
        def sql = MessageView.executeQuery(
                "from MessageView where idAuteur = :idAuteur order by dateCreation desc",
                [idAuteur:idAut])
        return sql
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

//SELECT `id`, `id_auteur`, `nom_auteur`, `image_auteur`, `content`, `id_destinataire`, `nom_destinataire`, `image_destinataire`, `etat` ,max(date_creation) as date_creation FROM `message_view` WHERE id_auteur =2 group by id_destinataire ORDER BY date_creation desc