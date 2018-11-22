package grailsapplalao

class ResultatView {
    int idAuteur
    String nomAuteur
    int idDestinataire
    String nomDestinataire
    double scoreAuteur
    double scoreDestinataire
    Date dateCreation

    static constraints = {
    }

    static mapping = {
        version false
    }

//    CREATE OR REPLACE VIEW resultat_view as
//    SELECT
//    resultat.`id`,
//    `id_auteur`,
//    utilisateur.nom as nom_auteur,
//    resultat.`date_creation`,
//    `id_destinataire`,
//    u.nom as nom_destinataire,
//    score_auteur,
//    score_destinataire
//    FROM
//    `resultat`
//    JOIN utilisateur ON utilisateur.id = resultat.id_auteur
//    JOIN utilisateur as u ON u.id = resultat.id_destinataire


}
