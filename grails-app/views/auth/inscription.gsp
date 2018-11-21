<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>Inscription</title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />
    <asset:stylesheet src="login.css"/>
    <asset:stylesheet src="materialize.min.css"/>
</head>
<body>

<main>
    <div class="body centreo grey lighten-4">
        <div class="section"></div>
        <h3 class="${color}-text text-darken-1">Grails App Lalao</h3>
        <h5 class="${color}-text text-darken-1">Inscrivez-vous</h5>
        <div class="section"></div>

        <div class="container">
            <div class="z-depth-1 grey lighten-4 login-box">
                <form method="POST" action="/auth/signup" enctype="multipart/form-data">
                    <input type='hidden' name="statut" value="0" required>
                    <input type='hidden' name="type" value="2" required>
                    <input type="hidden" name="dateCreation" value="${utilService.formatDate(new Date())}" required>
                    <div class="row">
                        <div class='input-field col s12'>
                            <input type='text' id='mail' name="nom" required>
                            <label for='mail'>Username <span class="red-text">*</span></label>
                        </div>
                        <div class='input-field col s12'>
                            <input type='password' id='password' name="password" required>
                            <label for='password'>Mot de passe <span class="red-text">*</span></label>
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
                            <button type='submit' class='col s12 btn btn-large waves-effect ${color} darken-1'>S'inscrire</button>
                        </div>
                    </div>
                </form>
            </div>
            <div style="margin-top: 20px">
                <a class="${color}-text text-darken-1" href="/auth">Vous possédez un compte, Connectez-vous</a>
            </div>
            <br>
            <p>${loginError} </p>
            <br>
        </div>
        <!-- fin container -->
    </div>
</main>

</body>
</html>
<asset:javascript src="jquery-3.1.1.min.js"/>
<asset:javascript src="materialize.min.js"/>

<script>
    $(document).ready(function () {
        //------------- sidenav
        $(".button-collapse").sideNav();
        $(".collapsible").collapsible();

        //------------- select
        $("select").material_select();

        //-------------  tabs
        $("ul.tabs").tabs();

        //--------------- activer modal
        $('.modal').modal();
    });
</script>
