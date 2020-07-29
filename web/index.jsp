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
   
    <section class="seccion_central">
        <%
            
            List<Categoria> categorias = new ArrayList<Categoria>(); 
            ProcesosCategoria pcategoria = new ProcesosCategoria();
            
            categorias = pcategoria.consultarDatos();
            String busqueda = request.getParameter("busqueda");
            
            List<Anime> animes = new ArrayList<Anime>(); 
            ProcesosAnime panime = new ProcesosAnime();
            int categoria = 1;
            String gradiente_a1="linear-gradient(0deg, rgba(68,68,68,1) 0%, rgba(199,138,157,1) 24%, rgba(101,130,226,1) 87%)";
            String gradiente_a2="linear-gradient(0deg, rgba(68,68,68,1) 0%, rgba(199,138,157,1) 24%, rgba(129,101,226,1) 87%)";
            String gradiente_a3="linear-gradient(0deg, rgba(68,68,68,1) 0%, rgba(199,138,157,1) 24%, rgba(208,101,226,1) 87%)";
            String gradiente_a4="linear-gradient(0deg, rgba(68,68,68,1) 0%, rgba(199,138,157,1) 24%, rgba(226,101,134,1) 87%)";
            String gradiente_a5="linear-gradient(0deg, rgba(68,68,68,1) 0%, rgba(199,138,157,1) 24%, rgba(101,226,210,1) 87%)";
            List<String> colores = new ArrayList<String>();
            colores.add(gradiente_a1);
            colores.add(gradiente_a2);
            colores.add(gradiente_a3);
            colores.add(gradiente_a4);
            colores.add(gradiente_a5);
            String gradiente_b="linear-gradient(0deg, rgba(49,49,49,1) 0%, rgba(49,49,49,0.8932949888939951) 10%, rgba(49,49,49,0.6019784622833508) 23%, rgba(49,49,49,0) 100%)";
            
            if (busqueda == null){ %>
                <div class="menu_contenedores">
                <% for(Categoria categoria_get: categorias){

                    animes = panime.consultarDatosPorCategoria(categoria_get.getId_categoria());%>
                    
                    <h1 class='titulo_categoria'><%= categoria_get.getNombre()%></h1>
                    <div class="carousel-bg">
                        <section class="carousel" data-flickity='{ "wrapAround": true, "pageDots": false, "prevNextButtons": false, "groupCells": true}'>

                                <% for(Anime anime_get: animes){ %>

                                    <a class="cada_anime carousel-cell" href="descripcion.jsp?id_anime=<%= anime_get.getId_anime()%>&id_categoria=<%= anime_get.getId_categoria()%>">
                                        <div class="menu_imagen" alt="UK" style='background-image: <%=colores.get((int)(Math.random()*5)) %>, url("<%=anime_get.getUrl_imagen()%>"), <%= gradiente_b %>; background-blend-mode: overlay, saturation;'><h3><%= anime_get.getNombre()%></h3></div>
                                    </a>
                                <% } %>

                        </section>
                    </div>
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
                                <div class="menu_imagen" alt="UK" style='background-image: <%=colores.get((int)(Math.random()*5)) %>, url("<%=anime_get.getUrl_imagen()%>"), <%= gradiente_b %>; background-blend-mode: overlay, saturation;'><h3><%= anime_get.getNombre()%></h3></div>
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
