/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.Anime;
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
public class ProcesosAnime {
    
    Connection conn;
    
    public ProcesosAnime() {
        
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
    
    public int guardarAnime(Anime anime){
        int resultado = 0;
        try{
            Statement stmt = conn.createStatement();
            String query = "INSERT INTO anime(nombre, descripcion, url_imagen, id_categoria)";
                    query += "VALUES('"+anime.getNombre()+"', '"+anime.getDescripcion()+"', '"+anime.getUrl_imagen()+"', "+anime.getId_categoria()+")";
        
            resultado = stmt.executeUpdate(query);
            return resultado;
        } catch(Exception w){
            System.out.println("Error al insertar en base de datos: " + w);
        }
        return 0;
    }
    
    public int actualizarAnime(Anime anime, int id_anime){
        int resultado = 0;
        try{
            Statement stmt2 = conn.createStatement();
            String query = "UPDATE anime SET ";
                    query += "nombre='"+anime.getNombre()+"', descripcion='"+anime.getDescripcion()+"', url_imagen='"+anime.getUrl_imagen()+"', id_categoria="+anime.getId_categoria();
                    query += " WHERE id_anime="+id_anime;
            resultado = stmt2.executeUpdate(query);
            return resultado;
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return 0;
    }
  
    public int eliminarAnime(String id_anime){
        int resultado = 0;
        try{
            Statement stmt = conn.createStatement();
            String query = "DELETE FROM anime WHERE id_anime="+id_anime;
            resultado = stmt.executeUpdate(query);
            return resultado;
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return 0;
    }
    
    public List<Anime>  consultarDatos(){
        List<Anime> animes = new ArrayList<Anime>();
        try{
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM anime";
            ResultSet resultado = stmt.executeQuery(query);
            while(resultado.next()){
                Anime anime = new Anime();
                anime.setId_anime(resultado.getInt("id_anime"));
                anime.setId_categoria(resultado.getInt("id_categoria"));
                anime.setNombre(resultado.getString("nombre"));
                anime.setDescripcion(resultado.getString("descripcion"));
                anime.setUrl_imagen(resultado.getString("url_imagen"));
                anime.setCreated_at(resultado.getTimestamp("created_at"));
                anime.setUpdated_at(resultado.getTimestamp("updated_at"));
                animes.add(anime);
            }
            resultado.close();
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return animes;
    }
    
    public Anime  consultarDatosPorID(String id_anime){
        Anime anime = new Anime();
        try{
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM anime WHERE id_anime="+id_anime;
            ResultSet resultado = stmt.executeQuery(query);
            while(resultado.next()){
                anime.setId_anime(resultado.getInt("id_anime"));
                anime.setId_categoria(resultado.getInt("id_categoria"));
                anime.setNombre(resultado.getString("nombre"));
                anime.setDescripcion(resultado.getString("descripcion"));
                anime.setUrl_imagen(resultado.getString("url_imagen"));
                anime.setCreated_at(resultado.getTimestamp("created_at"));
                anime.setUpdated_at(resultado.getTimestamp("updated_at"));
            }
            resultado.close();
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return anime;
    }
    
    
    // Consultar animes por palabra.
        public List<Anime> consultarDatosPorPalabra(String palabra){
            List<Anime> animes = new ArrayList<Anime>();
            try{
                Statement stmt = conn.createStatement();
                String query = "SELECT * FROM anime WHERE nombre='"+palabra+"' OR id_categoria=";
                        query += "(SELECT id_categoria FROM categoria WHERE nombre='"+palabra+"')";
                ResultSet resultado = stmt.executeQuery(query);
                while(resultado.next()){
                    Anime anime = new Anime();
                    anime.setId_anime(resultado.getInt("id_anime"));
                    anime.setId_categoria(resultado.getInt("id_categoria"));
                    anime.setNombre(resultado.getString("nombre"));
                    anime.setDescripcion(resultado.getString("descripcion"));
                    anime.setUrl_imagen(resultado.getString("url_imagen"));
                    anime.setCreated_at(resultado.getTimestamp("created_at"));
                    anime.setUpdated_at(resultado.getTimestamp("updated_at"));
                    animes.add(anime);
                }
                resultado.close();
            } catch(Exception e){
                System.out.println("Error: " + e);
            }
            return animes;
        }
       
    // Consultar animes por id de categoria.
        public List<Anime> consultarDatosPorCategoria(int id_categoria){
            List<Anime> animes = new ArrayList<Anime>();
            try{
                Statement stmt = conn.createStatement();
                String query = "SELECT * FROM anime WHERE id_categoria="+id_categoria;
                ResultSet resultado = stmt.executeQuery(query);
                while(resultado.next()){
                    Anime anime = new Anime();
                    anime.setId_anime(resultado.getInt("id_anime"));
                    anime.setId_categoria(resultado.getInt("id_categoria"));
                    anime.setNombre(resultado.getString("nombre"));
                    anime.setDescripcion(resultado.getString("descripcion"));
                    anime.setUrl_imagen(resultado.getString("url_imagen"));
                    anime.setCreated_at(resultado.getTimestamp("created_at"));
                    anime.setUpdated_at(resultado.getTimestamp("updated_at"));
                    animes.add(anime);
                }
                resultado.close();
            } catch(Exception e){
                System.out.println("Error: " + e);
            }
            return animes;
        }
       
   
}
