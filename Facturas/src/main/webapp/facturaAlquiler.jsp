<%-- 
    Document   : facturaAlquiler
    Created on : 14/10/2024, 10:10:54 p. m.
    Author     : esteb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Factura de Alquiler</title>
</head>
<body>
    <h2>Factura de Alquiler</h2>
    <p>Nombre: ${nombre}</p>
    <p>NIT: ${nit}</p>
    <p>Días de alquiler: ${dias}</p>
    <p>Precio Total: Q${total}</p>
    <button onclick="window.location.href='CardionicaServlet'">No</button>
    <button onclick="window.location.href='descargarPDF?action=alquiler'">Sí</button>
</body>
</html>