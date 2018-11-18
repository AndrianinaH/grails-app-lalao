package grailsapplalao

class UtilisateurController extends BaseController {

    def index() {
        def allModel = [ : ]
        allModel << ["color" : this.color]
        allModel << ["allUser" : Utilisateur.list()]
        allModel << ["utilService" : this.utilService]
        if(params.error!=null) allModel << ["error" : params.error]
        render(view : "utilisateur.gsp", model: allModel
        )
    }

    def save(Utilisateur user){
        try{
            authService.saveUtilisateur(user);
            redirect(uri:"/utilisateur")
        }catch (Exception ex){
            redirect(uri:"/utilisateur", params:[error:ex.getMessage()])
        }
    }

    def delete(int id){
        try{
            def user = new Utilisateur()
            user.setId(id)
            authService.deleteUtilisateur(user);
            redirect(uri:"/utilisateur")
        }
        catch (Exception ex){
            redirect(uri:"/utilisateur", params:[error:ex.getMessage()])
        }
    }
}
