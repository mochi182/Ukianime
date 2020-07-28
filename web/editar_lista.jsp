<%@page import="Entidades.Anime"%>
<%@page import="Procesos.ProcesosAnime"%>
<%@page import="Entidades.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="Procesos.ProcesosCategoria"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ukianime</title>
        <!--Carga CSS-->
        <link rel="stylesheet" href="css/estilos_comunes.css">
        <link rel="stylesheet" href="css/paginas/crud_subir_editar.css">
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
        <%
            ProcesosAnime panime = new ProcesosAnime();
            Anime anime_get = new Anime();
            String id_anime = request.getParameter("id_anime");
            anime_get = panime.consultarDatosPorID(id_anime);
            
            if(request.getParameter("nombre")!=null){
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
                int isUpdated = panime.actualizarAnime(anime, anime_get.getId_anime());
                anime_get = panime.consultarDatosPorID(id_anime);
        %>
                <div class="alertaVerde">
                    <h3>
                        <%
                            if (isUpdated > 0){
                                out.print("¡Datos actualizados exitosamente!");
                            } else{}
                        %>
                    </h3>
                </div>
            <%}else{}%><!-- Fin del IF-ELSE -->
        
            <h1>Editar lista de reproducción</h1>
            <hr>
            <form method="POST" action="editar_lista.jsp">
                <input class="input_escondido" type="text" name="id_anime" value=<%=anime_get.getId_anime()%>>
                <div id="subir_video_flex_1">
                    <div id="subir_video_flex_2">
                        <img id="preview_crear_lista" src=<%=anime_get.getUrl_imagen()%> alt="e1">
                        <p>
                            Cartelón
                        </p>
                    </div>
                    <div id="subir_video_flex_3">
                        <div id="titulo_y_descripcion_listas">
                            <p>Información básica</p>
                            <hr>
                            <p>
                                Nombre *
                                <br>
                                <input name="nombre" type="text" required value="<%=anime_get.getNombre()%>">
                            </p>
                            <p>
                                Descripción
                                <br>
                                <textarea name="descripcion" rows="15"><%=anime_get.getDescripcion()%></textarea>
                            </p>
                            <%
                                ProcesosCategoria pcategoria = new ProcesosCategoria();
                                List<Categoria> categorias = pcategoria.consultarDatos();
                            %>
                            <p>
                                Categoría *
                                <br>
                                <select name="id_categoria" id="play_list_categoria" required>
                                    <% for(Categoria opcion_categoria: categorias){%>
                                        <option value=<%= opcion_categoria.getId_categoria() %> <%
                                            if(opcion_categoria.getId_categoria()==anime_get.getId_categoria()){
                                            %> selected <%}
                                        %>><%= opcion_categoria.getNombre() %></option>
                                    <%}%>
                                </select>
                            </p>
                            <p>
                                Cartelón *
                                <br>
                                <input name="url_imagen" type="text" required value="<%=anime_get.getUrl_imagen()%>">
                            </p>
                        </div>
                        <div id="subseccion_de_botones">
                            <input type="submit" value="Listo" class="botonInput hierba min_width_124px"><br>
                            <a href="panel_de_listas.jsp" type="button" class="boton peligro">Regresar</a>
                        </div>
                    </div>
                </div>
            </form>
            
            
        </section>

        <%@include file="componentes/footer.html"%>
    </body>
</html>