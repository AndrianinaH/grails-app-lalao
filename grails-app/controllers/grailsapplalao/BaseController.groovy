package grailsapplalao

import org.springframework.web.multipart.MultipartFile

class BaseController {

    def UtilService utilService
    def AuthService authService
    def MessageService messageService
    def ResultatService resultatService
    def color = "amber"

}
