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
public class Video {
    
    private int id_video;
    private int id_anime;
    private String nombre;
    private String descripcion;
    private String url_imagen;

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
     * @return the url_imagen
     */
    public String getUrl_imagen() {
        return url_imagen;
    }

    /**
     * @param url_imagen the url_imagen to set
     */
    public void setUrl_imagen(String url_imagen) {
        this.url_imagen = url_imagen;
    }
    
    
}
