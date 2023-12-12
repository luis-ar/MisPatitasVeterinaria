/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.pe.mispatitas.historial.Servlet;

import com.pe.mispatitas.historial.dao.DaoHistorialClinico;
import com.pe.mispatitas.historial.dao.DaoMascota;
import com.pe.mispatitas.historial.dao.impl.DaoHistorialClinicoImpl;
import com.pe.mispatitas.historial.dao.impl.DaoMascotaImpl;
import entidad.HistorialClinico;
import entidad.Mascota;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Luis Santos
 */
@WebServlet(name = "listarHistorialUsuarioServlet", urlPatterns = {"/listarHistorialUsuario"})
public class listarHistorialUsuarioServlet extends HttpServlet {

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

        DaoMascota dao = new DaoMascotaImpl();
                DaoHistorialClinico daoHistorial = new DaoHistorialClinicoImpl();

        List<Mascota> listaMascota = dao.mascotaSel();
        Integer idUsuario = Integer.valueOf(request.getParameter("idUsuario"));
        
        for (Mascota mascota : listaMascota) {
            HistorialClinico histo=daoHistorial.historialMascotaGet(mascota.getIdMascota());
            mascota.setFechaHistorial(histo.getFechaHistorial());
            mascota.setTratamiento(histo.getTratamiento());
        }
        
        request.setAttribute("idUsuario", idUsuario);
        request.setAttribute("listaMascota", listaMascota);
        request.getRequestDispatcher("historialClinicoUsuario.jsp").forward(request, response);

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
