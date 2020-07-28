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

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/paginas/formulario.css" rel="stylesheet" type="text/css"/>
        <title>Confirmacion</title>
    </head>
    <body>
        <h1 class="centrarrrr">Su usuario fue creado exitosamente!</h1> <br>
     
        <button type="button" class="botonaceptar" onclick="location.href='login.jsp'" value="Cerrar Sesion">Aceptar</button>
    </body>
</html>
