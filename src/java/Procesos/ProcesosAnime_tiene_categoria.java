/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.Anime_tiene_categoria;
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
public class ProcesosAnime_tiene_categoria {
    
    Connection conn;
    
    public ProcesosAnime_tiene_categoria() {
        
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
    
    public int guardarAnime_tiene_categoria(Anime_tiene_categoria anime_tiene_categoria){
        int resultado = 0;
        try{
            Statement stmt = conn.createStatement();
            String query = "INSERT INTO anime_tiene_categoria(id_anime, id_categoria)";
                    query += "VALUES("+anime_tiene_categoria.getId_anime()+", "+anime_tiene_categoria.getId_categoria()+")";
        
            resultado = stmt.executeUpdate(query);
            return resultado;
        } catch(Exception w){
            System.out.println("Error al insertar en base de datos: " + w);
        }
        return 0;
    }
    
    public List<Anime_tiene_categoria>  consultarDatos(){
        List<Anime_tiene_categoria> animes_tienen_categorias = new ArrayList<Anime_tiene_categoria>();
        try{
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM anime_tiene_categoria";
            ResultSet resultado = stmt.executeQuery(query);
            while(resultado.next()){
                Anime_tiene_categoria anime_tiene_categoria = new Anime_tiene_categoria();
                anime_tiene_categoria.setId_anime(resultado.getInt("id_anime"));
                anime_tiene_categoria.setId_categoria(resultado.getInt("id_categoria"));
                animes_tienen_categorias.add(anime_tiene_categoria);
            }
            resultado.close();
            stmt.close();
            conn.close();
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return animes_tienen_categorias;
    }
    
}
