/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.pe.mispatitas.historial.Servlet;

import com.pe.mispatitas.historial.dao.DaoUsuario;
import com.pe.mispatitas.historial.dao.DaoVeterinario;
import com.pe.mispatitas.historial.dao.impl.DaoUsuarioImpl;
import com.pe.mispatitas.historial.dao.impl.DaoVeterinarioImpl;
import entidad.Usuario;
import entidad.Veterinario;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Luis Santos
 */
@WebServlet(name = "registrarUsuarioServlet", urlPatterns = {"/registrarUsuario"})
public class registrarUsuarioServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        DaoUsuario dao = new DaoUsuarioImpl();
        String nombreUsuario = request.getParameter("nombreUsuario");
        String telefonoUsuario = request.getParameter("telefonoUsuario");
        String correoUsuario = request.getParameter("correoUsuario");
        String contraUsuario = request.getParameter("contraUsuario");
        String mensajeAlerta;
        if ("".equals(nombreUsuario) || "".equals(telefonoUsuario) || "".equals(correoUsuario) || "".equals(contraUsuario)) {
            mensajeAlerta = "todos los campos son obligatorios";
            request.setAttribute("mensajeAlerta", mensajeAlerta);
            request.getRequestDispatcher("/registrarUsuario.jsp").forward(request, response);
            return;
        } else if (validarCorreo(correoUsuario) == false) {
            System.out.println("entro validar");
            mensajeAlerta = "no es un correo valido";
            request.setAttribute("mensajeAlerta", mensajeAlerta);
            request.getRequestDispatcher("/registrarUsuario.jsp").forward(request, response);
            return;
        }

        List<Usuario> usuarios = dao.usuarioSel();
        for (Usuario usuario : usuarios) {
            if (usuario.getCorreoUsuario().equals(correoUsuario)) {

                System.out.println("validando usuario");
                mensajeAlerta = "Correo ya existente";
                request.setAttribute("mensajeAlerta", mensajeAlerta);
                request.getRequestDispatcher("/registrarUsuario.jsp").forward(request, response);
                return;
            }
        }
        DaoVeterinario daoVeterinario = new DaoVeterinarioImpl();
        List<Veterinario> veterinarios = daoVeterinario.veterinarioSel();
        for (Veterinario veterinario : veterinarios) {
            if (veterinario.getCorreo().equals(correoUsuario)) {
                System.out.println("validando usuario");
                mensajeAlerta = "Correo ya existente";
                request.setAttribute("mensajeAlerta", mensajeAlerta);
                request.getRequestDispatcher("/registrarUsuario.jsp").forward(request, response);
                return;
            }
        }
        Usuario cat = new Usuario(null, nombreUsuario, correoUsuario, telefonoUsuario, contraUsuario);
        int idUsuario = dao.usuarioIns(cat);

        request.setAttribute("idUsuario", idUsuario);
        request.getRequestDispatcher("registrarMascota.jsp").forward(request, response);

    }

    private boolean validarCorreo(String correo) {
        // Expresión regular para validar un correo electrónico
        String regex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,6}$";

        // Compilar la expresión regular en un patrón
        Pattern pattern = Pattern.compile(regex);

        // Crear un objeto Matcher para la cadena de entrada
        Matcher matcher = pattern.matcher(correo);

        // Verificar si la cadena coincide con el patrón
        return matcher.matches();
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
