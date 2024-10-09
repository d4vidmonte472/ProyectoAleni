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
/**
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
        String autorizacion = request.getParameter("comI");
        
        
        Consumidor consumidor = new Consumidor(nacionalidad, tipoConsumidor, nit, dpi, nombre1, nombre2, apellido1, apellido2, apellidoCasada, direccion, zona, departamento, municipio, sede, telDom, tel, telRef, correo, autorizacion, sexo);
    
        System.out.println(consumidor.apellido1 + consumidor.apellido2 + consumidor.correo);
        
        List<Consumidor> listaConsumidor = new ArrayList<>();
        
        listaConsumidor.add(consumidor);
        
        
        try {
            File myObj = new File("C:\\Users\\fboan\\OneDrive\\Documentos\\NetBeansProjects\\ProyectoAleni\\src\\main\\webapp\\CSV\\consumidor.csv");
      if (myObj.createNewFile()) {
        System.out.println("File created: " + myObj.getName());
        FileWriter myWriter = new FileWriter("C:\\Users\\fboan\\OneDrive\\Documentos\\NetBeansProjects\\ProyectoAleni\\src\\main\\webapp\\CSV\\consumidor.csv");
      myWriter.write("nacionalidad,tipoConsumidor,nit,dpi,nombre1,nombre2,apellido1,apellido2,apellidoCasada,direccion,zona,departamento,municipio,sede,telDom,tel,telRef,correo,autorizacion,sexo");
      } else {
        System.out.println("File already exists.");
      }
            try (FileWriter myWriter = new FileWriter("C:\\Users\\fboan\\OneDrive\\Documentos\\NetBeansProjects\\ProyectoAleni\\src\\main\\webapp\\CSV\\consumidor.csv", true)) {
                
                
                myWriter.append(consumidor.nombre1 +","+consumidor.nombre2+","+consumidor.apellido1+","+consumidor.apellido2);
            }
      
     
     
      System.out.println("Successfully wrote to the file.");
    } catch (IOException e) {
      System.out.println("An error occurred.");
      e.printStackTrace();
    }

        // Respuesta de éxito
        response.getWriter().println("Datos guardados correctamente.");
    
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}