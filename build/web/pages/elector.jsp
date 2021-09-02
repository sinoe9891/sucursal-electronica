
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="database.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../css/normalize.css">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/sidebar.css">
        <link rel="stylesheet" href="../css/all.css">
        <link rel="stylesheet" href="../src/app-assets/css/bootstrap.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link rel="stylesheet" type="text/css" href="../src/app-assets/css/pages/app-user.css">
        <link rel="stylesheet" type="text/css" href="../src/app-assets/css/components.css">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700&display=swap" rel="stylesheet">
        <title>Votación Online</title>
        <link rel="shortcut icon" href="../src/img/unitec.ico" type="image/x-icon">
        <!-- BEGIN: Vendor CSS-->
        <link rel="stylesheet" type="text/css" href="../src/app-assets/vendors/css/vendors.min.css">
        <link rel="stylesheet" type="text/css" href="../src/app-assets/vendors/css/tables/datatable/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="../src/app-assets/vendors/css/tables/datatable/responsive.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css" href="../src/app-assets/vendors/css/tables/datatable/buttons.bootstrap4.min.css">
        <!-- END: Vendor CSS-->

        <!-- BEGIN: Theme CSS-->
        <link rel="stylesheet" type="text/css" href="../src/app-assets/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="../src/app-assets/css/bootstrap-extended.css">
        <link rel="stylesheet" type="text/css" href="../src/app-assets/css/colors.css">
        <link rel="stylesheet" type="text/css" href="../src/app-assets/css/components.css">
        <link rel="stylesheet" type="text/css" href="../src/app-assets/css/themes/dark-layout.css">
        <link rel="stylesheet" type="text/css" href="../src/app-assets/css/themes/bordered-layout.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .elector a{
                color:#c3151c;
            }
            li.list-group-item {
                text-align: left;
            }
            .input {
                display: flex;
                justify-content: space-around;
            }

            [type="radio"] {
                /*visibility: hidden;*/
            }

            label {
                width: 200px;
                height: 200px;
                padding-left: 1em;
                position: relative;
                /*border: 1px solid rgb(47, 61, 255);*/
            }

            /* Desactivado */
            label:before {
                content: ' ';
                border-radius: 20px;
                width:0.8em;
                height:0.8em;
                position:absolute;
                left:0px;
                top: -0.26em;
                position: relative;
                transition: all 0.2s;
            }

            [type="radio"]:checked+label:before {
                color: #9e9e9e;
                content: '\f00d';
                font-family: FontAwesome;
                font-size: 200px;
            }
            .imagen-perfil{
                overflow: hidden;
                object-fit: cover;
                width: 197px;
            }
        </style>
        <script>
//            function votacion(nombre_voto) {
//                var nombre_voto;
//                alert("Gracias por tu voto de " + nombre_voto);
//            }
            function clickradio() {

                var radio_value = "",
                        radios = document.getElementsByName("presidentes");

                for (var i = 0; i < radios.length; i++) {
                    if (radios[i].checked) {
                        radio_value = radios[i].value;
                        break;
                    }
                }

                if (radio_value != "") {
//                    var hola1 = document.getElementsByName("presidentes");
                    var hola1 = document.querySelector('[name="presidentes"]').value;
                    console.log(hola1);
                    return true;
                } else {
                    document.getElementById("mensaje").innerHTML = "Debe de seleccionar un opción";
                    console.log('hola2')
                    return false;
                }
            }
            
            function clicheck() {

                var check = document.getElementsByName("diputados");
                console.log(check);
                var cont = 0;
                
                for (var x = 0; x < check.length; x++) {
                    if (check[x].checked) {
                        cont = cont + 1;
                    }
                    
                }
                    if(cont > 3){
                        alert("Solo debes seleccionar 3 Casillas")
//                        console.log(hola1);
                    }
                
            }

//            function clicheck() {
//                var checkboxes = form1.checkbox; //Array que contiene los checkbox
//                var cont = 0; //Variable que lleva la cuenta de los checkbox pulsados
//                for (var x = 0; x < checkboxes.length; x++) {
//                    if (checkboxes[x].checked) {
//                        cont = cont + 1;
//                    }
//                }
//                alert("El número de checkbox pulsados es " + cont);
//            }

            function mod(pid, pnp, pd, pep) {
                var modal2 = document.getElementById("myModal");
                document.getElementById("idh1").value = pid;
                document.getElementById("ids1").value = pnp;
                document.getElementById("ids2").value = pd;
                document.getElementById("ids3").value = pep;
            }



        </script>
    </head>

    <body>
        <div class="main-sidebar">
            <div class="container-login">
                <div class="sidebar-main">
                    <div class="img-log">
                        <img class="logo-plat-sidebar" src="../src/img/Votem_Logo_Primary_Navy.png" alt="">
                        <img class="logo-sidebar" src="../src/img/logo-ceutec.png" alt="">
                    </div>

                    <nav>
                        <ul class="navigation navigation-main">
                            <li class="nav-item elector"><a href="elector.jsp"><i class="fas fa-info"></i>Información Votante</li></a>
                            <li class="nav-item presidente"><a href="boleta-presidente.jsp"><i class="fas fa-user"></i>Presidente</li></a>
                            <li class="nav-item alcaldes"><a href="#"><i class="fas fa-user-friends"></i>Alcaldes</li></a>
                            <li class="nav-item header-item">Configuración</li>
                            <li class="nav-item"><a href="elector_login.jsp"><i class="fas fa-sign-out-alt"></i></i>Cerrar Sesión</li></a>
                        </ul>
                    </nav>
                </div>
                <div class="main-body-page"> 
                    <div class="content-wrapper">
                        <div class="content-body">
                            <!-- users list start -->
                            <section class="app-user-list">
                                <div class="card">
                                    <div class="nav-header">
                                        <div style="width: 100%;">
                                            <div style="display: flex;justify-content: space-between;margin:5px 0 15px 0">
                                                <h3>Bienvenidos al Sistema de Votación Online 👋</h3>
                                                <a href="../logout.jsp"><i class="fas fa-sign-out-alt"></i>Cerrar Sesión</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>

                            <section class="app-user-list">
                                <div class="card">
                                    <div class="col-md-12">
                                        <div class="card text-center">
                                            <!--INFORMACIÓN  VOTANTE-->
                                            <% Dba db = new Dba(application.getRealPath("usuarios-sucursal.mdb"));
                                                db.conectar();
                                                db.query.execute("SELECT id_votante, estado, votacion_elector FROM votantes WHERE identidad LIKE '" + request.getParameter("identidad") + "'");
                                                ResultSet rs = db.query.getResultSet();
                                                String estatus1, habilitado1, bloqueadoTab1;
                                                String estatus_votante1, habilitado_votante1, bloqueadoTab_votante1;
                                                Boolean estado1, votacion1;
                                                while (rs.next()) {

                                                    estado1 = rs.getBoolean(2);
                                                    votacion1 = rs.getBoolean(3);

                                                    if (estado1) {
                                                        estatus1 = "Habilitado";
                                                        habilitado1 = "bg-gradient-success";
                                                        bloqueadoTab1 = "";

                                                    } else {
                                                        estatus1 = "Inhabilitado";
                                                        habilitado1 = "bg-gradient-secondary";
                                                        bloqueadoTab1 = "disabled";
                                                    }

                                                    if (votacion1) {
                                                        estatus_votante1 = "Ya Realizó su Voto";
                                                        habilitado_votante1 = "bg-gradient-secondary";
                                                        bloqueadoTab_votante1 = "disabled";

                                                    } else {
                                                        estatus_votante1 = "Puede ejercer su Sufragio";
                                                        habilitado_votante1 = "bg-gradient-success";
                                                        bloqueadoTab_votante1 = "";
                                                    }
                                            %>
                                            <div class="card-header py-2">
                                                <ul class="nav nav-pills card-header-pills ml-0" id="pills-tab" role="tablist">
                                                    <li class="nav-item">
                                                        <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true"><i class="fas fa-info"></i>Información Lector</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="elector_login.jsp" tabindex="-1" ><i class="fas fa-sign-out-alt"></i></i>Regresar</li></a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <%  }%>



                                            <!--INFORMACIÓN  PRESIDENTE-->
                                            <div class="card-body">
                                                <div class="tab-content" id="pills-tabContent">
                                                    <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab"> 
                                                        <% Dba dbb = new Dba(application.getRealPath("usuarios-sucursal.mdb"));
                                                            dbb.conectar();
                                                            dbb.query.execute("SELECT a.id_votante, a.identidad, a.nombre_votante, a.apellidos_votantes, a.sexo, a.fecha_nacimiento, a.estado, b.nombre_departamento, c.nombre_municipio, d.nombre_sector_domicilio, d.numero_mesa, d.linea, d.centro_de_votacion, a.votacion_elector "
                                                                    + "FROM votantes a, departamentos b, municipios c, mesas_electorales d "
                                                                    + "WHERE  a.identidad LIKE '" + request.getParameter("identidad") + "' AND a.id_departamento_mesa = b.id_departamento AND a.id_municipio_mesa = c.id_municipio AND a.numero_mesa = d.id_mesa "
                                                                    + "ORDER BY a.nombre_votante DESC");
                                                            ResultSet rsinf1 = dbb.query.getResultSet();
                                                            String id_votanteb, identidadb, nombresb, apellidosb, sexob, estatusb, departamentob, municipiob, coloniab, numero_mesab, lineab, habilitadob, bloqueadoTabb;
                                                            String estatus_votanteb, habilitado_votanteb, bloqueadoTab_votanteb, nombre_presidenteb, photo_profileb;
                                                            Boolean estadob, votacionb;
                                                            while (rsinf1.next()) {

                                                                id_votanteb = rsinf1.getString(1);
                                                                identidadb = rsinf1.getString(2);
                                                                nombresb = rsinf1.getString(3);
                                                                apellidosb = rsinf1.getString(4);
                                                                sexob = rsinf1.getString(5);

                                                                String fecha_nacimiento2 = rsinf1.getString(6);
                                                                Date fechaNacimiento = new SimpleDateFormat("yyyy-MM-dd").parse(fecha_nacimiento2);
                                                                String fecha_nacimiento = new SimpleDateFormat("dd/MM/yyyy").format(fechaNacimiento);

                                                                estadob = rsinf1.getBoolean(7);
                                                                departamentob = rsinf1.getString(8);
                                                                municipiob = rsinf1.getString(9);
                                                                coloniab = rsinf1.getString(10);
                                                                numero_mesab = rsinf1.getString(11);
                                                                lineab = rsinf1.getString(12);

                                                                if (estadob) {
                                                                    estatusb = "Habilitado";
                                                                    habilitadob = "bg-gradient-success";
                                                                    bloqueadoTabb = "";

                                                                } else {
                                                                    estatusb = "Inhabilitado";
                                                                    habilitadob = "bg-gradient-secondary";
                                                                    bloqueadoTabb = "disabled";
                                                                }

                                                        %>

                                                        <h4 class="card-title">Información</h4>
                                                        <div class="card-title" style="text-align: center;display: flex;justify-content: center;">
                                                            <div class="<%=habilitadob%>" style="width: 300px;padding: 10px;border-radius: 10px;">
                                                                <%=estatusb%>
                                                            </div>

                                                        </div>
                                                        <ul class="list-group list-group-flush">
                                                            <li class="list-group-item">NÚMERO DE IDENTIDAD: <strong> <%=identidadb%> </strong></li>
                                                            <li class="list-group-item">NOMBRE APARECE EN CENSO: <strong> <%=nombresb%> <%=apellidosb%></strong></li>
                                                            <li class="list-group-item">SEXO: <strong><%=sexob%></strong></li>
                                                            <li class="list-group-item">FECHA DE NACIMIENTO: <strong><%=fecha_nacimiento%></strong></li>
                                                            <li class="list-group-item">DEPARTAMENTO Y MUNICIPIO DE DOMICILIO: <strong><%=municipiob%>, <%=departamentob%></strong></li>
                                                            <li class="list-group-item">NOMBRE DEL SECTOR DOMICILIO: <strong><%=coloniab%></strong></li>
                                                            <li class="list-group-item">MESA:<strong> <%=numero_mesab%></strong></li>
                                                            <li class="list-group-item">LÍNEA:<strong> <%=lineab%></strong></li>
                                                        </ul>


                                                        <!--presidentes-->
                                                        <div>
                                                            <h4 class="card-title" style="font-weight: 900;font-size: 29px;margin-bottom: 3px;"><i class="fas fa-user"></i>Presidentes</h4>
                                                            <h4 class="card-title">Formula Presidencial y Al Palmento Centroamericano 2021</h4>
                                                            <div class="card-title" style="text-align: center;display: flex;justify-content: center;">
                                                                <% db.query.execute("SELECT identidad, voto_presidente FROM votantes WHERE identidad LIKE '" + request.getParameter("identidad") + "' ");
                                                                    ResultSet rsinfo = db.query.getResultSet();
                                                                    String estatus_votante2, habilitado_votante2, bloqueadoTab_votante2;
                                                                    Boolean estado2, votacion_presidente2;
                                                                    while (rsinfo.next()) {

                                                                        votacion_presidente2 = rsinfo.getBoolean(2);

                                                                        if (votacion_presidente2) {
                                                                            estatus_votante2 = "Ya Realizó su Voto";
                                                                            habilitado_votante2 = "bg-gradient-secondary";
                                                                            bloqueadoTab_votante2 = "disabled";

                                                                        } else {
                                                                            estatus_votante2 = "Puede ejercer su Sufragio";
                                                                            habilitado_votante2 = "bg-gradient-success";
                                                                            bloqueadoTab_votante2 = "";
                                                                        }
                                                                %>
                                                                <div class="<%=habilitado_votante2%>" style="width: 300px;padding: 10px;border-radius: 10px;">
                                                                    <%=estatus_votante2%>
                                                                </div>
                                                                <%  }%>
                                                            </div>
                                                            <%
                                                                String presideParame = request.getParameter("presidentes");
                                                                String id_votante = request.getParameter("identidad");

                                                            %>
                                                            <%  //MODIFICAR un producto-----------------------------------------------   
                                                                if (request.getParameter("bt_votar_presidente") != null) {
                                                                    try {
                                                                        Dba dbF = new Dba(application.getRealPath("usuarios-sucursal.mdb"));
                                                                        dbF.conectar();
                                                                        int contador = dbF.query.executeUpdate("UPDATE votos_presidentes a SET a.numero_votos = a.numero_votos+1 WHERE a.id_presidente='" + request.getParameter("presidentes") + "' ");
                                                                        //                                                        int contador = dbF.query.executeUpdate("UPDATE votos_presidentes a SET a.numero_votos = a.numero_votos+1 WHERE a.id_presidente='" + request.getParameter("presidentes") + "' ");
                                                                        if (contador >= 1) {
                                                                            String alerta = "<div class='alert alert-success' role='alert'><h4 class='alert-heading'>El voto Presidencial se realizó con éxito</h4></div>";
                                                                            dbF.query.executeUpdate("UPDATE votantes b SET b.voto_presidente = true, b.votacion_elector = true WHERE b.identidad='" + request.getParameter("identidad") + "' ");
                                                                            out.print(alerta);
                                                                        }
                                                                        dbF.commit();
                                                                        dbF.desconectar();
                                                                    } catch (Exception e) {
                                                                        String alerta = "<div class='alert alert-danger' role='alert'><h4 class='alert-heading'>El registro no se modificó</h4></div>";
                                                                        out.print(alerta);
                                                                        e.printStackTrace();
                                                                    }
                                                                }
                                                            %>
                                                            <div class="">
                                                                <form class="form" style="display: flex;flex-direction: column;flex-wrap: wrap;" action="elector.jsp?identidad=<%=request.getParameter("identidad")%>" name="f1" method="POST">

                                                                    <div style="display: flex;flex-direction: column;flex-wrap: wrap;">
                                                                        <div style="margin: 0 5px;display: flex;flex-wrap: wrap;">
                                                                            <% db.query.execute("SELECT a.identidad, a.voto_presidente, b.presidente_id, c.nombre_presidente, c.photo_profile, c.id_presidente FROM votantes a, votos_electores b, presidente c "
                                                                                        + "WHERE a.identidad LIKE '" + request.getParameter("identidad") + "' "
                                                                                        + "AND a.id_votante = b.id_votante");
                                                                                ResultSet rsinf = db.query.getResultSet();
                                                                                String identidad, presidente_id, nombre_presidente, photo_profile, estatus_votante, habilitado_votante, bloqueadoTab_votante, id_presi, ocultar;
                                                                                Boolean estado, votacion_presidente;
                                                                                while (rsinf.next()) {

                                                                                    identidad = rsinf.getString(1);
                                                                                    votacion_presidente = rsinf.getBoolean(2);

                                                                                    presidente_id = rsinf.getString(3);
                                                                                    nombre_presidente = rsinf.getString(4);
                                                                                    photo_profile = rsinf.getString(5);
                                                                                    id_presi = rsinf.getString(6);

                                                                                    if (votacion_presidente) {
                                                                                        estatus_votante = "Ya Realizó su Voto";
                                                                                        habilitado_votante = "bg-gradient-secondary";
                                                                                        bloqueadoTab_votante = "disabled";
                                                                                        ocultar = "display:none;";

                                                                                    } else {
                                                                                        estatus_votante = "Puede ejercer su Sufragio";
                                                                                        habilitado_votante = "bg-gradient-success";
                                                                                        bloqueadoTab_votante = "";
                                                                                        ocultar = "";
                                                                                    }
                                                                            %>


                                                                            <div style="<%=ocultar%>width: 200px;height: 382px;border: 1px solid;margin: 20px 5px;">
                                                                                <div class="" style="border-bottom: 1px solid grey;">
                                                                                    <img class="imagen-perfil" src="<%=photo_profile%>" alt="Meeting Pic"/>
                                                                                    <h4 class="card-title" style="font-size: 14px;margin-bottom: 0;padding: 10px 0px;"><%=nombre_presidente%></h4>
                                                                                </div>
                                                                                <div class="input">
                                                                                    <div class="input-box">
                                                                                        <input type="radio" id="<%=id_presi%>" value="<%=id_presi%>" name="presidentes" <%=bloqueadoTab_votante%> onclick="clickradio()">
                                                                                        <label for="<%=id_presi%>"></label>
                                                                                    </div>
                                                                                </div>
                                                                            </div> 


                                                                            <%  }%>


                                                                        </div>
                                                                    </div>

                                                                    <div style="display: flex;flex-direction: column;flex-wrap: wrap;">
                                                                        <h4 class="card-title" style="font-weight: 900;font-size: 29px;margin-bottom: 3px;"><i class="fas fa-user-friends"></i>Alcaldes</h4>
                                                                        <h4 class="card-title">Formula Municipal</h4>
                                                                        <div style="margin: 0 5px;display: flex;flex-wrap: wrap;">

                                                                            <% db.query.execute("SELECT a.identidad, a.voto_alcalde, b.presidente_id, c.nombre_alcalde, c.photo_profile, c.id_alcalde FROM votantes a, votos_electores b, alcaldes c "
                                                                                        + "WHERE a.identidad LIKE '" + request.getParameter("identidad") + "' "
                                                                                        + "AND a.id_votante = b.id_votante");
                                                                                ResultSet rsin = db.query.getResultSet();
                                                                                String identidad_v, alcalde_id, nombre_alcalde, photo_profile_alcalde, estatus_votante_2, habilitado_votante_1, bloqueadoTab_votante_2, id_alcalde, ocultar1;

                                                                                Boolean estado_votante, votacion_alcalde;
                                                                                while (rsin.next()) {

                                                                                    identidad_v = rsin.getString(1);
                                                                                    votacion_alcalde = rsin.getBoolean(2);

                                                                                    alcalde_id = rsin.getString(3);
                                                                                    nombre_alcalde = rsin.getString(4);
                                                                                    photo_profile_alcalde = rsin.getString(5);
                                                                                    id_alcalde = rsin.getString(6);

                                                                                    if (votacion_alcalde) {
                                                                                        estatus_votante_2 = "Ya Realizó su Voto";
                                                                                        habilitado_votante_1 = "bg-gradient-secondary";
                                                                                        bloqueadoTab_votante_2 = "disabled";
                                                                                        ocultar1 = "display:none;";

                                                                                    } else {
                                                                                        estatus_votante_2 = "Puede ejercer su Sufragio";
                                                                                        habilitado_votante_1 = "bg-gradient-success";
                                                                                        bloqueadoTab_votante_2 = "";
                                                                                        ocultar1 = "";
                                                                                    }
                                                                            %>


                                                                            <div style="<%=ocultar1%>width: 200px;height: 382px;border: 1px solid;margin: 20px 5px;">
                                                                                <div class="" style="border-bottom: 1px solid grey;">
                                                                                    <img class="imagen-perfil" src="<%=photo_profile_alcalde%>" alt="Meeting Pic"/>
                                                                                    <h4 class="card-title" style="font-size: 14px;margin-bottom: 0;padding: 10px 0px;"><%=nombre_alcalde%></h4>
                                                                                </div>
                                                                                <div class="input">
                                                                                    <div class="input-box">
                                                                                        <input type="radio" id="<%=id_alcalde%>" value="<%=id_alcalde%>" name="alcaldes" <%=bloqueadoTab_votante_2%> onclick="clickradio()">
                                                                                        <label for="<%=id_alcalde%>"></label>
                                                                                    </div>
                                                                                </div>
                                                                            </div> 


                                                                            <%  }%>

                                                                        </div>
                                                                    </div>

                                                                    <div style="display: flex;flex-direction: column;flex-wrap: wrap;">
                                                                        <h4 class="card-title" style="font-weight: 900;font-size: 29px;margin-bottom: 3px;"><i class="fas fa-user-friends"></i>Diputados</h4>
                                                                        <h4 class="card-title">Formula Diputación</h4>
                                                                        <div style="margin: 0 5px;display: flex;flex-wrap: wrap;">

                                                                            <% db.query.execute("SELECT a.identidad, a.voto_alcalde, b.alcalde_id, c.nombre_alcalde, c.photo_profile, c.id_diputado FROM votantes a, votos_electores b, diputados c "
                                                                                        + "WHERE a.identidad LIKE '" + request.getParameter("identidad") + "' "
                                                                                        + "AND a.id_votante = b.id_votante ORDER BY c.id_diputado ASC");
                                                                                ResultSet rsind = db.query.getResultSet();
                                                                                String identidad_vd, alcalde_id_di, nombre_alcalde_d, photo_profile_alcalde_d, estatus_votante_3, habilitado_votante_3, bloqueadoTab_votante_3, id_alcalde_3, ocultar_3;

                                                                                Boolean estado_votante_2, votacion_alcalde_4;
                                                                                while (rsind.next()) {

                                                                                    identidad_v = rsind.getString(1);
                                                                                    votacion_alcalde_4 = rsind.getBoolean(2);

                                                                                    alcalde_id = rsind.getString(3);
                                                                                    nombre_alcalde = rsind.getString(4);
                                                                                    photo_profile_alcalde = rsind.getString(5);
                                                                                    id_alcalde = rsind.getString(6);

                                                                                    if (votacion_alcalde_4) {
                                                                                        estatus_votante_2 = "Ya Realizó su Voto";
                                                                                        habilitado_votante_1 = "bg-gradient-secondary";
                                                                                        bloqueadoTab_votante_2 = "disabled";
                                                                                        ocultar1 = "display:none;";

                                                                                    } else {
                                                                                        estatus_votante_2 = "Puede ejercer su Sufragio";
                                                                                        habilitado_votante_1 = "bg-gradient-success";
                                                                                        bloqueadoTab_votante_2 = "";
                                                                                        ocultar1 = "";
                                                                                    }
                                                                            %>


                                                                            <div style="<%=ocultar1%>width: 200px;height: 382px;border: 1px solid;margin: 20px 5px;">
                                                                                <div class="" style="border-bottom: 1px solid grey;">
                                                                                    <img class="imagen-perfil" src="<%=photo_profile_alcalde%>" alt="Meeting Pic"/>
                                                                                    <h4 class="card-title" style="font-size: 14px;margin-bottom: 0;padding: 10px 0px;"><%=nombre_alcalde%></h4>
                                                                                </div>
                                                                                <div class="input">
                                                                                    <div class="input-box">
                                                                                        <input type="checkbox" id="<%=id_alcalde%>" value="<%=id_alcalde%>" name="diputados" <%=bloqueadoTab_votante_2%> onclick="clicheck()">
                                                                                        <label for="<%=id_alcalde%>"></label>
                                                                                    </div>
                                                                                </div>
                                                                            </div> 


                                                                            <%  }%>

                                                                        </div>
                                                                    </div>

                                                                    <div class="row">
                                                                        <div class="col-12 mb-1">
                                                                            <button class="btn btn-primary" style="font-size: 18px;" name="bt_votar_presidente" type="submit" onclick="clickradio()">Votar Aquí</button>
                                                                            <br>
                                                                            <p id="mensaje" style="font-size: 18px;color: #c3151c;padding-top: 5px;"></p>
                                                                        </div>
                                                                    </div>      

                                                                </form>

                                                            </div>
                                                        </div>

                                                    </div>
                                                    <%  }%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </section>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- BEGIN: Vendor JS-->
        <script src="../src/app-assets/vendors/js/vendors.min.js"></script>
        <!-- BEGIN Vendor JS-->

        <!-- BEGIN: Page Vendor JS-->
        <script src="../src/app-assets/vendors/js/tables/datatable/jquery.dataTables.min.js"></script>
        <script src="../src/app-assets/vendors/js/tables/datatable/datatables.bootstrap4.min.js"></script>
        <script src="../src/app-assets/vendors/js/tables/datatable/dataTables.responsive.min.js"></script>
        <script src="../src/app-assets/vendors/js/tables/datatable/responsive.bootstrap4.js"></script>
        <script src="../src/app-assets/vendors/js/tables/datatable/datatables.buttons.min.js"></script>
        <script src="../src/app-assets/vendors/js/tables/datatable/buttons.bootstrap4.min.js"></script>
        <script src="../src/app-assets/vendors/js/forms/validation/jquery.validate.min.js"></script>
        <!-- BEGIN: Vendor JS-->
        <script src="../src/app-assets/vendors/js/vendors.min.js"></script>
        <!-- BEGIN Vendor JS-->

        <!-- BEGIN: Page Vendor JS-->
        <!-- END: Page Vendor JS-->

        <!-- BEGIN: Theme JS-->
        <script src="../src/app-assets/js/core/app-menu.js"></script>
        <script src="../src/app-assets/js/core/app.js"></script>
        <!-- END: Theme JS-->
        <!-- END: Page Vendor JS-->

        <!-- BEGIN: Theme JS-->
        <script src="../src/app-assets/js/core/app-menu.js"></script>
        <script src="../src/app-assets/js/core/app.js"></script>
        <!-- END: Theme JS-->

        <!-- BEGIN: Page JS-->
        <script src="../src/app-assets/js/scripts/pages/app-user-list.js"></script>
        <!-- END: Page JS-->

    </body>

</html>