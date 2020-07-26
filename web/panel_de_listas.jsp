<%@page import="java.util.List"%>
<%@page import="Entidades.Anime"%>
<%@page import="Procesos.ProcesosAnime"%>
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

        <!--Carga librerÃ­as y archivos de JS-->
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
            <div id="listas_flex_1">
                <h1 id="titulo_listas_de_reproduccion">Panel de listas de reproducciónn</h1>
                <div id="listas_flex_2">
                    <a href="crear_lista.jsp" type="button" class="boton hierba">Crear lista</a>
                    <a href="panel_de_videos.html" type="button" class="boton chillin">Regresar</a>
                </div>
            </div>
            
        <% ProcesosAnime panime = new ProcesosAnime(); 
            if(request.getParameter("nombre")==null){
            }else{
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
                int isSaved = panime.guardarAnime(anime);
        %>
                <h2>
                    <%
                        if (isSaved > 0){
                            out.print("¡Datos ingresados exitosamente!");
                        } else{}
                    %>
                </h2>
            <%}%><!-- Fin del IF-ELSE -->
                      
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
                    List<Anime> animes = panime.consultarDatos();
                    for(Anime anime_get: animes){%>
                    <tr>
                        <td>
                            <img class="imagen_lista" src=<%= anime_get.getUrl_imagen()%> alt="l2">
                        </td>
                        <td class="texto_alineado_iz">
                            <b><%=anime_get.getNombre() %></b>
                            <br>
                            <%= anime_get.getId_categoria() %>
                        </td>
                        <td>3/8/2018</td>
                        <td>854</td>
                        <td>12</td>
                        <td>
                            <a href="#" type="button" class="boton hierba">Editar</a>
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