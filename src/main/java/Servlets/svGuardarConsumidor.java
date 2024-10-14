/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;


import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.List;
import Clases.Consumidor;
import java.io.File;
import jakarta.servlet.AsyncContext;
import java.nio.file.Path;
import Clases.Proveedor;
import Clases.Quejas;




/*
 *
 * @author david
 */
public class svGuardarConsumidor extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        
    }

 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
              throws ServletException, IOException {
        String nacionalidad = request.getParameter("nacionalidad");
        String tipoConsumidor = request.getParameter("contribuyente");
        int nit = Integer.parseInt(request.getParameter("NIT"));
        int dpi = Integer.parseInt(request.getParameter("DPI"));
        String nombre1 = request.getParameter("PrimerNombre");
        String nombre2 = request.getParameter("SegundoNombre");
        String apellido1 = request.getParameter("PrimerApellido");
        String apellido2 = request.getParameter("SegundoApellido");
        String apellidoCasada = request.getParameter("ApellidoCasada");
        String sexo = request.getParameter("sexo");
        String direccion = request.getParameter("direccion");
        String zona = request.getParameter("zona");
        String departamento = request.getParameter("departamento");
        String municipio = request.getParameter("municipio");
        String sede = request.getParameter("SedeD");
        int telDom = Integer.parseInt(request.getParameter("TelefonoD"));
        int tel = Integer.parseInt(request.getParameter("Celular"));
        int telRef = Integer.parseInt(request.getParameter("Telr"));
        String correo = request.getParameter("email");
        Boolean autorizacion = Boolean.valueOf(request.getParameter("check"));
        
        
        Consumidor consumidor = new Consumidor(nacionalidad, tipoConsumidor, nit, dpi, nombre1, nombre2, apellido1, apellido2, apellidoCasada, direccion, zona, departamento, municipio, sede, telDom, tel, telRef, correo, autorizacion, sexo);
    
        System.out.println(consumidor.apellido1 + consumidor.apellido2 + consumidor.correo);
        
        List<Consumidor> listaConsumidor = new ArrayList<>();
        
        listaConsumidor.add(consumidor);
        
        
        
        try {
            
            
            File myObj = new File("C:\\Users\\david\\OneDrive\\Desktop\\consumidores.csv");
         
      if (myObj.exists()==false) {
        
                try (FileWriter myWriter = new FileWriter("C:\\Users\\david\\OneDrive\\Desktop\\consumidores.txt")) {
                    myWriter.append("nacionalidad,tipoConsumidor,nit,dpi,nombre1,nombre2,apellido1,apellido2,apellidoCasada,direccion,zona,departamento,municipio,sede,telDom,tel,telRef,correo,autorizacion,sexo");
                }
      } else {  
        System.out.println("File already exists.");
      }
            try (FileWriter myWriter = new FileWriter("C:\\Users\\david\\OneDrive\\Desktop\\consumidores.txt", true)) {
                
                
               myWriter.append("\n"+consumidor.nacionalidad+","+consumidor.tipoConsumidor+","+consumidor.nit+","+consumidor.dpi+","
                       +consumidor.nombre1 +","+consumidor.nombre2+","+consumidor.apellido1+","+consumidor.apellido2+","+
                       consumidor.apellidoCasada+","+consumidor.direccion+","+consumidor.zona+","+consumidor.departamento+","+consumidor.municipio+","+consumidor.sedeDiaco
                       +","+consumidor.telDom+","+consumidor.tel+","+consumidor.telRef+","+consumidor.correo+","+consumidor.autorizacion+","+consumidor.sexo);
            myWriter.close();
            }
      
     
     
      System.out.println("Successfully wrote to the file.");
    } catch (IOException e) {
      System.out.println("An error occurred.");
      e.printStackTrace();
    }

        
         String nombreEmpresa = request.getParameter("empresa");
        String razonSocial = request.getParameter("razon-social");
        int nitP = Integer.parseInt(request.getParameter("NITP"));
        String direccionP = request.getParameter("direccionP");
        String zonaP = request.getParameter("zonaP");
        String departamentoP = request.getParameter("departamentoP");
        String municipioP = request.getParameter("municipioP");
        int telefono = Integer.parseInt(request.getParameter("telefono"));
        String email = request.getParameter("email");
     
        
        
        Proveedor proveedor = new Proveedor(nombreEmpresa, razonSocial, nitP,direccionP,zonaP,departamentoP,municipioP,telefono,email);
        List<Proveedor> listaProveedor = new ArrayList<>();
        
        listaProveedor.add(proveedor);
        

try {
           File myObj = new File("C:\\Users\\david\\OneDrive\\Desktop\\proveedores.csv");
         
      if (myObj.exists()==false) {
        
                try (FileWriter myWriter = new FileWriter("C:\\Users\\david\\OneDrive\\Desktop\\proveedores.txt")) {
                    myWriter.append("empresa,razon-social,NITP,direccionP,zonaP,departamentoP,municipioP,telefono,email");
                }
      } else {  
        System.out.println("File already exists.");
      }
            try (FileWriter myWriter = new FileWriter("C:\\Users\\david\\OneDrive\\Desktop\\proveedores.txt", true)) {
                
                
               myWriter.append("\n"+proveedor.getNombreEmpresa()+","+proveedor.getRazonSocial()+","+proveedor.getNit()+","+proveedor.getDireccion()+","+proveedor.getZona()
+","+ proveedor.getDepartamento()+","+proveedor.getMunicipio()+","+proveedor.getTelefono()+","+proveedor.getCorreo());
            myWriter.close();
            }
      
     
     
      System.out.println("Successfully wrote to the file.");
    } catch (IOException e) {
      System.out.println("An error occurred.");
      e.printStackTrace();
    }

int numDoc = Integer.parseInt(request.getParameter("NumDoc"));
         String fecha = request.getParameter("fecha");
         String detalle = request.getParameter("detalle");
         String solicitud = request.getParameter("solicitud");
         File pruebas = new File(request.getParameter("pruebas"));
         
         Quejas quejas = new Quejas(numDoc, fecha, detalle, solicitud, proveedor, consumidor);
         List<Quejas> listaQuejas = new ArrayList<>();
         listaQuejas.add(quejas);
         
         
         try {
           File myObj = new File("C:\\Users\\david\\OneDrive\\Desktop\\quejas.csv");
         
      if (myObj.exists()==false) {
        
                try (FileWriter myWriter = new FileWriter("C:\\Users\\david\\OneDrive\\Desktop\\quejas.txt")) {
                    myWriter.append("NumDoc,fecha,detalle,solicitud");
                }
      } else {  
        System.out.println("File already exists.");
      }
            try (FileWriter myWriter = new FileWriter("C:\\Users\\david\\OneDrive\\Desktop\\quejas.txt", true)) {
                
                
               myWriter.append("\n"+quejas.getNumDoc()+","+quejas.getFecha()+","+quejas.getDetalle()+","+quejas.getSolicitud()+","+quejas.getProveedor()+","+quejas.getConsumidor());
            myWriter.close();
            }
      
     
     
      System.out.println("Successfully wrote to the file.");
    } catch (IOException e) {
      System.out.println("An error occurred.");
      e.printStackTrace();
    }
        // Respuesta de éxito
        response.getWriter().println("Datos guardados correctamente. Su numero de queja es: ");
        
    
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}