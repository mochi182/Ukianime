<%@page import="Procesos.ProcesosCategoria"%>
<%@page import="Entidades.Categoria"%>
<%@page import="Procesos.ProcesosAnime"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.Anime"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ukianime</title>
    <!--Carga CSS-->
    <link rel="stylesheet" href="css/estilos_comunes.css">
    <link rel="stylesheet" href="css/paginas/menu.css">
    <link rel="stylesheet" href="css/componentes/menu_oculto.css">
    <link rel="stylesheet" href="css/componentes/header.css">
    <link rel="stylesheet" href="css/componentes/footer.css">
    <link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css"> <!--Carrusel-->

    <!--Carga librerías y archivos de JS-->
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script src="js/menu_desplegable.js"></script>
    <script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

</head>
<body class="">

    <%@include file="componentes/header.jsp"%>
    <%@include file="componentes/menu_oculto.jsp"%>
    
    Links para probar las páginas...
    <ul>
        <li><a href="panel_de_listas.jsp">Panel de listas</a></li>
        <li><a href="registro-usuario.jsp">Registrar usuario</a></li>
    </ul>

    <section class="seccion_central">
        <%
            
            List<Categoria> categorias = new ArrayList<Categoria>(); 
            ProcesosCategoria pcategoria = new ProcesosCategoria();
            
            categorias = pcategoria.consultarDatos();
            String busqueda = request.getParameter("busqueda");
            
            List<Anime> animes = new ArrayList<Anime>(); 
            ProcesosAnime panime = new ProcesosAnime();
            int categoria = 1;
            
            if (busqueda == null){ %>
                <div class="menu_contenedores">
                <% for(Categoria categoria_get: categorias){

                    animes = panime.consultarDatosPorCategoria(categoria_get.getId_categoria());%>
                    
                    <h1><%= categoria_get.getNombre()%></h1>
                    <section class="carousel" data-flickity='{ "wrapAround": true, "pageDots": false}'>
                        <div class="carousel-cell">

                            <% for(Anime anime_get: animes){ %>

                                <a class="cada_anime" href="descripcion_prueba.jsp?id_anime=<%= anime_get.getId_anime()%>">
                                    <img class="menu_imagen" src="<%= anime_get.getUrl_imagen()%>" alt="UK">
                                    <br>
                                    <b><%= anime_get.getNombre()%></b>
                                </a>
                            <% } %>
                        </div>

                    </section>
                    <%}%>
                </div>
            <%} else{
                    animes = panime.consultarDatosPorPalabra(busqueda);%>
                    
                    <div class="alertaBusqueda">
                        <h3>Resultado de la búsqueda: <%=busqueda%></h3>
                    </div>
                    <div class="carousel-cell">
                        <% for(Anime anime_get: animes){ %>

                            <div class="cada_anime">
                                <img class="menu_imagen" src="<%= anime_get.getUrl_imagen()%>" alt="UK">
                                <br>
                                <b><%= anime_get.getNombre()%></b>
                            </div>
                        <% } %>
                    </div>
                    <%
                    }
            %>

    </section>
    <%@include file="componentes/footer.html"%>            
</body>
</html>
