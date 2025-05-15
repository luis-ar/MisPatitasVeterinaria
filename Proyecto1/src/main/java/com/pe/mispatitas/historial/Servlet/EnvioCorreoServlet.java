/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.pe.mispatitas.historial.Servlet;

import com.pe.mispatitas.historial.UtilCorreo;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.util.Properties;

/**
 *
 * @author Luis Santos
 */
@WebServlet(name = "EnvioCorreoServlet", urlPatterns = {"/EnvioCorreo"})
public class EnvioCorreoServlet extends HttpServlet {

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

        String correoRemitente = request.getParameter("email");

        String mensaje = request.getParameter("mensaje");
                String mensajeAlerta;

        if ("".equals(mensaje)) {
            mensajeAlerta = "todos los campos son obligatorios";
            request.setAttribute("mensajeAlerta", mensajeAlerta);
            request.getRequestDispatcher("contacto.jsp").forward(request, response);
        
        }
      
        Properties proo = new Properties();
        try (InputStream input = UtilCorreo.class.getClassLoader().getResourceAsStream("config.properties")) {

            if (input == null) {
                System.err.println("Sorry, error config.properties");
                return;
            }
            proo.load(input);

        } catch (Exception e) {
            e.printStackTrace();
        }

        final String username = proo.getProperty("email");
        final String password = proo.getProperty("password");

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Authenticator authenticator = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        };

// Configura la autenticación en tu sesión de JavaMail
        Session session = Session.getInstance(props, authenticator);
        try {
            response.sendRedirect(request.getContextPath() + "/indexUsuario.jsp");
            Message message = new MimeMessage(session);
            // Establecer la dirección de correo electrónico del remitente
            message.setFrom(new InternetAddress(correoRemitente));
            message.setRecipient(Message.RecipientType.CC, new InternetAddress(correoRemitente));

// Establecer la dirección de correo electrónico del destinatario
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(username));
            message.setSubject("Test");
            message.setText(mensaje);
            Transport.send(message);

            System.err.println("Done");

        } catch (Exception e) {
            e.printStackTrace();
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