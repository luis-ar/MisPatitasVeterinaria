<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : index
    Created on : 2 set. 2023, 10:30:10
    Author     : luisd
--%>

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
            <form action="login" method="post" class="contenedorIntranet">

                <h2 class="introIntranet" style="font-size: 35px;text-align: center">Mis Patitas</h2>
                <c:if test="${not empty mensajeAlerta}">
                    <div class="componenteError" style="border-left: 4px solid red; padding-left: 20px;text-transform: uppercase;background-color: white;text-align: center ">${mensajeAlerta}</div>
                </c:if>
                <h5 class="subIntranet" style="font-size: 20px;margin-bottom: -10px;">Dirección de correo electrónico</h5>
                <input name="correo" autocomplete="off" type="text" class="datos" placeholder="Ingrese su dirección de correo electrónico" style="padding-left:10px;font-size: 20px;" >
                <h5  class="subIntranet" style="font-size: 20px;margin-bottom: -10px;">Clave</h5>

                <div style="width: 100%;height:50px;position: relative;">
                    <button class="fas fa-eye" style="position: absolute;right: 0;top:30%;border: none;height: 20px;background-color: white;font-size: 20px;margin-right: 10px;"></button>
                    <input name="contra" autocomplete="off" type="password" class="datos"  placeholder="Ingrese su contraseña" style="padding-left:10px;font-size: 20px;width: 100%;" >
                </div>
                <div class="contraseña">
                    <h5 class="subIntranet" style="font-size:20px;color: blue;">¿Olvidaste tu contraseña?</h5>
                </div>
                <button class="datos" style="color: white;background-color: black;cursor: pointer">Iniciar Sesión</button>
                <div style="width: 100%; height: 10px; border-bottom: 1px solid rgb(144, 141, 141);text-align: center;">
                    <span style="font-size: 16px; background-color:#E3E3E3; padding: 0px 7px; color: rgb(144, 141, 141);"><font style="vertical-align: inherit;">
                        <font style="vertical-align: inherit;">O</font></font></span>

                </div>
                <!--
                                <div class="caja1" style="display: flex;align-items: center; justify-content: center">
                                    <button class="datos continuar" style="width: 50%;margin-right: 15px;" id="googleLogin"><img class="iconoRedes" height="28px" alt="google logo" src="./img/google.png" style="margin-right: 10px;">continuar con Google</button>
                
                                   <button class="datos continuar" style="width: 50%;" id="facebookLogin"><img class="iconoRedes" height="28px" alt="github logo" src="./img/facebook.png" style="margin-right: 10px;">continuar con Facebook</button>
                
                                </div>-->
                <div style="display: flex" >
                    <p>¿Aún no eres cliente? <a href="/Integrador/registrarUsuario.jsp" style="color: blue">Registrate aqui</a></p>
                </div>


            </form>


            <%@include file="WEB-INF/jspf/pie.jspf" %>


        </div>

    </body>

</html>
