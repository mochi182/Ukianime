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
        <script src="Fase%201/js/menu_desplegable.js"></script>
        <script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
        

        <!--Carga componentes-->
       
    </head>

    <body>
         
            <% ProcesosVideo pvideo = new ProcesosVideo();
            String id_video = request.getParameter("id_video");
             Video video2= pvideo.consultarDatosPorIDSinLista(id_video);
             ProcesosVideo jvideo = new ProcesosVideo();
             String id_animes= request.getParameter("id_anime");
             List<Video> videos= jvideo.consultarDatosPorID(id_animes);
               
                        
                        ProcesosComentario comentario2 = new ProcesosComentario();
                        String vid_usuario= request.getParameter("id_usuario");
                        String vid_video= request.getParameter("id_video");
                        String vcomentario = request.getParameter("texto");
                        Comentario comentario_v = new Comentario();
                        int v_usuario = 1;
                        int v_video = 2;
                        comentario_v.setId_usuario(v_usuario);
                        comentario_v.setId_video(v_video);
                        comentario_v.setTexto(vcomentario);
                        int isSaved = comentario2.guardarComentario(comentario_v);
                        
                        
                        ProcesosComentario pcomentario = new ProcesosComentario();
                        List<Comentario> comentarios = pcomentario.consultarDatos();
            %>

            
        <section>
        <%@include file="componentes/header.html"%>
        <%@include file="componentes/menu_oculto.html"%>
        </section>
        
         
        <section> 
            
            <section class="primercontenedor">
                
                <p class="tituloprincipal">
                  <%= video2.getNombre() %>
                </p> 
                
                    <div class="player"class="contenedordelvideo" id="vid_video"></div>

                
                </div>
            </section>
            <section class="segundocontenedor">
               
           
                <div class="moverbotones2">
                    <button class="anadirfavorito">Añadir favoritos</button>
                </div>
            </section>
            <section class="tercercontenedor">
         
                <div class="carousel" data-flickity='{ "wrapAround": true }'>
                    <% for (Video video: videos){%>
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
                        <div class="contenedorcajadecomts"><input name="texto" type="text"  class="caja-de-comentarios" required></div>
                        <div class="contenedordebtnenviar" ><button class="btn-enviar" type="submit" required>Agregar comentario</button></div>
                        </form>
                    </div>
                
                </div>
            </section>
            <br style="clear: both;">
            <section class="quintocontenedor">
                <div class="ultimocontenedor">
                    <hr class="lineadivisorafinal">
                    <% for (Comentario comentario: comentarios){%>
                    <div class="comtsusuario">
                        
                        <p><span>sdadad</span> ayer </p>
                        <p><%=comentario.getTexto()%></p>
                    </div>
                   
                </div>
                <%}%>
                <h4>
                        <%
                            if (isSaved > 0){
                                out.print("¡Datos ingresados exitosamente!");
                            } else{}
                        %>
                </h4>
            </section>
        </section>
        <%@include file="componentes/footer.html"%>
        <script id="embed" src="js/embed_script.js">
        </script>
    </body>
</html>