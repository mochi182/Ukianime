<%@page import="Procesos.ProcesosUsuario"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="Procesos.ProcesosVideo"%>
<%@page import="Entidades.Video"%>
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
        <script src="Fase%201/js/menu_desplegable.js"></script>
        <script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
        

        <!--Carga componentes-->
       
    </head>

    <body>
         <%
                ProcesosVideo pVideo = new ProcesosVideo();
                List<Video> videos = pVideo.consultarDatos();

            %>
        <section>
        <%@include file="componentes/header.html"%>
        <%@include file="componentes/menu_oculto.html"%>
        </section>
        
         
        <section> 
            
            <section class="primercontenedor">
                <% for (Video video: videos){%>
                <p class="tituloprincipal">
                    <%= video.getNombre() %>
                </p> 
                <%}%>
                <div class="contenedordelvideo">
                    <video controls>
                        <source src="media/MI VIDA.mp4" type="video/mp4">
                    </video>
                </div>
            </section>
            <section class="segundocontenedor">
               
                <div class="moverbotones">
                    <button class="compartir">Compartir</button>
                </div>
                <div class="moverbotones2">
                    <button class="anadirfavorito">Añadir favoritos</button>
                </div>
            </section>
            <section class="tercercontenedor">
                <% for (Video video: videos){%>
                <div class="carousel" data-flickity='{ "wrapAround": true }'>
                    <div class="carousel-cell">
                        <div class="contenedortexmini">
                            <p class="titulosanimesmini"><%= video.getNombre() %></p><img class="productos3" src="<%= video.getUrl_video()%>" alt="">
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
                        <div class="contenedorcajadecomts"><input name="cometario" type="text" placeholder="" class="caja-de-comentarios" required></div>
                        <div class="contenedordebtnenviar" ><button class="btn-enviar" type="submit" required>Agregar comentario</button></div>
                        </form>
                    </div>
                    <%
                        String vcomentario = request.getParameter("comentario");
                        Comentario comentario = new Comentario();
                        comentario.setTexto(vcomentario);
                        ProcesosUsuario pUsuario = new ProcesosUsuario();
                        List<Usuario> usuarios = pUsuario.consultarDatos();
                    %>
                </div>
            </section>
            <br style="clear: both;">
            <section class="quintocontenedor">
                <div class="ultimocontenedor">
                    <hr class="lineadivisorafinal">
                    <%for (Comentario comentario: comentarios){%>
                        
                    <div class="comtsusuario">
                        
                        <p><span>usuario.getNombre()</span> Ayer </p>
                        <p>Haru, porque eres asi...</p>
                    </div>
                          <%}%>
                </div>
            </section>
        </section>
        <footer id="footer"></footer>
    </body>
</html>