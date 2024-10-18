<%-- 
    Document   : M.mQuejas
    Created on : 17/10/2024, 9:49:45 p. m.
    Author     : fboan
--%>

<%@page import="Clases.Quejas"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
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
                <a class="nav-link" href="#">PROVEDORES</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="M.quejas.jsp">QUEJAS</a>
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

        <h1>LISTA DE USUARIOS</h1>

        <table class="table">
            <thead>
                <tr>
                      <th scope="col">#</th>
                      <th scope="col">Fecha</th>
                    <th scope="col">NITProveedor</th>
                    <th scope="col">NITConsumidor</th>
                    <th scope="col">Numero de documento</th>
                    <th scope="col">Acciones</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Quejas> lista = (List<Quejas>) request.getSession().getAttribute("listaQuejas");
                    int cont=0 ;
                    if (lista != null && !lista.isEmpty()) {
                        for (Quejas que : lista) {
                        cont++;
                %>
                    <tr>
                        <td> <%= que.getNumQueja() %> </td>
                        <td><%= que.getFecha() %></td>
                        <td><%= que.getNitProveedor() %></td>
                        <td><%= que.getNitConsumidor() %></td>
                        <td><%= que.getNumDoc()%></td>
                        
                        <td> 
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <form action="${pageContext.request.contextPath}/svEditarUsuario" method="POST" > 
                                <input type="hidden" name="usuarioId" value="<%= cont-1 %>">
                                <button type="submit" class="tn btn-primary btn-sm"> <i class="fa-solid fa-pen-to-square"></i> </button>
                            </form>  

                            </div>
                        </td>
                    </tr>
                <% 
                        }
                    } else { 
                %>
                    <tr>
                        <td colspan="4">No hay quejas ingresadas.</td>
                    </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
    </body>
    <script src="https://kit.fontawesome.com/efd3b94f53.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</html>
