/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.pe.mispatitas.historial.Servlet;

import com.pe.mispatitas.historial.dao.DaoHistorialClinico;
import com.pe.mispatitas.historial.dao.impl.DaoHistorialClinicoImpl;
import entidad.HistorialClinico;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Luis Santos
 */
@WebServlet(name = "registroHistorialServlet", urlPatterns = {"/registroHistorial"})
public class registroHistorialServlet extends HttpServlet {

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
        DaoHistorialClinico dao = new DaoHistorialClinicoImpl();

        Integer codigoVeterinario = Integer.valueOf(request.getParameter("codigoVeterinario"));
        Integer codigoMascota = Integer.valueOf(request.getParameter("codigoMascota"));
        String descripcionSintomas = request.getParameter("descripcionSintomas");
        String tratamiento = request.getParameter("tratamiento");
        String fecha = request.getParameter("fecha");
        String mensajeAlerta;
        if ("".equals(request.getParameter("codigoVeterinario")) || "".equals(request.getParameter("codigoMascota")) || "".equals(descripcionSintomas) || "".equals(tratamiento) || "".equals(fecha)) {
            mensajeAlerta = "todos los campos son obligatorios";
            System.out.println("entro a verificar el historial");
            request.setAttribute("mensajeAlerta", mensajeAlerta);
            request.getRequestDispatcher("/registrarHistorialVeterinario.jsp").forward(request, response);
            System.out.println("entro a verificar el historial 22");
            return;

        }

        HistorialClinico cat = new HistorialClinico(null, codigoVeterinario, codigoMascota, fecha, descripcionSintomas, tratamiento);
        dao.historialIns(cat);

        response.sendRedirect(request.getContextPath() + "/ReporteHistorial");

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
