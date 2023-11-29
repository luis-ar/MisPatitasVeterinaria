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
            <p style="display: flex">Revisa un listado de las mascotas</p>

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
                            <td>${g.sexo}</td>
                            <td><button class="btnCodigo" value="${g.idMascota}" ><a  href="#">Ver Historial</a></td>


                        </tr>



                    </c:forEach>
                </table>

            </div>

        </div>
        <%@include file="WEB-INF/jspf/pie.jspf" %>
        <script>
            // Obtener idUsuario del localStorage
            const idVeterinario = localStorage.getItem('idVeterinario');
const btnCodigo=document.querySelector(".btnCodigo").value;
            // Verificar si idUsuario es válido antes de modificar el enlace
            if (idVeterinario) {
                // Modificar el enlace del botón de historial con el idUsuario
                const btnAgregar = document.getElementById('btnAgregar');
                btnAgregar.href = "<%= request.getContextPath() %>/registrarHistorialVeterinario.jsp?idVeterinario=" + idVeterinario;
            }
        </script>
    </body>
</html>
