<%-- 
    Document   : M.EditarQuejas
    Created on : 17/10/2024, 11:06:56 p. m.
    Author     : fboan
--%>
<%@page import="Clases.Quejas"%>
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
                <a class="nav-link active" aria-current="page" href="M.Usuarios.jsp">USUARIOS</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">CONSUMIDORES</a>
            </li>
            <li class="nav-item">
                    
        
            <a class="nav-link" href="M.quejas.jsp">
             <form id="Proveedores" method="GET" action="${pageContext.request.contextPath}/SvMostrarqueja"> 
             <button type="submit" class="btn btn-secondary btn-lg">PROVEEDORES</button>
        </form></a>         
             
     
             
            </li>
            <li class="nav-item">
                
                <a class="nav-link" href="M.quejas.jsp">        <form id="Proveedores" method="GET" action="${pageContext.request.contextPath}/SvMostrarqueja"> 
             <button type="submit" class="btn btn-secondary btn-lg">QUEJAS</button>
        </form></a>
            
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" type="">
                REPORTES 
                </a>
                <ul class="dropdown-menu dropdown-menu-dark">
                <li><a class="dropdown-item" href="#">VENTAS</a></li>
                <li><a class="dropdown-item" href="#">QUEJAS</a></li>
                <li>
                    <hr class="dropdown-divider">
                </li>

                    
           
            </ul>
            <li class="nav-item">
                <a class="nav-link" href="../../index.jsp">Log out</a>
            </li>
        </div>
        </div>
    </div>
</li>
        </ul>


    </nav>
         <% Quejas editado = (Quejas) request.getSession().getAttribute("que1");  %>
         
         
        <h1> EDITAR Queja No: <%= editado.getNumQueja() %> </h1>
        
            <form action="${pageContext.request.contextPath}/svEditarQuejas" method="POST">
                
                <label>Numero de Queja:</label>
                <input type="text" name="numQueja" value="<%= editado.getNumQueja()%>" required readonly><br>
                
                
                <label>Fecha:</label>
                <input type="text" name="fecha" value="<%= editado.getFecha()%>" required><br>
                
                <label>Detalle:</label>
                <input type="text" name="detalle" value="<%= editado.getDetalle()%>" required><br>

                <label>Solicitud:</label>
                <input type="text" name="solicitud" value="<%= editado.getSolicitud()%>" required ><br>
                
                <label>NIT Consumidor:</label>
                <input type="text" name="nitConsumidor" value="<%= editado.getNitConsumidor()%>" required ><br>
                
                <label>NIT Proveedor:</label>
                <input type="text" name="nitProveedor" value="<%= editado.getNitProveedor()%>" required ><br>
                
                <label>Num. Documento:</label>
                <input type="text" name="numDoc" value="<%= editado.getNumDoc()%>" required ><br>

                
                <button type="submit">Guardar Cambios</button>
            </form>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</html>
