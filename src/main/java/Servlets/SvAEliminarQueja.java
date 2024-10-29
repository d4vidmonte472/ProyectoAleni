/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Clases.Quejas;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class SvAEliminarQueja extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener el contexto del archivo y la ruta del archivo de quejas.
        ServletContext context = getServletContext();
        String rutaArchivoQuejas = context.getRealPath("/TXT/quejas.txt");
        
        // Leer todas las líneas del archivo.
        List<String> lineas = Files.readAllLines(Paths.get(rutaArchivoQuejas));
        List<Quejas> listaQuejas = new ArrayList<>();
        
        // Convertir las líneas a objetos Quejas.
        for (String linea : lineas) {
            String[] partes = linea.split(",");
            if (partes.length == 7) {
                int numDocTxt = Integer.parseInt(partes[0].trim());
                String fechaTxt = partes[1].trim();
                String detalleTxt = partes[2].trim();
                String solicitudTxt = partes[3].trim();
                int nitProveedorTxt = Integer.parseInt(partes[4].trim());
                int nitConsumidorTxt = Integer.parseInt(partes[5].trim());
                int numQuejaTxt = Integer.parseInt(partes[6].trim());

                listaQuejas.add(new Quejas(numDocTxt, fechaTxt, detalleTxt, solicitudTxt,
                        nitProveedorTxt, nitConsumidorTxt, numQuejaTxt));
            }
        }

        // Obtener el ID de la queja a eliminar.
        int idQuejaEliminar = Integer.parseInt(request.getParameter("QuejasId"));

        // Filtrar la lista para eliminar la queja con el ID proporcionado.
        listaQuejas.removeIf(q -> q.getNumQueja() == idQuejaEliminar);

        // Sobrescribir el archivo con la lista actualizada.
        try (FileWriter myWriter = new FileWriter(rutaArchivoQuejas)) {
            for (Quejas queja : listaQuejas) {
                myWriter.write(queja.getNumDoc() + "," + queja.getFecha() + "," +
                        queja.getDetalle() + "," + queja.getSolicitud() + "," +
                        queja.getNitProveedor() + "," + queja.getNitConsumidor() + "," +
                        queja.getNumQueja() + "\n");
            }
        } catch (IOException e) {
            System.out.println("Ocurrió un error al escribir en el archivo.");
            e.printStackTrace();
        }

        // Actualizar la sesión con la lista de quejas.
        HttpSession misesion = request.getSession();
        misesion.setAttribute("listaQuejas", listaQuejas);

        // Redirigir a la página de quejas.
        response.sendRedirect("JSP/Master/A.mQuejas.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); // Redirigir al método GET para manejar la lógica.
    }

    @Override
    public String getServletInfo() {
        return "Servlet para eliminar quejas y sobrescribir el archivo.";
    }
}
