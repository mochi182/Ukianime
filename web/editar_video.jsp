<%@page import="Entidades.Anime"%>
<%@page import="java.util.List"%>
<%@page import="Procesos.ProcesosAnime"%>
<%@page import="Entidades.Video"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="Procesos.ProcesosVideo"%>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ukianime</title>
        <!--Carga CSS-->
        <link rel="stylesheet" href="css/estilos_comunes.css">
        <link rel="stylesheet" href="css/paginas/crud_subir_editar.css">
        <link rel="stylesheet" href="css/componentes/menu_oculto.css">
        <link rel="stylesheet" href="css/componentes/header.css">
        <link rel="stylesheet" href="css/componentes/footer.css">

        <!--Carga librerÃ­as y archivos de JS-->
        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <script src="js/menu_desplegable.js"></script>

    </head>

    <body>
        <%@include file="componentes/header.jsp"%>
        <%@include file="componentes/menu_oculto.jsp"%>
               
        <section class="seccion_central">
        <%
            ProcesosVideo pvideo = new ProcesosVideo();
            Video video_get = new Video();
            String id_video = request.getParameter("id_video");
            video_get = pvideo.consultarDatoPorID(id_video);
            
            if(request.getParameter("nombre")!=null){
                String nombre = request.getParameter("nombre");
                String descripcion = request.getParameter("descripcion");
                String url_video = request.getParameter("url_video");
                
                String id_anime_string = request.getParameter("id_anime");
                Integer id_anime = new Integer(0);
                id_anime = Integer.parseInt(id_anime_string);
                
                String episodio_string = request.getParameter("episodio");
                Integer episodio = new Integer(0);
                episodio = Integer.parseInt(episodio_string);
                
                Video video = new Video();
                video.setNombre(nombre);
                video.setEpisodio(episodio);
                video.setId_anime(id_anime);
                video.setDescripcion(descripcion);
                video.setUrl_video(url_video);
                int isUpdated = pvideo.actualizarVideo(video, video_get.getId_video());
                video_get = pvideo.consultarDatoPorID(id_video);
        %>
                <div class="alertaVerde">
                    <h3>
                        <%
                            if (isUpdated > 0){
                                out.print("¡Datos actualizados exitosamente!");
                            } else{}
                        %>
                    </h3>
                </div>
            <%}else{}%><!-- Fin del IF-ELSE -->
        
            <h1>Subir video</h1>
            <hr>
            <form method="POST" action="editar_video.jsp">
                <input class="input_escondido" type="text" name="id_video" value=<%=video_get.getId_video()%>>
                <div id="subir_video_flex_1">
                    <div id="subir_video_flex_2">
                        <img id="preview_editar_video" src="https://img.youtube.com/vi/<%= video_get.getUrl_video() %>/sddefault.jpg" alt="e1">
                        <p>
                            Vista previa
                        </p>
                    </div>
                    <div id="subir_video_flex_3">
                        <div id="titulo_y_descripcion_videos">
                            <p>Información básica</p>
                            <hr>
                            <p>
                                Episodio *
                                <br>
                                <input name="episodio" type="number" required value="<%=video_get.getEpisodio()%>">
                            </p>
                            <p>
                                Título
                                <br>
                                <input name="nombre" type="text" value="<%=video_get.getNombre()%>">
                            </p>
                            <p>
                                Descripción
                                <br>
                                <textarea name="descripcion" rows="15"><%=video_get.getDescripcion()%></textarea>
                            </p>
                            <p>
                                URL del video *
                                <br>
                                <input name="url_video" type="text" required value="<%=video_get.getUrl_video()%>">
                            </p>
                            <%
                                ProcesosAnime panime = new ProcesosAnime();
                                List<Anime> animes = panime.consultarDatos();
                            %>
                            <p>
                                Lista de reproducción *
                                <br>
                                <select name="id_anime" id="playlist_subir_video" required>
                                    <% for(Anime opcion_anime: animes){%>                                      
                                        <option value=<%= opcion_anime.getId_anime() %> <%
                                            if(opcion_anime.getId_anime()==video_get.getId_anime()){
                                            %> selected <%}
                                        %>><%= opcion_anime.getNombre() %></option>
                                        
                                    <%}%>
                                </select>
                            </p>
                            <p>
                                Etiquetas
                                <br>
                                <input type="text">
                            </p>
                        </div>
                        <div id="subseccion_de_botones">
                            <input type="submit" value="Listo" class="botonInput hierba min_width_124px"><br>
                            <a href="panel_de_videos.jsp?id_anime=<%=video_get.getId_anime()%>" type="button" class="boton peligro">Regresar</a>
                        </div>
                    </div>
                </div>
            </form>
        </section>

        <%@include file="componentes/footer.html"%>
    </body>
</html>