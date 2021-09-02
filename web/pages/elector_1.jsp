
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
                display: none;
            }

            label {
                width: 300px;
                height: 300px;
                padding-left: 1em;
                position: relative;
                border: 1px solid rgb(47, 61, 255);
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
                color: #00e676;
                content: '\f00d';
                font-family: FontAwesome;
                font-size: 300px;
            }
        </style>
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
                            <li class="nav-item"><a href="pages/elector_login.jsp"><i class="fas fa-sign-out-alt"></i></i>Cerrar Sesión</li></a>
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
                                        <% Dba db = new Dba(application.getRealPath("usuarios-sucursal.mdb"));
                                            db.conectar();
                                            db.query.execute("SELECT a.id_votante, a.identidad, a.nombre_votante, a.apellidos_votantes, a.sexo, a.fecha_nacimiento, a.estado, "
                                                    + "b.nombre_departamento, c.nombre_municipio, d.nombre_sector_domicilio, d.numero_mesa, d.linea, d.centro_de_votacion, "
                                                    + "a.votacion_elector e.nombre_presidente, e.photo_profile "
                                                    + "FROM votantes a, departamentos b, municipios c, mesas_electorales d, presidente e, votos_presidentes f, votos_alcalde g WHERE  a.identidad "
                                                    + "LIKE '" + request.getParameter("identidad") + "' "
                                                    + "AND a.id_departamento_mesa = b.id_departamento AND a.id_municipio_mesa = c.id_municipio AND a.numero_mesa = d.id_mesa "
                                                    + "ORDER BY a.nombre_votante DESC");
                                            ResultSet rs = db.query.getResultSet();
                                            String id_votante, identidad, nombres, apellidos, sexo, estatus, departamento, municipio, colonia, numero_mesa, linea, habilitado, bloqueadoTab;
                                            String estatus_votante, habilitado_votante, bloqueadoTab_votante, nombre_presidente, photo_profile;
                                            Boolean estado, votacion;
                                            while (rs.next()) {

                                                id_votante = rs.getString(1);
                                                identidad = rs.getString(2);
                                                nombres = rs.getString(3);
                                                apellidos = rs.getString(4);
                                                sexo = rs.getString(5);

                                                String fecha_nacimiento2 = rs.getString(6);
                                                Date fechaNacimiento = new SimpleDateFormat("yyyy-MM-dd").parse(fecha_nacimiento2);
                                                String fecha_nacimiento = new SimpleDateFormat("dd/MM/yyyy").format(fechaNacimiento);

                                                estado = rs.getBoolean(7);
                                                departamento = rs.getString(8);
                                                municipio = rs.getString(9);
                                                colonia = rs.getString(10);
                                                numero_mesa = rs.getString(11);
                                                linea = rs.getString(12);
                                                votacion = rs.getBoolean(14);
                                                nombre_presidente = rs.getString(15);
                                                photo_profile = rs.getString(14);

                                                if (estado) {
                                                    estatus = "Habilitado";
                                                    habilitado = "bg-gradient-success";
                                                    bloqueadoTab = "";

                                                } else {
                                                    estatus = "Inhabilitado";
                                                    habilitado = "bg-gradient-secondary";
                                                    bloqueadoTab = "disabled";
                                                }

                                                if (votacion) {
                                                    estatus_votante = "Ya Realizó su Voto";
                                                    habilitado_votante = "bg-gradient-secondary";
                                                    bloqueadoTab_votante = "disabled";

                                                } else {
                                                    estatus_votante = "Puede ejercer su Sufragio";
                                                    habilitado_votante = "bg-gradient-success";
                                                    bloqueadoTab_votante = "";
                                                }


                                        %>
                                        <div class="card text-center">
                                            <div class="card-header py-2">
                                                <ul class="nav nav-pills card-header-pills ml-0" id="pills-tab" role="tablist">
                                                    <li class="nav-item">
                                                        <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true"><i class="fas fa-info"></i>Información Lector</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link  <%=bloqueadoTab%>" id="pills-profile-tab" data-toggle="pill" href="#pills-presidente" role="tab" aria-controls="pills-profile" aria-selected="false"><i class="fas fa-user"></i>Presidentes</li></a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link  <%=bloqueadoTab%>" id="pills-profile-tab" data-toggle="pill" href="#pills-alcalde" role="tab" aria-controls="pills-profile" aria-selected="false"><i class="fas fa-user-friends"></i>Alcaldes</li></a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link  <%=bloqueadoTab%>" id="pills-profile-tab" data-toggle="pill" href="#pills-diputado" role="tab" aria-controls="pills-profile" aria-selected="false"><i class="fas fa-users"></i>Diputados</li></a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="elector_login.jsp" tabindex="-1" ><i class="fas fa-sign-out-alt"></i></i>Regresar</li></a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="card-body">
                                                <div class="tab-content" id="pills-tabContent">
                                                    <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">   
                                                        <h4 class="card-title">Información</h4>

                                                        <div class="card-title" style="text-align: center;display: flex;justify-content: center;">
                                                            <div class="<%=habilitado%>" style="width: 300px;padding: 10px;border-radius: 10px;">
                                                                <%=estatus%>
                                                            </div>

                                                        </div>
                                                        <ul class="list-group list-group-flush">
                                                            <li class="list-group-item">NÚMERO DE IDENTIDAD: <strong> <%=identidad%> </strong></li>
                                                            <li class="list-group-item">NOMBRE APARECE EN CENSO: <strong> <%=nombres%> <%=apellidos%></strong></li>
                                                            <li class="list-group-item">SEXO: <strong><%=sexo%></strong></li>
                                                            <li class="list-group-item">FECHA DE NACIMIENTO: <strong><%=fecha_nacimiento%></strong></li>
                                                            <li class="list-group-item">DEPARTAMENTO Y MUNICIPIO DE DOMICILIO: <strong><%=municipio%>, <%=departamento%></strong></li>
                                                            <li class="list-group-item">NOMBRE DEL SECTOR DOMICILIO: <strong><%=colonia%></strong></li>
                                                            <li class="list-group-item">MESA:<strong> <%=numero_mesa%></strong></li>
                                                            <li class="list-group-item">LÍNEA:<strong> <%=linea%></strong></li>
                                                        </ul>

                                                    </div>
                                                    <div class="tab-pane fade" id="pills-presidente" role="tabpanel" aria-labelledby="pills-profile-tab">
                                                        <h4 class="card-title">Presidentes</h4>
                                                        <h4 class="card-title">Formula Presidencial y Al Palmento Centroamericano 2021</h4>
                                                        <div class="card-title" style="text-align: center;display: flex;justify-content: center;">
                                                            <div class="<%=habilitado_votante%>" style="width: 300px;padding: 10px;border-radius: 10px;">
                                                                <%=estatus_votante%>
                                                            </div>

                                                        </div>
                                                        <div class="col-lg-4 col-md-6 col-12">
                                                            <div class="card card-developer-meetup">
                                                                <form class="form" style="display: flex;" action="elector.jsp?identidad=<%=identidad%>" name="f1" method="POST">
                                                                    <div class="caja" style="display: flex;margin: 0 20px;">
                                                                        <div class="caja1" style="margin: 0 20px;">
                                                                            <div class="meetup-img-wrapper rounded-top text-center">
                                                                                <img src="../src/presidentes/luis.jpg" alt="Meeting Pic" height="170" />
                                                                            </div>
                                                                            <div class="input">
                                                                                <div class="input-box">
                                                                                    <input type="radio" id="activar2" name="presidentes" <%=bloqueadoTab_votante%> required>
                                                                                    <label for="activar2"></label>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="caja1" style="margin: 0 20px;">
                                                                            <div class="meetup-img-wrapper rounded-top text-center">
                                                                                <img src="../src/presidentes/luis.jpg" alt="Meeting Pic" height="170" />
                                                                            </div>
                                                                            <div class="input">
                                                                                <div class="input-box">
                                                                                    <input type="radio" id="activar3" name="presidentes" <%=bloqueadoTab_votante%> required>
                                                                                    <label for="activar3"></label>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="caja1" style="margin: 0 20px;">
                                                                            <div class="meetup-img-wrapper rounded-top text-center">
                                                                                <img src="../src/presidentes/luis.jpg" alt="Meeting Pic" height="170" />
                                                                            </div>
                                                                            <div class="input">
                                                                                <div class="input-box">
                                                                                    <input type="radio" id="activar1" name="presidentes" <%=bloqueadoTab_votante%> required>
                                                                                    <label for="activar1"></label>
                                                                                </div>
                                                                            </div>
                                                                        </div>  
                                                                    </div>
                                                            </div>
                                                        </div>
                                                        <div class="tab-pane fade" id="pills-alcalde" role="tabpanel" aria-labelledby="pills-profile-tab">
                                                            <h4 class="card-title">Alcaldes</h4>
                                                            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                                        </div>
                                                        <div class="tab-pane fade" id="pills-diputado" role="tabpanel" aria-labelledby="pills-profile-tab">
                                                            <h4 class="card-title">Diputados</h4>
                                                            <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
                                                        </div>
                                                        </form>
                                                        <%  }%>
                                                    </div>
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