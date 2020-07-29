<%@page import="Procesos.ProcesosUsuario"%>
<%@page import="Entidades.Usuario"%>

<%@page contentType="text/html;charset=UTF-8" language="java" %>

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

    <!--Carga librerÃ­as y archivos de JS-->
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script src="js/menu_desplegable.js"></script>
</head>

<body>
<%@include file="componentes/header.jsp"%>
<%@include file="componentes/menu_oculto.jsp"%>

<% ProcesosUsuario pusuario = new ProcesosUsuario();
    String id_usuario = "1";/* request.getParameter("id_usuario");  */
    Usuario usuario= pusuario.consultarDatosPorIDSinLista(id_usuario);
%>
<section class="seccion_central">
    <h1>Cuenta</h1>
    <hr>

    <div class="cuenta_div_flex_1">

        <table>
            <tr>
                <th colspan='2'>Datos:</th>
            </tr>
            <tr>
                <td>Nombre:</td>
                <td><%=usuario.getNombre()%></td>
            </tr>
            <tr>
                <td>Apellido:</td>
                <td><%=usuario.getApellido()%></td>
            </tr>
            <tr>
                <td>Región:</td>
                <td><%=usuario.getRegion()%></td>
            </tr>
            <tr>
                <td>Correo electrónico:</td>
                <td><%=usuario.getEmail()%></td>
            </tr>
            <tr>
                <td>Contraseña:</td>
                <td><%=usuario.getContrasena()%></td>
            </tr>
            <tr>
                <td>Fecha de nacimiento:</td>
                <td><%=usuario.getFecha_nacimiento()%></td>
            </tr>
            <tr>
                <td>Teléfono:</td>
                <td><%=usuario.getTelefono()%></td>
            </tr>
        </table>

        <p class="info-cuenta multilinea">Cambiar correo de la cuenta>
            Cambiar contraseña
            Cambiar datos personales
            Actualizar métodos de pago
            Historial de facturación
            Cancelación de la membresía
            Eliminar Cuenta
        </p>
    </div>

    <!--
    <h1>Perfiles del grupo</h1>
    <hr>

    <div class="cuenta_div_flex_2">
        
        <div class="cuenta_div_flex_3">
            <img src="https://www.kindpng.com/picc/m/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png" id="icono_perfil">
            <span>Francisco</span>
        </div>
        
        <div class="cuenta_div_flex_3">
            <img src="https://www.kindpng.com/picc/m/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png" id="icono_perfil">
            <span>Alejandro</span>
        </div>

        <div class="cuenta_div_flex_3">
            <img src="https://www.kindpng.com/picc/m/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png" id="icono_perfil">
            <span>Ernesto</span>
        </div>

        <button class="boton cuidao">Editar Perfiles</button>
        <button class="boton cuidao">+ Agregar nuevo perfil</button>
        <button class="boton cuidao">Eliminar perfil </button> 
    </div>-->
</section>

<%@include file="componentes/footer.html"%>
</body>
</html>