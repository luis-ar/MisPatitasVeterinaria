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
            <div class="nombreMascota">
                <span>Actualizar historial Clinico</span>
            </div>
            <div class="datosHistoialVeterinario" >

                <form class="contenedorHistorialVeterinario" action="actualizarHistorial" method="post">
                    <c:if test="${not empty mensajeAlerta}">
                        <div class="componenteError" style="border-left: 4px solid red; padding-left: 20px;text-transform: uppercase;background-color: white;text-align: center ">${mensajeAlerta}</div>
                    </c:if>
                    <input style="display: none" type="text" name="idHistorial" value=${idHistorial}>
                    <div>
                        <!--  
                        <div>
                                                    <h5>Cod. veterinario</h5>
                                                </div>-->
                        <input style="display: none"  id="codVeterinario" name="codigoVeterinario" type="text">

                        <div class="camposHistorilaVeterinario">
                            <div>
                                <h5>Cod. mascota</h5>
                                <input name="codigoMascota" type="number">
                            </div>
                            <!--                            <div>
                                                            <h5>Nombre del Dueño</h5>
                                                            <input name="nombreDueño" type="text">
                                                        </div>-->
                        </div>
                        <div>
                            <h5>Descripcion de Sintomas</h5>
                            <textarea name="descripcionSintomas" maxlength="200" style="width: 100%;height: 100px;resize: none;padding: 10px"></textarea>  
                        </div>

                    </div>

                    <div>
                        <div>
                            <h5 class="subIntranet">¿Fecha?</h5>
                            <input name="fecha" style="padding-left: 10px" type="date" placeholder="H 0 M">

                        </div>
                        <div>
                            <h5>Descripcion del Tratamiento</h5>
                            <textarea  name="tratamiento"maxlength="200" style="width: 100%;height: 100px;resize: none;padding: 10px"></textarea>  
                        </div>

                    </div>

                    <button class="registrarHistorial">Actualizar</button>

                </form>







            </div>


        </div>
        <%@include file="WEB-INF/jspf/pie.jspf" %>
        <script>
            const codVeterinario = localStorage.getItem('idVeterinario');
            const inputVeterinario = document.getElementById('codVeterinario');
            console.log(codVeterinario);
            console.log(inputVeterinario);
            inputVeterinario.value = codVeterinario;

            console.log(inputVeterinario.value);
        </script>
    </body>
</html>
