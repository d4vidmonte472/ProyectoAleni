<%-- 
    Document   : compra
    Created on : 14/10/2024, 10:09:38 p. m.
    Author     : esteb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Compra</title>
    </head>
    <body>
        <h2>Formulario de Compra</h2>
        <form action="CardionicaServlet?action=finalizarCompra" method="POST">
            Nombre: <input type="text" name="nombre" required><br>
            NIT (o C/F): <input type="text" name="nit" required><br>
            Cantidad (1-10): <input type="number" name="cantidad" min="1" max="10" required><br>
            <button type="submit">FINALIZAR</button>
            <button type="button" onclick="window.location.href='CardionicaServlet'">REGRESAR</button>
        </form>
    </body>
</html>
