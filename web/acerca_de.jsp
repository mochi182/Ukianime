<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ukianime</title>
        <!--Carga CSS-->
        <link rel="stylesheet" href="css/estilos_comunes.css">
        <link rel="stylesheet" href="css/paginas/acerca_de.css">
        <link rel="stylesheet" href="css/componentes/menu_oculto.css">
        <link rel="stylesheet" href="css/componentes/header.css">
        <link rel="stylesheet" href="css/componentes/footer.css">

        <!--Carga librerías y archivos de JS-->
        <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <script src="js/menu_desplegable.js"></script>

        <!--Carga templates-->

    </head>

    <body>
    <%@include file="componentes/header.html"%>
    <%@include file="componentes/menu_oculto.html"%>

        <section class="seccion_central">
            <h1>Acerca de Nosotros</h1>
            <hr>
            <p> Ukianime se encarga de brindarte los mejores anime con un servicio de calidad, en el cual no tendrás problemas para encontrar los mejores animes.
                Cada cuenta te permite crear tres distintos perfiles los cuales cada uno tendrán sus distintas formas de administrar todo el contenido de Ukianime
                para asi siempre tener tus anime favorito con solo un click.
                El equipo de dearrollo que dio vida a ukianime está conformado por cinco jovenes estudiantes de la Universidad Tecnológica de Panamá el cual quieren brindar la mejor experiencia a todos los amantes del anime.
            </p>
        </section>

        <footer id="footer"></footer>
    </body>
</html>