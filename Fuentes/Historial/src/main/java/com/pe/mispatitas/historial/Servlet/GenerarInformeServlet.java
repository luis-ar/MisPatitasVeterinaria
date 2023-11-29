/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.pe.mispatitas.historial.Servlet;

import entidad.HistorialClinico;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRField;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import util.Conexion;

/**
 *
 * @author Luis Santos
 */
@WebServlet(name = "GenerarInformeServlet", urlPatterns = {"/GenerarInforme"})
public class GenerarInformeServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        try {
//            // Lógica para generar el informe PDF
////            String reportPath = getServletContext().getRealPath("/WEB-INF/classes/com/pe/mispatitas/historial/historial.jasper");
//            String reportPath = "/src/main/java/com/pe/mispatitas/historial/historial.jasper" ;
//            JasperReport jasperReport = JasperCompileManager.compileReport(reportPath);
//
//            // Configurar los parámetros del informe (si los hay)
//            Map<String, Object> parameters = new HashMap<>();
//
//            // Compilar y llenar el informe
//            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, new JREmptyDataSource());
//
//            // Exportar el informe a PDF y enviar como respuesta al navegador
//            response.setContentType("application/pdf");
//            JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
//        } catch (JRException e) {
//            e.printStackTrace();
//            response.getWriter().println("Error al generar el informe PDF: " + e.getMessage());
//        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String fechaInicio = request.getParameter("fechaInicio");
            String fechaFin = request.getParameter("fechaFin");

            Conexion conexion = new Conexion();

            List<HistorialClinico> datosFiltrados = filtrarPorFechas(fechaInicio, fechaFin, conexion);

            Map<String, Object> parametros = new HashMap<>();
            parametros.put("fechaInicio", fechaInicio);
            parametros.put("fechaFin", fechaFin);
String rutaInforme="src\\main\\resources\\jasperreports\\nuevoInforme.jasper";
//            String rutaInforme = getServletContext().getRealPath("/jasperreports/nuevoInforme.jasper");
            System.out.println("Ruta del informe: " + rutaInforme);
            try {
                JasperPrint jasperPrint = JasperFillManager.fillReport(rutaInforme, parametros,
                        new JRBeanCollectionDataSource(datosFiltrados));

                byte[] informeBytes = JasperExportManager.exportReportToPdf(jasperPrint);

                response.setContentType("application/pdf");
                response.setHeader("Content-Disposition", "attachment; filename=informe.pdf");

                try (OutputStream out = response.getOutputStream()) {
                    out.write(informeBytes);
                }
            } catch (JRException e) {
                e.printStackTrace(); // Imprime la traza en la consola del servidor
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                        "Error al generar el informe PDF: " + e.getMessage());
            }
        } catch (IOException e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "Error al procesar la solicitud: " + e.getMessage());
        }

    }

    private List<HistorialClinico> filtrarPorFechas(String fechaInicio, String fechaFin, Conexion conexion) {
        List<HistorialClinico> datosFiltrados = new ArrayList<>();

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // Obtener la conexión desde la clase de conexión
            connection = conexion.getConexion();
            String consulta = "SELECT v.nombreVeterinario, m.nombreMascota, h.fechaHistorial, h.descripcion, h.tratamiento "
                    + "FROM historial h "
                    + "JOIN mascota m ON h.idMascota = m.idMascota "
                    + "JOIN veterinario v ON h.idVeterinario = v.idVeterinario "
                    + "WHERE h.fechaHistorial BETWEEN ? AND ?";
            preparedStatement = connection.prepareStatement(consulta);
            preparedStatement.setString(1, fechaInicio);
            preparedStatement.setString(2, fechaFin);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                HistorialClinico historial = new HistorialClinico();
                historial.setNombreVeterinario(resultSet.getString("nombreVeterinario"));
                historial.setNombreMascota(resultSet.getString("nombreMascota"));
                historial.setFechaHistorial(resultSet.getString("fechaHistorial"));
                historial.setDescripcion(resultSet.getString("descripcion"));
                historial.setTratamiento(resultSet.getString("tratamiento"));

                datosFiltrados.add(historial);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return datosFiltrados;
    }

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
