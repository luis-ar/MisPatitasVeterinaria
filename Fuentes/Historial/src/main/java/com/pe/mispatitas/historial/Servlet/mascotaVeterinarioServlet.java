/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.pe.mispatitas.historial.Servlet;

import com.pe.mispatitas.historial.dao.DaoHistorialClinico;
import com.pe.mispatitas.historial.dao.DaoMascota;
import com.pe.mispatitas.historial.dao.DaoUsuario;
import com.pe.mispatitas.historial.dao.impl.DaoHistorialClinicoImpl;
import com.pe.mispatitas.historial.dao.impl.DaoMascotaImpl;
import com.pe.mispatitas.historial.dao.impl.DaoUsuarioImpl;
import entidad.HistorialClinico;
import entidad.Mascota;
import entidad.Usuario;
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
@WebServlet(name = "mascotaVeterinarioServlet", urlPatterns = {"/mascotaVeterinario"})
public class mascotaVeterinarioServlet extends HttpServlet {

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
        DaoUsuario daoUsuario = new DaoUsuarioImpl();
        List<Mascota> listaMascotaVeterinario = dao.mascotaSel();

        for (Mascota mascota : listaMascotaVeterinario) {
            Usuario cat = daoUsuario.usuarioGet(mascota.getIdUsuario());
            HistorialClinico histo=daoHistorial.historialMascotaGet(mascota.getIdMascota());
            mascota.setNombreUsuario(cat.getNombreUsuario());
            mascota.setTratamiento(histo.getTratamiento());
        }
        
        request.setAttribute("listaMascotaVeterinario", listaMascotaVeterinario);
        request.getRequestDispatcher("mascotasVeterinario.jsp").forward(request, response);

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
