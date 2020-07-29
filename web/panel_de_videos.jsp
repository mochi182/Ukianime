<%@page import="Entidades.Anime"%>
<%@page import="Procesos.ProcesosAnime"%>
<%@page import="Procesos.ProcesosComentario"%>
<%@page import="java.util.ArrayList"%>
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
    </head>

    <body>
        <%@include file="componentes/header.jsp"%>
        <%@include file="componentes/menu_oculto.jsp"%>

        <section class="seccion_central">
            
            <% ProcesosVideo pvideo = new ProcesosVideo();
            
            String id_anime_string = request.getParameter("id_anime");
            String id_video_string = request.getParameter("id_video");
            
            if((id_anime_string!=null)&(id_video_string==null)&(request.getParameter("nombre")==null)){}
            
            else if((id_anime_string!=null)&(id_video_string!=null)){
                int isDeleted = pvideo.eliminarVideo(id_video_string);
                %>
                <div class="alertaRoja">
                    <h3>
                        <%
                            if (isDeleted > 0){
                                out.print("¡El registro ha sido eliminado!");
                            } else{}
                        %>
                    </h3>
                </div>
            <%} else if(request.getParameter("nombre")!=null){
                    String nombre = request.getParameter("nombre");
                    String descripcion = request.getParameter("descripcion");
                    String url_video = request.getParameter("url_video");

                    String episodio_string = request.getParameter("episodio");
                    Integer episodio = new Integer(0);
                    episodio = Integer.parseInt(episodio_string);
                    
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
                    <div class="alertaVerde">
                        <h3>
                            <%
                                if (isSaved > 0){
                                    out.print("¡Datos ingresados exitosamente!");
                                } else{}
                            %>
                        </h3>
                    </div>
                <%}else{}%>
            
            <div id="panel_flex_1">
                <h1>Panel de videos</h1>
                <div id="panel_flex_2">
                    <a href="subir_video.jsp" type="button" class="boton hierba">Subir video</a>
                    <a href="panel_de_listas.jsp" type="button" class="boton chillin">Regresar</a>
                </div>
            </div>            
            <hr>
            <table class="tabla_sin_bordes">
                <tr>
                    <th colspan="2"></th>
                    <th>Creación</th>
                    <th>Última modificación</th>
                    <th>Vistas</th>
                    <th>Comentarios</th>
                    <th colspan="2"></th>
                </tr>
                
                <% 
                    List<Video> videos = new ArrayList<Video>();
                    videos = pvideo.consultarDatosPorID(id_anime_string);
                    ProcesosComentario pcomentario = new ProcesosComentario();
                    ProcesosAnime panime = new ProcesosAnime();
                    for(Video video_get: videos){%>
                    <tr>
                        <td>
                            <img class="crud_preview" src="https://img.youtube.com/vi/<%= video_get.getUrl_video() %>/sddefault.jpg" alt="Preview">
                        </td>
                        <td class="texto_alineado_iz">
                            <b>Episodio <%= video_get.getEpisodio() %>: <%= video_get.getNombre() %></b>
                            <br>
                            <%= panime.consultarDatosPorID(String.valueOf(video_get.getId_anime())).getNombre() %>
                        </td>
                        <td><%=video_get.getCreated_at() %></td>
                        <td><%=video_get.getUpdated_at() %></td>
                        <td><%=video_get.getVista() %></td>
                        <td><%=pcomentario.consultarComentariosPorVideo(video_get.getId_video()) %></td>
                        <td>
                            <form method="POST" action="editar_video.jsp">
                                <input class="input_escondido" type="text" name="id_video" value=<%=video_get.getId_video()%>>
                                <input type="submit" value="Editar" class="botonInput hierba"><br>
                            </form>
                        </td>
                        <td>
                            <form method="POST" action="panel_de_videos.jsp">
                                <input class="input_escondido" type="text" name="id_video" value=<%=video_get.getId_video()%>>
                                <input class="input_escondido" type="text" name="id_anime" value=<%=video_get.getId_anime()%>>
                                <input type="submit" value="Eliminar" class="botonInput peligro"><br>
                            </form>
                        </td>
                    </tr>
                <%}%>
            </table>

        </section>

        <%@include file="componentes/footer.html"%>
    </body>
</html>