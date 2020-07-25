/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.Usuario_agrega_video;
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
public class ProcesosUsuario_agrega_video {
    
    Connection conn;
    
    public ProcesosUsuario_agrega_video() {
        
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
    
    public int guardarUsuario_agrega_video(Usuario_agrega_video usuario_agrega_video){
        int resultado = 0;
        try{
            Statement stmt = conn.createStatement();
            String query = "INSERT INTO usuario_agrega_video(id_usuario, id_video)";
                    query += "VALUES("+usuario_agrega_video.getId_usuario()+", "+usuario_agrega_video.getId_video()+")";
        
            resultado = stmt.executeUpdate(query);
            return resultado;
        } catch(Exception w){
            System.out.println("Error al insertar en base de datos: " + w);
        }
        return 0;
    }
    
    public List<Usuario_agrega_video>  consultarDatos(){
        List<Usuario_agrega_video> usuarios_agregan_videos = new ArrayList<Usuario_agrega_video>();
        try{
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM usuario_agrega_video";
            ResultSet resultado = stmt.executeQuery(query);
            while(resultado.next()){
                Usuario_agrega_video usuario_agrega_video = new Usuario_agrega_video();
                usuario_agrega_video.setId_usuario(resultado.getInt("id_usuario"));
                usuario_agrega_video.setId_video(resultado.getInt("id_video"));
                usuarios_agregan_videos.add(usuario_agrega_video);
            }
            resultado.close();
            stmt.close();
            conn.close();
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return usuarios_agregan_videos;
    }
    
}
