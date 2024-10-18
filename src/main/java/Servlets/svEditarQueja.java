/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Clases.Quejas;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author fboan
 */
public class svEditarQueja extends HttpServlet {

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
                ServletContext context = getServletContext();
        String rutaArchivoUsuarios = context.getRealPath("/TXT/quejas.txt");
        List<String> lineas = Files.readAllLines(Paths.get(rutaArchivoUsuarios));
               List<Quejas> listaQuejas = new ArrayList<>();
       
         for (String linea : lineas) {
            String[] partes = linea.split(",");
            if (partes.length == 7) {
                int numDocTxt = Integer.parseInt(partes[0].trim());
                String fechaTxt = partes[1].trim();
                String detalleTxt = partes[2].trim();
                String solicitudTxt = partes[3].trim();
                int nitProveedorTxt = Integer.parseInt(partes[4].trim());
                int nitConsumidorTxt = Integer.parseInt(partes[5].trim());
                int numQuejaTxt = Integer.parseInt(partes[6].trim());
                
                
                listaQuejas.add(new Quejas(numDocTxt,fechaTxt,detalleTxt,solicitudTxt,nitProveedorTxt,nitConsumidorTxt,numQuejaTxt));   
    }
         }
         
         for (Quejas que : listaQuejas ){
             if (que.getNumQueja().equals(requestparameter("adgvgasv")))
         }
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
