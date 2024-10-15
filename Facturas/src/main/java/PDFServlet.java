/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;


/**
 *
 * @author esteb
 */
public class PDFServlet extends HttpServlet {

     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Establecemos el tipo de respuesta como PDF
        response.setContentType("application/pdf");

        // Configuramos la respuesta para descarga
        response.setHeader("Content-Disposition", "attachment; filename=factura.pdf");

        // Obtener los datos del formulario (nombre, NIT, etc.)
        String nombre = request.getParameter("nombre");
        String nit = request.getParameter("nit");
        String tipoFactura = request.getParameter("tipoFactura"); // Compra o Alquiler
        double total = Double.parseDouble(request.getParameter("total"));

        try {
            // Creamos el documento PDF
            Document document = new Document() {};
            // Inicializamos el PdfWriter para escribir en la respuesta de salida
            OutputStream out = response.getOutputStream();
            PdfWriter.getInstance(document, out);

            // Abrimos el documento para agregar contenido
            document.open();

            // Agregamos el contenido al PDF
            document.add(new Paragraph("Factura de " + tipoFactura));
            document.add(new Paragraph("Nombre del cliente: " + nombre));
            document.add(new Paragraph("NIT o C/F: " + nit));
            document.add(new Paragraph("Precio Total: Q" + total));

            // Cerramos el documento
            document.close();
        } catch (DocumentException e) {
            throw new IOException(e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);  // Utilizamos doGet para manejar tanto GET como POST
    }
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
