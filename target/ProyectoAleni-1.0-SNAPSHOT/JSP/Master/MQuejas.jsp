<%-- 
    Document   : MQuejas
    Created on : 17/10/2024, 8:23:18 a. m.
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

    <!-- Menú de navegación original -->
    <nav class="navbar navbar-dark bg-dark">
        <ul>
            <li><a href="Mcmenu.jsp">INICIO</a></li>
            <li><a href="MCardionica.jsp">CARDIONICA</a></li>
            <li><a href="Mservicios.jsp">PLANES</a></li>
            <li><a href="MContacto.jsp">CONTACTO</a></li>
            <li><a href="MQuejas.jsp">QUEJAS DIACO</a></li>
            
<li>
    <div class="container-fluid">
        <a class="navbar-brand" href="#">MASTER MENU</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel">MASTER</h5>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
            <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#">USUARIOS</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">CONSUMIDORES</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">PROVEDORES</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">QUEJAS</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                REPORTES 
                </a>
                <ul class="dropdown-menu dropdown-menu-dark">
                <li><a class="dropdown-item" href="#">VENTAS</a></li>
                <li><a class="dropdown-item" href="#">QUEJAS</a></li>
                <li>
                    <hr class="dropdown-divider">
                </li>
            <li class="nav-item">
                <a class="nav-link" href="../../index.jsp">Log out</a>
            </li>
                
           
            </ul>
        </div>
        </div>
    </div>
</li>
        </ul>


    </nav>
    <h1>FORMULARIO DE QUEJAS DIACO</h1>
    <form id="formularioQueja" method="POST" action="${pageContext.request.contextPath}/svGuardarConsumidor">

    <div class="dformC" id="seccion1">
        
        <label for="nacionalidad">Elige una nacionalidad:</label>
        <select id="nacionalidad" name="nacionalidad" required>
            <option value="guatemalteco">Guatemalteco</option>
            <option value="otro">Otro</option>
        </select>

        <label for="contribuyente">Elige el tipo de contribuyente:</label>
        <select id="contribuyente" name="contribuyente" required>
            <option value="individual">Individual</option>
            <option value="juridico">Jurídico</option>
        </select>



        <p>NIT:
            <input type="number" required title="NIT" placeholder="18106838" name="NIT" id="NIT">
        </p>

        <p>NO. DOCUMENTO DE IDENTIFICACIÓN:
            <input type="number" required title="DPI" name="DPI">
        </p>

        <input type="text" required minlength="3" placeholder="Primer Nombre" title="Primer Nombre" name="PrimerNombre">
        <input type="text" minlength="3" placeholder="Segundo Nombre" title="Segundo Nombre" required name="SegundoNombre">
        <input type="text" required minlength="3" placeholder="Primer Apellido" title="Primer Apellido" name="PrimerApellido">
        <input type="text" required minlength="3" placeholder="Segundo Apellido" title="Segundo Apellido" name="SegundoApellido">
        <input type="text" minlength="3" required placeholder="Apellido de Casada" title="Apellido de Casada" name="ApellidoCasada">

        <p>Sexo:</p>
        <div class="radio-group">
            <label>
                Hombre<input type="radio" required name="sexo" value="h"> 
            </label>
            <label>
                Mujer<input type="radio" required name="sexo" value="m"> 
            </label>
        </div>

        <label for="direccion">Dirección:</label>
        <input type="text" name="direccion" id="direccion" minlength="5" placeholder="Ingrese su dirección" required>

        <label for="zona">Elija su zona:</label>
        <select id="zona" name="zona" required>
            <option value="sin-zona">Sin Zona</option>
            <option value="zona-1">Zona 1</option>
            <option value="zona-2">Zona 2</option>
            <option value="zona-3">Zona 3</option>
            <option value="zona-4">Zona 4</option>
            <option value="zona-5">Zona 5</option>
            <option value="zona-6">Zona 6</option>
            <option value="zona-7">Zona 7</option>
            <option value="zona-8">Zona 8</option>
            <option value="zona-9">Zona 9</option>
            <option value="zona-10">Zona 10</option>
            <option value="zona-11">Zona 11</option>
            <option value="zona-12">Zona 12</option>
            <option value="zona-13">Zona 13</option>
            <option value="zona-14">Zona 14</option>
            <option value="zona-15">Zona 15</option>
            <option value="zona-16">Zona 16</option>
            <option value="zona-17">Zona 17</option>
            <option value="zona-18">Zona 18</option>
            <option value="zona-19">Zona 19</option>
            <option value="zona-20">Zona 20</option>
            <option value="zona-21">Zona 21</option>
            <option value="zona-22">Zona 22</option>
            <option value="zona-23">Zona 23</option>
            <option value="zona-24">Zona 24</option>
            <option value="zona-25">Zona 25</option>  
        </select>

        <label for="departamento">Elija su departamento:</label>
            <select id="departamento" name="departamento" required>
            <option value=""></option>  
            </select>

            <label for="municipio">Elija su municipio:</label>
            <select id="municipio" required name="municipio">

            </select>
            
            <label for="SedeD">Sede de DIACO más cercana:</label>
        <select id="SedeD" name="SedeD" required>
            <option value="Baja Verapaz">-DIACO- BAJA VERAPAZ</option>
            <option value="Central">CENTRAL</option>
            <option value="Chimaltenango">CHIMALTENANGO - DIACO</option>
            <option value="Cobán">COBÁN - DIACO</option>
            <option value="Chiquimula">CHIQUIMULA - DIACO</option>
            <option value="Escuintla">ESCUINTLA - DIACO</option>
            <option value="Huehuetenango">HUEHUETENANGO - DIACO</option>
            <option value="Izabal">IZABAL - DIACO</option>
            <option value="Jutiapa">JUTIAPA - DIACO</option>
            <option value="Petén">PETÉN - DIACO</option>
            <option value="Quetzaltenango">QUETZALTENANGO - DIACO</option>
            <option value="Quiché">QUICHÉ - DIACO</option>
            <option value="Suchitepéquez">SUCHITEPÉQUEZ - DIACO</option>
            <option value="Totonicapán">TOTONICAPÁN - DIACO</option>
            <option value="Retalhuleu">RETALHULEU - DIACO</option>
            <option value="Zacapa">ZACAPA - DIACO</option>
            <option value="Sacatepéquez">SACATEPÉQUEZ - DIACO</option>
            <option value="San Marcos">SAN MARCOS - DIACO</option>
            <option value="Mixco">MIXCO - DIACO</option>
            <option value="Villa Nueva">VILLA NUEVA - DIACO</option>
            <option value="Jalapa">JALAPA - DIACO</option>
            <option value="El Progreso">EL PROGRESO - DIACO</option>
            <option value="Santa Rosa">SANTA ROSA - DIACO</option>
            </select>
        
        <label for="TelefonoD">Teléfono de Domicilio</label>
        <input type="text" name="TelefonoD" id="TelefonoD" class="telefono">

        <label for="Celular">Su Celular:</label>
        <input type="text" name="Celular" id="Celular" class="telefono">

        <label for="Telr">Teléfono de referencia:</label>
        <input type="text" name="Telr" id="Telr" class="telefono">

    <label for="email">Correo Electrónico:</label>
    <input type="email" id="email" name="email" required placeholder="example@example.com">

    <label for="confirm-email">Confirmar Correo Electrónico:</label>
    <input type="email" id="confirm-email" name="confirm-email" required placeholder="example@example.com">

    <label for="compI">Autorizo a publicar informacion:</label>
<div class="form-check">
  <input class="form-check-input" type="checkbox" value="true" id="flexCheckDefault" name="check">
  <label class="form-check-label" for="flexCheckDefault">
    Autorizo
  </label>
</div>
    
</div>

    <div class="dformC">
        
            <label for="empresa">Nombre de la Empresa:</label>
        
            <input type="text" id="empresa" name="empresa" required minlength="3" placeholder="Nombre de la Empresa">
        
            <label for="razon-social">Razón Social:</label>
            <input type="text" id="razon-social" name="razon-social" required minlength="3" placeholder="Razón Social">
        
            <label for="NIT">NIT:</label>
            <input type="number" id="NITP" name="NITP" required placeholder="Ingrese el NIT">
        
            <label for="direccion">Dirección:</label>
            <input type="text" id="direccionP" name="direccionP" required minlength="5" placeholder="Ingrese la dirección">
        
            <label for="zonaP">Zona:</label>
            <select id="zonaP" name="zonaP" required>
                <option value="sin-zona">Sin Zona</option>
                <option value="zona-1">Zona 1</option>
                <option value="zona-2">Zona 2</option>
                <option value="zona-3">Zona 3</option>
                <option value="zona-4">Zona 4</option>
                <option value="zona-5">Zona 5</option>
                <option value="zona-6">Zona 6</option>
                <option value="zona-7">Zona 7</option>
                <option value="zona-8">Zona 8</option>
                <option value="zona-9">Zona 9</option>
                <option value="zona-10">Zona 10</option>
                <option value="zona-11">Zona 11</option>
                <option value="zona-12">Zona 12</option>
                <option value="zona-13">Zona 13</option>
                <option value="zona-14">Zona 14</option>
                <option value="zona-15">Zona 15</option>
                <option value="zona-16">Zona 16</option>
                <option value="zona-17">Zona 17</option>
                <option value="zona-18">Zona 18</option>
                <option value="zona-19">Zona 19</option>
                <option value="zona-20">Zona 20</option>
                <option value="zona-21">Zona 21</option>
                <option value="zona-22">Zona 22</option>
                <option value="zona-23">Zona 23</option>
                <option value="zona-24">Zona 24</option>
                <option value="zona-25">Zona 25</option>
            </select>
        
            <label for="departamentoP">Departamento:</label>
            <select id="departamentoP" name="departamentoP" required>
            <option value=""></option>  
            </select>
        
            <label for="municipioP"> Municipio de la empresa:</label>
            <select id="municipioP" required name="municipioP">
            </select>
        
            <label for="telefono">Teléfono:</label>
            <input type="text" id="telefono" name="telefono" required minlength="8" placeholder="Ingrese el teléfono">
        
            <label for="email">Correo Electrónico:</label>
            <input type="email" id="email" name="email" required placeholder="example@example.com">
        
        
    </div>

</div>
    <div class="dformC">
        
            <label for="NumDoc"> Numero de Documento: </label>
            <input type="number" required title="Numero de Documento" placeholder="18106838" name="NumDoc" id="NumDoc"> Puede ingresar datos de facturas, recibos, contratos, etc.
            <p>
                <label for="fecha">Selecciona la fecha:</label><br>
                <input type="date" id="fecha" name="fecha">
            <p>
            <p>
                <label for="Detalle">Detalle de Queja:</label><br>
                <textarea id="detalle" name="detalle" class="textarea-grande" placeholder="Escribe el detalle de queja aquí..."></textarea>
            </p>
            <p>
                <label for="Solicitud">Solicitud:</label><br>
                <textarea id="solicitud" name="solicitud" class="textarea-grande" placeholder="Escribe su solicitud aquí..."></textarea>

            </p>
            <label for="pruebas">ADJUNTAR PRUEBAS</label>
            <input type="file" name="pruebas">aqui puede adjuntar archivos o imagenes para poder probar lo que dice.
        
    </div>
    <input type="submit" value="Enviar">
</form>
        <footer>
        <p>&copy; 2024 ALENI. Todos los derechos reservados.</p>
    </footer>
    <script src="../JS/municipios.js"></script>
    <script src="../JS/municipiosP.js"></script>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</html>