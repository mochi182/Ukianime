/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.Anime;
import Entidades.Categoria;
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
public class ProcesosCategoria {
    
    Connection conn;
    
    public ProcesosCategoria() {
        
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
    
    public int guardarCategoria(Categoria categoria){
        int resultado = 0;
        try{
            Statement stmt = conn.createStatement();
            String query = "INSERT INTO categoria(nombre)";
                    query += "VALUES('"+categoria.getNombre()+"')";
        
            resultado = stmt.executeUpdate(query);
            return resultado;
        } catch(Exception w){
            System.out.println("Error al insertar en base de datos: " + w);
        }
        return 0;
    }
    
    public List<Categoria>  consultarDatos(){
        List<Categoria> categorias = new ArrayList<Categoria>();
        try{
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM categoria";
            ResultSet resultado = stmt.executeQuery(query);
            while(resultado.next()){
                Categoria categoria = new Categoria();
                categoria.setId_categoria(resultado.getInt("id_categoria"));
                categoria.setNombre(resultado.getString("nombre"));
                categorias.add(categoria);
            }
            resultado.close();
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return categorias;
    }
    
    public List<Categoria>  obtenerCategoriasDeAnimes(List<Anime> animes){
        List<Categoria> categorias = new ArrayList<Categoria>();
        try{
            Statement stmt = conn.createStatement();
            for(Anime anime_get: animes){
                String query = "SELECT * FROM categoria WHERE id_categoria="+anime_get.getId_categoria();
                ResultSet resultado = stmt.executeQuery(query);
                while(resultado.next()){
                    Categoria categoria = new Categoria();
                    categoria.setId_categoria(resultado.getInt("id_categoria"));
                    categoria.setNombre(resultado.getString("nombre"));
                    categorias.add(categoria);
                }
                resultado.close();
            }
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return categorias;
    }
    
   public  Categoria  consultarDatosPorAnime1(String id_categoria){
        Categoria categorias  = new Categoria();
        try{
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM categoria WHERE id_categoria="+id_categoria;
            ResultSet resultado = stmt.executeQuery(query);
            while(resultado.next()){
                categorias.setId_categoria(resultado.getInt("id_categoria"));
                categorias.setNombre(resultado.getString("nombre"));
            }
            resultado.close();
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return categorias;
    } 
}
