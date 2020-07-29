


<%@include file="componentes/header.jsp"%>
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
        
        <% ProcesosAnime panime = new ProcesosAnime();
            String id_animes =request.getParameter("id_anime");
             Anime anime= panime.consultarDatosPorID(id_animes);
        %>
        <br>
        <br>
        <section class="cont1">
            <div class="izquierda1">
                <img  class="portada" src="<%=anime.getUrl_imagen() %>">
            </div>
            <div class="derecha1">
                <div class="subcont1">
                    <div class="izquierda2">
                        <div><img src="https://icongr.am/entypo/star.svg?size=50&color=F1C40F "></div>
                        <div><p>Favoritos</p></div>
                    </div>
            
                    
                    <div class="derecha2"><h1><%=anime.getNombre() %></h1></div>
                </div>

                <div class="context" > 
                    <p><%=anime.getDescripcion() %></p>
                </div>
                <br>
                <div>
                    <h2>Géneros</h2>
                     <%
                        ProcesosCategoria pcategoria = new ProcesosCategoria();
                        String id_categoria = request.getParameter("id_categoria");
                        Categoria categorias= pcategoria.consultarDatosPorAnime1(id_categoria);
                        %>
                    <p class="p_sin_margen">
                       
                         
                        <span class="genero_color"><%=categorias.getNombre() %></span>
                    </p>
                </div>
                <br>
                <div class="contenedor_estrella">
                    <div class="izquierda_informacion">
                        <h2>Información General</h2>
                    <%
                        ProcesosTag ptag = new ProcesosTag();
                        List<Tag> tags = ptag.consultarDatos();
                        
                     %>
                        <p class="p_sin_margen">
                            <span class="titulo_genero">Idiomas:</span>
                       <% for(Tag tag: tags){%>
                            <span class="genero_color"><%= tag.getNombre()%></span>
                       <%}%>
                        </p>
                        

                        <p class="p_sin_margen">
                            <span class="titulo_genero">Episodios:</span>
                            <span class="genero_color"></span>
                        </p>
                         
                        <p class="p_sin_margen">
                            <span class="titulo_genero">Visitas:</span>
                            <span class="genero_color"></span>
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
                <span class="listati" >Listado de Espisodios</span>
            </p>
            <hr>
            
            <%    ProcesosVideo jvideo = new ProcesosVideo(); 
            String id_animess= request.getParameter("id_animess");
            List<Video> videos= jvideo.consultarDatosPorID(id_animess);
               %>
            <% for (Video video: videos){%>
            <a href="vista_videos_tags.jsp"><p><span class="titulo_genero">Episodio <%=video.getEpisodio()%></span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=video.getNombre()%></span></p></a>
            <%}%>      
        </section>
        <br>
        <%@include file="componentes/footer.html"%>
    </body>
</html>
 


