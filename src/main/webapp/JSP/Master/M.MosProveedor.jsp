<%-- 
    Document   : M.MosProveedor
    Created on : 27/10/2024, 9:43:03 p. m.
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
                
               
                <a class="nav-link active" aria-current="page" href="M.Usuarios.jsp">
               
        <form id="Usuarios" method="GET" action="${pageContext.request.contextPath}/svMostrarUsuarios"> 
            <button type="submit" class="btn btn-sucess btn-lg"  style="color:#bcbebf">USUARIOS</button>
        </form>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">          
             <form id="Proveedores" method="GET" action="${pageContext.request.contextPath}/SvMosCons"> 
             <button type="submit" class="btn btn-sucess btn-lg"  style="color:#bcbebf">CONSUMIDORES</button>
             </form>
             </a>
            </li>
            <li class="nav-item">
                    
        
            <a class="nav-link" href="M.quejas.jsp">
             <form id="Proveedores" method="GET" action="${pageContext.request.contextPath}/SvMosproveedor"> 
             <button type="submit" class="btn btn-sucess btn-lg" style="color:#bcbebf">PROVEEDORES</button>
            </form>
            </a>         
             
     
             
            </li>
            <li class="nav-item">
                
                <a class="nav-link" href="M.quejas.jsp">      
             <form id="Proveedores" method="GET" action="${pageContext.request.contextPath}/SvMostrarqueja"> 
             <button type="submit" class="btn btn-sucess btn-lg"  style="color:#bcbebf">QUEJAS</button>
             </form>
                </a>
            
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" type="">
             <form id="Reports"  > 
             <button type="submit" class="btn btn-sucess btn-lg"  style="color:#bcbebf">REPORTES</button>
             </form>
                </a>
                <ul class="dropdown-menu dropdown-menu-dark">
                <li>
                    <a class="dropdown-item" href="#">
             <form id="Reports" method="GET" action="${pageContext.request.contextPath}/SvMosRepven" > 
             <button type="submit" class="btn btn-sucess btn-lg"  style="color:#bcbebf">VENTAS</button>
             </form>
                    </a>
                </li>
                        <li>
                             <a class="dropdown-item" href="#">
                                 <form id="Reports" method="GET" action="${pageContext.request.contextPath}/SvMosRepQue" > 
                                 <button type="submit" class="btn btn-sucess btn-lg"  style="color:#bcbebf">QUEJAS</button>
                                 </form>
                             </a>
                        </li>
                <li>
                    <hr class="dropdown-divider">
                </li>

                    
           
            </ul>
            <li class="nav-item">
                <a class="nav-link" href="../../index.jsp">
             <button type="button"  class="btn btn-sucess btn-lg"  style="color:#bcbebf">LOG OUT</button>
             
                </a>
            </li>
        </div>
        </div>
    </div>
</li>
        </ul>


    </nav>
                                 
                      
            <% Proveedor editado = (Proveedor) request.getSession().getAttribute("que");  %>

            <h1> EDITAR proveedor: <%= editado.getRazonSocial() %> </h1>

            <form action="${pageContext.request.contextPath}/SvMosproveedor" method="GET">

                <label>NIT:</label>
                <input type="text" name="numQueja" value="<%= editado.getNit() %>" readonly readonly><br>

                <label>RAZÓN SOCIAL:</label>
                <input type="text" name="fecha" value="<%= editado.getRazonSocial() %>" readonly><br>

                <label>NOMBRE DE EMPRESA:</label>
                <input type="text" name="detalle" value="<%= editado.getNombreEmpresa() %>" readonly><br>

                <label>TELEFONO:</label>
                <input type="text" name="solicitud" value="<%= editado.getTelefono() %>" required readonly><br>

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

                    <label for="zona">Zona:</label>
                    <select id="zona" name="zona" required data-selected="<%= editado.getZona() %>" disabled="">
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
                <input type="text" name="numDoc" value="<%= editado.getDireccion() %>" readonly ><br>

                <button type="submit">Regresar</button>
                <% int id= (int) request.getSession().getAttribute("idQuejaBuscada");%>
                <input type="hidden" name="proveedorId" value="<%= id %>">

            </form>

    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="../../JS/municipios.js"></script>
    <script src="../../JS/preseleccionarDep.js"></script>
    
</html>
