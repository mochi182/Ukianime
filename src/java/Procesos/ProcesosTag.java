/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.Tag;
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
public class ProcesosTag {
    
    Connection conn;
    
    public ProcesosTag() {
        
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
    
    public int guardarTag(Tag tag){
        int resultado = 0;
        try{
            Statement stmt = conn.createStatement();
            String query = "INSERT INTO tag(nombre, tipo)";
                    query += "VALUES('"+tag.getNombre()+"', '"+tag.getTipo()+"')";
        
            resultado = stmt.executeUpdate(query);
            return resultado;
        } catch(Exception w){
            System.out.println("Error al insertar en base de datos: " + w);
        }
        return 0;
    }
    
    public List<Tag>  consultarDatos(){
        List<Tag> tags = new ArrayList<Tag>();
        try{
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM tag";
            ResultSet resultado = stmt.executeQuery(query);
            while(resultado.next()){
                Tag tag = new Tag();
                tag.setId_tag(resultado.getInt("id_tag"));
                tag.setNombre(resultado.getString("nombre"));
                tag.setTipo(resultado.getString("tipo"));
                tags.add(tag);
            }
            resultado.close();
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return tags;
    }
    
}
