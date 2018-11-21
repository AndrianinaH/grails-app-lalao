package grailsapplalao

import grails.gorm.transactions.Transactional

import java.text.DateFormat
import java.text.Format
import java.text.SimpleDateFormat

@Transactional
class UtilService {

   def formatDate(Date date){
       Format f = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
       return f.format(date);
   }

    def formatDate2(Date date){
        Format f = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        return f.format(date);
    }

    static def uploadUrl = "D:/Serveur Web/UwAmp/www/grails_app_lalao_image/";
}
