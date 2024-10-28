/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import java.io.*;
import java.nio.file.*;
import java.util.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.*;
import Clases.Consumidor;
import Clases.Quejas;
import Clases.Usuario;
import Clases.Proveedor;
import jakarta.servlet.http.HttpSession;



/**
 *
 * @author david
 */
public class svMostrarConsumidores extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        Consumidor con1=null;
        //Ingresar el elemento del formulario que va a jalar la informacion para buscar en la lista
        ServletContext context = getServletContext();
        String rutaArchivoConsumidor = context.getRealPath("/TXT/consumidores.txt");
        List<String> lineas = Files.readAllLines(Paths.get(rutaArchivoConsumidor));
        
        List<Consumidor> listaConsumidor = new ArrayList<>();
        
        for (String linea : lineas) {
            String[] partes = linea.split(",");
            if (partes.length == 20) {
               String nacionalidadTxt = partes[0].trim();
                String tipoConsumidorTxt = partes[1].trim();
                int nitTxt = Integer.parseInt(partes[2].trim());
                int dpiTxt = Integer.parseInt(partes[3].trim());
                String nombre1Txt = partes[4].trim();
                String nombre2Txt = partes[5].trim();
                String apellido1Txt = partes[6].trim();
                String apellido2Txt = partes[7].trim();
                String apellidoCasadaTxt = partes[8].trim();
                String direccionTxt = partes[9].trim();
                String zonaTxt = partes[10].trim();
                String departamentoTxt = partes[11].trim();
                String municipioTxt = partes[12].trim();
                String sedeTxt = partes[13].trim();
                int telDomTxt = Integer.parseInt(partes[14].trim());
                int telTxt = Integer.parseInt(partes[15].trim());
                int telRefTxt = Integer.parseInt(partes[16].trim());
                String correoTxt = partes[17].trim();
                Boolean autorizacionTxt = Boolean.valueOf(partes[18].trim());
                String sexoTxt = partes[19].trim();
                
                
                
                listaConsumidor.add(new Consumidor(nacionalidadTxt, tipoConsumidorTxt, nitTxt, dpiTxt, nombre1Txt, nombre2Txt, apellido1Txt, 
                apellido2Txt, apellidoCasadaTxt, direccionTxt, zonaTxt, departamentoTxt, municipioTxt, sedeTxt, telDomTxt,telTxt, 
                telRefTxt, correoTxt, autorizacionTxt, sexoTxt));
                
                
                
            }
             int consumidorId = Integer.parseInt(request.getParameter("ConsumidorId"));
             Consumidor con = listaConsumidor.get(consumidorId);
        HttpSession misesion = request.getSession();
        misesion.setAttribute("con", con); // Guardar el consumidor en la sesión
        response.sendRedirect("JSP/Master/M.MostrarConsumidores.jsp");
    
       
    }
        
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        
        
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
