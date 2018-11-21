package grailsapplalao

import org.springframework.web.multipart.MultipartFile

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

    def inscription(){
        def allModel = [ : ]
        allModel << ["color" : this.color]
        allModel << ["utilService" : this.utilService]
        if(params.error!=null) allModel << ["loginError" : params.error]
        render(view : 'inscription.gsp', model : allModel)
    }

    def signup(Utilisateur user){
        try{
            def file = request.getFile("file")
            authService.saveUserWithImageProfil(user,file);
            redirect(uri:"/auth")
        }catch (Exception ex){
            ex.printStackTrace()
            redirect(uri:"/auth/inscription", params:[error:ex.getMessage()])
        }
    }
	
	// serveur d'image
    // localhost/grails_app_lalao_image
}
