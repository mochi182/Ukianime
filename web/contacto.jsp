<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Ukianime</title>
        <!--Carga CSS-->
        <link rel="stylesheet" href="css/estilos_comunes.css">
        <link rel="stylesheet" href="css/paginas/contacto.css">
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
            <h1>Contacto</h1>
            <hr>
            <div id="contenido_de_contacto">
                <ul>
                    <li>Ciudad de Chitr�, provincia de Herrera, Panam�</li>
                    <li>Tel�fono 1:(507) 274-2042</li>
                    <li>Tel�fono 2:(507) 250-8434</li>
                    <li>E-mail: ukianime@outlook.com</li>
                </ul>
        
                <h2>Mensaje</h2>
                
                <p>Escriba su notificaci�n</p>
        
                <textarea id="caja_de_comentarios" rows="5" cols="50"></textarea>
                <p>
                    <button class="boton peligro">Cancelar</button>
                    <button class="boton chillin">Enviar</button>
                </p>
            </div>
        </section>

        <%@include file="componentes/footer.html"%> 
    </body>
</html>