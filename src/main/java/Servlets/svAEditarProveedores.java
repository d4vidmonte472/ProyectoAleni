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
import jakarta.servlet.http.HttpSession;
import java.io.FileWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author David
 */
public class svAEditarProveedores extends HttpServlet {

  
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
         int proveedorId = Integer.parseInt(request.getParameter("proveedorId"));
         
                 listaProveedores.get(proveedorId).setNombreEmpresa(request.getParameter("nombreEmpresa"));
                 listaProveedores.get(proveedorId).setRazonSocial(request.getParameter("razonSocial"));
                 listaProveedores.get(proveedorId).setNit(Integer.parseInt(request.getParameter("nit")));
                 listaProveedores.get(proveedorId).setDireccion(request.getParameter("direccion"));
                 listaProveedores.get(proveedorId).setZona(request.getParameter("zona"));
                 listaProveedores.get(proveedorId).setDepartamento(request.getParameter("departamento"));
                 listaProveedores.get(proveedorId).setMunicipio(request.getParameter("municipio"));
                 listaProveedores.get(proveedorId).setTelefono(Integer.parseInt(request.getParameter("telefono")));
                 listaProveedores.get(proveedorId).setCorreo(request.getParameter("correo"));

                  try {
  
            try (FileWriter myWriter = new FileWriter(rutaArchivoProveedores, false)) {
                for(Proveedor proveedor : listaProveedores){
                    
               myWriter.write("\n" + "\n"+proveedor.getNombreEmpresa()+","+proveedor.getRazonSocial()+","+proveedor.getNit()+","+proveedor.getDireccion()+","+proveedor.getZona()
               +","+ proveedor.getDepartamento()+","+proveedor.getMunicipio()+","+proveedor.getTelefono()+","+proveedor.getCorreo());
           
                }
                 myWriter.close();
            }
      
     
     
      System.out.println("Successfully wrote to the file.");
    } catch (IOException e) {
      System.out.println("An error occurred.");
      e.printStackTrace();
        }
        HttpSession misesion = request.getSession();
        misesion.setAttribute("listaProveedores", listaProveedores);
        
         response.sendRedirect("JSP/Master/M.mProveedores.jsp");
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
