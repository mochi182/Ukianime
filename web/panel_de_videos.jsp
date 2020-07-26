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
            <div id="panel_flex_1">
                <h1>Panel de videos</h1>
                <div id="panel_flex_2">
                    <select name="playlist" id="playlist_panel">
                        <option value="beastars">Beastars</option>
                        <option value="rurouni_kenshin">Rurouni Kenshin</option>
                        <option value="neon_genesis_evangelion">Neon Genesis Evangelion</option>
                    </select>
                    <a href="subir_video.html" type="button" class="boton hierba">Subir video</a>
                    <a href="panel_de_listas.html" type="button" class="boton chillin">Administrar listas</a>
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
                <tr>
                    <td>
                        <img class="vista_previa" src="https://maroon-prod.s3.amazonaws.com/media/CACHE/images/photos/2020/04/19/beatars/ce09d947a4dc92f740c51383fc3a057b.jpg" alt="e1">
                    </td>
                    <td class="texto_alineado_iz">
                        <b>Episodio 1. La luna y la bestia.</b>
                        <br>
                        Playlist: Beastars
                    </td>
                    <td>23/5/2018</td>
                    <td>254</td>
                    <td>0</td>
                    <td>
                        <a href="editar_video.html" type="button" class="boton hierba">Editar</a>
                    </td>
                    <td>
                        <a href="#" type="button" class="boton peligro">Eliminar</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <img class="vista_previa" src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/ea914385-70d7-476d-aa3b-37d0c449c464/ddjjy49-1412208c-a189-4ce6-8f3f-53be03b1ea7a.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvZWE5MTQzODUtNzBkNy00NzZkLWFhM2ItMzdkMGM0NDljNDY0XC9kZGpqeTQ5LTE0MTIyMDhjLWExODktNGNlNi04ZjNmLTUzYmUwM2IxZWE3YS5qcGcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.BqfadImymrEuC_AtcOTixzAJJi0gsPlxOyQ1_eoSoUo" alt="e2">
                    </td>
                    <td class="texto_alineado_iz">
                        <b>Episodio 2. Los alfas de la academia.</b>
                        <br>
                        Playlist: Beastars
                    </td>
                    <td>23/5/2018</td>
                    <td>278</td>
                    <td>0</td>
                    <td>
                        <a href="#" type="button" class="boton hierba">Editar</a>
                    </td>
                    <td>
                        <a href="#" type="button" class="boton peligro">Eliminar</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <img class="vista_previa" src="https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/ea914385-70d7-476d-aa3b-37d0c449c464/ddshe8r-f8ac8773-c7cb-43e5-8c41-fb7e48caded4.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvZWE5MTQzODUtNzBkNy00NzZkLWFhM2ItMzdkMGM0NDljNDY0XC9kZHNoZThyLWY4YWM4NzczLWM3Y2ItNDNlNS04YzQxLWZiN2U0OGNhZGVkNC5qcGcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.H73TA-Y7aCUdUxhVuzQd70JRCmflssqhN4som4OyOXs" alt="e3">
                    </td>
                    <td class="texto_alineado_iz">
                        <b>Episodio 3. Nace un lobo.</b>
                        <br>
                        Playlist: Beastars
                    </td>
                    <td>23/5/2018</td>
                    <td>312</td>
                    <td>1</td>
                    <td>
                        <a href="#" type="button" class="boton hierba">Editar</a>
                    </td>
                    <td>
                        <a href="#" type="button" class="boton peligro">Eliminar</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <img class="vista_previa" src="https://vignette.wikia.nocookie.net/beastars-eng/images/f/f2/04-4.jpg/revision/latest?cb=20191024031122" alt="e4">
                    </td>
                    <td class="texto_alineado_iz">
                        <b>Episodio 4. Darlo todo.</b>
                        <br>
                        Playlist: Beastars
                    </td>
                    <td>23/5/2018</td>
                    <td>275</td>
                    <td>0</td>
                    <td>
                        <a href="#" type="button" class="boton hierba">Editar</a>
                    </td>
                    <td>
                        <a href="#" type="button" class="boton peligro">Eliminar</a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <img class="vista_previa" src="https://vignette.wikia.nocookie.net/beastars/images/b/bd/Episodio_05.jpg/revision/latest/scale-to-width-down/200?cb=20191107030203&path-prefix=es" alt="e5">
                    </td>
                    <td class="texto_alineado_iz">
                        <b>Episodio 5. Las dos campanas.</b>
                        <br>
                        Playlist: Beastars
                    </td>
                    <td>23/5/2018</td>
                    <td>402</td>
                    <td>1</td>
                    <td>
                        <a href="#" type="button" class="boton hierba">Editar</a>
                    </td>
                    <td>
                        <a href="#" type="button" class="boton peligro">Eliminar</a>
                    </td>
                </tr>

            </table>

        </section>

        <footer id="footer"></footer>
    </body>
</html>