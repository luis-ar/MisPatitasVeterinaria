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
        <script>
            function establecerFecha() {
                var hoy = new Date();
                var dd = hoy.getDate();
                var mm = hoy.getMonth() + 1; // ¡Ten en cuenta que los meses comienzan en 0!
                var yyyy = hoy.getFullYear();

                if (dd < 10) {
                    dd = '0' + dd;
                }

                if (mm < 10) {
                    mm = '0' + mm;
                }

                var fechaHoy = yyyy + '-' + mm + '-' + dd;
                document.getElementById('fechaInput').value = fechaHoy;
            }
        </script>
    </head>
    <body onload="establecerFecha();">
        <%@include file="WEB-INF/jspf/encabezadoVeterinario.jspf" %>
        <div class="madreMascotaUsuario">
            <div class="nombreMascota">
                <span>Registrar historial Clinico</span>
            </div>
            <c:if test="${not empty mensajeAlerta}">
                <div class="componenteError" style="border-left: 4px solid red; padding-left: 20px;text-transform: uppercase;background-color: white;text-align: center ">${mensajeAlerta}</div>
            </c:if>
            <div class="datosHistoialVeterinario" >

                <form class="contenedorHistorialVeterinario" action="registroHistorial" method="post">

                    <div>
                        <div>
                            <h5>Cod. veterinario</h5>
                            <input id="codigoVeterinario" name="codigoVeterinario" type="number" readonly="true">
                        </div>
                        <div class="camposHistorilaVeterinario">
                            <div>
                                <h5>Cod. mascota</h5>
                                <input id="codigoMascota" name="codigoMascota" type="number" readonly="true">
                            </div>
                        </div>
                        <div>
                            <h5>Descripcion de Sintomas</h5>
                            <textarea name="descripcionSintomas" maxlength="200" style="width: 100%;height: 100px;resize: none;padding: 10px"></textarea>  
                        </div>

                    </div>

                    <div>
                        <div>
                            <h5 class="subIntranet">¿Fecha?</h5>
                            <input type="date" id="fechaInput" name="fecha"  style="padding-left: 10px" readonly="true" />


                        </div>
                        <div>
                            <h5>Descripcion del Tratamiento</h5>
                            <textarea  name="tratamiento"maxlength="200" style="width: 100%;height: 100px;resize: none;padding: 10px"></textarea>  
                        </div>

                    </div>



                    <button class="registrarHistorial">Registrar</button>

                </form>







            </div>


        </div>
        <%@include file="WEB-INF/jspf/pie.jspf" %>
        <script>
            const url = window.location.href;

            // Crear un objeto URLSearchParams con la URL
            const params = new URLSearchParams(new URL(url).search);

            // Obtener el valor del parámetro idVeterinario
            const idVeterinario = params.get('idVeterinario');
            const idMascota = params.get('idMascota');

            // Verificar si idVeterinario es válido
            if (idVeterinario && idMascota) {
                // Puedes usar idVeterinario aquí
                const codigoVeterinario = document.getElementById("codigoVeterinario");
                const codigoMascota = document.getElementById("codigoMascota");
                codigoVeterinario.value = idVeterinario;
                codigoMascota.value = idMascota;
            } else {
                console.log('El parámetro idVeterinario no está presente en la URL.' + idMascota);
            }
        </script>
    </body>
</html>
