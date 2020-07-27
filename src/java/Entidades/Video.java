/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import java.sql.Timestamp;

/**
 *
 * @author galop
 */
public class Video {
    
    private int id_video;
    private int id_anime;
    private String nombre;
    private int episodio;
    private String descripcion;
    private String url_video;
    private int vista;
    private Timestamp created_at;
    private Timestamp updated_at;

    /**
     * @return the vista
     */
    public int getVista() {
        return vista;
    }

    /**
     * @param vista the vista to set
     */
    public void setVista(int vista) {
        this.vista = vista;
    }

    /**
     * @return the created_at
     */
    public Timestamp getCreated_at() {
        return created_at;
    }

    /**
     * @param created_at the created_at to set
     */
    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }

    /**
     * @return the updated_at
     */
    public Timestamp getUpdated_at() {
        return updated_at;
    }

    /**
     * @param updated_at the updated_at to set
     */
    public void setUpdated_at(Timestamp updated_at) {
        this.updated_at = updated_at;
    }
    
    /**
     * @return the episodio
     */
    public int getEpisodio() {
        return episodio;
    }

    /**
     * @param episodio the episodio to set
     */
    public void setEpisodio(int episodio) {
        this.episodio = episodio;
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
     * @return the id_anime
     */
    public int getId_anime() {
        return id_anime;
    }

    /**
     * @param id_anime the id_anime to set
     */
    public void setId_anime(int id_anime) {
        this.id_anime = id_anime;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * @return the url_video
     */
    public String getUrl_video() {
        return url_video;
    }

    /**
     * @param url_video the url_video to set
     */
    public void setUrl_video(String url_video) {
        this.url_video = url_video;
    }
    
    
}
