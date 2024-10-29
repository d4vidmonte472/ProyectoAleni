/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Clases.Consumidor;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author david
 */
public class SvAEditarConsumidor extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
         ServletContext context = getServletContext();
        String rutaArchivoConsumidores = context.getRealPath("/TXT/consumidores.txt");
        List<String> lineas = Files.readAllLines(Paths.get(rutaArchivoConsumidores));
        
        List<Consumidor> listaConsumidores = new ArrayList<>();
       
        Path archivoCon = Paths.get(rutaArchivoConsumidores);
        
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
                
                listaConsumidores.add(new Consumidor(nacionalidadTxt,tipoConsumidorTxt,nitTxt,dpiTxt,nombre1Txt,nombre2Txt,apellido1Txt,apellido2Txt,
                apellidoCasadaTxt,direccionTxt,zonaTxt,departamentoTxt,municipioTxt,sedeTxt,telDomTxt,telTxt,telRefTxt,
                correoTxt,autorizacionTxt,sexoTxt));
    }
         }
          int consumidorId = Integer.parseInt(request.getParameter("ConsumidorId"));
            Consumidor con = listaConsumidores.get(consumidorId);
        HttpSession misesion = request.getSession();
        misesion.setAttribute("con", con); // Guardar el consumidor en la sesión
        misesion.setAttribute("consumidorId", consumidorId);
        response.sendRedirect("JSP/Master/A.EditarConsumidor.jsp");
    
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
