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
            String query = "INSERT INTO usuario(nombre, contrasena, id_rol, usuario, apellido, email, fecha_nacimiento, telefono, region)";
                    query += "VALUES('"+usuario.getNombre()+"', '"+usuario.getContrasena()+"', "+2+",'"+usuario.getUsuario()+"','"+usuario.getApellido()+"','"+usuario.getEmail()+"','"+usuario.getFecha_nacimiento()+"', "+usuario.getTelefono()+",'"+usuario.getRegion()+"')";
        
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
                usuario.setId_usuario(resultado.getInt("id_usuario"));
                usuario.setId_rol(resultado.getInt("id_rol"));
                usuario.setNombre(resultado.getString("nombre"));
                usuario.setContrasena(resultado.getString("contrasena"));
                usuario.setUsuario(resultado.getString("usuario"));
                usuario.setApellido(resultado.getString("apellido"));
                usuario.setEmail(resultado.getString("email"));
                usuario.setRegion(resultado.getString("region"));
                usuario.setTelefono(resultado.getString("telefono"));
                usuario.setFecha_nacimiento(resultado.getString("fecha_nacimiento"));
                usuarios.add(usuario);
            }
            resultado.close();
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return usuarios;
    }
    
    public Usuario consultarUsuarioPorUsuario(String p_usuario){
        Usuario usuario = new Usuario();
        try{
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM usuario WHERE usuario='"+p_usuario+"'";
            ResultSet resultado = stmt.executeQuery(query);
            while(resultado.next()){
                usuario.setId_usuario(resultado.getInt("id_usuario"));
                usuario.setId_rol(resultado.getInt("id_rol"));
                usuario.setNombre(resultado.getString("nombre"));
                usuario.setContrasena(resultado.getString("contrasena"));
                usuario.setUsuario(resultado.getString("usuario"));
                usuario.setApellido(resultado.getString("apellido"));
                usuario.setEmail(resultado.getString("email"));
                usuario.setRegion(resultado.getString("region"));
                usuario.setTelefono(resultado.getString("telefono"));
                usuario.setFecha_nacimiento(resultado.getString("fecha_nacimiento"));
            }
            resultado.close();
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return usuario;
    }
    
    public Usuario consultarPrimerUsuario(){
        Usuario usuario = new Usuario();
        try{
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM usuario WHERE id_usuario="+1;
            ResultSet resultado = stmt.executeQuery(query);
            while(resultado.next()){
                usuario.setId_usuario(resultado.getInt("id_usuario"));
                usuario.setId_rol(resultado.getInt("id_rol"));
                usuario.setNombre(resultado.getString("nombre"));
                usuario.setContrasena(resultado.getString("contrasena"));
                usuario.setUsuario(resultado.getString("usuario"));
                usuario.setApellido(resultado.getString("apellido"));
                usuario.setEmail(resultado.getString("email"));
                usuario.setRegion(resultado.getString("region"));
                usuario.setTelefono(resultado.getString("telefono"));
                usuario.setFecha_nacimiento(resultado.getString("fecha_nacimiento"));
            }
            resultado.close();
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return usuario;
    }
       public Usuario consultarDatosPorIDSinLista(String id_usuario){
        Usuario usuario = new Usuario();
        try{
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM usuario WHERE id_usuario="+id_usuario;
            ResultSet resultado = stmt.executeQuery(query);
            while(resultado.next()){
                usuario.setId_usuario(resultado.getInt("id_usuario"));
                usuario.setNombre(resultado.getString("nombre"));
                usuario.setUsuario(resultado.getString("usuario"));
                usuario.setApellido(resultado.getString("apellido"));
                usuario.setContrasena(resultado.getString("contrasena"));
                usuario.setEmail(resultado.getString("email"));
                usuario.setRegion(resultado.getString("region"));
                usuario.setFecha_nacimiento(resultado.getString("fecha_nacimiento"));
                usuario.setTelefono(resultado.getString("telefono"));
                usuario.setId_rol(resultado.getInt("id_rol"));
            }
            resultado.close();
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return usuario;
    }
       
    
       
       
}
