/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.Video;
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
public class ProcesosVideo {
    
    Connection conn;
    
    public ProcesosVideo() {
        
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
    
    public int guardarVideo(Video video){
        int resultado = 0;
        try{
            Statement stmt = conn.createStatement();
            String query = "INSERT INTO video(id_anime, nombre, descripcion, url_video, episodio)";
                    query += "VALUES("+video.getId_anime()+",'"+video.getNombre()+"', '"+video.getDescripcion()+"', '"+video.getUrl_video()+"', "+video.getEpisodio()+")";
        
            resultado = stmt.executeUpdate(query);
            return resultado;
        } catch(Exception w){
            System.out.println("Error al insertar en base de datos: " + w);
        }
        return 0;
    }
    
    public List<Video>  consultarDatos(){
        List<Video> videos = new ArrayList<Video>();
        try{
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM video";
            ResultSet resultado = stmt.executeQuery(query);
            while(resultado.next()){
                Video video = new Video();
                video.setId_video(resultado.getInt("id_video"));
                video.setId_anime(resultado.getInt("id_anime"));
                video.setNombre(resultado.getString("nombre"));
                video.setDescripcion(resultado.getString("descripcion"));
                video.setUrl_video(resultado.getString("url_video"));
                video.setEpisodio(resultado.getInt("episodio"));
                video.setVista(resultado.getInt("vista"));
                video.setCreated_at(resultado.getTimestamp("created_at"));
                video.setUpdated_at(resultado.getTimestamp("updated_at"));
                videos.add(video);
            }
            resultado.close();
            stmt.close();
            conn.close();
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return videos;
    }
    
    public List<Video> consultarDatosPorID(String id_anime){
        List<Video> videos = new ArrayList<Video>();
        try{
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM video WHERE id_anime="+id_anime;
            ResultSet resultado = stmt.executeQuery(query);
            while(resultado.next()){
                Video video = new Video();
                video.setId_video(resultado.getInt("id_video"));
                video.setId_anime(resultado.getInt("id_anime"));
                video.setNombre(resultado.getString("nombre"));
                video.setDescripcion(resultado.getString("descripcion"));
                video.setUrl_video(resultado.getString("url_video"));
                video.setEpisodio(resultado.getInt("episodio"));
                video.setVista(resultado.getInt("vista"));
                video.setCreated_at(resultado.getTimestamp("created_at"));
                video.setUpdated_at(resultado.getTimestamp("updated_at"));
                videos.add(video);
            }
            resultado.close();
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return videos;
    }
    
    public int consultarVistasPorAnime(int id_anime){
        int cantidad = 0;
        try{
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM video WHERE id_anime="+id_anime;
            ResultSet resultado = stmt.executeQuery(query);
            while(resultado.next()){
                cantidad += resultado.getInt("vista");
            }
            resultado.close();
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return cantidad;
    }
    
}
