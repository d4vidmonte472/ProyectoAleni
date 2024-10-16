/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.cardionica.servlets;

import com.cardionica.util.PDFUtil;
import com.cardionica.util.EmailUtil;
import java.io.IOException;
import java.io.OutputStream;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.itextpdf.text.DocumentException;
import jakarta.mail.MessagingException;
/**
 *
 * @author esteb
 */
@WebServlet("/CardionicaServlet")
public class CardionicaServlet extends HttpServlet {

     @Override
     protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
         if (action == null) {
            request.getRequestDispatcher("menu.jsp").forward(request, response);
        } else if (action.equals("compra")) {
            request.getRequestDispatcher("compra.jsp").forward(request, response);
        } else if (action.equals("alquiler")) {
            request.getRequestDispatcher("alquiler.jsp").forward(request, response);
        } else if (action.equals("finalizarCompra")) {
            procesarCompra(request, response);
        } else if (action.equals("finalizarAlquiler")) {
            procesarAlquiler(request, response);
        } else if (action.equals("descargarCompra")) {
            descargarPDF(request, response, true);
        } else if (action.equals("descargarAlquiler")) {
            descargarPDF(request, response, false);
        } else {
            response.sendRedirect(request.getContextPath() + "/CardionicaServlet");
        }
    }     
    
    @Override    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
 private void procesarCompra(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String nit = request.getParameter("nit");
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        double total = cantidad * 1500;
        
        request.setAttribute("total", total);
        request.setAttribute("nombre", nombre);
        request.setAttribute("nit", nit);
        request.setAttribute("cantidad", cantidad);
        request.getRequestDispatcher("facturaCompra.jsp").forward(request, response);
    }
private void procesarAlquiler(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String nit = request.getParameter("nit");
        int dias = Integer.parseInt(request.getParameter("dias"));
        double total = dias * 200;
        
        request.setAttribute("total", total);
        request.setAttribute("nombre", nombre);
        request.setAttribute("nit", nit);
        request.setAttribute("dias", dias);
        request.getRequestDispatcher("facturaAlquiler.jsp").forward(request, response);
    }
private void descargarPDF(HttpServletRequest request, HttpServletResponse response, boolean esCompra) 
            throws ServletException, IOException {
         try {
            String nombre = request.getParameter("nombre");
            String nit = request.getParameter("nit");
            String cantidad = esCompra ? request.getParameter("cantidad") : request.getParameter("dias");
            String precioTotal = String.format("%.2f", (Double) request.getAttribute("total"));
            String email = request.getParameter("email"); // Asegúrate de agregar este campo en tus formularios

            byte[] pdfBytes = PDFUtil.generarFacturaPDF(nombre, nit, cantidad, precioTotal, esCompra);

            // Enviar correo electrónico
            String asunto = "Su factura de Cardionica";
            String cuerpo = "Buenas tardes " + nombre + ", espero que se encuentre bien.\n\n" +
                            "Aquí le adjuntamos su factura.\n\n" +
                            "Gracias.\n" +
                            "Atte. Cardionica";
            String nombreArchivo = esCompra ? "factura_compra.pdf" : "factura_alquiler.pdf";
            
            try {
                EmailUtil.enviarCorreoConPDF(email, asunto, cuerpo, pdfBytes, nombreArchivo);
            } catch (MessagingException e) {
                throw new ServletException("Error al enviar el correo electrónico", e);
            }

            // Configurar la respuesta para descargar el PDF
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + nombreArchivo + "\"");
            response.setContentLength(pdfBytes.length);

            try (OutputStream os = response.getOutputStream()) {
                os.write(pdfBytes);
            }
        } catch (DocumentException e) {
            throw new ServletException("Error al generar el PDF", e);
        }
    }
}
