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
                animes.add(anime);
            }
            resultado.close();
            stmt.close();
            conn.close();
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return animes;
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
    
}
