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
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import Clases.*;
import jakarta.servlet.http.HttpSession;
import java.io.FileWriter;
import java.nio.file.Path;

/**
 *
 * @author David
 */
public class svEditarConsumidores extends HttpServlet {

  
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
             
             
                 listaConsumidores.get(consumidorId).setNacionalidad(request.getParameter("nacionalidad"));
                 listaConsumidores.get(consumidorId).setTipoConsumidor(request.getParameter("tipoConsumidor"));
                 listaConsumidores.get(consumidorId).setNit(Integer.parseInt(request.getParameter("nit")));
                 listaConsumidores.get(consumidorId).setNombre1(request.getParameter("nombre1"));
                 listaConsumidores.get(consumidorId).setNombre2(request.getParameter("nombre2"));
                 listaConsumidores.get(consumidorId).setApellido1(request.getParameter("apellido1"));
                 listaConsumidores.get(consumidorId).setApellido2(request.getParameter("apellido2"));
                 listaConsumidores.get(consumidorId).setApellidoCasada(request.getParameter("apellidoCasada"));
                 listaConsumidores.get(consumidorId).setDireccion(request.getParameter("direccion"));
                 listaConsumidores.get(consumidorId).setZona(request.getParameter("zona"));
                 listaConsumidores.get(consumidorId).setDepartamento(request.getParameter("departamento"));
                 listaConsumidores.get(consumidorId).setMunicipio(request.getParameter("municipio"));
                 listaConsumidores.get(consumidorId).setSedeDiaco(request.getParameter("SedeD"));
                 listaConsumidores.get(consumidorId).setTelDom(Integer.parseInt(request.getParameter("telDom")));
                 listaConsumidores.get(consumidorId).setTel(Integer.parseInt(request.getParameter("tel")));
                 listaConsumidores.get(consumidorId).setTelRef(Integer.parseInt(request.getParameter("telRef")));
                 listaConsumidores.get(consumidorId).setCorreo(request.getParameter("correo"));
                 listaConsumidores.get(consumidorId).setAutorizacion(request.getParameter("autorizacion")!= null);
                 listaConsumidores.get(consumidorId).setSexo(request.getParameter("sexo"));
                 
                
                     
            try (FileWriter myWriter = new FileWriter(rutaArchivoConsumidores, false)) {
                for(Consumidor consumidor : listaConsumidores){
                    
               myWriter.write("\n" +consumidor.nacionalidad+","+consumidor.tipoConsumidor+","+consumidor.nit+","+consumidor.dpi+","
                       +consumidor.nombre1 +","+consumidor.nombre2+","+consumidor.apellido1+","+consumidor.apellido2+","+
                       consumidor.apellidoCasada+","+consumidor.direccion+","+consumidor.zona+","+consumidor.departamento+","+consumidor.municipio+","+consumidor.sedeDiaco
                       +","+consumidor.telDom+","+consumidor.tel+","+consumidor.telRef+","+consumidor.correo+","+consumidor.autorizacion+","+consumidor.sexo);
           
                }
                 myWriter.close();
           
      
     
     
      System.out.println("Successfully wrote to the file.");
    } catch (IOException e) {
      System.out.println("An error occurred.");
      e.printStackTrace();
    }
              
            
        HttpSession misesion = request.getSession();
        
        misesion.setAttribute("listaConsumidores", listaConsumidores);
        response.sendRedirect("JSP/Master/M.mConsumidores.jsp");
    
                 
             
         
}

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
