/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.Video_tiene_tag;
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
public class ProcesosVideo_tiene_tag {
    
    Connection conn;
    
    public ProcesosVideo_tiene_tag() {
        
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
    
    public int guardarVideo_tiene_tag(Video_tiene_tag video_tiene_tag){
        int resultado = 0;
        try{
            Statement stmt = conn.createStatement();
            String query = "INSERT INTO video_tiene_tag(id_video, id_tag)";
                    query += "VALUES("+video_tiene_tag.getId_video()+", "+video_tiene_tag.getId_tag()+")";
        
            resultado = stmt.executeUpdate(query);
            return resultado;
        } catch(Exception w){
            System.out.println("Error al insertar en base de datos: " + w);
        }
        return 0;
    }
    
    public List<Video_tiene_tag>  consultarDatos(){
        List<Video_tiene_tag> videos_tienen_tags = new ArrayList<Video_tiene_tag>();
        try{
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM video_tiene_tag";
            ResultSet resultado = stmt.executeQuery(query);
            while(resultado.next()){
                Video_tiene_tag video_tiene_tag = new Video_tiene_tag();
                video_tiene_tag.setId_video(resultado.getInt("id_video"));
                video_tiene_tag.setId_tag(resultado.getInt("id_tag"));
                videos_tienen_tags.add(video_tiene_tag);
            }
            resultado.close();
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return videos_tienen_tags;
    }
    
}
