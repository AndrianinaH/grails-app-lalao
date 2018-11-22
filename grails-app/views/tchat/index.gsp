<%--
  Created by IntelliJ IDEA.
  User: kevin
  Date: 21/11/2018
  Time: 08:02
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Grails lalao</title>
</head>

<body>
<main>
    <asset:javascript src="jquery-3.1.1.min.js"/>
    <asset:javascript src="materialize.min.js"/>
    <asset:javascript src="jquery.dataTables.js"/>
    <asset:javascript src="moment-with-locales.min.js"/>
    <asset:javascript src="utile.js"/>
    <asset:javascript src="user.js"/>
    <script> moment.locale('fr');</script>
    <div class="my-container">
        <h5 class="${color}-text text-darken-1"><strong>${destinataire.nom}</strong></h5>
        <input type="hidden" id="userAuteur" value="${session.grails_user.nom}">
        <input type="hidden" id="userDestinataire" value="${destinataire.nom}">
        <div class="discussion_content">
            <g:each var="message" in="${messages}">
                <g:if test="${message.idAuteur == session.grails_user.id}">
                    <div class='outgoing_message'>
                        <div class="right user-chip-right chip">
                            <g:if test="${session.grails_user.imageProfil != "" && session.grails_user.imageProfil != null}">
                                <img src='http://localhost/grails_app_lalao_image/${session.grails_user.imageProfil}'/>
                            </g:if>
                            <g:else>
                                <g:img class="circle" dir="images" file="user.png"/>
                            </g:else>
                           ${session.grails_user.nom}
                        </div>
                        <div class='sent_message'>
                            <div class='card-panel green darken-2 message-content'>
                                <span class="white-text right-align">
                                    <time id="discussion_datetime${message.id}">
                                        <script>
                                            $('#discussion_datetime${message.id}').html(moment('${utilService.formatDate(message.dateCreation)}','YYYY-MM-DD h:mm:ss.S').fromNow());
                                        </script>
                                    </time>
                                </span>
                                <p id="${message.id}" class='white-text'>${message.content}</p>
                            </div>
                        </div>
                    </div>
                </g:if>
                <g:else>
                    <div class='incoming_message'>
                        <div class="user-chip-left chip">
                            <g:if test="${destinataire.imageProfil != "" && destinataire.imageProfil != null}">
                                <img src='http://localhost/grails_app_lalao_image/${destinataire.imageProfil}'/>
                            </g:if>
                            <g:else>
                                <g:img class="circle" dir="images" file="user.png"/>
                            </g:else>
                            ${destinataire.nom}
                        </div>
                        <div class='received_message'>
                            <div class='received_width_message'>
                                <div class='card-panel red message-content'>
                                    <span class="white-text">
                                        <time id="discussion_datetime${message.id}">
                                            <script>
                                                $('#discussion_datetime${message.id}').html(moment('${utilService.formatDate(message.dateCreation)}','YYYY-MM-DD h:mm:ss.S').fromNow());
                                            </script>
                                        </time>
                                    </span>
                                    <p id="${message.id}" class='white-text'>${message.content}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </g:else>
            </g:each>
        </div>


        <div class="row">

                <div class="row">
                    <div class="input-field col s9">
                        <input id="message" type="text">
                        <label>Votre message</label>
                    </div>

                    <div class="input-field col s1">
                        <a title="envoyer" id="send" class="btn-floating btn-large waves-effect waves-light red"><i
                                class="material-icons">send</i></a>
                    </div>

                    <div class="input-field col s1">
                        <a title="jouer" id="play" class="btn-floating btn-large waves-effect waves-light red"><i
                                class="material-icons">games</i></a>
                    </div>

                </div>

        </div>
    </div>
</main>

<script>
    $(document).ready(function () {
        //--------------- DataTables
        $('#datatable').DataTable({
            "language": getLanguage(),
        });
        //------------- sidenav
        $(".button-collapse").sideNav();
        $(".collapsible").collapsible();
        $(".dropdown-button").dropdown();
        //-------------  tabs
        $("ul.tabs").tabs();
        //--------------- activer modal
        $('.modal').modal();

        //------------- select
        $("select").material_select();

        //------------- charger message
        charger();
        userConnected();

        $("#send").click(function () {
           send();
        });

        function send(){
            var URL = "${createLink(controller:'tchat',action:'sendMessage')}";
            var message = $.trim($("#message").val());
            if (message) {
                $.ajax({
                    url: URL,
                    type: "POST",
                    data: {
                        idAuteur: ${session.grails_user.id}, idDestinataire: ${destinataire.id}, content: message,
                        etat: "non-lu"
                    },
                    success: function (rep) {
                        createSendMsg(message, rep);
                        $("#message").val("");
                    }
                });
            }
        }

        function createReceivedMsg(message, rep) {
            var imgProfil = '';
            if (${destinataire.imageProfil != "" && destinataire.imageProfil != null}){
                imgProfil += '<img src="http://localhost/grails_app_lalao_image/${destinataire.imageProfil}"/>'
            }else{
                imgProfil += '<g:img class="circle" dir="images" file="user.png"/>';
            }
            var username= $("#userDestinataire").val();
            var dateCreation = moment(rep.dateCreation,'YYYY-MM-DDThh:mm:ssZ').fromNow();

            var div = "<div class='incoming_message'>" +
                "<div class='user-chip-left chip'>"+
                    imgProfil +
                    username +
                "</div>" +
                "<div class='received_message'>" +
                "<div class='received_width_message'>" +
                "<div class='card-panel red message-content'>" +
                " <span class='white-text'>"+ dateCreation +"</span>"+
                "<p id="+ rep.id +" class='white-text'>" + message + "</p>" +
                "</div>" +
                "</div>" +
                "</div>" +
                "</div>";
            $(".discussion_content").append(div);
        }

        function createSendMsg(message, rep) {
            var imgProfil = '';
            if (${session.grails_user.imageProfil != "" && session.grails_user.imageProfil != null}){
                imgProfil += '<img src="http://localhost/grails_app_lalao_image/${session.grails_user.imageProfil}"/>'
            }else{
                imgProfil += '<g:img class="circle" dir="images" file="user.png"/>';
            }
            var username= $("#userAuteur").val();
            console.log(rep.dateCreation)
            var dateCreation = moment(rep.dateCreation,'YYYY-MM-DDThh:mm:ssZ').fromNow();
            var div = "<div class='outgoing_message'>" +
                "<div class='right user-chip-right chip'>"+
                    imgProfil +
                    username +
                "</div>" +
                "<div class='sent_message'>" +
                "<div class='card-panel green darken-2 message-content'>" +
                " <span class='white-text'>"+ dateCreation +"</span>"+
                "<p id="+ rep.id +" class='white-text'>" + message + "</p>" +
                "</div>" +
                "</div>" +
                "</div>";
            $(".discussion_content").append(div);
        }

        function charger() {
            var URL = "${createLink(controller:'tchat',action:'getLastMessage')}";
            var lastMessage = $(".discussion_content p:last").attr('id');
            chargerMessage(URL,lastMessage);
            setTimeout(function() {
                charger();
            },1000)
        }

        function chargerMessage(URL,lastMessage) {
            $.ajax({
                url: URL,
                data:{idAuteur: ${session.grails_user.id}, idDestinataire: ${destinataire.id}, idLastMessage: lastMessage},
                success:function(rep){
                    var i;
                    for(i=0;i<rep.length;i++){
                        createReceivedMsg(rep[i].content, rep[i]);
                    }
                }
            });
        }
    });
</script>
</body>
</html>