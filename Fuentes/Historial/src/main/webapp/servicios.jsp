<%-- 
    Document   : servicios.jsp
    Created on : 14 set. 2023, 09:25:32
    Author     : luisd
--%>
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
        <%@include file="WEB-INF/jspf/encabezadoVeterinario.jspf" %>
        <div class="contenedorServicio" style="height: auto">
            <h1 class="tituloServicio">Nuestros Servicios</h1>
            <div class="btnAgregar">
                <a href="/Historial/agregarServicio.jsp" id="btnAgregar">Agregar Servicio</a>
            </div>
            <section class="experts">


                <c:forEach items="${listaServicio}" var="g" varStatus="loopStatus">
                    <div class="card" >

                        <div class="face front">
                            <img src="data:image/jpeg;base64,${g.imagenBase64}" />
                            <h3 class="n-expert"style="text-transform: uppercase;font-size: 20px" >${g.nombre}</h3>
                        </div>
                        <div class="face back">
                            <h3 style="text-transform: uppercase;font-size: 20px">${g.nombre}</h3>
                            <p>
                                ${g.descripcion}
                            </p>
                            <div class="link" style="display: flex;justify-content: center;gap: 20px">
                                <form action="RecuperarIdServicio" method="post">
                                    <input name="imagenModificar" value="${g.foto}" type="hidden" />
                                    <button name="actualizar" value="${g.idServicio}" style="cursor: pointer;background-color: #0D93CD;color: white;padding: 10px">Editar</button>
                                </form>
                                <form action="EliminarServicio" method="post">
                                    <button name="eliminar" value="${g.idServicio}" style="cursor: pointer;background-color: #D42A2A;color: white;padding: 10px">Eliminar</button>
                                </form>
                            </div>
                        </div>

                    </div>


                </c:forEach>





            </section>
        </div>








        <%@include file="WEB-INF/jspf/pie.jspf" %>    

    </body>
</html>
