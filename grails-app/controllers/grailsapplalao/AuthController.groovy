package grailsapplalao

class AuthController extends BaseController{

    def index(){
        def allModel = [ : ]
        allModel << ["color" : this.color]
        if(params.error!=null) allModel << ["loginError" : params.error]
        render(view : 'login.gsp', model : allModel)
    }

    def login(Utilisateur user){
        try{
            session.setAttribute("grails_user",authService.login(user))
            redirect(uri:"/")
        }catch (Exception ex){
            ex.printStackTrace()
            redirect(uri:"/auth", params:[error:ex.getMessage()])
        }
    }

    def logout(){
        session.invalidate()
        redirect (uri:"/auth")
    }
}
