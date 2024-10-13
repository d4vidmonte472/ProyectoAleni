<%-- 
    Document   : Inicio_sesion
    Created on : 19/09/2024, 9:43:17 a. m.
    Author     : fboan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio de Sesión</title>
    <link rel="stylesheet" href="../CSS/styles.css"> 
</head>
<body>

    <nav>
        <ul>
            <li><a href="../index.jsp">INICIO</a></li>
            <li><a href="Cardionica.jsp">CARDIONICA</a></li>
            <li><a href="planes.jsp">PLANES</a></li>
            <li><a href="Quejas.jsp">QUEJAS DIACO</a></li>
            <li><a href="Contacto.jsp">CONTACTO</a></li>
            <li><a href="inicio_sesion.jsp">INICIO SESION</a></li>
        </ul>
    </nav>

<div class="container">
    <h1>Inicio de Sesión</h1>
    <form action="${pageContext.request.contextPath}/SvLogin" method="POST"> 
        <label for="username">Nombre de usuario:</label>
        <input type="text" id="username" name="username" required>

        <label for="password">Contraseña:</label>
        <input type="password" id="password" name="password" required>

        <input type="submit" value="Iniciar Sesión">
    </form>
</div>

<footer>
    <p> © 2024 Grupo Comercial Aleni. Todos los derechos reservados.</p>
</footer>

</body>
</html>
