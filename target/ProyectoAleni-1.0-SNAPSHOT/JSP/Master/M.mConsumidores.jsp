<%-- 
    Document   : M.mConsumidores
    Created on : 17/10/2024, 9:41:19 a. m.
    Author     : fboan
--%>

<%@page import="Clases.Consumidor"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="../../CSS/styles.css">


</head>
<body>

    <!-- Menú de navegación original -->
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
                                         <h1>LISTA DE CONSUMIDORES</h1>

        <table class="table">
            <thead>
                <tr>
                      <th scope="col">#</th>
                      <th scope="col">DPI</th>
                    <th scope="col">Nombres</th>
                    <th scope="col">Apellidos</th>
                    <th scope="col">NitConsumidor</th>
                    <th scope="col">Sexo</th>
                    <th scope="col">Acciones</th>
                 
                    
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Consumidor> lista = (List<Consumidor>) request.getSession().getAttribute("listaConsumidores");
                    int cont=0 ;
                    if (lista != null && !lista.isEmpty()) {
                        for (Consumidor con : lista) {
                        cont++;
                %>
                    <tr>
                        <td> <%= cont %> </td>
                        <td> <%= con.getDpi() %> </td>
                        <td><%= con.getNombre1() %></td>
                        <td><%= con.getApellido1() %></td>
                        <td><%= con.getNit() %></td>
                        <td><%= con.getSexo()%></td>
                        
                     
                        
                        <td> 
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                            <form action="${pageContext.request.contextPath}/svEditarConsumidores" method="POST" > 
                                <input type="hidden" name="ConsumidorId" value="<%= cont-1 %>">
                                <button type="submit" class="tn btn-primary btn-sm"> <i class="fa-solid fa-pen-to-square"></i> </button>
                            </form>  
                            <form action="${pageContext.request.contextPath}/SvEliminarConsumidores" method="GET"> 
                                <input type="hidden" name="ConsumidorId" value="<%= cont-1 %>">
                                <button type="submit" class="tn btn-primary btn-sm"> <i class="fa-solid fa-trash"></i> </button>
                            </form>
                            <form action="${pageContext.request.contextPath}/svMostrarConsumidores" method="POST"> 
                                <input type="hidden" name="ConsumidorId" value="<%= cont-1 %>">
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
                        <td colspan="4">No hay Consumidores ingresadas.</td>
                    </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
                                         
                                         
    <body>
        <h1>Hello World!</h1>
    </body>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/efd3b94f53.js" crossorigin="anonymous"></script>
</html>
