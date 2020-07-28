<%@page import="Procesos.ProcesosComentario"%>
<%@page import="Procesos.ProcesosVideo"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="Entidades.Categoria"%>
<%@page import="Procesos.ProcesosCategoria"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.Anime"%>
<%@page import="Procesos.ProcesosAnime"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>

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
        <%@include file="componentes/header.jsp"%>
        <%@include file="componentes/menu_oculto.jsp"%>
        
        <section class="seccion_central">
        <% ProcesosAnime panime = new ProcesosAnime();
            String id_anime = request.getParameter("id_anime");
            if(request.getParameter("id_anime")!=null){
                int isDeleted = panime.eliminarAnime(id_anime);
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
            <%}else if(request.getParameter("nombre")!=null){
                
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
                    <h3>
                        <%
                            if (isSaved > 0){
                                out.print("¡Datos ingresados exitosamente!");
                            } else{}
                        %>
                    </h3>
                </div>
            <%}else{}%><!-- Fin del IF-ELSE -->


            <div id="listas_flex_1">
                <h1 id="titulo_listas_de_reproduccion">Panel de listas de reproducción</h1>
                <div id="listas_flex_2">
                    <a href="crear_lista.jsp" type="button" class="boton hierba">Crear lista</a>
                    <a href="index.jsp" type="button" class="boton chillin">Regresar</a>
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
                    <th colspan="3"></th>
                </tr>
                <%
                    ProcesosCategoria pcategoria = new ProcesosCategoria();
                    ProcesosVideo pvideo = new ProcesosVideo();
                    ProcesosComentario pcomentario = new ProcesosComentario();
                    List<Anime> animes = panime.consultarDatos();
                    List<Categoria> categorias_por_id = pcategoria.obtenerCategoriasDeAnimes(animes);
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
                        <td><%=animes.get(i).getCreated_at() %></td>
                        <td><%=animes.get(i).getUpdated_at() %></td>
                        <td><%=pvideo.consultarVistasPorAnime(animes.get(i).getId_anime()) %></td>
                        <td><%=pcomentario.consultarComentariosPorAnime(animes.get(i).getId_anime()) %></td>
                        <td>
                            <form method="POST" action="panel_de_videos.jsp">
                                <input class="input_escondido" type="text" name="id_anime" value=<%=animes.get(i).getId_anime()%>>
                                <input type="submit" value="Ver contenido" class="botonInput chillin"><br>
                            </form>
                        </td>
                        <td>
                            <form method="POST" action="editar_lista.jsp">
                                <input class="input_escondido" type="text" name="id_anime" value=<%=animes.get(i).getId_anime()%>>
                                <input type="submit" value="Editar" class="botonInput hierba"><br>
                            </form>
                        </td>
                        <td>
                            <form method="POST" action="panel_de_listas.jsp">
                                <input class="input_escondido" type="text" name="id_anime" value=<%=animes.get(i).getId_anime()%>>
                                <input tabindex="-1" type="submit" value="Eliminar" class="botonInput peligro"><br>
                            </form>
                        </td>

                    </tr>
                <%}%>
            </table>

        </section>

        <%@include file="componentes/footer.html"%>
    </body>
</html>