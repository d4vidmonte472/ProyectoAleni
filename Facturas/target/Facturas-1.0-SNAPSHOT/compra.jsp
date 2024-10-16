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
        <title>Cardionica - Compra</title>
        <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        form { max-width: 400px; margin: 0 auto; }
        label { display: block; margin-top: 10px; }
        input, select { width: 100%; padding: 5px; margin-top: 5px; }
        button { margin-top: 20px; padding: 10px 20px; }
    </style>
    <script>
        function calcularTotal() {
            var cantidad = document.getElementById('cantidad').value;
            var total = cantidad * 1500;
            document.getElementById('precioTotal').value = 'Q' + total;
        }
    </script>
    </head>
    <body>
        <h1>Formulario de Compra</h1>
        <form action="CardionicaServlet" method="post">
        <input type="hidden" name="action" value="finalizarCompra">
        
        <label for="nombre">Nombre *</label>
        <input type="text" id="nombre" name="nombre" required>
        
        <label for="nit">NIT (o C/F)</label>
        <input type="text" id="nit" name="nit" placeholder="C/F">
        
        <label for="cantidad">Cantidad</label>
        <select id="cantidad" name="cantidad" onchange="calcularTotal()">
            <% for(int i = 1; i <= 10; i++) { %>
                <option value="<%= i %>"><%= i %></option>
            <% } %>
        </select>
        
        <label for="precioTotal">Precio Total</label>
        <input type="text" id="precioTotal" name="precioTotal" readonly>
        
        <button type="submit">FINALIZAR</button>
    </form>
    <a href="MainServlet">REGRESAR</a>
    
    <script>calcularTotal();</script>
    </body>
</html>
