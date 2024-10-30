/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Clases.Consumidor;
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
import jakarta.servlet.http.Part;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author fboan
 */
public class svAGuardarConsumidor extends HttpServlet {

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
    
       
        
        List<Consumidor> listaConsumidor = new ArrayList<>();
        
        listaConsumidor.add(consumidor);
        
        
   
       
           ServletContext context = getServletContext();

       String rutaArchivoConsumidor = context.getRealPath("/TXT/consumidores.txt");
       Path archivoCon = Paths.get(rutaArchivoConsumidor);
       System.out.println("Ruta del archivo consumidor: " + rutaArchivoConsumidor);
            
        if (Files.notExists(archivoCon)) {
            Files.createFile(archivoCon);
        }

        String datosConsumidor = "\n"+consumidor.nacionalidad+","+consumidor.tipoConsumidor+","+consumidor.nit+","+consumidor.dpi+","
                       +consumidor.nombre1 +","+consumidor.nombre2+","+consumidor.apellido1+","+consumidor.apellido2+","+
                       consumidor.apellidoCasada+","+consumidor.direccion+","+consumidor.zona+","+consumidor.departamento+","+consumidor.municipio+","+consumidor.sedeDiaco
                       +","+consumidor.telDom+","+consumidor.tel+","+consumidor.telRef+","+consumidor.correo+","+consumidor.autorizacion+","+consumidor.sexo;    
      
       
       
            try {
          
                Files.write(archivoCon, datosConsumidor.getBytes(), StandardOpenOption.APPEND);
            }
       catch (IOException e) {
      System.out.println("An error occurred.");
      e.printStackTrace();
    }
     
     
      System.out.println("Successfully wrote to the file.");
   

        
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
        


       
       String rutaArchivoProveedores = context.getRealPath("/TXT/proveedores.txt");
        
            try (BufferedWriter writer = new BufferedWriter(new FileWriter(rutaArchivoProveedores, true))) {
                
                
               writer.write("\n"+proveedor.getNombreEmpresa()+","+proveedor.getRazonSocial()+","+proveedor.getNit()+","+proveedor.getDireccion()+","+proveedor.getZona()
+","+ proveedor.getDepartamento()+","+proveedor.getMunicipio()+","+proveedor.getTelefono()+","+proveedor.getCorreo());
            writer.close();
            
      
     
     
      System.out.println("Successfully wrote to the file.");
    } catch (IOException e) {
      System.out.println("An error occurred.");
      e.printStackTrace();
    }

int numDoc = Integer.parseInt(request.getParameter("NumDoc"));
         String fecha = request.getParameter("fecha");
         String detalle = request.getParameter("detalle");
         String solicitud = request.getParameter("solicitud");
         
         
         
         
         
         
          int ultimoNumero = 0;
        String linea;
        
        
        
        String rutaArchivoNumQuejas = context.getRealPath("/TXT/NumQuejas.txt");

        try (BufferedReader br = new BufferedReader(new FileReader(rutaArchivoNumQuejas))) {
            // Leer línea por línea hasta el final
            while ((linea = br.readLine()) != null) {
                try {
                    // Convertir la línea en un número entero
                    ultimoNumero = Integer.parseInt(linea);
                } catch (NumberFormatException e) {
                    System.out.println("Línea inválida en el archivo: " + linea);
                }
            }
        }
         
        int nuevoNumero = ultimoNumero +1;
        int numQueja = nuevoNumero;
        
        try (FileWriter fw = new FileWriter(rutaArchivoNumQuejas, false)) { // 'true' para agregar al final del archivo
            fw.write(nuevoNumero + "\n"); // Escribir el nuevo número en una nueva línea
        }
         
         Quejas quejas = new Quejas(numDoc, fecha, detalle, solicitud, proveedor.getNit(), consumidor.getNit(), numQueja);
         List<Quejas> listaQuejas = new ArrayList<>();
         listaQuejas.add(quejas);
         
         
         try {
  
           
             
             String rutaArchivoQuejas = context.getRealPath("/TXT/quejas.txt");
             
             
            try (FileWriter myWriter = new FileWriter(rutaArchivoQuejas, true)) {
                
                
               myWriter.append("\n"+quejas.getNumDoc()+","+quejas.getFecha()+","+quejas.getDetalle()+","+quejas.getSolicitud()+","+quejas.getNitProveedor()+","+quejas.getNitConsumidor()+","+quejas.getNumQueja());
            myWriter.close();
            }
      
            
            
            
            
     
     
      System.out.println("Successfully wrote to the file.");
    } catch (IOException e) {
      System.out.println("An error occurred.");
      e.printStackTrace();
    }
         
                     
            String nombreArchivo = "r" + quejas.getNumQueja() + ".txt";
            File archivoReporte = new File(nombreArchivo);
       String rutaArchivoReportes = context.getRealPath("/Reportes/"+nombreArchivo);
         
        Path archivoReportes = Paths.get(rutaArchivoReportes);
       System.out.println("Ruta del archivo consumidor: " + rutaArchivoReportes);
            
       try(BufferedWriter writer = new BufferedWriter(new FileWriter(rutaArchivoReportes))){
           writer.write("Numero de Queja: " + quejas.getNumQueja()+"\n");
           writer.write("Fecha de la queja: "+ quejas.getFecha()+"\n");
           writer.write("Nombre del Consumidor: "+ consumidor.getApellido1()+consumidor.getNombre1()+"\n");
           writer.write("Nombre de la Empresa: "+ proveedor.getNombreEmpresa()+"\n");
           writer.write("Solicitud: "+ quejas.getSolicitud()+"\n");
           writer.write("Detalle: "+ quejas.getDetalle()+"\n");
           
           
       }catch (IOException e) {
            e.printStackTrace();
            // Manejo de errores
        }
     
      System.out.println("Successfully wrote to the file.");
   

       
         
         
         
         
        //Guardar Archivos 
        
        Part filePart = request.getPart("pruebas"); // "archivo" es el nombre del input
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        
          String nuevoNombre =  "A" + quejas.getNumQueja() + fileName;
          String savePath = context.getRealPath("/ArchivosQuejas"); // Cambia la ruta según tu proyecto
        File directorio = new File(savePath);
         if (!directorio.exists()) {
            directorio.mkdirs(); // Crear directorio si no existe
        }
        // Respuesta de éxito
        
        
        
        
         filePart.write(savePath + File.separator + nuevoNombre);

        response.getWriter().println("Datos guardados correctamente. Su numero de queja es: " + quejas.getNumQueja());
        
     HttpSession misesion = request.getSession();
        misesion.setAttribute("numqueja", quejas.getNumQueja());
        
         response.sendRedirect("JSP/Admin/ANumQueja.jsp");
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
