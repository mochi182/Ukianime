
<%@page import="Entidades.Usuario_agrega_anime"%>
<%@page import="Procesos.ProcesosUsuario_agrega_anime"%>
<%@page import="Entidades.Categoria"%>
<%@page import="Procesos.ProcesosCategoria"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.Anime"%>
<%@page import="Procesos.ProcesosAnime"%>
<%@page import="Procesos.ProcesosCategoria"%>
<%@page import="Procesos.ProcesosTag"%>
<%@page import="Entidades.Tag"%>
<%@page import="Procesos.ProcesosVideo"%>
<%@page import="Entidades.Video"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ukianime</title>
        <!--Carga CSS-->
        <link rel="stylesheet" href="css/estilos_comunes.css">
        <link rel="stylesheet" href="css/paginas/descripcion1.css">
        <link rel="stylesheet" href="css/componentes/menu_oculto.css">
        <link rel="stylesheet" href="css/componentes/header.css">
        <link rel="stylesheet" href="css/componentes/footer.css">

        <!--Carga librerÃ­as y archivos de JS-->
        <script src="https://code.jquery.com/jquery-3.5.1.js"  crossorigin="anonymous"></script>
        <script src="js/menu_desplegable.js"></script>

    </head>
    <body>
        <%@include file="componentes/header.jsp"%>
        <%@include file="componentes/menu_oculto.jsp"%>
        <% 
            ProcesosCategoria pcategoria = new ProcesosCategoria();
            String id_categoria = request.getParameter("id_categoria");
            Categoria categorias= pcategoria.consultarDatosPorAnime1(id_categoria);
            ProcesosAnime panime = new ProcesosAnime();
            String id_animes =request.getParameter("id_anime");
            Integer id_anime_int = new Integer(0);
            id_anime_int = Integer.parseInt(id_animes);
            Anime anime= panime.consultarDatosPorID(id_animes);
            ProcesosUsuario_agrega_anime pusuarioanime = new ProcesosUsuario_agrega_anime();
            String agregar_favorito = request.getParameter("agregar_favorito");
            String eliminar_favorito = request.getParameter("eliminar_favorito");
            
            if(agregar_favorito != null){
                Usuario_agrega_anime usuarioanime = new Usuario_agrega_anime();
                usuarioanime.setId_usuario(1);
                usuarioanime.setId_anime(id_anime_int);
                int isSaved = pusuarioanime.guardarUsuario_agrega_anime(usuarioanime);
            } else if (eliminar_favorito != null){
                int isDeleted = pusuarioanime.eliminarUsuario_agrega_anime(id_anime_int, 1);
            }
             
        %>
        <br>
        <br>
        <section class="cont1">
            <div class="izquierda1">
                <img  class="portada" src="<%=anime.getUrl_imagen() %>">
            </div>
            <div class="derecha1">
                <div class="subcont1">
                    <div class="">
                        <% 
                            Usuario_agrega_anime usuarioanime2 = pusuarioanime.consultarDatoPorIDs(id_anime_int, 1);
                            if(usuarioanime2.getId_anime()!=0){
                                %>
                                <form method="POST" action="descripcion.jsp" class="izquierda2">
                                    <input class="input_escondido" type="text" name="eliminar_favorito" value="1">
                                    <input class="input_escondido" type="text" name="id_anime" value='<%=id_animes%>'>
                                    <input class="input_escondido" type="text" name="id_categoria" value='<%=id_categoria%>'>
                                    <input type="submit" value="★" class="estrella agregada input_favorito">
                                </form>
                                <%
                            } else{
                                %>
                                <form method="POST" action="descripcion.jsp" class="izquierda2">
                                    <input class="input_escondido" type="text" name="agregar_favorito" value="1">
                                    <input class="input_escondido" type="text" name="id_anime" value='<%=id_animes%>'>
                                    <input class="input_escondido" type="text" name="id_categoria" value='<%=id_categoria%>'>
                                    <input type="submit" value="★" class="estrella desagregada input_favorito">
                                </form>
                                <%
                            }
                        %>
                    </div>
            
                    
                    <div class="derecha2"><h1><%=anime.getNombre() %></h1></div>
                </div>

                <div class="context" > 
                    <p><%=anime.getDescripcion() %></p>
                </div>
                <br>
                <div>
                    <h2>Categoría</h2>
                    <p class="p_sin_margen">
                       
                         
                        <span class="genero_color"><%=categorias.getNombre() %></span>
                    </p>
                </div>
                <br>
                <div class="contenedor_estrella">
                    <div class="izquierda_informacion">
                        <h2>Información General</h2>
                    <%
                        ProcesosVideo jvideo = new ProcesosVideo(); 
                        List<Video> videos= jvideo.consultarDatosPorID(id_animes);
                        ProcesosTag ptag = new ProcesosTag();
                        List<Tag> tags = ptag.consultarDatos();
                        int cuenta = jvideo.contarVideosPorAnime(id_animes);
                     %>
                        <p class="p_sin_margen">
                            <span class="titulo_genero">Idiomas:</span>
                       <% for(Tag tag: tags){%>
                            <span class="genero_color"><%= tag.getNombre()%></span>
                       <%}%>
                        </p>
                        

                        <p class="p_sin_margen">
                            <span class="titulo_genero">Episodios:</span>
                            <span class="genero_color"><%=cuenta %></span>
                        </p>
                         
                        <p class="p_sin_margen">
                            <span class="titulo_genero">Visitas:</span>
                            <span class="genero_color"><%= jvideo.consultarVistasPorAnime(id_anime_int)%></span>
                        </p>
                    </div>
                    <div class="derecha_votos">
                        <p class="numero_votos">250</p><p class="numero_votos">Votos</p>
                        <img src="https://icongr.am/entypo/star.svg?size=65&color=922B21">
                        <p class="numero_rating">9.00</p>
                    </div>
                </div>
            </div>
        </section>
        <br>
        <section class="lista">
            <p >
                <span class="spam-div"><img src="https://icongr.am/clarity/menu.svg?size=27&color=9b9b9b"></span>
                <span class="listati" >Listado de episodios</span>
            </p>
            <hr>
            <% for (Video video: videos){%>
                <a href="vista_videos_tags.jsp?id_video=<%=video.getId_video()%>&id_anime=<%=video.getId_anime()%>"><p><span class="titulo_genero">Episodio <%=video.getEpisodio()%></span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=video.getNombre()%></span></p></a>
            <%}%>      
        </section>
        <br>
        <%@include file="componentes/footer.html"%>
    </body>
</html>
 


