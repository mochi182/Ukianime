/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import java.util.Date;

/**
 *
 * @author galop
 */
public class Info_de_pago {
    
    private int id_info_de_pago;
    private int id_usuario;
    private String tipo_de_cuenta;
    private String metodo_de_pago;
    private String tarjeta;
    private int codigo_de_seguridad;
    private String fecha_de_expiracion;
    private String forma_de_cobro;

    /**
     * @return the tarjeta
     */
    public String getTarjeta() {
        return tarjeta;
    }

    /**
     * @param tarjeta the tarjeta to set
     */
    public void setTarjeta(String tarjeta) {
        this.tarjeta = tarjeta;
    }
    
    /**
     * @return the id_info_de_usuario
     */
    public int getId_info_de_pago() {
        return id_info_de_pago;
    }

    /**
     * @param id_info_de_usuario the id_info_de_usuario to set
     */
    public void setId_info_de_pago(int id_info_de_pago) {
        this.id_info_de_pago = id_info_de_pago;
    }

    /**
     * @return the id_usuario
     */
    public int getId_usuario() {
        return id_usuario;
    }

    /**
     * @param id_usuario the id_usuario to set
     */
    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    /**
     * @return the tipo_de_cuenta
     */
    public String getTipo_de_cuenta() {
        return tipo_de_cuenta;
    }

    /**
     * @param tipo_de_cuenta the tipo_de_cuenta to set
     */
    public void setTipo_de_cuenta(String tipo_de_cuenta) {
        this.tipo_de_cuenta = tipo_de_cuenta;
    }

    /**
     * @return the metodo_de_pago
     */
    public String getMetodo_de_pago() {
        return metodo_de_pago;
    }

    /**
     * @param metodo_de_pago the metodo_de_pago to set
     */
    public void setMetodo_de_pago(String metodo_de_pago) {
        this.metodo_de_pago = metodo_de_pago;
    }

    /**

     * @return the codigo_de_seguridad
     */
    public int getCodigo_de_seguridad() {
        return codigo_de_seguridad;
    }

    /**
     * @param codigo_de_seguridad the codigo_de_seguridad to set
     */
    public void setCodigo_de_seguridad(int codigo_de_seguridad) {
        this.codigo_de_seguridad = codigo_de_seguridad;
    }

    /**
     * @return the fecha_de_expiracion
     */
    public String getFecha_de_expiracion() {
        return fecha_de_expiracion;
    }

    /**
     * @param fecha_de_expiracion the fecha_de_expiracion to set
     */
    public void setFecha_de_expiracion(String fecha_de_expiracion) {
        this.fecha_de_expiracion = fecha_de_expiracion;
    }

    /**
     * @return the forma_de_cobro
     */
    public String getForma_de_cobro() {
        return forma_de_cobro;
    }

    /**
     * @param forma_de_cobro the forma_de_cobro to set
     */
    public void setForma_de_cobro(String forma_de_cobro) {
        this.forma_de_cobro = forma_de_cobro;
    }
    
   
}
