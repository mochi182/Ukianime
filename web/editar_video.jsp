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
        <%@include file="componentes/header.html"%>
        <%@include file="componentes/menu_oculto.html"%>
        
        <%
            ProcesosVideo pvideo = new ProcesosVideo();
            Video video_get = new Video();
            String id_video = request.getParameter("id_video");
            video_get = pvideo.consultarDatosPorID(id_video);
            
            if(request.getParameter("nombre")!=null){
                String nombre = request.getParameter("nombre");
                String descripcion = request.getParameter("descripcion");
                String url_imagen = request.getParameter("url_imagen");
                
                String id_categoria_string = request.getParameter("id_categoria");
                Integer id_categoria = new Integer(0);
                id_categoria = Integer.parseInt(id_categoria_string);
                
                Anime anime = new Anime();
                anime.setNombre(nombre);
                anime.setId_categoria(id_categoria);
                anime.setDescripcion(descripcion);
                anime.setUrl_imagen(url_imagen);
                int isUpdated = panime.actualizarAnime(anime, anime_get.getId_anime());
                anime_get = panime.consultarDatosPorID(id_anime);
        %>
                <div class="alertaVerde">
                    <h4>
                        <%
                            if (isUpdated > 0){
                                out.print("¡Datos actualizados exitosamente!");
                            } else{}
                        %>
                    </h4>
                </div>
            <%}else{}%><!-- Fin del IF-ELSE -->
        

        <section class="seccion_central">
            <h1>Editar video</h1>
            <hr>
            <div id="subir_video_flex_1">
                <div id="subir_video_flex_2">
                    <img id="preview_subir_video" src="https://maroon-prod.s3.amazonaws.com/media/CACHE/images/photos/2020/04/19/beatars/ce09d947a4dc92f740c51383fc3a057b.jpg" alt="e1">
                    <p>
                        Lista de reproducciÃ³n
                        <br>
                        <select name="playlist" id="playlist_subir_video">
                            <option value="beastars">Beastars</option>
                            <option value="rurouni_kenshin">Rurouni Kenshin</option>
                            <option value="neon_genesis_evangelion">Neon Genesis Evangelion</option>
                        </select>
                    </p>
                    <p>
                        Vista previa
                        <br>
                        <input type="file" class="file_input">
                    </p>
                    <p>
                        SubtÃ­tulos
                        <br>
                        <input type="file" class="file_input">
                    </p>

                </div>
                    <div id="subir_video_flex_3">
                        <div id="titulo_y_descripcion_videos">
                            <p>InformaciÃ³n bÃ¡sica</p>
                            <hr>
                            <p>
                                TÃ­tulo
                                <br>
                                <input type="text">
                            </p>
                            <p>
                                DescripciÃ³n
                                <br>
                                <textarea name="descripcion" rows="15"></textarea>
                            </p>
                            <p>
                                Etiquetas
                                <br>
                                <input type="text">
                            </p>
                        </div>
                        <div id="subseccion_de_botones">
                            <a href="panel_de_videos.html" type="button" class="boton hierba">Listo</a>
                            <a href="panel_de_videos.html" type="button" class="boton peligro">Cancelar</a>
                        </div>
                    </div>
                </div>
            </section>

        <%@include file="componentes/footer.html"%>
    </body>
</html>