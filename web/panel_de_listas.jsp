<%@page import="Entidades.Categoria"%>
<%@page import="Procesos.ProcesosCategoria"%>
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

    </head>

    <body>
        <%@include file="componentes/header.html"%>
        <%@include file="componentes/menu_oculto.html"%>

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
                <div class="alertaVerde">
                    <h2>
                        <%
                            if (isSaved > 0){
                                out.print("¡Datos ingresados exitosamente!");
                            } else{}
                        %>
                    </h2>
                </div>
            <%}%><!-- Fin del IF-ELSE -->

        <section class="seccion_central">
            <div id="listas_flex_1">
                <h1 id="titulo_listas_de_reproduccion">Panel de listas de reproducción</h1>
                <div id="listas_flex_2">
                    <a href="crear_lista.jsp" type="button" class="boton hierba">Crear lista</a>
                    <a href="panel_de_videos.jsp" type="button" class="boton chillin">Regresar</a>
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
                    ProcesosCategoria pcategoria = new ProcesosCategoria();
                    List<Anime> animes = panime.consultarDatos();
                    List<Categoria> categorias_por_id = pcategoria.consultarDatosPorID(animes);
                    for(int i = 0; i < animes.size(); i++){%>
                    <tr>
                        <td>
                            <img class="imagen_lista" src=<%= animes.get(i).getUrl_imagen()%> alt="l2">
                        </td>
                        <td class="texto_alineado_iz">
                            <b><%=animes.get(i).getNombre() %></b>
                            <br>
                            <%=categorias_por_id.get(i).getNombre()%>
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

        <%@include file="componentes/footer.html"%>
    </body>
</html>