<%@page import="java.util.List"%>
<%@page import="Entidades.Video"%>
<%@page import="Procesos.ProcesosVideo"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ukianime</title>
        <!--Carga CSS-->
        <link rel="stylesheet" href="css/estilos_comunes.css">
        <link rel="stylesheet" href="css/paginas/crud_panel.css">
        <link rel="stylesheet" href="css/componentes/menu_oculto.css">
        <link rel="stylesheet" href="css/componentes/header.css">
        <link rel="stylesheet" href="css/componentes/footer.css">

        <!--Carga librerías y archivos de JS-->
        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <script src="js/menu_desplegable.js"></script>

        <!--Carga templates-->
        <script>
        $(function(){
            $("#header").load("https://raw.githubusercontent.com/mochi182/Ukianime/master/componentes/header.html"); 
        });
        $(function(){
            $("#footer").load("https://raw.githubusercontent.com/mochi182/Ukianime/master/componentes/footer.html"); 
        });
        $(function(){
            $("#menu_oculto").load("https://raw.githubusercontent.com/mochi182/Ukianime/master/componentes/menu_oculto.html"); 
        });
        </script>
    </head>

    <body>
        <header id="header"></header>
        <div id="menu_oculto"></div>

        <section class="seccion_central">
            
            <% ProcesosVideo pvideo = new ProcesosVideo(); 
                if(request.getParameter("nombre")==null){
                }else{
                    String nombre = request.getParameter("nombre");
                    String descripcion = request.getParameter("descripcion");
                    String url_video = request.getParameter("url_video");

                    String episodio_string = request.getParameter("episodio");
                    Integer episodio = new Integer(0);
                    episodio = Integer.parseInt(episodio_string);
                    
                    String id_anime_string = request.getParameter("id_anime");
                    Integer id_anime = new Integer(0);
                    id_anime = Integer.parseInt(id_anime_string);

                    Video video = new Video();
                    video.setId_anime(id_anime);
                    video.setNombre(nombre);
                    video.setEpisodio(episodio);
                    video.setDescripcion(descripcion);
                    video.setUrl_video(url_video);
                    int isSaved = pvideo.guardarVideo(video);
            %>
                    <h2>
                        <%
                            if (isSaved > 0){
                                out.print("¡Datos ingresados exitosamente!");
                            } else{}
                        %>
                    </h2>
                <%}%><!-- Fin del IF-ELSE -->
            
            <div id="panel_flex_1">
                <h1>Panel de videos</h1>
                <div id="panel_flex_2">
                    <select name="playlist" id="playlist_panel"></select>
                    <a href="subir_video.jsp" type="button" class="boton hierba">Subir video</a>
                    <a href="panel_de_listas.jsp" type="button" class="boton chillin">Administrar listas</a>
                </div>
            </div>            
            <hr>
            <table class="tabla_sin_bordes">
                <tr>
                    <th colspan="2"></th>
                    <th>Fecha</th>
                    <th>Vistas</th>
                    <th>Comentarios</th>
                    <th colspan="2"></th>
                </tr>
                
                <%
                    List<Video> videos = pvideo.consultarDatos();
                    for(Video video_get: videos){%>
                        <tr>
                            <td>
                                <%= video_get.getUrl_video() %>
                            </td>
                            <td class="texto_alineado_iz">
                                <b>Episodio <%= video_get.getEpisodio() %>: <%= video_get.getNombre() %></b>
                                <br>
                                Playlist: <%= video_get.getId_anime() %>
                            </td>
                            <td>23/5/2018</td>
                            <td>254</td>
                            <td>0</td>
                            <td>
                                <a href="editar_video.html" type="button" class="boton hierba">Editar</a>
                            </td>
                            <td>
                                <a href="#" type="button" class="boton peligro">Eliminar</a>
                            </td>
                        </tr>
                    <%}%>
            </table>

        </section>

        <footer id="footer"></footer>
    </body>
</html>