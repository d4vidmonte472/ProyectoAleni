/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Clases.Usuario;
import jakarta.servlet.ServletContext;
import java.io.IOException;
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
 * @author David
 */
public class svEditarUsuario extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        ServletContext context = getServletContext();
        String rutaArchivoUsuarios = context.getRealPath("/TXT/Usuarios.txt");
        List<String> lineas = Files.readAllLines(Paths.get(rutaArchivoUsuarios));
        
       List<Usuario> listaUsuarios = new ArrayList<>();
       
         for (String linea : lineas) {
            String[] partes = linea.split(",");
            if (partes.length == 3) {
                String usuarioTxt = partes[0].trim();
                String contrasenaTxt = partes[1].trim();
                String masterTxt = partes[2].trim();
                
                listaUsuarios.add(new Usuario(usuarioTxt, contrasenaTxt, masterTxt));
    
        
        
        
    }
         }
         int usuarioId = Integer.parseInt(request.getParameter("usuarioId"));
         
        
             
             
          
                 Usuario usr = listaUsuarios.get(usuarioId);
                 
                 HttpSession misesion = request.getSession();
                misesion.setAttribute("usr", usr);
         String mensajeErr = null ;
            misesion.setAttribute("mensajeError",mensajeErr );
         response.sendRedirect("JSP/Master/M.EditarUsuario.jsp");
                
                
             
         
         
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
