<%-- 
    Document   : M.EditarProveedor
    Created on : 22/10/2024, 6:47:33 p. m.
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
        
            <form action="${pageContext.request.contextPath}/svEditarQuejas" method="POST">
                
                <label>NIT:</label>
                <input type="text" name="numQueja" value="<%= editado.getNit() %>" required readonly><br>
                
                
                <label>RAZÓN SOCIAL:</label>
                <input type="text" name="fecha" value="<%= editado.getRazonSocial() %>" required><br>
                
                <label>NOMBRE DE EMPRESA:</label>
                <input type="text" name="detalle" value="<%= editado.getNombreEmpresa() %>" required><br>

                <label>TELEFONO:</label>
                <input type="text" name="solicitud" value="<%= editado.getTelefono() %>" required ><br>
                
                <label>DEPARTAMENTO:</label>
                        <label for="departamento">Elija su departamento:</label>
            <select id="departamento" name="departamento" required>
            <option value=""></option>  
            </select>

            <label for="municipio">Elija su municipio:</label>
          

          
                <input type="text" name="nitConsumidor" value="<%= editado.getDepartamento() %>" required ><br>
                
                <label>MUNICIPIO:</label>
                  <select id="municipio" required name="municipio" value="<%= editado.getMunicipio() %>">
                      <option value=""></option> 
                  </select>
                <input type="text" name="nitProveedor" value="<%= editado.getMunicipio() %>" required ><br>
                
                <label>ZONA:</label>
                <input type="text" name="numDoc" value="<%= editado.getZona() %>" required ><br>
                
                <label>DIRECCÍON:</label>
                <input type="text" name="numDoc" value="<%= editado.getDireccion() %>" required ><br>
                
                
                

                
                <button type="submit">Guardar Cambios</button>
            </form>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="../JS/municipios.js"></script>
    <script src="../JS/municipiosP.js"></script>
</html>