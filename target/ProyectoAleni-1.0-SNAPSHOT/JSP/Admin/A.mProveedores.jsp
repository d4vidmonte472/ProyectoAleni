<%-- 
    Document   : A.mProveedores
    Created on : 28/10/2024, 9:54:05 p. m.
    Author     : fboan
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Clases.Proveedor"%>
<%@page import="java.util.List"%>
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
                    <li class="nav-item dropdown">
                       
                            
                                <form id="Reports" method="GET" action="${pageContext.request.contextPath}/SvAMosRepQue">
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
                                    
<h1 class="text-center">LISTA DE PROVEEDORES</h1>
<div class="container" style="max-width: 80%;">
    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">NIT</th>
                    <th scope="col">RAZÓN SOCIAL</th>
                    <th scope="col">NOMBRE DE LA EMPRESA</th>
                    <th scope="col">TELEFONO</th>
                    <th scope="col">CORREO</th>
                    <th scope="col">ACCIONES</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Proveedor> lista = (List<Proveedor>) request.getSession().getAttribute("listaProveedores");
                    int totalItems = lista != null ? lista.size() : 0;
                    int itemsPorPagina = 10;
                    int paginaActual = request.getParameter("pagina") != null ? Integer.parseInt(request.getParameter("pagina")) : 1;
                    int totalPaginas = (int) Math.ceil((double) totalItems / itemsPorPagina);
                    int indiceInicio = (paginaActual - 1) * itemsPorPagina;

                    // Sublistar los elementos de acuerdo a la página actual
                    List<Proveedor> proveedoresPagina = lista != null && !lista.isEmpty() ? 
                        lista.subList(indiceInicio, Math.min(indiceInicio + itemsPorPagina, totalItems)) :  new ArrayList<>();

                    int cont = indiceInicio + 1; // Para mantener el conteo correcto
                    if (proveedoresPagina != null && !proveedoresPagina.isEmpty()) {
                        for (Proveedor que : proveedoresPagina) {
                %>
                    <tr>
                        <td><%= cont++ %></td>
                        <td><%= que.getNit() %></td>
                        <td><%= que.getRazonSocial() %></td>
                        <td><%= que.getNombreEmpresa() %></td>
                        <td><%= que.getTelefono() %></td>
                        <td><%= que.getCorreo() %></td>
                        <td>
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                <form action="${pageContext.request.contextPath}/SvAEditarProveedor" method="POST"> 
                                    <input type="hidden" name="ProveedorId" value="<%= cont - 2 %>">
                                    <button type="submit" class="btn btn-primary btn-sm"><i class="fa-solid fa-pen-to-square"></i></button>
                                </form>
                                <form action="${pageContext.request.contextPath}/SvAEliminarProv" method="GET"> 
                                    <input type="hidden" name="ProveedorId" value="<%= cont - 2 %>">
                                    <button type="submit" class="btn btn-danger btn-sm"><i class="fa-solid fa-trash"></i></button>
                                </form>
                                <form action="${pageContext.request.contextPath}/SvAMosProv" method="POST"> 
                                    <input type="hidden" name="ProveedorId" value="<%= cont - 2 %>">
                                    <button type="submit" class="btn btn-info btn-sm"><i class="fa-solid fa-eye"></i></button>
                                </form>
                            </div>
                        </td>
                    </tr>
                <% 
                        }
                    } else { 
                %>
                    <tr>
                        <td colspan="7" class="text-center">No hay proveedores ingresados.</td>
                    </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
    </div>

    <!-- Paginación -->
    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
            <% if (paginaActual > 1) { %>
            <li class="page-item">
                <a class="page-link" href="?pagina=<%= paginaActual - 1 %>" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <% } %>
            <% for (int i = 1; i <= totalPaginas; i++) { %>
            <li class="page-item <%= (i == paginaActual) ? "active" : "" %>">
                <a class="page-link" href="?pagina=<%= i %>"><%= i %></a>
            </li>
            <% } %>
            <% if (paginaActual < totalPaginas) { %>
            <li class="page-item">
                <a class="page-link" href="?pagina=<%= paginaActual + 1 %>" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
            <% } %>
        </ul>
    </nav>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/efd3b94f53.js" crossorigin="anonymous"></script>
</body>
</html>

