package grailsapplalao

import grails.converters.JSON

class ResultatController extends BaseController {

    def index() {
        def allModel = [:]
        allModel << ["color": this.color]
        allModel << ["allResultat": ResultatView.list()]
        allModel << ["allUser": Utilisateur.list()]
        allModel << ["utilService": this.utilService]

        render(view: "resultat.gsp", model: allModel)
    }
}
