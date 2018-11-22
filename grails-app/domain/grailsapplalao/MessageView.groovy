package grailsapplalao

class MessageView{
    String content
    int idAuteur
    String nomAuteur
    String imageAuteur
    int idDestinataire
    String nomDestinataire
    String imageDestinataire
    String etat
    Date dateCreation

    static constraints = {
    }

    static mapping = {
        version false
    }

//    CREATE OR REPLACE VIEW message_view as
//    SELECT message.`id`, `id_auteur`,
//    utilisateur.nom as nom_auteur,
//    utilisateur.image_profil as image_auteur,
//    `content`,
//    message.`date_creation`,
//    `id_destinataire`,
//    u.nom as nom_destinataire,
//    u.image_profil as image_destinataire,
//    `etat` FROM `message`
//    JOIN utilisateur ON utilisateur.id = message.id_auteur
//    JOIN utilisateur as u ON u.id = message.id_destinataire
}
