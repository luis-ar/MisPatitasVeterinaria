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
        <%@include file="WEB-INF/jspf/encabezadoUsuario.jspf" %>



        <div class="madreMascotaUsuario">

            <div class="btnAgregar">
                <a href="/Integrador/registrarMascota.jsp" id="btnAgregar">Agregar Mascota</a>
            </div>
            <c:forEach items="${listaMascota}" var="g" varStatus="loopStatus">
                <c:if test="${g.idUsuario eq idUsuario}">
                    <div class="contenedorGeneral">

                        <div class="nombreMascota">
                            <span>${g.nombreMascota}</span>
                        </div>

                        <div class="contenidoMascota" >

                            <div class="detalleMascota">
                                <div class="contenedorImagen">
                                    <img class="fotoMascota"  src="data:image/jpeg;base64,${g.imagenBase64}">
                                </div>
                                
                                <div class="datosMascota">
                                    <p>Codigo: <span>${g.idMascota}</span></p>
                                    <p>Fecha Nacimiento: <span>${g.fechaNacimiento}</span></p>
                                    <p>Genero: <span>${g.sexo}</span></p>
                                    <p>Raza: <span>${g.razaMascota}</span></p>
                                </div>
                            </div>
                            <div class="descripcionMascota">
                                ${g.descripcion}
                            </div>

                        </div>
                    </div>
                </c:if>

            </c:forEach>

        </div>
        <%@include file="WEB-INF/jspf/pie.jspf" %>
        <!-- Script para obtener idUsuario y guardarlo en localStorage -->

    </body>
</html>
