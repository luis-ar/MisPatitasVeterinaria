package com.pe.mispatitas.historial.test;

import java.sql.Connection;
import util.Conexion;

public class Test {

    public static void main(String[] args) {
        Conexion conexion = new Conexion();
        try (Connection cn = conexion.getConexion()){
            System.out.println("Conexion exitosa");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
    
}
