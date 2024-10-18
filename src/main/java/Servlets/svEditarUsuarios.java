/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Clases.Usuario;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.FileWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author David
 */
public class svEditarUsuarios extends HttpServlet {

    
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
            if (partes.length == 2) {
                String usuarioTxt = partes[0].trim();
                String contrasenaTxt = partes[1].trim();
                String masterTxt = partes[2].trim();
                
                listaUsuarios.add(new Usuario(usuarioTxt, contrasenaTxt, masterTxt));
    
        
        
        
    }
         }
         
         for(Usuario us : listaUsuarios){
             
             
             if(us.getMaster() == null ? request.getParameter("usuarioId") == null : us.getMaster().equals(request.getParameter("usuarioId"))){
                 us.setUsuario(request.getParameter("usuario"));
                 us.setPassword(request.getParameter("password"));
                 
                  try {
  
            try (FileWriter myWriter = new FileWriter(rutaArchivoUsuarios, false)) {
                for(Usuario usuario : listaUsuarios){
                    
               myWriter.write("\n" + usuario.getUsuario() + usuario.getPassword() + usuario.getMaster());
           
                }
                 myWriter.close();
            }
      
     
     
      System.out.println("Successfully wrote to the file.");
    } catch (IOException e) {
      System.out.println("An error occurred.");
      e.printStackTrace();
    }
                 break;
                 
             }
         }
         
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
