<%-- 
    Document   : A.MostrarConsumidores
    Created on : 28/10/2024, 9:24:03 p. m.
    Author     : fboan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Clases.Consumidor"%>
<!DOCTYPE html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>USUARIOS</title>
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
                        <form id="Usuarios" method="GET" action="${pageContext.request.contextPath}/AsvMostrarUsuarios">
                            <button type="submit" class="btn btn-dark btn-lg" style="color:#bcbebf">USUARIOS</button>
                        </form>
                    </li>
                    <li class="nav-item">
                        <form id="Proveedores" method="GET" action="${pageContext.request.contextPath}/ASvMosCons">
                            <button type="submit" class="btn btn-dark btn-lg" style="color:#bcbebf">CONSUMIDORES</button>
                        </form>
                    </li>
                    <li class="nav-item">
                        <form id="Proveedores" method="GET" action="${pageContext.request.contextPath}/ASvMosproveedor">
                            <button type="submit" class="btn btn-dark btn-lg" style="color:#bcbebf">PROVEEDORES</button>
                        </form>
                    </li>
                    <li class="nav-item">
                        <form id="Proveedores" method="GET" action="${pageContext.request.contextPath}/ASvMostrarqueja">
                            <button type="submit" class="btn btn-dark btn-lg" style="color:#bcbebf">QUEJAS</button>
                        </form>
                    </li>
                    <li class="nav-item dropdown">
                        <form id="Reports" method="GET" action="${pageContext.request.contextPath}/ASvMosRepQue">
                            <button type="submit" class="dropdown-item">REPORTES QUEJAS</button>
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

<%  Consumidor editado = (Consumidor) request.getSession().getAttribute("con");  %>
        
<h1> Mostrar Consumidor: <%= editado.getNombre1() %> </h1>

<form action="${pageContext.request.contextPath}/SvAMosCons" method="GET">  <!-- Modificación aquí -->
    
    <label for="nacionalidad">Nacionalidad:</label>
    <select id="nacionalidad" name="nacionalidad" required data-selected="<%= editado.getNacionalidad() %>" disabled>
        <option value="guatemalteco">Guatemalteco</option>
        <option value="otro">Otro</option>
    </select><br>

    <!-- Tipo de Consumidor (Select) -->
    <label for="tipoConsumidor">Tipo de Consumidor:</label>
    <select id="tipoConsumidor" name="tipoConsumidor" required data-selected="<%= editado.getTipoConsumidor() %>" disabled>
        <option value="juridico">Jurídico</option>
        <option value="individual">Individual</option>
    </select><br>

    <label>NIT:</label>
    <input type="text" name="nit" value="<%= editado.getNit()%>" required readonly><br>

    <label>Primer Nombre :</label>
    <input type="text" name="nombre1" value="<%= editado.getNombre1()%>" required readonly><br>
    <label>Segundo Nombre:</label>
    <input type="text" name="nombre2" value="<%= editado.getNombre2()%>" required readonly><br>

    <label>Primer Apellido:</label>
    <input type="text" name="apellido1" value="<%= editado.getApellido1()%>" required readonly><br>

    <label>Segundo Apellido:</label>
    <input type="text" name="apellido2" value="<%= editado.getApellido2()%>" required readonly><br>

    <label>Apellido Casada:</label>
    <input type="text" name="apellidoCasada" value="<%= editado.getApellidoCasada()%>" required readonly><br>

    <label>Direccion:</label>
    <input type="text" name="direccion" value="<%= editado.getDireccion()%>" required readonly><br>

    <label for="zona">Zona:</label>
    <select id="zona" name="zona" required data-selected="<%= editado.getZona() %>" disabled>
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

    <!-- Campo de Departamento -->
    <label for="departamento">Departamento:</label>
    <select id="departamento" name="departamento" data-selected="<%= editado.getDepartamento() %>" required disabled>
        <option value="">Selecciona un departamento</option>
    </select>

    <!-- Campo de Municipio -->
    <label for="municipio">Municipio:</label>
    <select id="municipio" name="municipio" data-selected="<%= editado.getMunicipio() %>" required disabled> 
        <option value="">Selecciona un municipio</option>
    </select>

    <label for="SedeD">Sede de DIACO más cercana:</label>
    <select id="SedeD" name="SedeD" required data-selected="<%= editado.getSedeDiaco() %>" disabled>
        <option value="Baja Verapaz">-DIACO- BAJA VERAPAZ</option>
        <option value="Central">CENTRAL</option>
        <option value="Chimaltenango">CHIMALTENANGO - DIACO</option>
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
    </select><br>

    <label>Telefono de Referencia:</label>
    <input type="text" name="telRef" value="<%= editado.getTelRef()%>" required readonly><br>

    <label>Telefono:</label>
    <input type="text" name="tel" value="<%= editado.getTel()%>" required readonly><br>

    <label>Teledono Domicilio:</label>
    <input type="text" name="telDom" value="<%= editado.getTelDom()%>" required readonly><br>

    <label>Correo:</label>
    <input type="text" name="correo" value="<%= editado.getCorreo()%>" required readonly><br>

    <label>Autorizacion:</label>
    <input type="checkbox" name="autorizacion" <%= editado.getAutorizacion() ? "checked" : "" %> disabled><br>

    <label>Sexo:</label>
    <label>
        Masculino <input type="radio" name="sexo" value="M" <%= "M".equals(editado.getSexo()) ? "checked" : "" %> disabled> <br>
    </label>
    <label>
        Femenino <input type="radio" name="sexo" value="F" <%= "F".equals(editado.getSexo()) ? "checked" : "" %> disabled> <br>
    </label>
    
    <button type="submit">Aceptar</button>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="../../JS/preseleccionarDep.js"></script>
<script src="../../JS/precargarotros.js"></script>
</body>
</html>    
            

      
