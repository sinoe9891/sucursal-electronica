<%if (session.getAttribute("s_user") == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
%>
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
        <link rel="stylesheet" type="text/css"
              href="../src/app-assets/vendors/css/tables/datatable/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css"
              href="../src/app-assets/vendors/css/tables/datatable/responsive.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css"
              href="../src/app-assets/vendors/css/tables/datatable/buttons.bootstrap4.min.css">
        <!-- END: Vendor CSS-->

        <!-- BEGIN: Theme CSS-->
        <link rel="stylesheet" type="text/css" href="../src/app-assets/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="../src/app-assets/css/bootstrap-extended.css">
        <link rel="stylesheet" type="text/css" href="../src/app-assets/css/colors.css">
        <link rel="stylesheet" type="text/css" href="../src/app-assets/css/components.css">
        <link rel="stylesheet" type="text/css" href="../src/app-assets/css/themes/dark-layout.css">
        <link rel="stylesheet" type="text/css" href="../src/app-assets/css/themes/bordered-layout.css">
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAY7Ys2hwRXTru00HE2Dxn6BEGU7t6s2_A&callback=initMap"></script>
        <!--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">-->
        <!--<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.20/datatables.min.css"/>-->

        <script type="text/javascript">

            function mostrar_mapa(centinela) {

                //UbicaciÃ³n inicial del mapa.
                var ubicacion = new google.maps.LatLng(<%= request.getParameter("latitud")%>,<%= request.getParameter("longitud")%>); //Latitud y Longitud

                console.log(ubicacion.lat());
                if (ubicacion.lat() == 0 && ubicacion.lng() == 0) {
                    document.getElementById("id_mapa_ver").style.display = "none";
                } else {
                    document.getElementById("id_mapa_ver").style.display = "initial";
                }


                //ParÃ¡metros Iniciales
                var opciones = {zoom: <%= request.getParameter("zoom_m")%>, //acercamiento
                    center: ubicacion,
                    mapTypeId: google.maps.MapTypeId.SATELLITE, //Las posibles opciones son ROADMAP/SATELLITE/HYBRID/TERRA
                    disableDefaultUI: true,
                    disableDoubleClickZoom: true,
                    draggable: false
                };

                //Creacion del mapa
                var map = new google.maps.Map(document.getElementById("mapa"), opciones);

                //recuperar ubicacion donde hago click
                var iw = new google.maps.InfoWindow(
                        {content: '<%= request.getParameter("centro")%>',
                            position: ubicacion});
                iw.open(map);
                // configurar evento click sobre el mapa
//                map.addListener('click', function (mapsMouseEvent) {
//                    iw.close();
//                    iw = new google.maps.InfoWindow({position: mapsMouseEvent.latLng});
//                    iw.setContent(mapsMouseEvent.latLng.toString());
//                    iw.open(map);
//                });


                if (centinela == 1) {
                    //Colocar una marca sobre el Mapa
                    mi_ubicacion = new google.maps.Marker({
                        position: new google.maps.LatLng(14.104173, -87.186145), //PosiciÃ³n de la marca
                        icon: 'persona.jpg', //Imagen que aparecerÃ¡ en la marca, debe estar en el server
                        map: map, //Mapa donde estarÃ¡ la marca
                        title: 'Danny Velásquez' //TÃ­tulo all hacer un mouseover
                    });

                    //Mostrar InformaciÃ³n al hacer click en la marca
                    var infowindow = new google.maps.InfoWindow({
                        content: 'Elaborado Por: Danny Velásquez Cadenas<br/>'
                    });

                    google.maps.event.addListener(mi_ubicacion, 'click', function () {
                        //Calling the open method of the InfoWindow
                        infowindow.open(map, mi_ubicacion);
                    });
                }
            }



        </script>

        <style>
            .votantes a{
                color:#c3151c;
            }
            .custom-control.custom-switch.custom-switch-success {
                margin-top: 10px;
            }
        </style>
    </head>   
    <body>
        <div class="main-sidebar">
            <div class="container-login">
                <%@include file="sidebar.jsp" %>
                <div class="main-body-page"> 
                    <div class="content-wrapper">
                        <div class="content-body">
                            <section class="app-user-list">
                                <div class="card">
                                    <div class="nav-header">
                                        <div style="width: 50%;">
                                            <h3>Votantes</h3>
                                        </div>
                                        <div style="text-align:right;width: 50%;">
                                            <a href="votantes-edit.jsp"><button class="btn add-new btn-primary mt-100" type="button"><span>Gestionar</span></button></a>
                                            <!--<button class="btn add-new btn-info mt-100" type="button"><span>Editar</span></button>
                                                <button class="btn add-new btn-warning mt-100" type="button"><span>Modificar</span></button>
                                                <button class="btn add-new btn-danger mt-100" type="button"><span>Eliminar</span></button>-->
                                        </div>
                                    </div>
                                </div>
                            </section>
                            <section class="app-user-list" id="id_mapa_ver">
                                <div class="card">
                                    <div class="nav-header">
                                        <div>
                                            <section class="app-user-list" id="id_mapa_ver">
                                                <div class="card">
                                                    <center>
                                                        <body onload="mostrar_mapa(0)" >
                                                            <h4>Ubicación de Sector Domicilio</h4>
                                                            <div id="mapa" style="width: 650px; height: 400px;"></div>
                                                        </body>
                                                    </center>
                                                </div>
                                            </section>
                                        </div>
                                        <div>
                                            <%
                                                //paso #2 si preciono el link 
                                                if (request.getParameter("ver_mapa") != null) {
                                            %>
                                            <br>
                                            <% Dba db = new Dba(application.getRealPath("usuarios-sucursal.mdb"));
                                                db.conectar();
                                                db.query.execute("SELECT a.id_votante, a.identidad, a.nombre_votante, a.apellidos_votantes, a.sexo, a.fecha_nacimiento, a.estado, b.nombre_departamento, c.nombre_municipio, d.nombre_sector_domicilio, d.numero_mesa, d.linea, d.nombre_sector_domicilio, d.centro_de_votacion, d.latitud, d.longitud "
                                                        + "FROM votantes a, departamentos b, municipios c, mesas_electorales d WHERE  a.identidad "
                                                        + "LIKE '" + request.getParameter("identidad") + "' "
                                                        + "AND a.id_departamento_mesa = b.id_departamento AND a.id_municipio_mesa = c.id_municipio AND a.numero_mesa = d.id_mesa "
                                                        + "ORDER BY a.nombre_votante DESC");
                                                ResultSet rs = db.query.getResultSet();
                                                String id_votante, identidad, nombres, apellidos, sexo, estatus, departamento, municipio, colonia, numero_mesa, linea;
                                                Boolean estado;
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

                                                    if (estado) {
                                                        estatus = "Habilitado";
                                                    } else {
                                                        estatus = "Inhabilitado";
                                                    }
                                            %>
                                            <section class="app-user-list" id="id_mapa_ver">                                                
                                                    <h4>Información del Ciudadano</h4>
                                                    <div class="nav-header">

                                                        <ul class="list-group list-group-flush">
                                                            <li class="list-group-item">NÚMERO DE IDENTIDAD: <strong> <%=identidad%> </strong></li>
                                                            <li class="list-group-item">NOMBRE APARECE EN CENSO: <strong> <%=nombres%> <%=apellidos%></strong></li>
                                                            <li class="list-group-item">SEXO: <strong><%=sexo%></strong></li>
                                                            <li class="list-group-item">FECHA DE NACIMIENTO: <strong><%=fecha_nacimiento%></strong></li>
                                                            <li class="list-group-item">ESTADO EN CENSO: <strong><%=estatus%></strong></li>
                                                            <li class="list-group-item">DEPARTAMENTO Y MUNICIPIO DE DOMICILIO: <strong><%=municipio%>, <%=departamento%></strong></li>
                                                            <li class="list-group-item">NOMBRE DEL SECTOR DOMICILIO: <strong><%=colonia%></strong></li>
                                                            <li class="list-group-item">MESA:<strong> <%=numero_mesa%></strong></li>
                                                            <li class="list-group-item">LÍNEA:<strong> <%=linea%></strong></li>
                                                        </ul>

                                                    </div>
                                                
                                            </section>
                                        </div>
                                        <%  }%>
                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                            </section>
                            <section class="app-user-list">
                                <div class="card">
                                    <div class="card-datatable table-responsive pt-0" style='padding: 1rem !important;'>
                                        <div class="card-header border-bottom">
                                            <h4 class="card-title">Votantes</h4>
                                        </div>
                                        <table class="user-list-table "  id="datatable">
                                            <thead class="thead-light">
                                                <tr class = "thead-dark">
                                                    <th data-field="nombre" data-editable="false">IDENTIDAD</th>
                                                    <th data-field="operaciones" data-editable="false">NOMBRE</th>
                                                    <th data-field="operaciones" data-editable="false">APELLIDO</th>
                                                    <th data-field="descripcion" data-editable="false">SEXO</th>
                                                    <th data-field="operaciones" data-editable="false">ESTADO</th>
                                                    <th data-field="operaciones" data-editable="false">MÁS INFORMACIÓN</th>
                                                    <!--<th data-field="operaciones" data-editable="false">MÁS INFORMACIÓN</th>-->
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% Dba db = new Dba(application.getRealPath("usuarios-sucursal.mdb"));
                                                    db.conectar();
                                                    db.query.execute("SELECT a.id_votante, a.identidad, a.nombre_votante, a.apellidos_votantes, a.sexo, a.fecha_nacimiento, a.estado, d.latitud, d.longitud, d.centro_de_votacion FROM votantes a, departamentos b, municipios c, mesas_electorales d "
                                                            + "WHERE a.id_departamento_mesa = b.id_departamento AND a.id_municipio_mesa = c.id_municipio AND a.numero_mesa = d.id_mesa ORDER BY a.nombre_votante DESC");
                                                    ResultSet rs = db.query.getResultSet();
                                                    String id_votante, identidad, nombres, apellidos, sexo, fecha_nacimiento, estatus, latitud, longitud, centro;
                                                    Boolean estado;
                                                    while (rs.next()) {

                                                        id_votante = rs.getString(1);
                                                        identidad = rs.getString(2);
                                                        nombres = rs.getString(3);
                                                        apellidos = rs.getString(4);
                                                        sexo = rs.getString(5);
                                                        fecha_nacimiento = rs.getString(6);
                                                        estado = rs.getBoolean(7);
                                                        latitud = rs.getString(8);
                                                        longitud = rs.getString(9);
                                                        centro = rs.getString(10);

                                                        if (estado) {
                                                            estatus = "Habilitado";
                                                        } else {
                                                            estatus = "Inhabilitado";
                                                        }

                                                %>
                                                <tr role="row" class="odd">
                                                    <td>
                                                        <div class="d-flex justify-content-left align-items-center">
                                                            <%=identidad%>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex justify-content-left align-items-center">
                                                            <%=nombres%>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex justify-content-left align-items-center">
                                                            <%=apellidos%>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex justify-content-left align-items-center">
                                                            <%=sexo%>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex justify-content-left align-items-center">
                                                            <%=estatus%>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex justify-content-left align-items-center">
                                                            <a href="votantes.jsp?identidad=<%=identidad%>&centro=<%=centro%>&latitud=<%=latitud%>&longitud=<%=longitud%>&zoom_m=19&ver_mapa=1" onclick="mostrar_mapa(1)">Ver Votante</a>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <%  }%>
                                            </tbody> 
                                        </table>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.20/datatables.min.js"></script>
        <script>
                                                                $("#datatable").DataTable();
        </script>
        <!-- BEGIN: Vendor JS-->
        <script src="../src/app-assets/vendors/js/vendors.min.js"></script>
        <!-- BEGIN Vendor JS-->

        <!-- BEGIN: Page Vendor JS-->
        <script src="../src/app-assets/vendors/js/tables/datatable/jquery.dataTables.min.js"></script>
        <script src="../src/app-assets/vendors/js/tables/datatable/datatables.bootstrap4.min.js"></script>
        <script src="../src/app-assets/vendors/js/tables/datatable/dataTables.responsive.min.js"></script>
        <script src="../src/app-assets/vendors/js/tables/datatable/responsive.bootstrap4.js"></script>
        <!--<script src="../src/app-assets/vendors/js/pickers/flatpickr/flatpickr.min.js"></script>-->
        <script src="../src/app-assets/vendors/js/tables/datatable/datatables.buttons.min.js"></script>
        <script src="../src/app-assets/vendors/js/tables/datatable/buttons.bootstrap4.min.js"></script>
        <script src="../src/app-assets/vendors/js/forms/validation/jquery.validate.min.js"></script>
        <script src="../src/app-assets/js/scripts/tables/table-datatables-advanced.js"></script>
        <!-- END: Page Vendor JS-->
        <script>
                                                                $(window).on('load', function () {
                                                                    if (feather) {
                                                                        feather.replace({
                                                                            width: 14,
                                                                            height: 14
                                                                        });
                                                                    }
                                                                })
        </script> 
        <!-- BEGIN: Theme JS-->
        <script src="../src/app-assets/js/core/app-menu.js"></script>
        <script src="../src/app-assets/js/core/app.js"></script>
        <!-- END: Theme JS-->

        <!-- BEGIN: Page JS-->
        <script src="../src/app-assets/js/scripts/pages/app-user-list.js"></script>
        <!-- END: Page JS-->
    </body> 
</html>