package grailsapplalao


class AuthInterceptor {
    public AuthInterceptor(){
        matchAll().excludes(controller:"auth")
        .excludes(controller: "auth", action:"inscription")
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
