<%-- 
    Document   : menu
    Created on : 14/10/2024, 10:09:25 p. m.
    Author     : esteb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Cardionica</title>
        <style>
        body { font-family: Arial, sans-serif; text-align: center; }
        h1 { color: #333; }
        .button { 
            display: inline-block;
            padding: 10px 20px;
            margin: 10px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
    </style>
    </head>
    <body>
        <h1>Cardionica!</h1>
        <a href="CardionicaServlet?action=compra" class="button">Compra</a>
        <a href="CardionicaServlet?action=alquiler" class="button">Alquiler</a>
    </body>
</html>
