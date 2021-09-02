
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="database.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>



        <%
            String presidentes = request.getParameter("presidentes");

        %>
        <h4><%=presidentes%></h4>
        <form class="form" enctype="multipart/form-data" style="display: flex;flex-direction: column;flex-wrap: wrap;" action="index.jsp" name="f1" method="POST">

            <div style="display: flex;flex-direction: column;flex-wrap: wrap;">
                <div style="margin: 0 5px;display: flex;flex-wrap: wrap;">
                    <% Dba db = new Dba(application.getRealPath("usuarios-sucursal.mdb"));
                        db.conectar();
                        db.query.execute("SELECT a.identidad, a.voto_presidente, b.presidente_id, c.nombre_presidente, c.photo_profile, c.id_presidente FROM votantes a, votos_electores b, presidente c "
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


                    %>



                    <%  }%>
                    <div style="width: 200px;height: 382px;border: 1px solid;margin: 20px 5px;">
                        <div class="" style="border-bottom: 1px solid grey;">
                            <img class="imagen-perfil" src="../src/presidentes/nulo.jpg" alt="Meeting Pic"/>
                            <h4 class="card-title" style="font-size: 14px;margin-bottom: 0;padding: 10px 0px;">Su Voto Será Nulo<br><br></h4>
                        </div>
                        <div class="input">
                            <div class="input-box">
                                <input type="radio" id="nulo" name="presidentes" required>
                                <label for="nulo"></label>
                                <div class="input">
                                    <div class="input-box">
                                        <input type="radio" name="presidentes" value="1">1 </input>
                                        <input type="radio" name="presidentes" value="2">2 </input>
                                        <input type="radio" name="presidentes" value="3">3 </input>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div> 
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


    </body>
</html>
