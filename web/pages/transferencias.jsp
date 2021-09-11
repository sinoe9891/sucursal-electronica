<%if (session.getAttribute("s_user") == null) {
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
%>
<%@page import="database.*"%>
<%@page import="java.sql.*"%>
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
        <title>Gestionar Tarjetas | Sucursal Electrónica</title>
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

        <!-- BEGIN: Page CSS-->
        <!-- <link rel="stylesheet" type="text/css" href="../src/app-assets/css/core/menu/menu-types/vertical-menu.css">
    <link rel="stylesheet" type="text/css" href="../src/app-assets/css/plugins/forms/form-validation.css">
    <link rel="stylesheet" type="text/css" href="../src/app-assets/css/pages/app-user.css"> -->
        <!-- END: Page CSS-->
        <style>
            .cuentas a{
                color:#c3151c;
            }
        </style>
    </head>  

    <script>
        function mod(pid, pnp, pd, pep, pp, pe, pfv) {
            var modal2 = document.getElementById("myModal");
            document.getElementById("idh1").value = pid;
            document.getElementById("ids1").value = pnp;
            document.getElementById("ids2").value = pd;
            document.getElementById("ids3").value = pep;
        }

    </script>

    <body>
        <div class="main-sidebar">
            <div class="container-login">
                <%@include file="sidebar-cliente.jsp" %>
                <div class="main-body-page"> 
                    <div class="content-wrapper">
                        <div class="content-body">
                            <section class="app-user-list">
                                <div class="card">
                                    <div class="nav-header">
                                        <div style="width: 100%;">

                                            <h3>Transferencias</h3>
                                        </div>
                                    </div>
                                </div>
                            </section>
                            <section class="app-user-list">
                                <div class="card">
                                    <%
                                        if (request.getParameter("bt_crear") != null) {
                                            try {
                                                Dba db = new Dba(application.getRealPath("usuarios-sucursal.mdb"));
                                                db.conectar();

                                                String numerocuenta = request.getParameter("numerocuenta");
                                                String tipocuenta = request.getParameter("tipocuenta");

                                                int contador = db.query.executeUpdate("INSERT into cuenta_cliente"
                                                        + "(numero_cuenta,tipo_cuenta) "
                                                        + "VALUES('"
                                                        + numerocuenta + "'"
                                                        + ",'" + tipocuenta
                                                        + "')");

                                                db.commit();
                                                db.desconectar();
                                                if (contador == 1) {
                                                    String alerta = "<div class='alert alert-success' role='alert'><h4 class='alert-heading'>Cuenta Se agregó con éxito</h4></div>";
                                                    out.print(alerta);
                                                }
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                        }
                                    %>

                                    <section class="app-user-list">
                                        <div class="card">

                                            <div class="nav-header">
                                                <div style="text-align:left;width: 100%;">
                                                    <form name="f1" action="cuentas-nueva.jsp" method="POST">
                                                        <input type="hidden" id="estadoCuenta" name="estadoCuenta" value="TRUE" />
                                                        <h3>Realizar transferencia</h3>
                                                        <div class="modal-body flex-grow-1">
                                                            <div class="form-group">
                                                                <label class="form-label" for="name-partido">Número de cuenta (Máximo 10 gigitos)</label>
                                                                <input type="number" name="numerocuenta" min="2100003001" max="2199999999" class="form-control dt-full-name" id="basic-icon-default-fullname" placeholder="21000000" >
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="form-label" for="enlace-url">Tipo de Cuenta</label>
                                                                <select class="form-control" id="basicSelect" name="tipocuenta">
                                                                    <option value="ahorros">
                                                                        Ahorros
                                                                    </option>
                                                                    <option value="cheques">
                                                                        Cheque
                                                                    </option>
                                                                </select>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="basicSelect">Tipo de Tarjeta</label>
                                                                <select class="form-control" id="basicSelect" name="partido_presi">
                                                                    <% Dba dba = new Dba(application.getRealPath("usuarios-sucursal.mdb"));
                                                                        dba.conectar();
                                                                        dba.query.execute("SELECT nombre, id from partidos_politicos ORDER BY id ASC");
                                                                        ResultSet rsdb = dba.query.getResultSet();
                                                                        String nombre_partido;
                                                                        String id_partido;
                                                                        while (rsdb.next()) {

                                                                            nombre_partido = rsdb.getString(1);
                                                                            id_partido = rsdb.getString(2);
                                                                    %>
                                                                    <option value="<%=id_partido%>">
                                                                        <%=nombre_partido%>
                                                                    </option>
                                                                    <%  }%> 
                                                                </select>
                                                            </div>
                                                            <button type="submit" class="btn btn-primary mr-1 data-submit waves-effect waves-float waves-light" value="crear" name="bt_crear">Crear</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </section>

                                    <%
                                        if (request.getParameter("p_eliminar") != null) {
                                            //ELIMINAR PRODUCTO 
                                            try {
                                                Dba db = new Dba(application.getRealPath("usuarios-sucursal.mdb"));
                                                db.conectar();
                                                int contador = db.query.executeUpdate("delete from cuenta_cliente WHERE id_cuenta='" + request.getParameter("p_id") + "' ");
                                                db.commit();
                                                db.desconectar();
                                                if (contador >= 1) {
                                                    String alerta = "<div class='alert alert-success' role='alert'><h4 class='alert-heading'>Registro Eliminado</h4></div>";
                                                    out.print(alerta);
                                                }
                                            } catch (Exception e) {
                                                String alerta = "<div class='alert alert-danger' role='alert'><h4 class='alert-heading'>Registro Eliminado</h4></div>";
                                                out.print(alerta);
                                                e.printStackTrace();
                                            }
                                        }
                                    %>

                                    <%
                                        //MODIFICAR un producto   
                                        if (request.getParameter("bt_modificar") != null) {
                                            try {
                                                Dba db = new Dba(application.getRealPath("usuarios-sucursal.mdb"));
                                                db.conectar();
                                                int contador = db.query.executeUpdate("UPDATE cuenta_cliente "
                                                        + "SET numero_cuenta='" + request.getParameter("ti_nombre_partido") + "', tipo_cuenta='" + request.getParameter("ti_url_logo") + "', estado='" + request.getParameter("estadocount") + "'"
                                                        + "WHERE id_cuenta='" + request.getParameter("ti_id") + "' ");
                                                
                                                if (contador >= 1) {
                                                    String alerta = "<div class='alert alert-success' role='alert'><h4 class='alert-heading'>El registro se modificó correctamente</h4></div>";
                                                    out.print(alerta);
                                                }
                                                db.commit();
                                                db.desconectar();
                                            } catch (Exception e) {
                                                String alerta = "<div class='alert alert-danger' role='alert'><h4 class='alert-heading'>El registro no se modificó</h4></div>";
                                                out.print(alerta);
                                                e.printStackTrace();
                                            }
                                        }
                                    %>

                                    <section class="app-user-list">
                                        <div class="card">
                                            <div class="card-datatable table-responsive pt-0">
                                                <h3>Lista de Cuentas</h3>
                                                <table class="user-list-table ">
                                                    <thead class="thead-light">
                                                        <tr>
                                                            <th data-field="operaciones" data-editable="false">ID</th>
                                                            <th data-field="operaciones" data-editable="false">No.  DE CUENTA</th>
                                                            <th data-field="descripcion" data-editable="false">TIPO DE CUENTA</th>
                                                            <th data-field="descripcion" data-editable="false">ESTADO</th>
                                                            <th data-field="operaciones" data-editable="false">GESTIONAR</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>

                                                        <% Dba db = new Dba(application.getRealPath("usuarios-sucursal.mdb"));
                                                            db.conectar();
                                                            db.query.execute("SELECT * FROM cuenta_cliente ORDER BY id_cuenta DESC");
                                                            ResultSet rs = db.query.getResultSet();
                                                            String tipoCuenta, idCuenta, numeroCuenta, estado;
                                                            while (rs.next()) {

                                                                tipoCuenta = rs.getString(1);
                                                                numeroCuenta = rs.getString(2);
                                                                idCuenta = rs.getString(4);
                                                                estado = rs.getString(5);
                                                        %>
                                                        <tr role="row" class="odd">
                                                            <td>
                                                                <div class="img-logo-gestionar-partido">
                                                                    <%=idCuenta%>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="img-logo-gestionar-partido">
                                                                    <%=numeroCuenta%>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="d-flex justify-content-left align-items-center">
                                                                    <%=tipoCuenta%>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="d-flex justify-content-left align-items-center">
                                                                    <%=estado%>
                                                                </div>
                                                            </td>
                                                            <td> 
                                                                <div class="dropdown">
                                                                    <button type="button" class="btn btn-sm text-white dropdown-toggle hide-arrow" data-toggle="dropdown">
                                                                        <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical" style="
                                                                             color: black;"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
                                                                    </button>
                                                                    <div class="dropdown-menu">
                                                                        <a class="dropdown-item"  data-toggle="modal" data-target="#inlineForm" onclick="mod('<%=idCuenta%>', '<%=tipoCuenta%>', '<%=numeroCuenta%>', '<%=estado%>')">
                                                                            <i data-feather="edit-2" class="mr-50"></i>
                                                                            <span>Modificar</span>
                                                                        </a>
                                                                        <a class="dropdown-item" href="cuentas-nueva.jsp?p_id=<%=idCuenta%>&p_eliminar=1">
                                                                            <i data-feather="trash" class="mr-50"></i>
                                                                            <span>Eliminar</span>
                                                                        </a>
                                                                    </div>
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
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade text-left" id="inlineForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
            <div d="myModal" class="modal-dialog modal-dialog-centered" role="document" i>
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel33">Modificar Cuenta</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form name="fM1" action="cuentas-nueva.jsp" method="POST">
                        <input type="hidden" id="idh1" name="ti_id" value="" />
                        <div class="modal-body">
                            <label>Número de Cuenta: </label>
                            <div class="form-group">
                                <input id="ids1" type="text" name="ti_nombre_partido" value="" class="form-control"/>
                            </div>

                            <label>Tipo de Cuenta: </label>
                            <div class="form-group">
                                <select class="form-control" id="ids2" name="ti_url_logo">
                                    <option value="ahorros">
                                        Ahorros
                                    </option>
                                    <option value="cheques">
                                        Cheque
                                    </option>
                                </select>
                            </div>
                            <label>Cuenta en uso: </label>
                            <div class="form-group">
                                <select class="form-control" id="ids3" name="estadocount">
                                    <option value="TRUE" selected>
                                        SI
                                    </option>
                                    <option value="FALSE">
                                        NO
                                    </option>
                                </select>
                            </div>
<!--                            <div class="form-group">
                                <input id="ids2" type="text" name="ti_url_logo" value="" class="form-control"/>
                            </div>-->
                        </div>
                        <div class="modal-footer">
                            <input type="submit" value="Modificar Producto" name="bt_modificar" /><br>    
                            <!--<button type="button" name="bt_modificar" class="btn btn-primary" data-dismiss="modal">Actualizar</button>-->
                        </div>
                    </form>    
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