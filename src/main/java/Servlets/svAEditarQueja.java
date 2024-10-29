/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Clases.Quejas;
import Clases.Usuario;
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
public class svAEditarQueja extends HttpServlet {

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
    // Inicializamos la variable que1 en null.
    Quejas que1 = null;

    ServletContext context = getServletContext();
    String rutaArchivoUsuarios = context.getRealPath("/TXT/quejas.txt");
    List<String> lineas = Files.readAllLines(Paths.get(rutaArchivoUsuarios));
    List<Quejas> listaQuejas = new ArrayList<>();

    // Cargar las quejas desde el archivo.
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

            listaQuejas.add(new Quejas(numDocTxt, fechaTxt, detalleTxt, solicitudTxt,
                    nitProveedorTxt, nitConsumidorTxt, numQuejaTxt));
        }
    }

    // Buscar la queja que coincide con el ID proporcionado.
    int idQuejaBuscada = Integer.parseInt(request.getParameter("QuejasId"));
    for (Quejas que : listaQuejas) {
        if (que.getNumQueja() == idQuejaBuscada) {
            que1 = que; // Asignamos la queja encontrada a que1.
            break;
        }
    }

    // Validar si se encontró la queja.
    if (que1 != null) {
        // Si la queja fue encontrada, se guarda en la sesión y se redirige.
        HttpSession misesion = request.getSession();
        misesion.setAttribute("que1", que1);
        response.sendRedirect("JSP/Admin/A.EditarQuejas.jsp");
    } else {
        // Si no se encontró, mostramos un mensaje de error.
        response.sendError(HttpServletResponse.SC_NOT_FOUND, "Queja no encontrada.");
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
