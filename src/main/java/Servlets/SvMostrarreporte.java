/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Clases.Reportes;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.FileReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author David
 */
public class SvMostrarreporte extends HttpServlet {

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

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         ServletContext context = getServletContext();
    String nombreArchivo = "r" + request.getParameter("numQueja") + ".txt";
       String rutaArchivoReportes = context.getRealPath("/Reportes/"+nombreArchivo);
    List<String> lineas = Files.readAllLines(Paths.get(rutaArchivoReportes));
    List<Reportes> listaReportes = new ArrayList<>();

    // Cargar las quejas desde el archivo.
         
         int numeroQueja = 0;
         String nombreConsumidor = "";
         String nombreEmpresa = "";
         String fechaQueja = "";
         String solicitud = "";
         String detalle = "";
         
         
         try (BufferedReader br = new BufferedReader(new FileReader(rutaArchivoReportes))) {
    String linea;
    while ((linea = br.readLine()) != null) {
        // Buscamos las líneas que contienen la información del consumidor y del proveedor
        if (linea.startsWith("Nombre del Consumidor: ")) {
            nombreConsumidor = linea.replace("Nombre del Consumidor: ", "").trim();
        } else if (linea.startsWith("Nombre de la Empresa: ")) {
            nombreEmpresa = linea.replace("Nombre de la Empresa: ", "").trim();
        }
        else if(linea.startsWith("Fecha de la queja: ")){
            fechaQueja = linea.replace("Fecha de la queja: ", "").trim();
        }
        else if(linea.startsWith("Solicitud: ")){
            solicitud = linea.replace("Solicitud: ", "").trim();
        }
        else if(linea.startsWith("Detalle: ")){
            detalle = linea.replace("Detalle: ", "").trim();
        }
        else if(linea.startsWith("Numero de Queja: ")){
            numeroQueja = Integer.parseInt(linea.replace("Numero de Queja: ", "").trim());
        }
        
        listaReportes.add(new Reportes(numeroQueja, fechaQueja, nombreConsumidor, nombreEmpresa, solicitud, detalle));

    }
         }
        HttpSession misesion = request.getSession();
         misesion.setAttribute("listaReportes", listaReportes);
        response.sendRedirect("JSP/Master/M.mReportes.jsp");
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
