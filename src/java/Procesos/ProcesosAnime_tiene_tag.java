/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.Anime_tiene_tag;
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
public class ProcesosAnime_tiene_tag {
    
    Connection conn;
    
    public ProcesosAnime_tiene_tag() {
        
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
    
    public int guardarAnime_tiene_tag(Anime_tiene_tag anime_tiene_tag){
        int resultado = 0;
        try{
            Statement stmt = conn.createStatement();
            String query = "INSERT INTO anime_tiene_tag(id_anime, id_tag)";
                    query += "VALUES("+anime_tiene_tag.getId_anime()+", "+anime_tiene_tag.getId_tag()+")";
        
            resultado = stmt.executeUpdate(query);
            return resultado;
        } catch(Exception w){
            System.out.println("Error al insertar en base de datos: " + w);
        }
        return 0;
    }
    
    public List<Anime_tiene_tag>  consultarDatos(){
        List<Anime_tiene_tag> animes_tienen_tags = new ArrayList<Anime_tiene_tag>();
        try{
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM anime_tiene_tag";
            ResultSet resultado = stmt.executeQuery(query);
            while(resultado.next()){
                Anime_tiene_tag anime_tiene_tag = new Anime_tiene_tag();
                anime_tiene_tag.setId_anime(resultado.getInt("id_anime"));
                anime_tiene_tag.setId_tag(resultado.getInt("id_tag"));
                animes_tienen_tags.add(anime_tiene_tag);
            }
            resultado.close();
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return animes_tienen_tags;
    }
    
}
