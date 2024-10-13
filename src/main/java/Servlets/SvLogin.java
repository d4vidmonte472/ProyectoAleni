/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import java.io.*;
import java.nio.file.*;
import java.util.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.*;

import Clases.Usuario;

/**
 *
 * @author fboan
 */
public class SvLogin extends HttpServlet {

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
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String usernameIngresado = request.getParameter("username");
        String passwordIngresado = request.getParameter("password");

        // Obtener el ServletContext
        ServletContext contexto = getServletContext();

        // Obtener la ruta real del archivo usuarios.txt
        String rutaArchivo = contexto.getRealPath("/TXT/Usuarios.txt");

        // Leer las líneas del archivo
        List<String> lineas = Files.readAllLines(Paths.get(rutaArchivo));
        System.out.println("Ruta del archivo: " + rutaArchivo);

        // Lista para almacenar los usuarios
        List<Usuario> usuarios = new ArrayList<>();

        // Crear objetos Usuario a partir de cada línea del archivo
        for (String linea : lineas) {
            String[] partes = linea.split(",");
            if (partes.length == 3) {
                String usuarioTxt = partes[0].trim();
                String passwordTxt = partes[1].trim();
                boolean esMaster = Boolean.parseBoolean(partes[2].trim());

                usuarios.add(new Usuario(usuarioTxt, passwordTxt, esMaster));
            }
        }

        // Verificar las credenciales del usuario ingresado
        boolean loginExitoso = usuarios.stream()
                .anyMatch(u -> u.Login(usernameIngresado, passwordIngresado));

        if (loginExitoso) {
            // Redirigir a una página JSP si el login es exitoso
            RequestDispatcher dispatcher = request.getRequestDispatcher("/JSP/Menu_master.jsp");
            dispatcher.forward(request, response);
        } else {
            // Mostrar un mensaje de error en la misma página
            request.setAttribute("loginError", "Usuario o contraseña incorrectos");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);
        }
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
