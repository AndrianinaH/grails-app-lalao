package grailsapplalao

class Message {
    String content
    int idAuteur
    int idDestinataire
    String etat
    Date dateCreation

    static constraints = {
        etat nullable  : true
    }

    static mapping = {
        version false
    }
}
