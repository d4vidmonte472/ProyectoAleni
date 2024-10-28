<%-- 
    Document   : M.EditarConsumidor
    Created on : Oct 25, 2024, 11:02:30 AM
    Author     : david
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Clases.Consumidor"%>
<!DOCTYPE html>
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



         <%  Consumidor editado = (Consumidor) request.getSession().getAttribute("con");  %>
         
         
        <h1> Mostrar Consumidor: <%= editado.getNombre1() %> </h1>
        
            <form action="${pageContext.request.contextPath}/svEditarConsumidores" method="POST">
                <% int id= (int) request.getSession().getAttribute("consumidorId");%>
                <input type="hidden" name="ConsumidorId" value="<%= id %>">
                <label>Nacionalidad:</label>
                <input type="text" name="nacionalidad" value="<%= editado.getNacionalidad()%>" required><br>
                <label>Tipo de Consumidor:</label>
                <input type="text" name="tipoConsumidor" value="<%= editado.getTipoConsumidor()%>" required><br>
                
                <label>NIT:</label>
                <input type="text" name="nit" value="<%= editado.getNit()%>" required><br>
                
                
                <label>Primer Nombre :</label>
                <input type="text" name="nombre1" value="<%= editado.getNombre1()%>" required><br>
                <label>Segundo Nombre:</label>
                <input type="text" name="nombre2" value="<%= editado.getNombre2()%>" required><br>
                
                
                <label>Primer Apellido:</label>
                <input type="text" name="apellido1" value="<%= editado.getApellido1()%>" required><br>
                
                <label>Segundo Apellido:</label>
                <input type="text" name="apellido2" value="<%= editado.getApellido2()%>" required><br>

                <label>Apellido Casada:</label>
                <input type="text" name="apellidoCasada" value="<%= editado.getApellidoCasada()%>" required><br>
                
                <label>Direccion:</label>
                <input type="text" name="direccion" value="<%= editado.getDireccion()%>" required><br>
                
                   <label for="zona">Zona:</label>
                <select id="zona" name="zona" required data-selected="<%= editado.getZona() %>">
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
                
                <label>Departamento:</label>
                <input type="text" name="departamento" value="<%= editado.getDepartamento()%>" required><br>

                              <label for="departamento">Departamento:</label>
                <select id="departamento" name="departamento" data-selected="<%= editado.getDepartamento() %>" required>
                    <option value="">Selecciona un departamento</option>
                </select>

                <label for="municipio">Municipio:</label>
                <select id="municipio" name="municipio" data-selected="<%= editado.getMunicipio() %>" required>
                    <option value="">Selecciona un municipio</option>
                </select>

                <input type="hidden" name="proveedorId" value="<%= id %>">
                    
             

                <label>Telefono de Referencia:</label>
                <input type="text" name="telRef" value="<%= editado.getTelRef()%>" required><br>

                <label>Telefono:</label>
                <input type="text" name="tel" value="<%= editado.getTel()%>" required><br>

                <label>Teledono Domicilio:</label>
                <input type="text" name="telDom" value="<%= editado.getTelDom()%>" required><br>

                <label>Correo:</label>
                <input type="text" name="correo" value="<%= editado.getCorreo()%>" required><br>

                <label>Autorizacion:</label>
                <input type="checkbox" name="autorizacion" <%= editado.getAutorizacion() ? "checked" : "" %>><br>

                <label>Sexo:</label>
                <input type="radio" name="sexo" value="M" <%= "M".equals(editado.getSexo()) ? "checked" : "" %> > Masculino
                <input type="radio" name="sexo" value="F" <%= "F".equals(editado.getSexo()) ? "checked" : "" %> > Femenino<br>

                <button type="submit">Aceptar</button>
            </form>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
      <script src="../../JS/preseleccionarDep.js"></script>
</html>