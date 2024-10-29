/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Clases.Proveedor;
import Clases.Quejas;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author fboan
 */
public class SvAEditarProveedor extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
     
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response .servlet response
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
        String rutaArchivoProveedores = context.getRealPath("/TXT/proveedores.txt");
        List<String> lineas = Files.readAllLines(Paths.get(rutaArchivoProveedores));
        
       List<Proveedor> listaProveedores = new ArrayList<>();
       
         for (String linea : lineas) {
            String[] partes = linea.split(",");
            if (partes.length == 9) {
                String nombreEmpresaTxt = partes[0].trim();
                String razonSocialTxt = partes[1].trim();
                int nitTxt = Integer.parseInt(partes[2].trim());
                String direccionTxt = partes[3].trim();
                String zonaTxt = partes[4].trim();
                String departamentoTxt = partes[5].trim();
                String municipioTxt = partes[6].trim();
                int telefonoTxt = Integer.parseInt(partes[7].trim());
                String correoTxt = partes[8].trim();
                
                
                listaProveedores.add(new Proveedor(nombreEmpresaTxt,razonSocialTxt,nitTxt,direccionTxt,zonaTxt,departamentoTxt,municipioTxt,telefonoTxt,correoTxt));
    

    }
         }    
            int idQuejaBuscada = Integer.parseInt(request.getParameter("ProveedorId"));
            Proveedor que = listaProveedores.get(idQuejaBuscada);
            
            HttpSession misesion = request.getSession();
            misesion.setAttribute("que", que);
            misesion.setAttribute("idQuejaBuscada", idQuejaBuscada);
            response.sendRedirect("JSP/Master/A.EditarProveedor.jsp");
                
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
