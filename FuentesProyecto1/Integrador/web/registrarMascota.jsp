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
        <script>
            function establecerFecha() {
                const codigo = localStorage.getItem('idUsuario');

                const hoy = new Date();
                const dd = hoy.getDate();
                const mm = hoy.getMonth() + 1; // ¡Ten en cuenta que los meses comienzan en 0!
                const yyyy = hoy.getFullYear();

                if (dd < 10) {
                    dd = '0' + dd;
                }

                if (mm < 10) {
                    mm = '0' + mm;
                }

                var fechaHoy = yyyy + '-' + mm + '-' + dd;
                document.getElementById('fechaInput').setAttribute('max', fechaHoy);
            }
        </script>
        <script>
            const idUsuario = ${idUsuario}; // Recuperar el valor de Java y asignarlo a una variable de JavaScript
            localStorage.setItem('idUsuario', idUsuario); // Almacenar en localStorage
            console.log("desde el registro mascota", idUsuario);

        </script>

    </head>
    <body onload="establecerFecha();">
        <div  class="madre" id="madre"  >
            <form action="registroMascota" method="post" enctype="multipart/form-data" class="contenedorIntranet" >
                <%
                    // Obtén el valor del parámetro idUsuario del request
                    String idUsuario = request.getParameter("idUsuario");
                %>

                <!-- Utiliza JavaScript para modificar el valor según localStorage -->


                <input id="userId" style="display: none" name="idUsuario" value=""  >
                <h2 class="introIntranet" style="font-size: 35px;text-align: center">Mis Patitas</h2>
                 <c:if test="${not empty mensajeAlerta}">
                    <div class="componenteError" style="border-left: 4px solid red; padding-left: 20px;text-transform: uppercase;background-color: white;text-align: center ">${mensajeAlerta}</div>
                </c:if>
                <h5 class="subIntranet" style="font-size: 20px;margin-bottom: -10px;">Nombre de la Mascota</h5>
                <input name="nombreMascota" autocomplete="off" type="text" class="datos" placeholder="Ingrese el nombre de la mascota" style="padding-left:10px;font-size: 20px;" >

                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 10px">
                    <div>
                        <h5 class="subIntranet" style="font-size: 20px;margin-bottom:10px;">Raza</h5>
                        <input name="razaMascota" autocomplete="off" type="text" class="datos" placeholder="Ingrese la raza" style="padding-left:10px;font-size: 20px;width: 100%" >
                    </div>
                    <div>
                        <h5 class="subIntranet" style="font-size: 20px;margin-bottom:10px;">¿Género?</h5>
                        <input name="generoMascota" autocomplete="off" type="text" class="datos" placeholder="M o H" style="padding-left:10px;font-size: 20px;width: 100%" >

                    </div>
                </div>
                <h5  class="subIntranet" style="font-size: 20px;margin-bottom: -10px;">Fecha de Nacimiento</h5>
                <input id="fechaInput" name="fechaMascota" autocomplete="off" type="date" class="datos"  placeholder="Ingrese la fecha" style="padding-left:10px;font-size: 20px;width: 100%;" >

                <h5  class="subIntranet" style="font-size: 20px;margin-bottom: -10px;">Descripción</h5>

                <textarea name="descripcionMascota" maxlength="200" style="width: 100%;height: 100px;resize: none;padding: 10px"></textarea>
                <h5  class="subIntranet" style="font-size: 20px;margin-bottom: -10px;">Seleccione Foto de la Mascota</h5>

                <div style="width: 100%;height:50px;position: relative;">
                    <input  autocomplete="off" type="file" class="datos"  placeholder="Seleccione la imagen" style="padding-left:10px;font-size: 20px;width: 100%;" name="imagenMascota" >
                </div>
                <button class="datos" style="color: white;background-color: black;cursor: pointer;">Registrar Mascota</button>

            </form>


            <%@include file="WEB-INF/jspf/pie.jspf" %>


        </div>
        <script>
            // Obtén el valor de idUsuario almacenado en localStorage
            const localStorageIdUsuario = localStorage.getItem('codigoUsuario');
            // Modifica el valor si existe en localStorage
            if (localStorageIdUsuario) {
                console.log("entro");
                console.log("Valor de localStorageIdUsuario:", localStorageIdUsuario);

                const mejorar = document.getElementById('userId')
                mejorar.value = localStorageIdUsuario;
                console.log(mejorar)

            } else {
                // Utiliza el valor del servidor si no hay un valor en localStorage
                const localIdUsuario = localStorage.getItem('idUsuario');

                document.getElementById('userId').value = localIdUsuario;
                console.log("Valor de idUsuario desde el servidor:", localIdUsuario);
            }
        </script>
    </body>

</html>
