<%@page import="Procesos.ProcesosUsuario"%>
<%@page import="Entidades.Usuario"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ukianime</title>
    <!--Carga CSS-->
    <link rel="stylesheet" href="css/estilos_comunes.css">
    <link rel="stylesheet" href="css/paginas/cuenta.css">
    <link rel="stylesheet" href="css/componentes/menu_oculto.css">
    <link rel="stylesheet" href="css/componentes/header.css">
    <link rel="stylesheet" href="css/componentes/footer.css">

    <!--Carga librerías y archivos de JS-->
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script src="js/menu_desplegable.js"></script>

    <!--Carga componentes-->

</head>

<body>
<%@include file="componentes/header.html"%>
<%@include file="componentes/menu_oculto.html"%>
<% ProcesosUsuario pusuario = new ProcesosUsuario();
    String id_usuario = "1";/* request.getParameter("id_usuario");  */
    Usuario usuario= pusuario.consultarDatosPorIDSinLista(id_usuario);
%>
<section class="seccion_central">
    <h1>Cuenta</h1>
    <hr>

    <div class="cuenta_div_flex_1">

        <p>Administración de cuenta:</p>

        <p  class="multilinea">
            <%=usuario.getNombre()%>
            <%=usuario.getApellido()%>
            <%=usuario.getRegion()%>
            <%=usuario.getEmail()%>
            <%=usuario.getContrasena()%>
            <%=usuario.getFecha_nacimiento()%>
            <%=usuario.getTelefono()%>
            <%=usuario.getId_rol()%>


        </p>


        <p class="info-cuenta multilinea">Cambiar correo de la cuenta>
            Cambiar contraseña
            Cambiar datos personales
            <a href="panel_de_videos.html">Administrar sitio</a>
            Actualizar métodos de pago
            Historial de facturación
            Cancelación de la membresia
            Eliminar Cuenta
        </p>
    </div>

    <h1>Perfiles</h1>
    <hr>

    <div class="cuenta_div_flex_2">
        <div class="cuenta_div_flex_3">
            <img src="https://www.kindpng.com/picc/m/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png" id="icono_perfil">
            <span>Alejandro</span>
        </div>

        <div class="cuenta_div_flex_3">
            <img src="https://www.kindpng.com/picc/m/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png" id="icono_perfil">
            <span>Francisco</span>
        </div>

        <div class="cuenta_div_flex_3">
            <img src="https://www.kindpng.com/picc/m/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png" id="icono_perfil">
            <span>Ernesto</span>
        </div>

        <button class="boton cuidao">Editar Perfiles</button>
        <button class="boton cuidao">+ Agregar nuevo perfil</button>
        <button class="boton cuidao">Eliminar perfil </button>
    </div>
</section>

<footer id="footer"></footer>
</body>
</html>