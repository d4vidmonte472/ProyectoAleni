<%-- 
    Document   : NumQueja
    Created on : 29/10/2024, 10:28:29 a. m.
    Author     : fboan
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../CSS/styles.css"> <!-- Asegúrate de vincular tu archivo CSS -->
    <title>Cardionica</title>
</head>
<body>
    <nav>
        <ul>
            <li><a href="../index.jsp">INICIO</a></li>
            <li><a href="Cardionica.jsp">CARDIONICA</a></li>
            
            <li><a href="Contacto.jsp">CONTACTO</a></li>
            <li><a href="Quejas.jsp">QUEJAS DIACO</a></li>
            <li><a href="Inicio_sesion.jsp">INICIO SESION</a></li>
        </ul>
    </nav>
    
    <div class="container" style="max-width: 50%;">
        <h1>SU NUMERO DE QUEJA ES:</h1>
        <%int num = (int)  request.getSession().getAttribute("numqueja"); %> 
        <h2> <%= num  %>  </h2>
        <h4>FAVOR GUARDAR ESTE NUMERO DE QUEJA PARA PODER DARLE SEGUIMIENTO A SU QUEJA.</h4>
        
    </div>
       
</body>
 <footer>
        <p>Fundada en 2014 como una empresa derivada del Instituto Nacional de Salud de Italia, Cardionica se desarrolló como un creador de tecnologías innovadoras para telemedicina y m-salud.</p>
 </footer>
</html>
