<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Grails lalao</title>
</head>
<body>

<!----------------------- CRUD ------------------------>
<main>
    <h5 class="my-titre ${color}-text text-darken-1">
        <b>Liste des résultats</b>
    </h5>
    <div class="my-container z-depth-2">
        <br>
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
                <th>dateCreation</th>
            </tr>
            </thead>
            <tbody>
            <g:each var="data" in="${allResultat}">
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
                    <td>${utilService.formatDate2(data.dateCreation)}</td>
                </tr>
            </g:each>
            </tbody>
        </table>
        <br>
    </div>
</main>

<asset:javascript src="jquery-3.1.1.min.js"/>
<asset:javascript src="materialize.min.js"/>
<asset:javascript src="jquery.dataTables.js"/>
<asset:javascript src="utile.js"/>

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

    });
</script>
</body>
</html>


