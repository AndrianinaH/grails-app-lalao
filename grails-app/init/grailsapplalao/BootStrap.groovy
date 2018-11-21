package grailsapplalao

class BootStrap {

    def init = { servletContext ->
//        new Utilisateur(
//                nom: "admin",
//                password: AuthService.toSha1("root"),
//                statut: 1,
//                type: 1,
//                dateCreation: new Date()
//        ).save()
//        new Utilisateur(
//                nom: "paul",
//                password: AuthService.toSha1("root"),
//                statut: 1,
//                type: 2,
//                dateCreation: new Date()
//        ).save()
//
//        new Message(
//                content: "test message blablabla",
//                idAuteur:  1,
//                idDestinataire: 2,
//                etat:"non lu",
//                dateCreation: new Date()
//        ).save()
//        new Message(
//                content: "test message blablabla2dsdqs",
//                idAuteur:  1,
//                idDestinataire: 2,
//                etat:"non lu",
//                dateCreation: new Date()
//        ).save()
//        new Message(
//                content: "test message sfdqsd",
//                idAuteur:  2,
//                idDestinataire: 1,
//                etat:"non lu",
//                dateCreation: new Date()
//        ).save()
//        new Message(
//                content: "test messagedsdqs",
//                idAuteur:  1,
//                idDestinataire: 2,
//                etat:"non lu",
//                dateCreation: new Date()
//        ).save(failOnError:true)

        println("users in bdd "+ new Utilisateur().findAll().size())
    }
    def destroy = {
    }
}
