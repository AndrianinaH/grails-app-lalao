package grailsapplalao

import grails.gorm.transactions.Transactional

@Transactional
class ResultatService {

    def saveResultat(Resultat resultat){
        resultat.save();
    }

    def getResultat(idAuteur, idDestinataire){
        def listResultat = Resultat.where {
            ("idAuteur" == idAuteur && "idDestinataire" == idDestinataire) || ("idAuteur" == idDestinataire && "idDestinataire" == idAuteur)
        }
        return listResultat.list()
    }

    def getResultatById(idAuteur){
        def listResultat = ResultatView.where {
            ("idAuteur" == idAuteur || "idDestinataire" == idAuteur)
        }
        return listResultat.list()
    }
}
