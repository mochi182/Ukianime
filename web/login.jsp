<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="Entidades.Usuario"%>
<%@page import="Entidades.Rol"%>
<%@page import="Entidades.Info_de_pago"%>
<%@page import="java.util.List"%>
<%@page import="Procesos.ProcesosUsuario"%>
<%@page import="Procesos.ProcesosInfo_de_pago"%>
<%@page import="Procesos.ProcesosRol"%>
<!DOCTYPE html>

<%  
    
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String fechanacimiento = request.getParameter("fechanacimiento");
    int telefono = Integer.parseInt(request.getParameter("telefono"));
    String region = request.getParameter("region");
    String email = request.getParameter("email");
    String usuariop = request.getParameter("usuario");
    String password = request.getParameter("password");
    
    
    String cuenta = request.getParameter("cuenta");
    String metodo = request.getParameter("metodo");
    String tarjeta = request.getParameter("tarjeta");
    int seguridad = Integer.parseInt(request.getParameter("seguridad"));
    String expiracion =  request.getParameter("expiracion");
    String cobro = request.getParameter("cobro");
    
    ProcesosUsuario pusuario = new ProcesosUsuario();
    ProcesosInfo_de_pago pinfopago = new ProcesosInfo_de_pago();

    if(request.getParameter("control")==null) {
    }
    else {
    

    Usuario usuario = new Usuario();
    
    usuario.setNombre(nombre);
    usuario.setApellido(apellido);
    usuario.setFecha_nacimiento(fechanacimiento);
    usuario.setTelefono(telefono);
    usuario.setRegion(region); 
    usuario.setEmail(email);
    usuario.setUsuario(usuariop);
    usuario.setContrasena(password);



    Info_de_pago info_de_pago = new Info_de_pago ();
    info_de_pago.setTipo_de_cuenta(cuenta);
    info_de_pago.setMetodo_de_pago(metodo);
    info_de_pago.setTarjeta(tarjeta);
    info_de_pago.setCodigo_de_seguridad(seguridad);
    info_de_pago.setFecha_de_expiracion(expiracion);
    info_de_pago.setForma_de_cobro(cobro);

    int isSaved = pusuario.guardarUsuario(usuario);
    int isSaved2 = pinfopago.guardarInfo_de_pago(info_de_pago);
    
    }
    
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio - Ukianime</title>
    <link rel="stylesheet" href="css/paginas/login.css">
    <link rel="stylesheet" href="css/estilos_comunes.css">
</head>
<body class="fondo-uki">
    <div class="contenedor-form">
        <img src="https://i.imgur.com/bYacHHK.png" alt="" class="logo">
        <h1 class="titulo">Ukianime</h1>
        <br>
        <br>
        <p>Si aún no tienes cuenta</p>
        <input type="button" value="Regístrate" class="botonr" onclick="location.href='registro-usuario.jsp'">
    </div>
    <div class="contenedor-form2">
        <h2>BIENVENIDO</h2>
        <div class="formulario">
            <p>Ingrese sus datos</p>
            <form action="login.jsp" method="POST">
                <input type="email" placeholder="Correo Electronico" name="email" required>
                <input type="password" placeholder="Contraseña" name="password" required>

                <input type="submit" value="Iniciar Sesión">

            </form>
        </div>
    </div>
</body>
</html>
