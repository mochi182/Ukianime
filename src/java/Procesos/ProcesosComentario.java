/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.Comentario;
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
public class ProcesosComentario {
    
    Connection conn;
    
    public ProcesosComentario() {
        
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
    
    public int guardarComentario(Comentario comentario){
        int resultado = 0;
        try{
            Statement stmt = conn.createStatement();
            String query = "INSERT INTO comentario(id_usuario, id_video,texto)";
                    query += "VALUES("+comentario.getId_usuario()+", "+comentario.getId_video()+", '"+comentario.getTexto()+"')";
        
            resultado = stmt.executeUpdate(query);
            return resultado;
        } catch(Exception w){
            System.out.println("Error al insertar en base de datos: " + w);
        }
        return 0;
    }
    
    public List<Comentario>  consultarDatos(){
        List<Comentario> comentarios = new ArrayList<Comentario>();
        try{
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM comentario";
            ResultSet resultado = stmt.executeQuery(query);
            while(resultado.next()){
                Comentario comentario = new Comentario();
                comentario.setId_comentario(resultado.getInt("id_comentario"));
                comentario.setId_usuario(resultado.getInt("id_usuario"));
                comentario.setId_video(resultado.getInt("id_video"));
                comentario.setTexto(resultado.getString("texto"));
                comentario.setCreated_at(resultado.getTimestamp("created_at"));
                comentario.setUpdated_at(resultado.getTimestamp("updated_at"));
                comentarios.add(comentario);
            }
            resultado.close();
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return comentarios;
    }
    
    public int consultarComentariosPorAnime(int id_anime){
        int cantidad = 0;
        try{
            Statement stmt = conn.createStatement();
            String query = "SELECT c.id_comentario FROM comentario AS c ";
            query += "INNER JOIN video AS v ON c.id_video = v.id_video ";
            query += "WHERE v.id_anime="+id_anime;
            ResultSet resultado = stmt.executeQuery(query);
            while(resultado.next()){
                cantidad += 1;
            }
            resultado.close();
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return cantidad;
    }
    
    public int consultarComentariosPorVideo(int id_video){
        int cantidad = 0;
        try{
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM comentario WHERE id_video="+id_video;
            ResultSet resultado = stmt.executeQuery(query);
            while(resultado.next()){
                cantidad += 1;
            }
            resultado.close();
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return cantidad;
    }
    
    public Comentario  consultarDatoPorID(int id_usuario){
        Comentario comentario = new Comentario();
        try{
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM comentario WHERE id_usuario="+id_usuario;
            ResultSet resultado = stmt.executeQuery(query);
            while(resultado.next()){
                comentario.setId_comentario(resultado.getInt("id_comentario"));
                comentario.setId_usuario(resultado.getInt("id_usuario"));
                comentario.setId_video(resultado.getInt("id_video"));
                comentario.setTexto(resultado.getString("texto"));
                comentario.setCreated_at(resultado.getTimestamp("created_at"));
                comentario.setUpdated_at(resultado.getTimestamp("updated_at"));
            }
            resultado.close();
            stmt.close();
            conn.close();
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return comentario;
    }
    
    public List<Comentario> consultarComentarioPorIDVideo(int id_video){
        List<Comentario> comentarios = new ArrayList<Comentario>();
        try{
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM comentario WHERE id_video="+id_video;
            ResultSet resultado = stmt.executeQuery(query);
            while(resultado.next()){
                Comentario comentario = new Comentario();
                comentario.setId_comentario(resultado.getInt("id_comentario"));
                comentario.setId_usuario(resultado.getInt("id_usuario"));
                comentario.setId_video(resultado.getInt("id_video"));
                comentario.setTexto(resultado.getString("texto"));
                comentario.setCreated_at(resultado.getTimestamp("created_at"));
                comentario.setUpdated_at(resultado.getTimestamp("updated_at"));
                comentarios.add(comentario);
            }
            resultado.close();
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return comentarios;
    }
    
}
