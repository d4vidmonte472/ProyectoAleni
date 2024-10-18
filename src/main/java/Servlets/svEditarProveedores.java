/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Clases.Proveedor;
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
public class svEditarProveedores extends HttpServlet {

  
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
        String rutaArchivoUsuarios = context.getRealPath("/TXT/proveedores.txt");
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
         
         for(Proveedor prov : listaProveedores){
             
             
             if(prov.getNit()==Integer.parseInt(request.getParameter("proveedorNit"))){
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
