<%-- 
    Document   : A.MosProveedor
    Created on : 28/10/2024, 9:16:28 p. m.
    Author     : fboan
--%>

<%@page import="Clases.Proveedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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


        <% Proveedor editado = (Proveedor) request.getSession().getAttribute("que");  %>
        <h1>EDITAR proveedor: <%= editado.getRazonSocial() %></h1>

        <form action="${pageContext.request.contextPath}/SvAMosproveedor" method="GET">
            <label>NIT:</label>
            <input type="text" name="numQueja" value="<%= editado.getNit() %>" readonly><br>

            <label>RAZÓN SOCIAL:</label>
            <input type="text" name="fecha" value="<%= editado.getRazonSocial() %>" readonly><br>

            <label>NOMBRE DE EMPRESA:</label>
            <input type="text" name="detalle" value="<%= editado.getNombreEmpresa() %>" readonly><br>

            <label>TELEFONO:</label>
            <input type="text" name="solicitud" value="<%= editado.getTelefono() %>" required readonly><br>

            <label for="departamento">Departamento:</label>
            <select id="departamento" name="departamento" data-selected="<%= editado.getDepartamento() %>" required disabled>
                <option value="">Selecciona un departamento</option>
            </select>

            <label for="municipio">Municipio:</label>
            <select id="municipio" name="municipio" data-selected="<%= editado.getMunicipio() %>" required disabled>
                <option value="">Selecciona un municipio</option>
            </select>

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

            <label>DIRECCIÓN:</label>
            <input type="text" name="numDoc" value="<%= editado.getDireccion() %>" readonly><br>

            <button type="submit">Regresar</button>
            <% int id= (int) request.getSession().getAttribute("idQuejaBuscada");%>
            <input type="hidden" name="proveedorId" value="<%= id %>">
        </form>

    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="../../JS/municipios.js"></script>
    <script src="../../JS/preseleccionarDep.js"></script>
</html>
