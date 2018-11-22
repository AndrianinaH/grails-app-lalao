package grailsapplalao

class IndexController extends BaseController{

    def index() {
        if(session.grails_user != null){
            def allModel = [ : ]
            allModel << ["color" : this.color]
            allModel << ["utilService" : utilService]
            allModel << ["messages" : messageService.getMessageById(session.grails_user.id)]
            allModel << ["resultats" : resultatService.getResultatById(session.grails_user.id)]
            render(view : "index", model : allModel)
        }


    }
}
