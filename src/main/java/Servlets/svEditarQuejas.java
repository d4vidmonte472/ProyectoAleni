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
import Clases.Quejas;


/**
 *
 * @author David
 */
public class svEditarQuejas extends HttpServlet {

  
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
        String rutaArchivoQuejas = context.getRealPath("/TXT/quejas.txt");
        List<String> lineas = Files.readAllLines(Paths.get(rutaArchivoQuejas));
        
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
         
         for(Quejas q : listaQuejas){
             
             
             if(q.getNumQueja()==Integer.parseInt(request.getParameter("numQueja"))){
                 q.setNumDoc(Integer.parseInt(request.getParameter("numDoc")));
                 q.setFecha(request.getParameter("fecha"));
                 q.setDetalle(request.getParameter("detalle"));
                 q.setSolicitud(request.getParameter("solicitud"));
                 q.setNitProveedor(Integer.parseInt(request.getParameter("nitProveedor")));
                 q.setNitConsumidor(Integer.parseInt(request.getParameter("nitConsumidor")));
                  try {
  
            try (FileWriter myWriter = new FileWriter(rutaArchivoQuejas, false)) {
                for(Quejas quejas : listaQuejas){
                    
               myWriter.write("\n"+quejas.getNumDoc()+","+quejas.getFecha()+","+quejas.getDetalle()+","+quejas.getSolicitud()+","+quejas.getNitProveedor()+","+quejas.getNitConsumidor()+","+quejas.getNumQueja());
           
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
