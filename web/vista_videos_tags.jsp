<%@page import="Procesos.ProcesosUsuario"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="Procesos.ProcesosVideo"%>
<%@page import="Entidades.Video"%>
<%@page import="Procesos.ProcesosComentario"%>
<%@page import="Entidades.Comentario"%>
<%@page import="Entidades.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ukianime</title>
        <!--Carga CSS-->
        <link rel="stylesheet" href="css/estilos_comunes.css">
        <link rel="stylesheet" href="css/paginas/vista_videos_tags.css">
        <link rel="stylesheet" href="css/componentes/menu_oculto.css">
        <link rel="stylesheet" href="css/componentes/header.css">
        <link rel="stylesheet" href="css/componentes/footer.css">
        <link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css">

        <!--Carga librerías y archivos de JS-->
        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <script src="js/menu_desplegable.js"></script>
        <script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
        

        <!--Carga componentes-->
       
    </head>

    <body>
         
            <% 
                ProcesosVideo pvideo = new ProcesosVideo();
                String id_animes= request.getParameter("id_anime");
                List<Video> videos= pvideo.consultarDatosPorID(id_animes);
                String id_video_string = request.getParameter("id_video");
                Video video2= pvideo.consultarDatosPorIDSinLista(id_video_string);
                Integer id_video = new Integer(0);
                id_video = Integer.parseInt(id_video_string);
                ProcesosComentario comentario2 = new ProcesosComentario();
                
                Video video_actual = new Video();
                video_actual = pvideo.consultarDatoPorID(id_video_string);
                
                String se_comento = request.getParameter("se_comento");
                if(se_comento!=null){ 
                    String vid_usuario= request.getParameter("id_usuario");
                    String vid_video= request.getParameter("id_video");
                    String vcomentario = request.getParameter("texto");
                    Comentario comentario_v = new Comentario();
                    int v_usuario = 1;
                    comentario_v.setId_usuario(v_usuario);
                    comentario_v.setId_video(id_video);
                    comentario_v.setTexto(vcomentario);
                    int isSaved = comentario2.guardarComentario(comentario_v);
                %>
                <h4>
                        <%
                            if (isSaved > 0){
                                out.print("¡Datos ingresados exitosamente!");
                            } else{}
                        %>
                </h4>
                <%} else{}

            ProcesosComentario pcomentario = new ProcesosComentario();
            List<Comentario> comentarios = pcomentario.consultarComentarioPorIDVideo(id_video);
            %>

            
        <section>
        <%@include file="componentes/header.jsp"%>
        <%@include file="componentes/menu_oculto.jsp"%>
        </section>
        
         
        <section> 
            
            <section class="primercontenedor">
                <p class="tituloprincipal">
                  <%= video2.getNombre() %>
                </p> 
                <div class="player" id="<%=video_actual.getUrl_video()%>"></div>
            </section>
            
            <section class="segundocontenedor">
                <div class="moverbotones2">
                    <button class="anadirfavorito">Añadir favoritos</button>
                </div>
            </section>
            
            <section class="tercercontenedor">
                <div class="carousel" data-flickity='{ "wrapAround": true }'>
                    <%
                        for (Video video: videos){%>
                            <div class="carousel-cell">
                                <div class="contenedortexmini">
                                    <p class="titulosanimesmini"><%= video.getNombre() %></p><img class="productos3" src="https://img.youtube.com/vi/<%= video.getUrl_video() %>/sddefault.jpg" alt="">
                                </div>
                            </div>
                    <%}%>
                </div> 
            </section>
                
            <p class="tituloCseccion">Comentarios</p> 
                
            <section class="cuartocontenedor">
                <div>
                    <hr class="lineadivisora">
                    <div class="notificacion">
                        <form method="POST" action="vista_videos_tags.jsp">
                            <input type="text"  class="input_escondido" name="id_video" value="<%=id_video%>">
                            <input type="text"  class="input_escondido" name="id_usuario" value="1">
                            <input type="text"  class="input_escondido" name="se_comento" value="1">
                            <div class="contenedorcajadecomts"><input name="texto" type="text"  class="caja-de-comentarios" required></div>
                            <div class="contenedordebtnenviar" ><input class="btn-enviar" type="submit" value="Agregar comentario" required></div>
                        </form>
                    </div>
                </div>
            </section>
                
            <br style="clear: both;">
            <section class="quintocontenedor">
                <div class="ultimocontenedor">
                    <hr class="lineadivisorafinal">
                    <!-- Cargan los comentarios -->
                    <% 
                        ProcesosUsuario pusuario = new ProcesosUsuario();
                        
                        if(comentarios != null){
                            for (Comentario comentario: comentarios){%>
                                <div class="comtsusuario">

                                    <p><span><%=  pusuario.consultarDatosPorIDSinLista(String.valueOf(comentario.getId_usuario())).getUsuario()%></span><%=comentario.getCreated_at()%></p>
                                    <p><%=comentario.getTexto()%></p>
                                </div>
                            </div>
                        <%}}%>
            </section>
        </section>
        <%@include file="componentes/footer.html"%>
        <script id="embed" src="js/embed_script.js">
        </script>
    </body>
</html>