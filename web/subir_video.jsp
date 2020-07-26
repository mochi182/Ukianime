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
    </head>

    <body>
        <%@include file="componentes/header.html"%>
        <%@include file="componentes/menu_oculto.html"%>

        <section class="seccion_central">
            <h1>Subir video</h1>
            <hr>
            <form method="POST" action="panel_de_videos.jsp">
                <div id="subir_video_flex_1">
                    <div id="subir_video_flex_3">
                        <div id="titulo_y_descripcion_videos">
                            <p>Información básica</p>
                            <hr>
                            <p>
                                Episodio *
                                <br>
                                <input name="episodio" type="number" required>
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
                                URL del video *
                                <br>
                                <input name="url_video" type="text" required>
                            </p>
                            <p>
                                Lista de reproducción *
                                <br>
                                <select name="id_anime" id="playlist_subir_video" required>
                                    <option value="3">Beastars</option>
                                    <option value="2">Rurouni Kenshin</option>
                                    <option value="1">Haikyuu!!</option>
                                </select>
                            </p>
                            <p>
                                Etiquetas
                                <br>
                                <input type="text">
                            </p>
                        </div>
                        <div id="subseccion_de_botones">
                            <input type="submit" value="Listo" class="botonInput hierba"><br>
                            <a href="panel_de_videos.jsp" type="button" class="boton peligro">Cancelar</a>
                        </div>
                    </div>
                </div>
            </form>
        </section>

        <%@include file="componentes/footer.html"%>
    </body>
</html>