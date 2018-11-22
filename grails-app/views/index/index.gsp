<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Grails lalao</title>
</head>

<body>

<main>
    <div class="my-container">
    </div>
</main>
<asset:javascript src="jquery-3.1.1.min.js"/>
<asset:javascript src="materialize.min.js"/>
<asset:javascript src="jquery.dataTables.js"/>
<asset:javascript src="utile.js"/>
<asset:javascript src="user.js"/>
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
