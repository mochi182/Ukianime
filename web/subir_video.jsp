<%@page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
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

        <!--Carga templates-->
        <script>
        $(function(){
            $("#header").load("https://raw.githubusercontent.com/mochi182/Ukianime/master/web/componentes/header.html"); 
        });
        $(function(){
            $("#footer").load("https://raw.githubusercontent.com/mochi182/Ukianime/master/web/componentes/footer.html"); 
        });
        $(function(){
            $("#menu_oculto").load("https://raw.githubusercontent.com/mochi182/Ukianime/master/web/componentes/menu_oculto.html"); 
        });
        </script>
    </head>

    <body>
        <header id="header"></header>
        <div id="menu_oculto"></div>

        <section class="seccion_central">
            <h1>Subir video</h1>
            <hr>
            <form method="POST" action="panel_de_videos.jsp">
                <div id="subir_video_flex_1">
                    <div id="subir_video_flex_2">
                        <p>
                            Lista de reproducción
                            <br>
                            <select name="id_anime" id="playlist_subir_video">
                                <option value="3">Beastars</option>
                                <option value="2">Rurouni Kenshin</option>
                                <option value="1">Haikyuu!!</option>
                            </select>
                        </p>
                    </div>
                    <div id="subir_video_flex_3">
                        <div id="titulo_y_descripcion_videos">
                            <div id="barra_de_cargar"></div>
                            <h2>Cargando</h2>
                            <p>Información básica</p>
                            <hr>
                            <p>
                                Episodio
                                <br>
                                <input name="episodio" type="number">
                            </p>
                            <p>
                                Título
                                <br>
                                <input name="nombre" type="text">
                            </p>
                            <p>
                                Descripción
                                <br>
                                <textarea name="descripcion" rows="15"></textarea>
                            </p>
                            <p>
                                Video
                                <br>
                                <input name="url_video" type="text">
                            </p>
                            <p>
                                Etiquetas
                                <br>
                                <input type="text">
                            </p>
                        </div>
                        <div id="subseccion_de_botones">
                            <input type="submit" value="Listo" class="boton hierba"><br>
                            <a href="panel_de_videos.html" type="button" class="boton hierba">Listo</a>
                            <a href="panel_de_videos.html" type="button" class="boton peligro">Cancelar</a>
                        </div>
                    </div>
                </div>
            </form>
        </section>

        <footer id="footer"></footer>
    </body>
</html>