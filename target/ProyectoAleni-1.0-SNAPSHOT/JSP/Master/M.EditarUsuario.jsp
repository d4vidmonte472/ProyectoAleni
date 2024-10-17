<%-- 
    Document   : M.EditarUsuario
    Created on : 17/10/2024, 5:36:51 p. m.
    Author     : fboan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
        <h1> Hello World ! </h1>
    </body>
</html>
