<%-- 
    Document   : ACardionica
    Created on : 28/10/2024, 10:01:31 p. m.
    Author     : fboan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../../CSS/styles.css">


</head>
<body>
<nav class="navbar navbar-danger-emphasis bg-info">
    <div class="container-fluid">
            <ul class="navbar-nav d-flex flex-row flex-grow-1 justify-content-around">
            <li class="nav-item">
                <b> <a class="nav-link" href="Menu_admin.jsp">INICIO</a> </b>
            </li>
            <li class="nav-item">
                <b> <a class="nav-link" href="ACardionica.jsp">CARDIONICA</a></b>
            </li>
           
            <li class="nav-item">
                <b> <a class="nav-link" href="AContacto.jsp">CONTACTO</a></b>
            </li>
            <li class="nav-item">
                <b> <a class="nav-link" href="AQuejas.jsp">QUEJAS DIACO</a> </b>
            </li>
        </ul>
        <a class="navbar-brand" href="#">Admin MENU</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel">MASTER</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <ul class="navbar-nav flex-grow-1 pe-3">
                   
                    <li class="nav-item">
                        <form id="Proveedores" method="GET" action="${pageContext.request.contextPath}/SvAMosCons">
                            <button type="submit" class="btn btn-dark btn-lg" style="color:#bcbebf">CONSUMIDORES</button>
                        </form>
                    </li>
                    <li class="nav-item">
                        <form id="Proveedores" method="GET" action="${pageContext.request.contextPath}/SvAMosproveedor">
                            <button type="submit" class="btn btn-dark btn-lg" style="color:#bcbebf">PROVEEDORES</button>
                        </form>
                    </li>
                    <li class="nav-item">
                        <form id="Proveedores" method="GET" action="${pageContext.request.contextPath}/SvAMostrarqueja">
                            <button type="submit" class="btn btn-dark btn-lg" style="color:#bcbebf">QUEJAS</button>
                        </form>
                    </li>
                     <li class="nav-item">
                            
                                <form id="Reports" method="GET" action="${pageContext.request.contextPath}/SvAMosRepQue">
                                    <button type="submit" class="btn btn-dark btn-lg" style="color:#bcbebf">REPORTES QUEJAS</button>
                                </form>
                     </li>  
                    <li class="nav-item">
                        <form id="Logout" method="GET" action="../../index.jsp">
                            <button type="submit" class="btn btn-dark btn-lg" style="color:#bcbebf">LOG OUT</button>
                        </form>
                    </li>
                </ul>
            </div>
        </div>

    
    </div>
</nav>

         <div class="contenido">
        <h1>Nuevo dispositivo personal para chequeo cardíaco preciso y detección de arritmias</h1>
        <img src="../../IMG/Cardionica.jfif" alt="Dispositivo Cardionica" class="imagen-cardionica">
        <p>Ideal para chequeos cardíacos y prevención y manejo de accidentes cerebrovasculares, fibrilación auricular, bradicardia y taquicardia. El primer EKG personal que puedes usar en modo independiente y a través de Bluetooth® directamente desde tu Smartphone.</p>

        <div class="features">
            <h2>1. App móvil o modo independiente</h2>
            <p>Úsalo en modo independiente o conectado con tu Smartphone (siempre incluye una app móvil gratuita).</p>

            <h2>2. Prueba en tiempo real en la app</h2>
            <p>Electrocardiograma en tiempo real y detección inmediata de posibles arritmias, fibrilación auricular, taquicardia.</p>

            <h2>3. Fácil de usar</h2>
            <p>Controla la salud de tu corazón en un minuto, dondequiera que estés y con la precisión de un entorno clínico.</p>

            <h2>4. Registro personal de EKG</h2>
            <p>Informes en PDF o EDP para compartir con cualquier persona a través de correo electrónico, WhatsApp, servidor en la nube y otras apps.</p>
        </div>

        <h2>Es hora de actuar</h2>
        <p>Los esfuerzos de investigación y recursos de la comunidad médica se dirigen hacia la obtención de información detallada sobre arritmias cardíacas y, específicamente, sobre la fibrilación auricular.</p>

        <p>Las arritmias cardíacas son muy comunes y pueden causar discapacidad significativa y muchos accidentes cerebrovasculares. Los nuevos dispositivos médicos y softwares médicos permiten la detección temprana y fácil de la fibrilación auricular y el manejo remoto de enfermedades cardíacas, en cualquier momento y desde cualquier lugar.</p>

        <h2>Fibrilación auricular</h2>
        <p>La fibrilación auricular es una arritmia cardíaca muy común, que causa discapacidad significativa y muchos accidentes cerebrovasculares. Es muy difícil de diagnosticar (silenciosa e intermitente).</p>

        <p>Alrededor de 44 millones de personas en todo el mundo están afectadas por fibrilación auricular, pero muchos de ellos no son conscientes de ello.</p>

        <p><strong>Fibrilación auricular asintomática:</strong></p>
        <ul>
            <li>Presenta en el 40% de los pacientes</li>
            <li>Mayor mortalidad a 1 año que la fibrilación auricular sintomática (2.9x)</li>
            <li>Mayor riesgo de accidente cerebrovascular (2.7x)</li>
            <li>Mayor riesgo de muerte por eventos cardiovasculares (3.1x)</li>
        </ul>

        <h2>Salud digital en aumento</h2>
        <p>La salud digital está desempeñando un papel importante en la atención médica. Las aplicaciones y desarrolladores están comenzando a enfocarse en fomentar estilos de vida saludables y el bienestar para prevenir que los pacientes se enfermen.</p>

        <p>Las personas están cada vez más dispuestas a probar métodos no tradicionales para acceder a los servicios de salud, especialmente debido a la pandemia que ha cambiado la forma de atención presencial.</p>

        <h2>Comenzando es fácil</h2>
        <ol>
            <li>Compra Cardionica</li>
            <li>Descarga la App</li>
            <li>Controla tu corazón</li>
            <li>Resultados inmediatos</li>
        </ol>
    </div>

    <footer>
        <p>Fundada en 2014 como una empresa derivada del Instituto Nacional de Salud de Italia, Cardionica se desarrolló como un creador de tecnologías innovadoras para telemedicina y m-salud.</p>
    </footer>
   

</body>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</html>