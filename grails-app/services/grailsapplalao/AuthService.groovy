package grailsapplalao

import grails.gorm.transactions.Transactional
import org.springframework.web.multipart.MultipartFile

import javax.rmi.CORBA.Util
import java.security.MessageDigest

@Transactional
class AuthService {

    def login(Utilisateur utilisateur){
        utilisateur.setPassword(sha1(utilisateur.password))
        def allUser = Utilisateur.findAllByNomAndPassword(utilisateur.nom,utilisateur.password)
        if(allUser.size()!=0) return allUser[0]
        else throw new Exception("Authentification echouer")
    }

    def saveUtilisateur(Utilisateur utilisateur){

        if(utilisateur.getId()== null) {//------------- add
            utilisateur.setPassword(sha1(utilisateur.password))
            if(Utilisateur.findAllByNom(utilisateur.getNom()).size()!=0) throw new Exception("Ce nom d'utilisateur existe déjà, réessayer avec un autre")
        }else{//------------- update
            if(utilisateur.getPassword()!="" && utilisateur.getPassword()!=null){
                utilisateur.setPassword(sha1(utilisateur.getPassword()))
            }else{
                def userInBdd = Utilisateur.findById(utilisateur.getId())
                utilisateur.setPassword((String)userInBdd.getOriginalValue("password"))
            }
        }
        utilisateur.save();
    }

    def deleteUtilisateur(Utilisateur utilisateur){
        def allMessage = Message.findAllByIdAuteurOrIdDestinataire(utilisateur.getId(), utilisateur.getId())
        if(allMessage.size()!=0) throw new Exception("Un message est encore assigné à cet utilisateur, supprimez ce message avant de supprimer cet utilisateur")
        utilisateur.delete();
    }

    def sha1(mot){
        MessageDigest sha1 = MessageDigest.getInstance("SHA1")
        sha1.update(mot.getBytes())
        return new BigInteger(1,sha1.digest()).toString(16).padLeft(40,'O')
    }

    static def toSha1(mot){
        MessageDigest sha1 = MessageDigest.getInstance("SHA1")
        sha1.update(mot.getBytes())
        return new BigInteger(1,sha1.digest()).toString(16).padLeft(40,'O')
    }

    def saveUserWithImageProfil(Utilisateur utilisateur, def file){
        if(file.filename != ""){
            String imgProfil = convertSpringFile(file).getName()
            utilisateur.setImageProfil(imgProfil)
        }
        saveUtilisateur(utilisateur)
    }

    def convertSpringFile(def file) throws IOException {
        def newFile = new File(UtilService.uploadUrl+file.getOriginalFilename());
        if(newFile.exists()) newFile.delete();
        file.transferTo(newFile);
        return newFile;
    }
}
