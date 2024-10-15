/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author esteb
 */
public class CardionicaServlet extends HttpServlet {

     @Override
     protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
         if (action == null) {
            // Si no hay acción, cargamos la página principal
            request.getRequestDispatcher("menu.jsp").forward(request, response);
        } else if (action.equals("compra")) {
            request.getRequestDispatcher("compra.jsp").forward(request, response);
        } else if (action.equals("alquiler")) {
            request.getRequestDispatcher("alquiler.jsp").forward(request, response);
        } else if (action.equals("finalizarCompra")) {
            // Aquí procesas la compra
            String nombre = request.getParameter("nombre");
            String nit = request.getParameter("nit");
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));
            double total = cantidad * 1500;
            request.setAttribute("total", total);
            request.setAttribute("nombre", nombre);
            request.setAttribute("nit", nit);
            request.setAttribute("cantidad", cantidad);
            request.getRequestDispatcher("facturaCompra.jsp").forward(request, response);
        } else if (action.equals("finalizarAlquiler")) {
            // Aquí procesas el alquiler
            String nombre = request.getParameter("nombre");
            String nit = request.getParameter("nit");
            int dias = Integer.parseInt(request.getParameter("dias"));
            double total = dias * 200;
            request.setAttribute("total", total);
            request.setAttribute("nombre", nombre);
            request.setAttribute("nit", nit);
            request.setAttribute("dias", dias);
            request.getRequestDispatcher("facturaAlquiler.jsp").forward(request, response);
        }
    }   
    
    @Override    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);  // Manejo similar de solicitudes en GET y POST
    }
    @Override
    public String getServletInfo() {
        return "Servlet que maneja las opciones de Compra y Alquiler en Cardionica";
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
