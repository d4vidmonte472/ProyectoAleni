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
                String sexoTxt = partes[9].trim();
                String direccionTxt = partes[10].trim();
                String zonaTxt = partes[11].trim();
                String departamentoTxt = partes[12].trim();
                String municipioTxt = partes[13].trim();
                String sedeTxt = partes[14].trim();
                int telDomTxt = Integer.parseInt(partes[15].trim());
                int telTxt = Integer.parseInt(partes[16].trim());
                int telRefTxt = Integer.parseInt(partes[17].trim());
                String correoTxt = partes[18].trim();
                Boolean autorizacionTxt = Boolean.parseBoolean(partes[19].trim());
                
                listaConsumidores.add(new Consumidor(nacionalidadTxt,tipoConsumidorTxt,nitTxt,dpiTxt,nombre1Txt,nombre2Txt,apellido1Txt,apellido2Txt,
                apellidoCasadaTxt,direccionTxt,zonaTxt,departamentoTxt,municipioTxt,sedeTxt,telDomTxt,telTxt,telRefTxt,
                correoTxt,autorizacionTxt,sexoTxt));
    }
         }
         for(Consumidor con : listaConsumidores){
             
             
             if(con.getDpi()==Integer.parseInt(request.getParameter("consumidorDpi"))){
                 con.setNacionalidad(request.getParameter("nacionalidad"));
                 con.setTipoConsumidor(request.getParameter("tipoConsumidor"));
                 con.setNit(Integer.parseInt(request.getParameter("nit")));

                 con.setNombre1(request.getParameter("nombre1"));
                 con.setNombre2(request.getParameter("nombre2"));
                 con.setApellido1(request.getParameter("apellido1"));
                 con.setApellido2(request.getParameter("apellido2"));
                 con.setApellidoCasada(request.getParameter("apellidoCasada"));
                 con.setDireccion(request.getParameter("direccion"));
                 con.setZona(request.getParameter("zona"));
                 con.setDepartamento(request.getParameter("deparetamento"));
                 con.setMunicipio(request.getParameter("municipio"));
                 con.setSedeDiaco(request.getParameter("sede"));
                 con.setTelDom(Integer.parseInt(request.getParameter("telDom")));
                 con.setTel(Integer.parseInt(request.getParameter("tel")));
                 con.setTelRef(Integer.parseInt(request.getParameter("telRef")));
                 con.setSexo(request.getParameter("sexo"));
                 
                  try{
                     
            try (FileWriter myWriter = new FileWriter(rutaArchivoConsumidores, false)) {
                for(Consumidor consumidor : listaConsumidores){
                    
               myWriter.write("\n" +consumidor.nacionalidad+","+consumidor.tipoConsumidor+","+consumidor.nit+","+consumidor.dpi+","
                       +consumidor.nombre1 +","+consumidor.nombre2+","+consumidor.apellido1+","+consumidor.apellido2+","+
                       consumidor.apellidoCasada+","+consumidor.direccion+","+consumidor.zona+","+consumidor.departamento+","+consumidor.municipio+","+consumidor.sedeDiaco
                       +","+consumidor.telDom+","+consumidor.tel+","+consumidor.telRef+","+consumidor.correo+","+consumidor.autorizacion+","+consumidor.sexo);
           
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