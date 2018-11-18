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
}
