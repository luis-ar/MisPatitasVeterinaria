<%-- 
    Document   : nosotros
    Created on : 1 set. 2023, 15:28:21
    Author     : LAB-USR-SJL275-B0205
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="WEB-INF/jspf/enlaces.jspf" %>
        <title>Nosotros</title>
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>



        <div>
            <header class="header" id="inicio">
                <%@include file="WEB-INF/jspf/encabezadoVeterinario.jspf" %>

                <div class="contenedor1 head">
                    <h1 class="titulo">Convertimos tus sueños en realidad</h1>
                    <p class="copy">
                        "El dinero no es el objetivo final, sino una herramienta para lograr
                        tus metas. Administra sabiamente tus gastos y convierte tus metas
                        en realidad"
                    </p>
                    <Animacion />
                </div>
            </header>


            <main>
                <section class="services contenedor1" id="servicio">
                    <h2 class="subtitulo">Aspectos Generales</h2>
                    <div class="contenedor-servicio">
                        <img             src="img/imagen4.jpeg"
                                         alt="" />
                        <div class="checklist-servicio">
                            <div class="service">
                                <h3 class="n-service">
                                    <span class="number">1</span>Misión
                                </h3>
                                <p>
                                    Proporcionar atención veterinaria de alta calidad y compasión a nuestros pacientes, promoviendo la salud y el bienestar animal mientras construimos relaciones sólidas con nuestros clientes.
                                </p>
                            </div>
                            <div class="service">
                                <h3 class="n-service">
                                    <span class="number">2</span>Visión
                                </h3>
                                <p>
                                    Ser la principal elección en cuidado veterinario, enfocados en el bienestar animal, el crecimiento sostenible y el impacto positivo en la comunidad
                                </p>
                            </div>
                            <div class="service">
                                <h3 class="n-service">
                                    <span class="number">3</span>Valores
                                </h3>
                                <p>
                                    Compasión, Profesionalismo, Integridad, Trabajo en Equipo, Educación, Responsabilidad Social y Ambiental.
                                </p>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="gallery" id="portafolio">
                    <div class="contenedor1">
                        <h2 class="subtitulo">Galeria</h2>
                        <div class="contenedor-galeria">
                            <img
                                src="img/perro.jpg"


                                alt=""
                                class="img-galeria"
                                />
                            <img
                                src="img/perro2.jpg"


                                alt=""
                                class="img-galeria"
                                />
                            <img
                                src="img/perro3.jpg"

                                alt=""
                                class="img-galeria"
                                />
                            <img
                                src="img/gato1.jpg"


                                alt=""
                                class="img-galeria"
                                />
                            <img
                                src="img/gato2.jpg"

                                alt=""
                                class="img-galeria"
                                />
                            <img
                                src="img/gato3.jpg"

                                alt=""
                                class="img-galeria"
                                />
                        </div>
                    </div>
                </section>
                <section class="imagen-light">
                    <img src="WEB-INF/imagenes/imagen3.png" alt="" class="close" />
                    <img src="WEB-INF/imagenes/imagen3.png" alt="" class="agregar-imagen" />
                </section>
                <div class="contenedor1" id="expertos">
                    <h2 class="subtitulo">Expertos en:</h2>
                    <section class="experts">
                        <div class="card">
                            <div class="face front">
                                <img  src="img/final1.jpg"/>
                                <h3 class="n-expert">Analisis</h3>
                            </div>

                            <div class="face back">
                                <h3>Analisis</h3>
                                <p>
                                    Se pueden identificar ineficiencias o gastos innecesarios,
                                    esto puede llevar a la implementación de medidas de reducción
                                    de costos.
                                </p>
                                <div class="link"></div>
                            </div>
                        </div>

                        <div class="card">
                            <div class="face front">
                                <img src="img/final2.jpg"  />
                                <h3 class="n-expert">Gestión</h3>
                            </div>

                            <div class="face back">
                                <h3>Gestión</h3>
                                <p>
                                    Permite tener un mayor control sobre los recursos financieros
                                    de la empresa, al establecer políticas claras, procesos de
                                    aprobación y límites de gastos.
                                </p>
                                <div class="link"></div>
                            </div>
                        </div>

                        <div class="card">
                            <div class="face front">
                                <img src="img/final3.jpg" />
                                <h3 class="n-expert">Administración</h3>
                            </div>

                            <div class="face back">
                                <h3>Administración</h3>
                                <p>
                                    Involucra la creación de presupuestos detallados que asignan
                                    los recursos financieros de manera adecuada, esto permite
                                    establecer límites y metas de gastos.
                                </p>
                                <div class="link"></div>
                            </div>
                        </div>
                    </section>
                </div>
            </main>
        </div>
        <%@include file="WEB-INF/jspf/pie.jspf" %>

    </body>
</html>
