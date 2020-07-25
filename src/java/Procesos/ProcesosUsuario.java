/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.Usuario;
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
public class ProcesosUsuario {
    
    Connection conn;
    
    public ProcesosUsuario() {
        
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
    
    public int guardarUsuario(Usuario usuario){
        int resultado = 0;
        try{
            Statement stmt = conn.createStatement();
            String query = "INSERT INTO usuario(nombre, contrasena, id_rol, usuario, apellido, correo, idioma, fecha_nacimiento, telefono, pais)";
                    query += "VALUES('"+usuario.getNombre()+"', '"+usuario.getContrasena()+"', "+usuario.getId_rol()+",'"+usuario.getUsuario()+"','"+usuario.getApellido()+"','"+usuario.getCorreo()+"','"+usuario.getIdioma()+"',"+usuario.getFecha_nacimiento()+", "+usuario.getTelefono()+",'"+usuario.getPais()+"')";
        
            resultado = stmt.executeUpdate(query);
            return resultado;
        } catch(Exception w){
            System.out.println("Error al insertar en base de datos: " + w);
        }
        return 0;
    }
    
    public List<Usuario>  consultarDatos(){
        List<Usuario> usuarios = new ArrayList<Usuario>();
        try{
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM usuario";
            ResultSet resultado = stmt.executeQuery(query);
            while(resultado.next()){
                Usuario usuario = new Usuario();
                usuario.setId_usuario(resultado.getInt("id_anime"));
                usuario.setId_rol(resultado.getInt("id_anime"));
                usuario.setNombre(resultado.getString("nombre"));
                usuario.setContrasena(resultado.getString("contrasena"));
                usuario.setUsuario(resultado.getString("usuario"));
                usuario.setApellido(resultado.getString("apellido"));
                usuario.setCorreo(resultado.getString("correo"));
                usuario.setIdioma(resultado.getString("idioma"));
                usuario.setPais(resultado.getString("pais"));
                usuario.setTelefono(resultado.getInt("telefono"));
                usuario.setFecha_nacimiento(resultado.getDate("fecha_nacimiento"));
                usuarios.add(usuario);
            }
            resultado.close();
            stmt.close();
            conn.close();
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return usuarios;
    }
    
}
