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
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .factura { border: 1px solid #ddd; padding: 20px; max-width: 500px; margin: 0 auto; }
        .botones { text-align: center; margin-top: 20px; }
        .botones button { margin: 0 10px; padding: 10px 20px; }
    </style>
</head>
<body>
    <div class="factura">
        <h2>Factura de Alquiler</h2>
        <p><strong>Nombre:</strong> <%= request.getParameter("nombre") %></p>
        <p><strong>NIT:</strong> <%= request.getParameter("nit") %></p>
        <p><strong>Días de alquiler:</strong> <%= request.getParameter("dias") %></p>
        <p><strong>Precio Total:</strong> <%= request.getParameter("precioTotal") %></p>
    </div>
    <div class="botones">
        <button onclick="window.location.href='CardionicaServlet?action=descargarAlquiler'">Descargar PDF</button>
        <button onclick="window.location.href='CardionicaServlet?action=alquiler'">Editar</button>
    </div>
</body>
</html>