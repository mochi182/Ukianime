/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.Usuario_agrega_anime;
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
public class ProcesosUsuario_agrega_anime {
    
    Connection conn;
    
    public ProcesosUsuario_agrega_anime() {
        
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
    
    public int guardarUsuario_agrega_anime(Usuario_agrega_anime usuario_agrega_anime){
        int resultado = 0;
        try{
            Statement stmt = conn.createStatement();
            String query = "INSERT INTO usuario_agrega_anime(id_usuario, id_anime)";
                    query += "VALUES("+usuario_agrega_anime.getId_usuario()+", "+usuario_agrega_anime.getId_anime()+")";
        
            resultado = stmt.executeUpdate(query);
            return resultado;
        } catch(Exception w){
            System.out.println("Error al insertar en base de datos: " + w);
        }
        return 0;
    }
    
    public int eliminarUsuario_agrega_anime(int id_anime, int id_usuario){
        int resultado = 0;
        try{
            Statement stmt = conn.createStatement();
            String query = "DELETE FROM usuario_agrega_anime WHERE id_anime="+id_anime+" AND id_usuario="+id_usuario;
            resultado = stmt.executeUpdate(query);
            return resultado;
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return 0;
    }
    
    public List<Usuario_agrega_anime>  consultarDatos(){
        List<Usuario_agrega_anime> usuarios_agregan_animes = new ArrayList<Usuario_agrega_anime>();
        try{
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM usuario_agrega_anime";
            ResultSet resultado = stmt.executeQuery(query);
            while(resultado.next()){
                Usuario_agrega_anime usuario_agrega_anime = new Usuario_agrega_anime();
                usuario_agrega_anime.setId_usuario(resultado.getInt("id_usuario"));
                usuario_agrega_anime.setId_anime(resultado.getInt("id_anime"));
                usuarios_agregan_animes.add(usuario_agrega_anime);
            }
            resultado.close();
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return usuarios_agregan_animes;
    }
    
    public Usuario_agrega_anime consultarDatoPorIDs(int p_id_anime, int p_id_usuario){
        Usuario_agrega_anime usuario_agrega_anime = new Usuario_agrega_anime();
        try{
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM usuario_agrega_anime WHERE id_anime="+p_id_anime+" AND id_usuario="+p_id_usuario;
            ResultSet resultado = stmt.executeQuery(query);
            while(resultado.next()){
                usuario_agrega_anime.setId_usuario(resultado.getInt("id_usuario"));
                usuario_agrega_anime.setId_anime(resultado.getInt("id_anime"));
            }
            resultado.close();
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return usuario_agrega_anime;
    }
    
}
