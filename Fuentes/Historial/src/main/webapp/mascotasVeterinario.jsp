<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
                var mensajeNoResultados = document.getElementById('mensajeNoResultados');

                filtroMascotas.addEventListener('input', function () {
                    var filtro = filtroMascotas.value.toUpperCase();
                    var tabla = document.querySelector('.tablaHistorial');
                    var filas = tabla.querySelectorAll('tr');
                    var resultadosEncontrados = false;

                    filas.forEach(function (fila) {
                        var datos = fila.getElementsByTagName('td');
                        var mostrarFila = false;

                        for (var i = 0; i < datos.length; i++) {
                            var texto = datos[i].innerText || datos[i].textContent;
                            if (texto.toUpperCase().indexOf(filtro) > -1) {
                                mostrarFila = true;
                                resultadosEncontrados = true;
                                break;
                            }
                        }

                        fila.style.display = mostrarFila ? '' : 'none';
                    });

                    // Mostrar o ocultar el mensaje "No se encuentran resultados"
                    mensajeNoResultados.style.display = resultadosEncontrados ? 'none' : 'block';
                });
            });
        </script>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/encabezadoVeterinario.jspf" %>
        <div class="madreMascotaUsuario">
            <div class="nombreMascota">
                <span>Mascotas</span>
            </div>
            <div class="barraBuscar">
                <div class="textoBuscar">
                    <input id="filtroMascotas" class="entradaTexto" type="text" placeholder="Buscar Mascota">

                    <button>
                        <i  class='bx bx-search-alt-2 lupa'></i>

                    </button>
                </div>
            </div>
            <!--            <p style="display: flex">Revisa un listado de las mascotas</p>-->
            <p id="mensajeNoResultados" style="display: none;">No se encuentran resultados</p>

            <div class="contenidoHistorial">
                <table border=1 class="tablaHistorial">

                    <tr>

                        <th>Nombre</th>
                        <th>Codigo Mascota</th>
                        <th>Fecha Nacimiento</th>
                        <th>Dueño</th>
                        <th>Raza</th>
                        <th>Sexo</th>
                        <th>Ver Historial</th>

                    </tr>

                    <c:forEach items="${listaMascotaVeterinario}" var="g" >
                        <tr>
                            <td>${g.nombreMascota}</td>
                            <td>${g.idMascota}</td>
                            <td>${g.fechaNacimiento}</td>
                            <td>${g.nombreUsuario}</td>
                            <td>${g.razaMascota}</td>
                            <td>${fn:toUpperCase(g.sexo)}</td>
                            <td><button class="btnCodigo" value="${g.idMascota}" ><a  href="#" id="historialMascota">Ver Historial</a></td>


                        </tr>



                    </c:forEach>
                </table>

            </div>

        </div>
        <%@include file="WEB-INF/jspf/pie.jspf" %>
        <script>

            const btnCodigo = document.querySelectorAll(".btnCodigo");

            btnCodigo.forEach(btn => {
                btn.addEventListener("click", () => {
                    const idMascota = btn.value;
                    const historialMascota = btn.querySelector('a');
                    historialMascota.href = "<%= request.getContextPath() %>/historial?idMascota=" + idMascota;
                });
            })
//            
//            const btnCodigo = document.querySelector(".btnCodigo").value;
//            const historialMascota = document.getElementById('historialMascota');
//            // Verificar si idUsuario es válido antes de modificar el enlace
//            if (btnCodigo) {
//                console.log(btnCodigo);
//                historialMascota.href = "<%= request.getContextPath() %>/historial?idMascota=" + btnCodigo;
//            }
        </script>
    </body>
</html>