<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Desarrollo de Aplicaciones Web</title>
    </head>
    <body>

        <form name="f1" action="autenticacion.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>Usuario</td>
                        <td><input type="text" name="ti_usuario" value="" /> </td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="ti_password" value="" /></td>
                    </tr>
                </tbody>
            </table>
            <br>Ï
            <label for="Usuario">Tipo de Usuario</label>
            <select name="role" >
                 <option value="2">
                    Clientes
                </option>
                <option value="1">
                    Administrador
                </option>
            </select>
            <input type="submit" value="Login" name="bt_login" />
        </form>

    </body>
</html>
