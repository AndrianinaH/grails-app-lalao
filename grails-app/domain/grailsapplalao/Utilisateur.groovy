package grailsapplalao

class Utilisateur {
    String nom
    String password
    int type
    int statut
    String imageProfil
    Date dateCreation

    static constraints = {
        nom blank : false, unique:true
        password nullable : true
        imageProfil nullable : true
    }

    static mapping = {
        version false
    }
}
