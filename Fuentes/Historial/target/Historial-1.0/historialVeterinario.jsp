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
            document.addEventListener('DOMContentLoaded', function () {
                var filtroMascotas = document.getElementById('filtroMascotas');

                filtroMascotas.addEventListener('input', function () {
                    var filtro = filtroMascotas.value.toUpperCase();
                    var tabla = document.querySelector('.tablaHistorial');
                    var filas = tabla.querySelectorAll('tr');

                    filas.forEach(function (fila) {
                        var datos = fila.getElementsByTagName('td');
                        var mostrarFila = false;

                        for (var i = 0; i < datos.length; i++) {
                            var texto = datos[i].innerText || datos[i].textContent;
                            if (texto.toUpperCase().indexOf(filtro) > -1) {
                                mostrarFila = true;
                                break;
                            }
                        }

                        fila.style.display = mostrarFila ? '' : 'none';
                    });
                });
            });
        </script>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/encabezadoVeterinario.jspf" %>
        <div class="madreMascotaUsuario">
            <div class="nombreMascota">
                <span>Historial Clinico </span>
            </div>
                <div class="btnAgregar">
                    <a href="" id="btnAgregar">Agregar Historial</a>
                </div>

            <c:if test="${empty listaHistorial.tratamiento}">
                <h1>Aun no tiene Historial</h1>

            </c:if>
            <c:if test="${not empty listaHistorial.tratamiento}">

                <div class="contenidoHistorial">
                    <table border=1 class="tablaHistorial">

                        <tr>
                            <th colspan="2">Opciones</th>


                            <th>Codigo Veterinario</th>
                            <th>Codigo Mascota</th>
                            <th>Fecha Historial</th>
                            <th>Descripción</th>
                            <th>Tratamiento</th>

                        </tr>
                        <tr>
                        <form action="recuperarIDHistorial" method="post">
                            <td><button name="actualizar" value=${listaHistorial.idHistorial} > 

                                    <a href="/Integrador/actualizarHistorial">
                                        <i class='bx bxs-pencil'></i>
                                    </a>
                                </button>

                            </td>
                        </form>
                        <form action="eliminarHistorial" method="post">
                            <td><button style="cursor: pointer" name="eliminar" value=${listaHistorial.idHistorial} ><i class='bx bxs-trash' ></i></button></td>
                        </form>
                        <td>${listaHistorial.idVeterinario}</td>
                        <td>${listaHistorial.idMascota}</td>
                        <td>${listaHistorial.fechaHistorial}</td>
                        <td>${listaHistorial.descripcion}</td>
                        <td>${listaHistorial.tratamiento}</td>

                        </tr>



                    </table>

                </div>   
            </c:if>


        </div>



        <%@include file="WEB-INF/jspf/pie.jspf" %>
        <script>
            // Obtener idUsuario del localStorage
            const idVeterinario = localStorage.getItem('idVeterinario');
            const url = new URL(window.location.href);
            const idMascota = url.searchParams.get("idMascota");
            // Verificar si idUsuario es válido antes de modificar el enlace
            if (idVeterinario) {
                // Modificar el enlace del botón de historial con el idUsuario
                const btnAgregar = document.getElementById('btnAgregar');
                localStorage.setItem("idMascota",idMascota)
                btnAgregar.href = "<%= request.getContextPath() %>/registrarHistorialVeterinario.jsp?idVeterinario=" + idVeterinario + "&idMascota=" + idMascota;
            }
        </script>
    </body>
</html>
