/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import Clases.Usuario;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author David
 */
public class svEditarUsuarios extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession misesion = request.getSession();
        // Obtiene la ruta del archivo de usuarios
        ServletContext context = getServletContext();
        String rutaArchivoUsuarios = context.getRealPath("/TXT/Usuarios.txt");
        
        // Lee las líneas del archivo y convierte a lista de objetos Usuario
        List<String> lineas = Files.readAllLines(Paths.get(rutaArchivoUsuarios));
        List<Usuario> listaUsuarios = new ArrayList<>();
        
        for (String linea : lineas) {
            String[] partes = linea.split(",");
            if (partes.length == 3) {
                listaUsuarios.add(new Usuario(partes[0].trim(), partes[1].trim(), partes[2].trim()));
            }
        }

         // Obtiene las contraseñas del formulario
        String nuevaContrasena = request.getParameter("password");
        String confirmarContrasena = request.getParameter("Cpassword");
        
        // Verifica si las contraseñas coinciden
        if (!nuevaContrasena.equals(confirmarContrasena)) {
            // Si no coinciden, establece un mensaje de error y redirige al JSP
            String mensajeErr = "Las contraseñas no coinciden.";
            misesion.setAttribute("mensajeError",mensajeErr );
            response.sendRedirect("JSP/Master/M.EditarUsuario.jsp");
            return; // Sale del método si las contraseñas no coinciden
        }

        // Busca al usuario que coincida con el parámetro usuarioId
        for (Usuario us : listaUsuarios) {
            if (us.getMaster() != null && us.getMaster().equals(request.getParameter("usuarioId"))) {
                us.setUsuario(request.getParameter("usuario"));
                us.setPassword(nuevaContrasena); // Guarda la nueva contraseña
                break;
            }
        }

        // Escribe los cambios en el archivo de usuarios
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(rutaArchivoUsuarios))) {
            for (Usuario usuario : listaUsuarios) {
                writer.write(usuario.getUsuario() + "," +
                             usuario.getPassword() + "," +
                             usuario.getMaster() + "\n");
            }
            System.out.println("Archivo actualizado correctamente.");
        } catch (IOException e) {
            System.out.println("Ocurrió un error al escribir en el archivo.");
            e.printStackTrace();
        }

        // Redirecciona al menú o a otra página según el resultado
        

                  
        misesion.setAttribute("listaUsuarios", listaUsuarios);
        
         response.sendRedirect("JSP/Master/M.mUsuarios.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Servlet para editar usuarios.";
    }
}
