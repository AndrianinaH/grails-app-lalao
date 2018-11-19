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
        <b>Gestion des messages</b>
    </h5>
    <div class="center-align">
        <a href="#createData" class='btn btn-large waves-effect amber'>
            <i class="material-icons right">add</i>
            Ajouter un utilisateur
        </a>
    </div>
    <div class="my-container z-depth-2">
        <br>
        <table class="highlight centered responsive-table" id="datatable">
            <thead>
            <tr>
                <th>id</th>
                <th>Nom</th>
                <th>Mot de passe</th>
                <th>Type</th>
                <th>dateCreation</th>
                <th>actions</th>
            </tr>
            </thead>
            <tbody>
            <g:each var="data" in="${allUser}">
                <tr>
                    <td>${data.id}</td>
                    <td>${data.nom}</td>
                    <td>${data.password}</td>
                    <td>${data.type == 1 ? "Admin" : "Joueur"}</td>
                    <td>${utilService.formatDate2(data.dateCreation)}</td>
                    <td>
                        <button class="btn-floating indigo darken-1 editData"
                                data-id="${data.id}"
                                data-nom="${data.nom}"
                                data-type="${data.type}"
                                data-dateCreation="${utilService.formatDate(data.dateCreation)}">
                            <i class="material-icons">edit</i>
                        </button>
                        <button class="btn-floating red darken-1 deleteData"
                                data-id="${data.id}"
                                data-nom="${data.nom}">
                            <i class="material-icons">delete</i>
                        </button>
                    </td>
                </tr>
            </g:each>
            </tbody>
        </table>
        <br>
    </div>
</main>

<!-- modal zone -->
<!------------ modal createData -------------->
<div id="createData" class="modal">
    <div class="modal-content">
        <a class="modal-action modal-close btn-floating grey darken-3 right"><i class="material-icons">close</i></a>
        <h5 class="center indigo-text">Nouveau Message</h5>
        <form action="utilisateur/save" method="POST" class="row">
            <input type="hidden" name="statut" value="0" required>
            <input type="hidden" name="dateCreation" value="${utilService.formatDate(new Date())}" required>
            <div class="input-field col s12">
                <input type="text" name="nom" required>
                <label>
                    Nom
                    <span class="red-text">*</span>
                </label>
            </div>
            <div class="input-field col s12">
                <input type="password" name="password" required>
                <label>
                    Mot de passe
                    <span class="red-text">*</span>
                </label>
            </div>
            <div class="input-field col s12">
                <select name="type" required>
                    <option value="1">Admin</option>
                    <option value="2">Joueur</option>
                </select>
                <label>
                    type
                    <span class="red-text">*</span>
                </label>
            </div>
            <div class="center-align"><button type="submit" class="btn btn-large waves-effect indigo darken-3"><i class="material-icons right">done</i>Enregistrer</button></div>
        </form>
    </div>
</div>

<!------------ modal createData -------------->
<div id="editData" class="modal">
    <div class="modal-content">
        <a class="modal-action modal-close btn-floating grey darken-3 right"><i class="material-icons">close</i></a>
        <h5 class="center indigo-text">Modifier Utilisateur</h5>
        <form action="utilisateur/save" method="POST" class="row">
            <input type="hidden" id="idEdit" name="id" required>
            <input type="hidden" name="statut" value="0" required>
            <input type="hidden" id="dateCreationEdit" name="dateCreation" required>
            <div class="input-field col s12">
                <input type="text" id="nomEdit" name="nom" required>
                <label>
                    Nom
                    <span class="red-text">*</span>
                </label>
            </div>
            <div class="input-field col s12">
                <input type="password" name="password">
                <label>
                    Mot de passe
                </label>
            </div>
            <div class="input-field col s12">
                <select id="typeEdit" name="type" required>
                    <option value="1">Admin</option>
                    <option value="2">Joueur</option>
                </select>
                <label>
                    type
                    <span class="red-text">*</span>
                </label>
            </div>
            <div class="center-align"><button type="submit" class="btn btn-large waves-effect indigo darken-3"><i class="material-icons right">done</i>Enregistrer</button></div>
        </form>
    </div>
</div>

<!------------ modal deleteData ------------>
<div id="deleteData" class="modal">
    <form action="utilisateur/delete" method="POST" class="row">
        <div class="modal-content">
            <a class="modal-action modal-close btn-floating grey darken-3 right"><i class="material-icons">close</i></a>
            <h5 class="center indigo-text">Êtes-vous sûr de vouloir supprimer [<span id="contentDelete"></span>] ?</h5>
            <input id="idDelete" name="id" type="hidden" value="" required>
        </div>
        <div class="modal-footer">
            <div class="center align">
                <a class="modal-action modal-close waves-effect waves-green btn-flat">Annuler</a>
                <button type="submit" class="btn red"><i class="material-icons left">delete</i>Supprimer</button>
            </div>

        </div>
    </form>
</div>
<g:if test="${error!=null}">
    <div id="errorModal" class="modal">
        <div class="modal-content">
            <a class="modal-action modal-close btn-floating grey darken-3 right"><i class="material-icons">close</i></a>
            <h5 class="center red-text">${error}</h5>
        </div>
        <div class="modal-footer">
            <div class="center-align">
                <a class="modal-action modal-close waves-effect waves-green btn black">Fermer</a>
            </div>
        </div>
    </div>
</g:if>
<asset:javascript src="jquery-3.1.1.min.js"/>
<asset:javascript src="materialize.min.js"/>
<asset:javascript src="jquery.dataTables.js"/>
<asset:javascript src="utile.js"/>

<script>
    $(document).ready(function () {
        //--------------- DataTables
        $('#datatable').DataTable({
            "language": getLanguage(),
            order:[[4,"desc"]]
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
        //------------- textarea
        $('#textarea1').trigger('autoresize');
        $('#contentEdit').trigger('autoresize');


        //------------- MODAL
        $('.editData').on("click",function(){
            var id = $(this).attr('data-id');
            var nom = $(this).attr('data-nom');
            var dateCreation = $(this).attr('data-dateCreation');
            var type = $(this).attr('data-type');

            $('#editData').modal('open');

            $("#idEdit").val(id);
            $("#nomEdit").val(nom);
            $("#dateCreationEdit").val(dateCreation);
            $("#typeEdit option").each(function() {
                if($(this).val()==type)
                {
                    $(this).attr("selected","selected");
                }
            });

            Materialize.updateTextFields();
        });

        //--------------- DELETE
        $('.deleteData').on("click",function(){
            var id = $(this).attr('data-id');
            var nom = $(this).attr('data-nom');
            $('#deleteData').modal('open');
            $("#idDelete").val(id);
            $("#contentDelete").text(nom);
        });

        $('#errorModal').modal('open');
    });
</script>
</body>
</html>


