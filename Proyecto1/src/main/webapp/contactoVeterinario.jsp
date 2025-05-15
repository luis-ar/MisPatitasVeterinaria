<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <script src="Javas/app.js" type="module"></script>
        <link href="css/estilo1.css" rel="stylesheet" type="text/css"/>
        <%@include file="WEB-INF/jspf/enlaces.jspf" %>
        <link href="css/mascotaUsuario.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>
        <%@include file="WEB-INF/jspf/encabezadoVeterinario.jspf" %>

        <div class="madreMascotaUsuario">
            <div class="contenedorHistorialUsuario">

                <div class="nombreMascota">
                    <span>Mensajes</span>
                </div>
                <div class="contenidoHistorial">
                    <table border=1 class="tablaHistorial">

                        <tr>

                            <th>Nombre</th>

                           
                            <th>Telefono</th>

                            <th>Mensaje</th>

                        </tr>

                        <c:forEach items="${lista}" var="g" >


                                <tr>
                                    <td>${g.nombreUsuario}</td>
                                    <td>${g.telefonoUsuario}</td>
                                    <td>${g.mensaje}</td>

                                </tr>



                        </c:forEach>

                    </table>

                </div>
            </div>


        </div>
        <%@include file="WEB-INF/jspf/pie.jspf" %>

    </body>
</html>
