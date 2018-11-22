package grailsapplalao

import grails.gorm.transactions.Transactional

@Transactional
class UtilisateurService {

    def userConnected(idUser) {
        def users = Utilisateur.where {
            id != idUser && statut == 1
        }
        return users.list()
    }
}
