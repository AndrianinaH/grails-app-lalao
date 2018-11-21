<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails App Lalao"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="materialize.min.css"/>
    <asset:stylesheet src="jquery.dataTables.css"/>

    <g:layoutHead/>
</head>

<body>

<!----------------------- Menu Principal  ------------------------>
<header>
    <div class="navbar">
        <nav class="nav-extended amber">
            <div class="nav-wrapper">
                <a data-activates="slide-out" class="left button-collapse white-text">
                    <i class="material-icons">menu</i>
                </a>
                <a class="brand-logo center white-text" href="/">
                    <strong>Grails App Lalao</strong>
                </a>
                <ul class="right">
                    <li>
                        <a class="dropdown-button" data-activates="dropdown-profil">
                            <i class="material-icons">more_vert</i>
                        </a>
                    </li>
                    <!-- Dropdown Structure -->
                    <ul id="dropdown-profil" class="my-dropdown dropdown-content">
                        <li>
                            <a href="/auth/logout">Se déconnecter</a>
                        </li>
                    </ul>
                </ul>
            </div>
        </nav>
    </div>
</header>

<!---------- menu latéral ---------->
<ul id="slide-out" class="side-nav fixed">
    <li>
        <div class="userView">
            <div class="background">
                <g:img dir="images" file="fond.jpg"/>
            </div>
            <a href="/auth/profil">
                <span class="circle">
                    <g:if test="${session.grails_user != null}">
                        <g:if test="${session.grails_user.imageProfil != "" && session.grails_user.imageProfil!= null}">
                            <img src='http://localhost/grails_app_lalao_image/${session.grails_user.imageProfil}'/>
                        </g:if>
                        <g:else>
                            <g:img class="circle" dir="images" file="user.png"/>
                        </g:else>
                    </g:if>
                </span>
            </a>
            <a href="/auth/profil">
                <span class="white-text name">Bonjour</span>
            </a>
            <a href="/auth/profil">
                <span class="white-text email"><strong>${session.grails_user != null ? session.grails_user.nom : ""}</strong>
                </span>
            </a>
        </div>
    </li>
    <g:if test="${session.grails_user != null}">
        <g:if test="${session.grails_user.type == 1}">
            <li class="no-padding">
                <a href="/">
                    <i class="material-icons">dashboard</i>Tableau de bordd
                </a>
            </li>
            <li>
                <div class="divider"></div>
            </li>
            <li class="no-padding">
                <a href="/utilisateur">
                    <i class="material-icons">group</i>Gérer les Utilisateurs
                </a>
            </li>
            <li>
                <div class="divider"></div>
            </li>
            <li class="no-padding">
                <a href="/message">
                    <i class="material-icons">list</i>Gérer les Messages
                </a>
            </li>
            <li>
                <div class="divider"></div>
            </li>
        </g:if>
    </g:if>

    <g:if test="${session.grails_user != null}">
        <g:if test="${session.grails_user.type == 2}">
            <li class="no-padding">
                <a href="/fdfsdfsd">
                    <i class="material-icons">message</i>Mes Messages <strong>(2)</strong>
                </a>
            </li>
            <li>
                <div class="divider"></div>
            </li>

            <li class="no-padding">
                <a>
                    <i class="material-icons">perm_identity</i>Joueurs Connectés
                </a>
            </li>
            <li>
                <div class="divider"></div>
            </li>

            <li class="no-padding">
                <g:link controller="tchat" id="2"><i class="material-icons">grade</i>Mahery Kevin</g:link>
            </li>

            <li class="no-padding">
                <a href="/fdfsdfsd">
                    <i class="material-icons">grade</i>Andrianina Layton
                </a>
            </li>

            <li class="no-padding">
                <a href="/fdfsdfsd">
                    <i class="material-icons">grade</i>Han Solo
                </a>
            </li>
            <li class="no-padding">
                <a href="/fdfsdfsd">
                    <i class="material-icons">grade</i>Han Solo
                </a>
            </li>




        </g:if>
    </g:if>

</ul>


<g:layoutBody/>

<div class="footer" role="contentinfo"></div>

%{--<asset:javascript src="application.js"/>--}%

</body>
</html>


