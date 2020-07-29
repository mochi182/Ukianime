/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.Rol;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author galop
 */
public class ProcesosRol {
    
    Connection conn;
    
    public ProcesosRol() {
        
        try{
            Class.forName("org.mariadb.jdbc.Driver");
            this.conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/ukianime", "root", "12345");
        }catch(SQLException e){
            System.out.println("Error al conectar: " + e);
        }
        catch(ClassNotFoundException ex){
            System.out.println("Error al registrar el driver de MySQL: " + ex);
        }
    }
    
    public int guardarRol(Rol rol){
        int resultado = 0;
        try{
            Statement stmt = conn.createStatement();
            String query = "INSERT INTO rol(nombre)";
                    query += "VALUES('"+rol.getNombre()+"')";
        
            resultado = stmt.executeUpdate(query);
            return resultado;
        } catch(Exception w){
            System.out.println("Error al insertar en base de datos: " + w);
        }
        return 0;
    }
    
    public List<Rol>  consultarDatos(){
        List<Rol> rols = new ArrayList<Rol>();
        try{
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM rol";
            ResultSet resultado = stmt.executeQuery(query);
            while(resultado.next()){
                Rol rol = new Rol();
                rol.setId_rol(resultado.getInt("id_rol"));
                rol.setNombre(resultado.getString("nombre"));
                rols.add(rol);
            }
            resultado.close();
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return rols;
    }
    
}
