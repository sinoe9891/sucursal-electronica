<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="es">

<head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;700&display=swap" rel="stylesheet">
        <title>Sucursal Electrónica</title>
        <link rel="shortcut icon" href="src/img/unitec.ico" type="image/x-icon">
        <link rel="stylesheet" type="text/css" href="src/app-assets/vendors/css/vendors.min.css">
        <link rel="stylesheet" type="text/css"
                href="src/app-assets/vendors/css/tables/datatable/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css"
                href="src/app-assets/vendors/css/tables/datatable/responsive.bootstrap4.min.css">
        <link rel="stylesheet" type="text/css"
                href="src/app-assets/vendors/css/tables/datatable/buttons.bootstrap4.min.css">
        <!-- END: Vendor CSS-->

        <!-- BEGIN: Theme CSS-->
        <link rel="stylesheet" type="text/css" href="src/app-assets/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="src/app-assets/css/bootstrap-extended.css">
        <link rel="stylesheet" type="text/css" href="src/app-assets/css/colors.css">
        <link rel="stylesheet" type="text/css" href="src/app-assets/css/components.css">
        <link rel="stylesheet" type="text/css" href="src/app-assets/css/themes/dark-layout.css">
        <link rel="stylesheet" type="text/css" href="src/app-assets/css/themes/bordered-layout.css">
</head>

<body>
        <div class="main-login">
                <div class="container-login">
                        <div class="colu-8 imagen-login">
                                <div class="container-center color-colum-second">
                                        <div class="caja-logo">
                                                <div class="">
                                                        <div class="caja-infomain">
                                                                <div class="caja-contenido">
                                                                        <img class="logo" src="src/img/logo-ceutec.png" alt="">
                                                                </div>
                                                                <div class="caja-contenido">
                                                                        <h1 style="margin:40px 0">Sucursal Electrónica CEUTEC</h1>

                                                                </div>
                                                                <div class="caja-contenido">
                                                                        <img class="hero" src="src/img/portada.jpeg" alt="">
                                                                </div>
                                                        </div>
                                                </div>
                                        </div>
                                </div>
                        </div>

                        <div class="colu-4">
                                <div class="container-center color-colum-one">
                                        <img class="logo-platform hidden" src="src/img/Votem_Logo_Primary_Navy.png" alt="">
                                        <img class="logo hidden" src="src/img/logo-ceutec.png" alt="">
                                        <div class="form-login">
                                                <div class="titulo-form">
                                                        <h3>Bienvenido a<br>Banca en Línea CEUTEC! 👋</h3>
                                                        <p>Inicie sesión con su cuenta</p>
                                                </div>
                                                <div class="form">
                                                        <form name="f1" action="pages/autenticacion.jsp" method="POST">
                                                                <div class="input-form">
                                                                        <label for="Usuario">Usuario</label>
                                                                        <input type="text" name="ti_usuario" value="" />
                                                                </div>
                                                                <div class="input-form">
                                                                        <label for="Usuario">Contraseña</label>
                                                                        <input type="password" name="ti_password" value="role" />
                                                                </div>
                                                                <div class="input-form">
                                                                        <label for="Usuario">Tipo de Usuario</label>
                                                                        <select name="role">
                                                                                <option value="1">
                                                                                        Administrador
                                                                                </option>
                                                                                <option value="2">
                                                                                        Cliente
                                                                                </option>
<!--                                                                                <option value="3">
                                                                                        Magistrados
                                                                                </option>-->
                                                                        </select>
                                                                </div>
                                                                <br>
                                                                <div>
                                                                        <input type="submit" value="Iniciar Sesión" name="bt_login" />
                                                                </div>
                                                        </form>
                                                </div>
                                        </div>
                                </div>
                                <div class="copyright">
                                        <p>Hecho por Jefferson con 🧡</p>
                                </div>
                        </div>
                </div>
        </div>

</body>

</html>