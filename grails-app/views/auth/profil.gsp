<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Grails lalao</title>
</head>

<body>

<main>
    <div class="my-container">
        <h5 class="my-titre ${color}-text text-darken-1">
            <b>Gérer votre profil</b>
        </h5>
        <div class="container">
            <div>
                <form method="POST" action="/auth/changeProfil" enctype="multipart/form-data">
                    <input type='hidden' name="id" value="${user_actif.id}" required>
                    <input type='hidden' name="statut" value="${user_actif.statut}" required>
                    <input type='hidden' name="type" value="${user_actif.type}" required>
                    <input type="hidden" name="dateCreation" value="${utilService.formatDate(user_actif.dateCreation)}" required>
                    <div class="row">
                        <div class='input-field col s12'>
                            <input type='text' id='mail' name="nom" value="${user_actif.nom}" required>
                            <label for='mail'>Username</label>
                        </div>
                        <div class='input-field col s12'>
                            <input type='password' id='password' name="password">
                            <label for='password'>Mot de passe</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="file-field input-field">
                            <div class="btn cyan">
                                <span>Image</span>
                                <input type="file" name="file">
                            </div>
                            <div class="file-path-wrapper">
                                <input class="file-path validate" type="text">
                            </div>
                        </div>
                    </div>
                    <div class="my-divider"></div>
                    <br>
                    <div class="centreo">
                        <div class='row'>
                            <button type='submit' class='col s12 btn btn-large waves-effect ${color} darken-1'>Sauvegarder</button>

                        </div>
</main>
<asset:javascript src="jquery-3.1.1.min.js"/>
<asset:javascript src="materialize.min.js"/>
<asset:javascript src="jquery.dataTables.js"/>
<asset:javascript src="utile.js"/>
</body>
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
    });
</script>
</body>
</html>
