package grailsapplalao

class Resultat {
    int idAuteur
    int idDestinataire
    double scoreAuteur
    double scoreDestinataire
    Date dateCreation

    static constraints = {
    }

    static mapping = {
        version false
    }
}
