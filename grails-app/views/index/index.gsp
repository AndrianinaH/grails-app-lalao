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
    <div class="my-container">
        <h5 class="${color}-text text-darken-1">Tableau de bord</h5>
        <div class="row">
            <div class="col s12 m6">
                <g:each var="data" in="${messages}">
                   ${data.id}
                   ${data.nomAuteur}
                   ${data.nomDestinataire}
                    <br>
                </g:each>
            </div>
            <div class="col s12 m6">
                <g:each var="data" in="${resultats}">
                    ${data.id}
                    ${data.nomAuteur}
                    ${data.nomDestinataire}
                    <br>
                </g:each>
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
