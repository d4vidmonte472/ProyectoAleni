/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.cardionica.util;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;
import java.io.*;

/**
 *
 * @author esteb
 */
public class PDFUtil {
    public static byte[] generarFacturaPDF(String nombre, String nit, String cantidad, String precioTotal, boolean esCompra) throws DocumentException {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        Document document = new Document();
        PdfWriter.getInstance(document, baos);
        document.open();
        
        document.add(new Paragraph("Factura de " + (esCompra ? "Compra" : "Alquiler")));
        document.add(new Paragraph("Nombre: " + nombre));
        document.add(new Paragraph("NIT: " + nit));
        
        if (esCompra) {
            document.add(new Paragraph("Cantidad: " + cantidad));
        } else {
            document.add(new Paragraph("Días de alquiler: " + cantidad));
        }
        
        document.add(new Paragraph("Precio Total: " + precioTotal));

        document.close();
        return baos.toByteArray();
    }
        
}
