/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

/**
 *
 * @author galop
 */
public class Comentario {
    
    private int id_comentario;
    private int id_usuario;
    private int id_video;
    private String texto;

    /**
     * @return the id_comentario
     */
    public int getId_comentario() {
        return id_comentario;
    }

    /**
     * @param id_comentario the id_comentario to set
     */
    public void setId_comentario(int id_comentario) {
        this.id_comentario = id_comentario;
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
     * @return the id_video
     */
    public int getId_video() {
        return id_video;
    }

    /**
     * @param id_video the id_video to set
     */
    public void setId_video(int id_video) {
        this.id_video = id_video;
    }

    /**
     * @return the texto
     */
    public String getTexto() {
        return texto;
    }

    /**
     * @param texto the texto to set
     */
    public void setTexto(String texto) {
        this.texto = texto;
    }
    
   
}
