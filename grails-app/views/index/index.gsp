<!doctype html>
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
    <div>
        <h5 class="${color}-text text-darken-1">Tableau de bord</h5>
        <div class="row">
            <div class="col s12">
                <div class="my-container z-depth-2">
                    <br>
                    <p class="${color}-text text-darken-1 center-align bold">Vos derniers messages</p>
                    <div class="discussion_content">
                        <g:each var="data" in="${messages}">
                            <a href="/tchat/index/${data.idDestinataire}">
                                <div class="user-chip-left chip amber lighten-3">
                                    <g:if test="${data.imageDestinataire != "" && data.imageDestinataire != null}">
                                        <img src='http://localhost/grails_app_lalao_image/${data.imageDestinataire}'/>
                                    </g:if>
                                    <g:else>
                                        <g:img class="circle" dir="images" file="user.png"/>
                                    </g:else>
                                    ${data.nomDestinataire}
                                </div>
                                <div class='received_message'>
                                    <div class='received_width_message hoverable'>
                                        <div class='card-panel amber lighten-3 message-content'>
                                            <span class="grey-text">
                                                <time id="discussion_datetime${data.id}">
                                                    <script>
                                                        $('#discussion_datetime${data.id}').html(moment('${utilService.formatDate(data.dateCreation)}', 'YYYY-MM-DD h:mm:ss.S').fromNow());
                                                    </script>
                                                </time>
                                            </span>

                                            <p class="grey-text" id="${data.id}">${data.content}</p>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </g:each>
                    </div>
                </div>
                %{-- fin my-container z-depth-2 --}%
            </div>
            <div class="col s12">
                <div class="my-container z-depth-2">
                    <br>
                    <p class="${color}-text text-darken-1 center-align bold">Tableau de score</p>
                    <table class="highlight centered responsive-table" id="datatable">
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>imageAuteur</th>
                            <th>Auteur</th>
                            <th>imageDestinataire</th>
                            <th>Destinaire</th>
                            <th>ScoreAuteur</th>
                            <th>ScoreDestinaire</th>
                            <th>créer</th>
                        </tr>
                        </thead>
                        <tbody>
                        <g:each var="data" in="${resultats}">
                            <tr>
                                <td>${data.id}</td>
                                <td>
                                    <g:if test="${data.imageAuteur!= "" && data.imageAuteur!= null}">
                                        <img class="circle" width="50" src='http://localhost/grails_app_lalao_image/${data.imageAuteur}'/>
                                    </g:if>
                                    <g:else>
                                        <g:img width="50" class="circle" dir="images" file="user.png"/>
                                    </g:else>
                                </td>
                                <td>${data.nomAuteur}</td>
                                <td>
                                    <g:if test="${data.imageDestinataire!= "" && data.imageDestinataire!= null}">
                                        <img class="circle" width="50" src='http://localhost/grails_app_lalao_image/${data.imageDestinataire}'/>
                                    </g:if>
                                    <g:else>
                                        <g:img width="50" class="circle" dir="images" file="user.png"/>
                                    </g:else>
                                </td>
                                <td>${data.nomDestinataire}</td>
                                <td>${data.scoreAuteur}</td>
                                <td>${data.scoreDestinataire}</td>

                                <td>  <time id="resultat_datetime${data.id}">
                                    <script>
                                        $('#resultat_datetime${data.id}').html(moment('${utilService.formatDate(data.dateCreation)}', 'YYYY-MM-DD h:mm:ss.S').fromNow());
                                    </script>
                                </time></td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                    <br>
                </div>
                %{-- fin my-container z-depth-2 --}%
            </div>
        </div>
    </div>
</main>
</html>
<script>
    $(document).ready(function () {
        //--------------- DataTables
        $('#datatable').DataTable({
            "language": getLanguage(),
            order:[[7,"desc"]]
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

        userConnected();
    });
</script>
</body>
</html>
