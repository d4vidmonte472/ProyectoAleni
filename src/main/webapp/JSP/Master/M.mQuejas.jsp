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
    <div class="container-fluid">
            <ul class="navbar-nav d-flex flex-row flex-grow-1 justify-content-around">
            <li class="nav-item">
                <a class="nav-link" href="Mcmenu.jsp">INICIO</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="MCardionica.jsp">CARDIONICA</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Mservicios.jsp">PLANES</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="MContacto.jsp">CONTACTO</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="MQuejas.jsp">QUEJAS DIACO</a>
            </li>
        </ul>
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
                <ul class="navbar-nav flex-grow-1 pe-3">
                    <li class="nav-item">
                        <form id="Usuarios" method="GET" action="${pageContext.request.contextPath}/svMostrarUsuarios">
                            <button type="submit" class="btn btn-dark btn-lg" style="color:#bcbebf">USUARIOS</button>
                        </form>
                    </li>
                    <li class="nav-item">
                        <form id="Proveedores" method="GET" action="${pageContext.request.contextPath}/SvMosCons">
                            <button type="submit" class="btn btn-dark btn-lg" style="color:#bcbebf">CONSUMIDORES</button>
                        </form>
                    </li>
                    <li class="nav-item">
                        <form id="Proveedores" method="GET" action="${pageContext.request.contextPath}/SvMosproveedor">
                            <button type="submit" class="btn btn-dark btn-lg" style="color:#bcbebf">PROVEEDORES</button>
                        </form>
                    </li>
                    <li class="nav-item">
                        <form id="Proveedores" method="GET" action="${pageContext.request.contextPath}/SvMostrarqueja">
                            <button type="submit" class="btn btn-dark btn-lg" style="color:#bcbebf">QUEJAS</button>
                        </form>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">REPORTES</a>
                        <ul class="dropdown-menu dropdown-menu-dark">
                            <li>
                                <form id="Reports" method="GET" action="${pageContext.request.contextPath}/SvMosRepven">
                                    <button type="submit" class="dropdown-item">VENTAS</button>
                                </form>
                            </li>
                            <li>
                                <form id="Reports" method="GET" action="${pageContext.request.contextPath}/SvMosRepQue">
                                    <button type="submit" class="dropdown-item">QUEJAS</button>
                                </form>
                            </li>
                        </ul>
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


        <h1>LISTA DE QUEJAS</h1>

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
                            <form action="${pageContext.request.contextPath}/svEditarQueja" method="POST" > 
                                <input type="hidden" name="QuejasId" value="<%= que.getNumQueja() %>">
                                <button type="submit" class="tn btn-primary btn-sm"> <i class="fa-solid fa-pen-to-square"></i> </button>
                            </form>  
                            <form action="${pageContext.request.contextPath}/SvEliminarQueja" method="GET"> 
                                <input type="hidden" name="QuejasId" value="<%= que.getNumQueja() %>">
                                <button type="submit" class="tn btn-primary btn-sm"> <i class="fa-solid fa-trash"></i> </button>
                            </form>
                            <form action="${pageContext.request.contextPath}/SvMosQueja" method="POST"> 
                                <input type="hidden" name="QuejasId" value="<%= que.getNumQueja() %>">
                                <button type="submit" class="tn btn-primary btn-sm"> <i class="fa-solid fa-eye"></i> </button>
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
