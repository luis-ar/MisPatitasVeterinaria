/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.pe.mispatitas.historial.Servlet;

import com.pe.mispatitas.historial.dao.DaoServicio;
import com.pe.mispatitas.historial.dao.impl.DaoServicioImpl;
import entidad.Servicio;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Luis Santos
 */
@WebServlet(name = "RegistroServicioServlet", urlPatterns = {"/RegistroServicio"})
@MultipartConfig
public class RegistroServicioServlet extends HttpServlet {

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
        DaoServicio dao = new DaoServicioImpl();
        String nombreServicio = request.getParameter("nombreServicio");
        String descripcionServicio = request.getParameter("descripcionServicio");

//        String imagenPrede = request.getParameter("imagenBase");
//        byte[] bytes = imagenPrede.getBytes();
//        InputStream inputStreamPredeterminado = new ByteArrayInputStream(bytes);
        String mensajeAlerta;
        Part part = request.getPart("imagenServicio");
        InputStream inputStream = part.getInputStream();
        if ("".equals(nombreServicio) || "".equals(descripcionServicio)) {
            mensajeAlerta = "todos los campos son obligatorios";
            request.setAttribute("mensajeAlerta", mensajeAlerta);
            request.getRequestDispatcher("agregarServicio.jsp").forward(request, response);
            return;
        } else if (!esAlfanumerico(nombreServicio)) {
            System.out.println("La cadena no es alfanumérica.");

            mensajeAlerta = "Nombre del servicio invalido";
            request.setAttribute("mensajeAlerta", mensajeAlerta);
            request.getRequestDispatcher("agregarServicio.jsp").forward(request, response);
            return;

        } else {
            if (part.getSize() == 0) {
////                 System.out.println("prueba"+inputStream);
////                System.out.println("prueba111"+inputStreamPredeterminado);
////                 Servicio cat = new Servicio(null, nombreServicio, descripcionServicio,inputStreamPredeterminado);
//            dao.servicioIns(cat);
                response.sendRedirect(request.getContextPath() + "/MostrarServicio");
            } else {
                Servicio cat = new Servicio(null, nombreServicio, descripcionServicio, inputStream);
                dao.servicioIns(cat);
                response.sendRedirect(request.getContextPath() + "/MostrarServicio");
            }

        }
    }

    public static boolean esAlfanumerico(String cadena) {
        // Define la expresión regular para caracteres alfanuméricos
        String patron = "^[a-zA-Z0-9]+$";

        // Compila la expresión regular en un patrón
        Pattern pattern = Pattern.compile(patron);

        // Crea un objeto Matcher para la cadena dada
        Matcher matcher = pattern.matcher(cadena);

        // Realiza la validación y devuelve el resultado
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
