/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.Grupo;
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
public class ProcesosGrupo {
    
    Connection conn;
    
    public ProcesosGrupo() {
        
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
    
    public int guardarGrupo(Grupo grupo){
        int resultado = 0;
        try{
            Statement stmt = conn.createStatement();
            String query = "INSERT INTO grupo(nombre, id_usuario_1, id_usuario_2, id_usuario_3)";
                    query += "VALUES('"+grupo.getNombre()+"', '"+grupo.getId_usuario_1()+"', '"+grupo.getId_usuario_2()+"', '"+grupo.getId_usuario_3()+"')";
        
            resultado = stmt.executeUpdate(query);
            return resultado;
        } catch(Exception w){
            System.out.println("Error al insertar en base de datos: " + w);
        }
        return 0;
    }
    
    public List<Grupo>  consultarDatos(){
        List<Grupo> grupos = new ArrayList<Grupo>();
        try{
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM grupo";
            ResultSet resultado = stmt.executeQuery(query);
            while(resultado.next()){
                Grupo grupo = new Grupo();
                grupo.setId_grupo(resultado.getInt("id_anime"));
                grupo.setNombre(resultado.getString("nombre"));
                grupo.setId_usuario_1(resultado.getInt("id_usuario_1"));
                grupo.setId_usuario_2(resultado.getInt("id_usuario_2"));
                grupo.setId_usuario_3(resultado.getInt("id_usuario_3"));
                grupos.add(grupo);
            }
            resultado.close();
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return grupos;
    }
    
}
