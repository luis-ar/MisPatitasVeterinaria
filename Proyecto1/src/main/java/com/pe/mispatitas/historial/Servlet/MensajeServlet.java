/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.pe.mispatitas.historial.Servlet;

import com.pe.mispatitas.historial.dao.DaoContacto;
import com.pe.mispatitas.historial.dao.DaoUsuario;
import com.pe.mispatitas.historial.dao.impl.DaoContactoImpl;
import com.pe.mispatitas.historial.dao.impl.DaoUsuarioImpl;

import entidad.Contacto;
import entidad.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Objects;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Luis Santos
 */
@WebServlet(name = "MensajeServlet", urlPatterns = {"/MensajeServlet"})
public class MensajeServlet extends HttpServlet {

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
        
        DaoUsuario daoUsuario = new DaoUsuarioImpl();
        DaoContacto dao = new DaoContactoImpl();
        String mail = request.getParameter("email");
        String nom = request.getParameter("nombre");
        String mensajeContacto = request.getParameter("mensaje");
        Integer idUsuario = Integer.valueOf(request.getParameter("id"));
        System.out.println("prueba " + mensajeContacto);
        System.out.println("prueba " + idUsuario);

        List<Usuario> usuarios = daoUsuario.usuarioSel();
        for (Usuario usuario : usuarios) {
            if (Objects.equals(usuario.getIdUsuario(), idUsuario)) {
                request.setAttribute("usuario", usuario);
            }
        }

        if (mensajeContacto != null) {
            Contacto cat = new Contacto(null, idUsuario, mensajeContacto);
            dao.contactoIns(cat);
            response.sendRedirect(request.getContextPath() + "/indexUsuario.jsp");
        }else{
            System.err.println(mensajeContacto +"MAL");
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
