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
        <!--        <script>
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
                </script>-->
        <script>
            function filtrarPorFecha() {
                var fechaInicio = document.getElementById("fechaInicio").value;
                var fechaFin = document.getElementById("fechaFin").value;

                var tabla = document.getElementById("miTabla");
                var filas = tabla.getElementsByTagName("tr");

                var resultadosEncontrados = false;

                for (var i = 1; i < filas.length; i++) {
                    var celdaFecha = filas[i].getElementsByTagName("td")[4]; // Suponiendo que la fecha está en la primera celda

                    if (celdaFecha) {
                        var fechaCelda = new Date(celdaFecha.innerText);

                        if (fechaCelda >= new Date(fechaInicio) && fechaCelda <= new Date(fechaFin)) {
                            filas[i].style.display = "";
                            resultadosEncontrados = true;
                        } else {
                            filas[i].style.display = "none";
                        }
                    }
                }

                // Mostrar u ocultar el mensaje "No hay resultados"
                var mensajeNoResultados = document.getElementById("mensajeNoResultados");
                mensajeNoResultados.style.display = resultadosEncontrados ? "none" : "block";
            }
        </script>

    </head>
    <body>
        <%@include file="WEB-INF/jspf/encabezadoVeterinario.jspf" %>
        <div class="madreMascotaUsuario">
            <div class="nombreMascota">
                <span>Historial Clinico</span>
            </div>
            <div class="barraBuscar">

                <label for="fechaInicio">Fecha de Inicio:</label>
                <input type="date" id="fechaInicio" max="<%= java.time.LocalDate.now() %>">

                <label for="fechaFin">Fecha de Fin:</label>
                <input type="date" id="fechaFin" max="<%= java.time.LocalDate.now() %>">

                <button onclick="filtrarPorFecha()">Filtrar</button>


                <div class="btnAgregar">
                    <button id="btnImprimirPDF" class="imprimir">Imprimir PDF</button>
                </div>        

            </div>
            <p id="mensajeNoResultados" style="display: none;font-weight: bold;font-size: 30px">No hay resultados</p>

            <div class="contenidoHistorial">
                <table border=1 class="tablaHistorial" id="miTabla">

                    <tr>
                        <th>N°</th>

                        <th>Cod Veterinario</th>
                        <th>Cod Mascota</th>
                        <th>Nombre Mascota</th>
                        <th>Fecha Historial</th>
                        <th>Descripción</th>
                        <th>Tratamiento</th>

                    </tr>
                    <c:forEach items="${listaHistorial}" var="g" varStatus="loopStatus">

                        <tr>

                            <td>${loopStatus.index + 1}</td>
                            <td>${g.idVeterinario}</td>
                            <td>${g.idMascota}</td>
                            <td>${g.nombreMascota}</td>
                            <td>${g.fechaHistorial}</td>
                            <td>${g.descripcion}</td>
                            <td>${g.tratamiento}</td>

                        </tr>
                    </c:forEach>



                </table>

            </div>

        </div>
        <%@include file="WEB-INF/jspf/pie.jspf" %>
        <script>
            // Obtener idUsuario del localStorage
            const idVeterinario = localStorage.getItem('idVeterinario');

            // Verificar si idUsuario es válido antes de modificar el enlace
            if (idVeterinario) {
                // Modificar el enlace del botón de historial con el idUsuario
                const btnAgregar = document.getElementById('btnAgregar');
                btnAgregar.href = "<%= request.getContextPath() %>/registrarHistorialVeterinario.jsp?idVeterinario=" + idVeterinario;
            }
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.debug.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.3.2/html2canvas.js"></script>
        <script>
            const tabla = document.querySelector("#miTabla");
            const boton = document.querySelector(".imprimir");
            boton.addEventListener("click", () => {
                const doc = new jsPDF("p", "pt", "letter");
                const margin = 20;
                const scale =
                        (doc.internal.pageSize.width - margin * 2) /
                        document.body.scrollWidth;
                doc.html(tabla, {
                    x: margin,
                    y: margin,
                    html2canvas: {
                        scale: scale,
                    },
                    callback: function (doc) {
                        doc.save("lista");
                    },
                });
            });
        </script>



    </body>
</html>
