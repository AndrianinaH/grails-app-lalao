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
            Ajouter un message
        </a>
    </div>
    <div class="my-container z-depth-2">
        <br>
        <table class="highlight centered responsive-table" id="datatable">
            <thead>
            <tr>
                <th>id</th>
                <th>Contenu</th>
                <th>Auteur</th>
                <th>Destinaire</th>
                <th>dateCreation</th>
                <th>actions</th>
            </tr>
            </thead>
            <tbody>
            <g:each var="data" in="${allMessage}">
                <tr>
                    <td>${data.id}</td>
                    <td>${data.content}</td>
                    <td>${data.nomAuteur}</td>
                    <td>${data.nomDestinataire}</td>
                    <td>${utilService.formatDate2(data.dateCreation)}</td>
                    <td>
                        <button class="btn-floating indigo darken-1 editData"
                                data-id="${data.id}"
                                data-content="${data.content}"
                                data-idAuteur="${data.idAuteur}"
                                data-idDestinataire="${data.idDestinataire}"
                                data-etat="${data.etat}"
                                data-dateCreation="${utilService.formatDate(data.dateCreation)}">
                            <i class="material-icons">edit</i>
                        </button>
                        <button class="btn-floating red darken-1 deleteData"
                                data-id="${data.id}"
                                data-content="${data.content}">
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
        <form action="message/save" method="POST" class="row">
            <input type="hidden" name="dateCreation" value="${utilService.formatDate(new Date())}" required>
            <div class="input-field col s12">
                <textarea id="textarea1" name="content" class="materialize-textarea" required></textarea>
                <label>
                    Contenu
                    <span class="red-text">*</span>
                </label>
            </div>
            <div class="input-field col s12">
                <select name="idAuteur" required>
                    <g:each var="data" in="${allUser}">
                        <option value="${data.id}">${data.nom}</option>
                    </g:each>
                </select>
                <label>
                    Auteur
                    <span class="red-text">*</span>
                </label>
            </div>
            <div class="input-field col s12">
                <select name="idDestinataire" required>
                    <g:each var="data" in="${allUser}">
                        <option value="${data.id}">${data.nom}</option>
                    </g:each>
                </select>
                <label>
                    Destinataire
                    <span class="red-text">*</span>
                </label>
            </div>
            <div class="input-field col s12">
                <select name="etat" required>
                    <option value="non lu">non lu</option>
                    <option value="non lu">lu</option>
                </select>
                <label>
                    Etat
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
        <h5 class="center indigo-text">Modifier Message</h5>
        <form action="message/save" method="POST" class="row">
            <input type="hidden" id="idEdit" name="id" required>
            <input type="hidden" id="dateCreationEdit" name="dateCreation" required>
            <div class="input-field col s12">
                <textarea id="contentEdit" name="content" class="materialize-textarea" required></textarea>
                <label>
                    Contenu
                    <span class="red-text">*</span>
                </label>
            </div>
            <div class="input-field col s12">
                <select id="idAuteurEdit" name="idAuteur" required>
                    <g:each var="data" in="${allUser}">
                        <option value="${data.id}">${data.nom}</option>
                    </g:each>
                </select>
                <label>
                    Auteur
                    <span class="red-text">*</span>
                </label>
            </div>
            <div class="input-field col s12">
                <select id="idDestinataireEdit" name="idDestinataire" required>
                    <g:each var="data" in="${allUser}">
                        <option value="${data.id}">${data.nom}</option>
                    </g:each>
                </select>
                <label>
                    Destinataire
                    <span class="red-text">*</span>
                </label>
            </div>
            <div class="input-field col s12">
                <select id="etatEdit" name="etat" required>
                    <option value="non lu">non lu</option>
                    <option value="non lu">lu</option>
                </select>
                <label>
                    Etat
                    <span class="red-text">*</span>
                </label>
            </div>
            <div class="center-align"><button type="submit" class="btn btn-large waves-effect indigo darken-3"><i class="material-icons right">done</i>Enregistrer</button></div>
        </form>
    </div>
</div>

<!------------ modal deleteData ------------>
<div id="deleteData" class="modal">
    <form action="message/delete" method="POST" class="row">
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
            var content = $(this).attr('data-content');
            var dateCreation = $(this).attr('data-dateCreation');
            var idAuteur = $(this).attr('data-idAuteur');
            var idDestinataire = $(this).attr('data-idDestinataire');
            var etat = $(this).attr('data-etat');

            $('#editData').modal('open');

            $("#idEdit").val(id);
            $("#contentEdit").val(content);
            $("#dateCreationEdit").val(dateCreation);

            $("#idAuteurEdit option").each(function() {
                if($(this).val()==idAuteur)
                {
                    $(this).attr("selected","selected");
                }
            });
            $("#idDestinataireEdit option").each(function() {
                if($(this).val()==idDestinataire)
                {
                    $(this).attr("selected","selected");
                }
            });
            $("#etatEdit option").each(function() {
                if($(this).val()==etat)
                {
                    $(this).attr("selected","selected");
                }
            });
            Materialize.updateTextFields();
        });

        //--------------- DELETE
        $('.deleteData').on("click",function(){
            var id = $(this).attr('data-id');
            var content = $(this).attr('data-content');
            $('#deleteData').modal('open');
            $("#idDelete").val(id);
            $("#contentDelete").text(content);
        });
    });
</script>
</body>
</html>


