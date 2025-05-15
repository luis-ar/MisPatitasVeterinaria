<%-- 
    Document   : index
    Created on : 2 set. 2023, 10:30:10
    Author     : luisd
--%>
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


    </head>
    <body>
        <div class="madre" id="madre" >
            <form action="registrarUsuario" method="post" class="contenedorIntranet" >

                <h2 class="introIntranet" style="font-size: 35px;text-align: center">Mis Patitas</h2>
                <c:if test="${not empty mensajeAlerta}">
                    <div class="componenteError" style="border-left: 4px solid red; padding-left: 20px;text-transform: uppercase;background-color: white;text-align: center ">${mensajeAlerta}</div>
                </c:if>
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 10px">
                    <div>
                        <h5 class="subIntranet" style="font-size: 20px;margin-bottom:10px;">Nombres</h5>
                        <input name="nombreUsuario" autocomplete="off" type="text" class="datos" placeholder="Ingrese su nombre" style="padding-left:10px;font-size: 20px;width: 100%" >
                    </div>
                    <div>
                        <h5 class="subIntranet" style="font-size: 20px;margin-bottom:10px;">Telefono</h5>
                        <input name="telefonoUsuario" autocomplete="off" type="tel" class="datos" placeholder="Ingrese su telefono" style="padding-left:10px;font-size: 20px;width: 100%" >
                    </div>
                </div>


                <h5 class="subIntranet" style="font-size: 20px;margin-bottom: -10px;">Dirección de correo electrónico</h5>
                <input name="correoUsuario" autocomplete="off" type="text" class="datos" placeholder="Ingrese su dirección de correo electrónico" style="padding-left:10px;font-size: 20px;" >
                <h5  class="subIntranet" style="font-size: 20px;margin-bottom: -10px;">Contraseña</h5>

                <div style="width: 100%;height:50px;position: relative;">
                    <button class="fas fa-eye" style="position: absolute;right: 0;top:30%;border: none;height: 20px;background-color: white;font-size: 20px;margin-right: 10px;"></button>
                    <input name="contraUsuario" autocomplete="off" type="password" class="datos"  placeholder="Ingrese su contraseña" style="padding-left:10px;font-size: 20px;width: 100%;" >
                </div>

                <button class="datos" style="color: white;background-color: black;">Registrarse</button>

            </form>

            <%@include file="WEB-INF/jspf/pie.jspf" %>

        </div>

    </body>

</html>
