package grailsapplalao


class RoleInterceptor {

    public RoleInterceptor(){

        match(controller: "message")
        match(controller: "utilisateur")
//        match(controller: "resultat")
    }

    boolean before() {
        if(session.grails_user != null) {
            if(session.grails_user.type != 1) {
                redirect (uri : "/");
                false
            }
        }
        true
    }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}
