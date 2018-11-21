<!doctype html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>Login</title>
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
        <h5 class="${color}-text text-darken-1">Connectez-vous</h5>
        <div class="section"></div>

        <div class="container">
            <div class="z-depth-1 grey lighten-4 row login-box">
                <form method="POST" action="/auth/login">
                    <div class='input-field col s12'>
                        <input type='text' id='mail' name="nom" required>
                        <label for='mail'>Username</label>
                    </div>
                    <div class='input-field col s12'>
                        <input type='password' id='password' name="password" required>
                        <label for='password'>Mot de passe</label>
                    </div>
                    <div class="my-divider"></div>
                    <br>
                    <div class="centreo">
                        <div class='row'>
                            <button type='submit' class='col s12 btn btn-large waves-effect ${color} darken-1'>Se Connecter</button>
                        </div>
                    </div>
                </form>
            </div>
            <div>
                <a class="${color}-text text-darken-1" href="/auth/inscription">Créer un nouveau compte</a>
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
