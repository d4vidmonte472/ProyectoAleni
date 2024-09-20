package com.aleni.mavenproject1.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.FileWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

    
@WebServlet(name = "svGuardarConsumidor", urlPatterns = {"/svGuardarConsumidor"})
public class svGuardarConsumidor extends HttpServlet {

        private static final String CSV_FILE_PATH = "C://Users/fboan/OneDrive/Documentos/NetBeansProjects/mavenproject1/src/main//webapp/";  // Cambia la ruta donde guardarás el CSV

   
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
response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Obtener los datos del formulario
        String nacionalidad = request.getParameter("nacionalidad");
        String contribuyente = request.getParameter("contribuyente");
        String nit = request.getParameter("NIT");
        String dpi = request.getParameter("DPI");
        String primerNombre = request.getParameter("PrimerNombre");
        String segundoNombre = request.getParameter("SegundoNombre");
        String primerApellido = request.getParameter("PrimerApellido");
        String segundoApellido = request.getParameter("SegundoApellido");
        String apellidoCasada = request.getParameter("ApellidoCasada");
        String sexo = request.getParameter("sexo");
        String direccion = request.getParameter("direccion");
        String zona = request.getParameter("zona");
        String departamento = request.getParameter("departamento");
        String municipio = request.getParameter("municipio");
        String telefonoD = request.getParameter("TelefonoD");
        String celular = request.getParameter("Celular");
        String telReferencia = request.getParameter("Telr");
        String email = request.getParameter("email");
        String sedeDIACO = request.getParameter("SedeD");
        String numDoc = request.getParameter("NumDoc");
        String fecha = request.getParameter("fecha");
        String detalleQueja = request.getParameter("detalle");
        String solicitud = request.getParameter("solicitud");

        // Crear un archivo CSV y escribir los datos
        try (FileWriter csvWriter = new FileWriter(CSV_FILE_PATH, true)) {
            csvWriter.append(nacionalidad)
                    .append(',')
                    .append(contribuyente)
                    .append(',')
                    .append(nit)
                    .append(',')
                    .append(dpi)
                    .append(',')
                    .append(primerNombre)
                    .append(',')
                    .append(segundoNombre)
                    .append(',')
                    .append(primerApellido)
                    .append(',')
                    .append(segundoApellido)
                    .append(',')
                    .append(apellidoCasada)
                    .append(',')
                    .append(sexo)
                    .append(',')
                    .append(direccion)
                    .append(',')
                    .append(zona)
                    .append(',')
                    .append(departamento)
                    .append(',')
                    .append(municipio)
                    .append(',')
                    .append(telefonoD)
                    .append(',')
                    .append(celular)
                    .append(',')
                    .append(telReferencia)
                    .append(',')
                    .append(email)
                    .append(',')
                    .append(sedeDIACO)
                    .append(',')
                    .append(numDoc)
                    .append(',')
                    .append(fecha)
                    .append(',')
                    .append(detalleQueja)
                    .append(',')
                    .append(solicitud)
                    .append('\n');
            csvWriter.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }

        // Mostrar mensaje de éxito
        out.println("<html><body>");
        out.println("<h1>Los datos se guardaron exitosamente en el archivo CSV.</h1>");
        out.println("<a href=\"index.jsp\">Volver al formulario</a>");
        out.println("</body></html>");

        processRequest(request, response);
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
