package grailsapplalao


class AuthInterceptor {
    public AuthInterceptor(){
        matchAll().excludes(controller:"auth")
    }

    boolean before() {
        if(session.grails_user == null) {
            redirect (uri : "/auth");
            false
        }
        true
    }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}
