package grailsapplalao

import grails.converters.JSON

class TchatController extends BaseController {

    def index() {
        render(view: "index.gsp")
    }

    def sendMessage() {
        /*def message = new Message(params);
        println(message.getId())*/
        println("id " + params);
        render "success"
    }

    def getMessage() {
        render messageService.getMessage(params.idAuteur, params.idDestinataire) as JSON
    }
}
