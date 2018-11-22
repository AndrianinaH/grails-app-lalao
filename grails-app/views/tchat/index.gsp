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
    <div class="my-container">
        <p><strong>Mahery Kevin</strong></p>

        <div class="discussion_content">
            <g:each var="message" in="${messages}">
                <g:if test="${message.idAuteur == session.grails_user.id}">
                    <div class='outgoing_message'>
                        <div class='sent_message'>
                            <div class='card-panel green darken-2 message-content'>
                                <span id="${message.id}" class='white-text'>${message.content}</span>
                            </div>
                        </div>
                    </div>
                </g:if>
                <g:else>
                    <div class='incoming_message'>
                        <div class='received_message'>
                            <div class='received_width_message'>
                                <div class='card-panel red message-content'>
                                    <span id="${message.id}" class='white-text'>${message.content}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </g:else>
            </g:each>
        </div>


        <div class="row">
            <form class="col s12">
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
            </form>
        </div>
    </div>
</main>
<asset:javascript src="jquery-3.1.1.min.js"/>
<asset:javascript src="materialize.min.js"/>
<asset:javascript src="jquery.dataTables.js"/>
<asset:javascript src="utile.js"/>
<asset:javascript src="user.js"/>
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
        });

        function createReceivedMsg(message, id) {
            var div = "<div class='incoming_message'>" +
                "<div class='received_message'>" +
                "<div class='received_width_message'>" +
                "<div class='card-panel red message-content'>" +
                "<span id="+ id +" class='white-text'>" + message + "</span>" +
                "</div>" +
                "</div>" +
                "</div>" +
                "</div>";
            $(".discussion_content").append(div);
        }

        function createSendMsg(message, id) {
            var div = "<div class='outgoing_message'>" +
                "<div class='sent_message'>" +
                "<div class='card-panel green darken-2 message-content'>" +
                "<span id="+ id +" class='white-text'>" + message + "</span>" +
                "</div>" +
                "</div>" +
                "</div>";
            $(".discussion_content").append(div);
        }

        function charger() {
            var URL = "${createLink(controller:'tchat',action:'getLastMessage')}";
            var lastMessage = $(".discussion_content span:last").attr('id');
            setTimeout(function() {
                $.ajax({
                    url: URL,
                    data:{idAuteur: ${session.grails_user.id}, idDestinataire: ${destinataire.id}, idLastMessage: lastMessage},
                    success:function(rep){
                        var i;
                        for(i=0;i<rep.length;i++){
                            createReceivedMsg(rep[i].content, rep[i].id);
                        }
                    }
                });
                charger();
            },3000)
        }
    });
</script>
</body>
</html>