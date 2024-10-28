<%-- 
    Document   : Menu_master
    Created on : 9/10/2024, 11:12:10 a. m.
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

<nav class="navbar navbar-dark bg-dark">
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
                <ul class="navbar-nav d-flex flex-grow-1 justify-content-between">
                    <!-- Opciones en el Offcanvas -->
                    <li class="nav-item flex-grow-1 text-center">
                        <a class="nav-link" href="M.Usuarios.jsp">USUARIOS</a>
                    </li>
                    <li class="nav-item flex-grow-1 text-center">
                        <a class="nav-link" href="#">CON+SUMIDORES</a>
                    </li>
                    <li class="nav-item flex-grow-1 text-center">
                        <a class="nav-link" href="M.quejas.jsp">PROVEEDORES</a>
                    </li>
                    <li class="nav-item flex-grow-1 text-center">
                        <a class="nav-link" href="M.quejas.jsp">QUEJAS</a>
                    </li>
                    <li class="nav-item dropdown flex-grow-1 text-center">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">REPORTES</a>
                        <ul class="dropdown-menu dropdown-menu-dark">
                            <li><a class="dropdown-item" href="#">VENTAS</a></li>
                            <li><a class="dropdown-item" href="#">QUEJAS</a></li>
                        </ul>
                    </li>
                    <li class="nav-item flex-grow-1 text-center">
                        <a class="nav-link" href="../../index.jsp">LOG OUT</a>
                    </li>
                </ul>
            </div>
        </div>
        
        <!-- Opciones adicionales en la Navbar fuera del offcanvas -->
        <ul class="navbar-nav d-flex flex-row flex-grow-1 justify-content-around">
            <li class="nav-item text-center">
                <a class="nav-link" href="Mcmenu.jsp">INICIO</a>
            </li>
            <li class="nav-item text-center">
                <a class="nav-link" href="MCardionica.jsp">CARDIONICA</a>
            </li>
            <li class="nav-item text-center">
                <a class="nav-link" href="Mservicios.jsp">PLANES</a>
            </li>
            <li class="nav-item text-center">
                <a class="nav-link" href="MContacto.jsp">CONTACTO</a>
            </li>
            <li class="nav-item text-center">
                <a class="nav-link" href="MQuejas.jsp">QUEJAS DIACO</a>
            </li>
        </ul>
    </div>
</nav>




    <!-- Sección de la página principal -->
    <header>
        <h1>Bienvenido a ALENI, SEÑOR FERXO</h1>
        <p>EN ESTE MENÚ PODRA EDITAR CUALQUIER ERROR EN VENTAS O ALGUNA DE LAS QUEJAS.</p>
    </header>

    <footer>
        <p>&copy; 2024 ALENI. Todos los derechos reservados.</p>
    </footer>
    
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</html>
