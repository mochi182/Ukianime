<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="Entidades.Usuario"%>
<%@page import="Entidades.Rol"%>
<%@page import="Entidades.Info_de_pago"%>
<%@page import="java.util.List"%>
<%@page import="Procesos.ProcesosUsuario"%>
<%@page import="Procesos.ProcesosInfo_de_pago"%>
<%@page import="Procesos.ProcesosRol"%>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio - Ukianime</title>
    <link rel="stylesheet" href="css/paginas/login.css">
    <link rel="stylesheet" href="css/estilos_comunes.css">
</head>
<body class="fondo-uki">
    <%  

        String control = request.getParameter("control");
        String verifica_login = request.getParameter("verifica_login");

        ProcesosUsuario pusuario = new ProcesosUsuario();
        List<Usuario> usuarios = pusuario.consultarDatos();

        if(control!=null) {
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String fechanacimiento = request.getParameter("fechanacimiento");
            String telefono = request.getParameter("telefono");
            String region = request.getParameter("region");
            String email = request.getParameter("email");
            String usuariop = request.getParameter("usuario");
            String password = request.getParameter("password");
            String cuenta = request.getParameter("cuenta");
            String metodo = request.getParameter("metodo");
            String tarjeta = request.getParameter("tarjeta");
            String seguridad_string = request.getParameter("seguridad");
            Integer seguridad = new Integer(0);
            seguridad = Integer.parseInt(seguridad_string);
            String expiracion =  request.getParameter("expiracion");
            String cobro = request.getParameter("cobro");
            ProcesosInfo_de_pago pinfopago = new ProcesosInfo_de_pago();

            Usuario usuario = new Usuario();

            usuario.setNombre(nombre);
            usuario.setApellido(apellido);
            usuario.setFecha_nacimiento(fechanacimiento);
            usuario.setTelefono(telefono);
            usuario.setRegion(region); 
            usuario.setEmail(email);
            usuario.setUsuario(usuariop);
            usuario.setContrasena(password);
            int isSaved = pusuario.guardarUsuario(usuario);

            Usuario ultimo_usuario = pusuario.consultarUsuarioPorUsuario(usuario.getUsuario());

            Info_de_pago info_de_pago = new Info_de_pago();
            info_de_pago.setId_usuario(ultimo_usuario.getId_usuario());
            info_de_pago.setTipo_de_cuenta(cuenta);
            info_de_pago.setMetodo_de_pago(metodo);
            info_de_pago.setTarjeta(tarjeta);
            info_de_pago.setCodigo_de_seguridad(seguridad);
            info_de_pago.setFecha_de_expiracion(expiracion);
            info_de_pago.setForma_de_cobro(cobro);

            int isSaved2 = pinfopago.guardarInfo_de_pago(info_de_pago);
        }else{
            if(verifica_login==null){}
            else{
                String email_login = request.getParameter("email");
                String password_login = request.getParameter("password");

                for(Usuario get_usuario: usuarios){
                    if((email_login.equals(get_usuario.getEmail()))&(password_login.equals(get_usuario.getContrasena()))){
                        %> <script>window.location.href = 'index.jsp'</script><%
                    }
                }
                %>
                    <div class="alertaRoja ">
                        <h3>Información incorrecta</h3>
                    </div>
                <%}
        }

    %>

    <div class="contenedor-form">
        <div class="player" id="lMFJZQYSHY0"></div>
        <br>
        <br>
        <br>
        <img src="https://i.imgur.com/bYacHHK.png" alt="" class="logo">
        <h1 class="titulo">Ukianime</h1>
        <br>
        <p>Si aún no tienes cuenta</p>
        <input type="button" value="Regístrate" class="botonr" onclick="location.href='registro-usuario.jsp'">
    </div>
    <div class="contenedor-form2">
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <h1>Bienvenido</h1>
        <div class="formulario">
            <p>Ingrese sus datos</p>
            <form action="login.jsp" method="POST">
                <input type="email" placeholder="Correo Electrónico" name="email">
                <input type="password" placeholder="Contraseña" name="password">
                <input type="text" class="input_escondido" name="verifica_login" value="1">
                <input type="submit" value="Iniciar Sesión">

            </form>
        </div>
    </div>
<script id="embed" src="js/embed_script.js"></script>
</body>
</html>
