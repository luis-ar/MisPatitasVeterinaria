<%-- 
    Document   : agregarMascota
    Created on : 20 oct. 2023, 06:22:08
    Author     : Luis Santos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <link href="css/estilo1.css" rel="stylesheet" type="text/css"/>
        <%@include file="WEB-INF/jspf/enlaces.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/encabezadoVeterinario.jspf" %>

        <div  class="madre" id="madre"  style="margin-top: 10vh;">
            <form action="RegistroServicio" method="post" enctype="multipart/form-data" class="contenedorIntranet" >

                <h2 class="introIntranet" style="font-size: 35px;text-align: center">Agregar Servicio</h2>

                <c:if test="${not empty mensajeAlerta}">
                    <div class="componenteError" style="border-left: 4px solid red; padding-left: 20px;text-transform: uppercase;background-color: white;text-align: center ">${mensajeAlerta}</div>
                </c:if>
                <h5 class="subIntranet" style="font-size: 20px">Nombre del Servicio</h5>
                <input name="nombreServicio" autocomplete="off" type="text" class="datos" placeholder="Ingrese el nombre del servicio" style="padding-left:10px;font-size: 20px;" >

                <h5  class="subIntranet" style="font-size: 20px;margin-bottom: -10px;">Descripción del Servicio</h5>

                <textarea name="descripcionServicio" maxlength="200" placeholder="Ingrese una descripcion" style="width: 100%;height: 100px;resize: none;padding: 10px"></textarea>
                <h5  class="subIntranet" style="font-size: 20px;margin-bottom: -10px;">Seleccione Foto del Servicio</h5>

                <div style="width: 100%;height:50px;position: relative;">
                    <input  autocomplete="off" type="file" class="datos"  placeholder="Seleccione la imagen" style="padding-left:10px;font-size: 20px;width: 100%;" name="imagenServicio" >
                </div>
                <button class="datos" style="color: white;background-color: black;cursor: pointer;">Registrar Servicio</button>

            </form>


            <%@include file="WEB-INF/jspf/pie.jspf" %>


        </div>


    </body>
</html>
