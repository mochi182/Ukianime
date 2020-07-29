/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Procesos;

import Entidades.Info_de_pago;
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
public class ProcesosInfo_de_pago {
    
    Connection conn;
    
    public ProcesosInfo_de_pago() {
        
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
    
    public int guardarInfo_de_pago(Info_de_pago info_de_pago){
        int resultado = 0;
        try{
            Statement stmt = conn.createStatement();
            String query = "INSERT INTO info_de_pago(id_usuario, tipo_de_cuenta, metodo_de_pago, tarjeta, codigo_de_seguridad, fecha_de_expiracion, forma_de_cobro)";
                    query += "VALUES("+info_de_pago.getId_usuario()+",'"+info_de_pago.getTipo_de_cuenta()+"', '"+info_de_pago.getMetodo_de_pago()+"','"+info_de_pago.getTarjeta()+"',"+info_de_pago.getCodigo_de_seguridad()+",'"+info_de_pago.getFecha_de_expiracion()+"', '"+info_de_pago.getForma_de_cobro()+"')";
        
            resultado = stmt.executeUpdate(query);
            return resultado;
        } catch(Exception w){
            System.out.println("Error al insertar en base de datos: " + w);
        }
        return 0;
    }
    
    public List<Info_de_pago>  consultarDatos(){
        List<Info_de_pago> infos_de_pago = new ArrayList<Info_de_pago>();
        try{
            Statement stmt = conn.createStatement();
            String query = "SELECT * FROM info_de_pago";
            ResultSet resultado = stmt.executeQuery(query);
            while(resultado.next()){
                Info_de_pago info_de_pago = new Info_de_pago();
                info_de_pago.setId_info_de_pago(resultado.getInt("id_info_de_pago"));
                info_de_pago.setId_usuario(resultado.getInt("id_usuario"));
                info_de_pago.setTipo_de_cuenta(resultado.getString("tipo_de_cuenta"));
                info_de_pago.setMetodo_de_pago(resultado.getString("metodo_de_pago"));
                info_de_pago.setTarjeta(resultado.getString("tarjeta"));
                info_de_pago.setCodigo_de_seguridad(resultado.getInt("codigo_de_seguridad"));
                info_de_pago.setFecha_de_expiracion(resultado.getString("fecha_de_expiracion"));
                info_de_pago.setForma_de_cobro(resultado.getString("forma_de_cobro"));
                infos_de_pago.add(info_de_pago);
            }
            resultado.close();
        } catch(Exception e){
            System.out.println("Error: " + e);
        }
        return infos_de_pago;
    }
    
}
