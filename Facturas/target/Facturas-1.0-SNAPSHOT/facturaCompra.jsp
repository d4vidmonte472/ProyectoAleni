<%-- 
    Document   : facturaCompra
    Created on : 14/10/2024, 10:10:45 p. m.
    Author     : esteb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Factura de Compra</title>
</head>
<body>
    <h2>Factura de Compra</h2>
    <p>Nombre: ${nombre}</p>
    <p>NIT: ${nit}</p>
    <p>Cantidad: ${cantidad}</p>
    <p>Precio Total: Q${total}</p>
    <button onclick="window.location.href='CardionicaServlet'">No</button>
    <button onclick="window.location.href='descargarPDF?action=compra'">Sí</button>
</body>
</html>
