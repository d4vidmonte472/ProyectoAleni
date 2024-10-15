<%-- 
    Document   : alquiler
    Created on : 14/10/2024, 10:09:48 p. m.
    Author     : esteb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Alquiler</title>
</head>
<body>
    <h2>Formulario de Alquiler</h2>
    <form action="CardionicaServlet?action=finalizarAlquiler" method="POST">
        Nombre: <input type="text" name="nombre" required><br>
        NIT (o C/F): <input type="text" name="nit" required><br>
        Días de alquiler (1-30): <input type="number" name="dias" min="1" max="30" required><br>
        <button type="submit">FINALIZAR</button>
        <button type="button" onclick="window.location.href='CardionicaServlet'">REGRESAR</button>
    </form>
</body>
</html>