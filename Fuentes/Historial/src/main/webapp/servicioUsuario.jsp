<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="WEB-INF/jspf/enlaces.jspf" %>
        <link href="css/estiloServicios.css" rel="stylesheet" type="text/css"/>
        <link href="css/mascotaUsuario.css" rel="stylesheet" type="text/css"/>


    </head>
    <body>
        <%@include file="WEB-INF/jspf/encabezadoUsuario.jspf" %>
        <div class="contenedorServicio" style="height: auto">
            <h1 class="tituloServicio">Nuestros Servicios</h1>

            <section class="experts">

                <c:choose>
                    <c:when test="${not empty listaServicio}">
                        <c:forEach items="${listaServicio}" var="g" varStatus="loopStatus">
                            <div class="card">
                                <div class="face front">
                                    <img src="data:image/jpeg;base64,${g.imagenBase64}" />
                                    <h3 class="n-expert" style="text-transform: uppercase">${g.nombre}</h3>
                                </div>
                                <div class="face back">
                                    <h3 style="text-transform: uppercase">${g.nombre}</h3>
                                    <p>${g.descripcion}</p>
                                    <div class="link"></div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p style="font-weight: bold;font-size: 30px;">No hay servicios disponibles.</p>
                    </c:otherwise>
                </c:choose>

            </section>

        </div>








        <%@include file="WEB-INF/jspf/pie.jspf" %>    

    </body>
</html>