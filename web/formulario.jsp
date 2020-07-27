<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="Procesos.ProcesosRol"%>
<%@page import="Entidades.Rol"%>
<%@page import="Entidades.Info_de_pago"%>
<%@page import="Procesos.ProcesosInfo_de_pago"%>
<%@page import="Entidades.Usuario"%>
<%@page import="Procesos.ProcesosUsuario"%>
<!DOCTYPE html>

<html>
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario</title>
    <link rel="stylesheet" href="css/paginas/estilo-registro.css">
    <link rel="stylesheet" href="css/paginas/formulario.css">
</head>
<body>
    <h1 class="principal">Revise su información: </h1> <br>

<%  
    
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String fechanacimiento = request.getParameter("fechanacimiento");
    int telefono = Integer.parseInt(request.getParameter("telefono"));
    String region = request.getParameter("region");
    String email = request.getParameter("email");
    String usuariop = request.getParameter("usuario");
    String password = request.getParameter("password");
    String rol = "Normal";
    
    
    String slash="/";
    String guion="-";
    String cuenta = request.getParameter("cuenta");
    String metodo = request.getParameter("metodo");
    String tarjeta1 = request.getParameter("tarjeta1");
    String tarjeta2 = request.getParameter("tarjeta2");
    String tarjeta3 = request.getParameter("tarjeta3");
    String tarjeta4 = request.getParameter("tarjeta4");
    String tarjeta = tarjeta1+guion+tarjeta2+guion+tarjeta3+guion+tarjeta4;
    int seguridad = Integer.parseInt(request.getParameter("seguridad"));
    String fecha = request.getParameter("fecha");
    String dia = request.getParameter("dia");
    String expiracion =  fecha+slash+dia;
    String cobro = request.getParameter("cobro");
    
%>

<h3 class="titulos">Datos personales: </h3> </br>

<h1 class="resul">Nombre:<span class="paraspan"> <%= nombre %></span></h1> <br>
<h1 class="resul">Apellido:<span class="paraspan"> <%= apellido %></span></h1><br>
<h1 class="resul">Fecha de nacimineto: <span class="paraspan"><%= fechanacimiento %></span></h1><br>
<h1 class="resul">Telefono:<span class="paraspan"><%= telefono %></span></h1><br>
<h1 class="resul">Region: <span class="paraspan"><%= region %></span></h1><br><br>

<h3 class="titulos">Datos de la cuenta: </h3> </br>

<h1 class="resul">Email: <span class="paraspan"> <%= email %></span></h1><br>
<h1 class="resul">Usuario:<span class="paraspan"> <%= usuariop %></span></h1><br>
<h1 class="resul">Contraseña:<span class="paraspan"> <%= password %></span></h1><br>
<h1 class="resul">Rol:<span class="paraspan"> <%= rol %></span></h1><br><br>

<h3 class="titulos">Cuenta y metodo de pago: </h3> </br>

<h1 class="resul">Tipo de cuenta:<span class="paraspan"><%= cuenta %></span></h1> <br>
<h1 class="resul">Metodo de pago:<span class="paraspan"><%= metodo %></span></h1> <br>
<h1 class="resul">Tarjeta:<span class="paraspan"> <%= tarjeta1 %><%= tarjeta2 %><%= tarjeta3 %><%= tarjeta4 %></span></h1> <br>
<h1 class="resul">Seguridad: <span class="paraspan"><%= seguridad %></span></h1><br>
<h1 class="resul">Expiración[Fecha/dia]:<span class="paraspan"> <%= fecha %>/<%= dia %></span></h1> <br>
<h1 class="resul">Forma de pagar: <span class="paraspan"> <%= cobro %></span></h1> <br>

<input type="button" onclick="location.href='login.jsp'" value="Aceptar" name="control">
    <% 
    
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
</form>
<br>
<br>
<div class="resul">
<a href="registro-usuario.jsp" style="color: white;" > Regresar </a>
</div>

</body>
</html>