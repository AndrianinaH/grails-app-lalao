package grailsapplalao

class Utilisateur {
    String nom
    String password
    int type
    Date dateCreation

    static constraints = {
        nom blank : false, unique:true
        password nullable : true
    }

    static mapping = {
        version false
    }
}
