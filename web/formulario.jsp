
<%@page import="Procesos.ProcesosRol"%>
<%@page import="Entidades.Rol"%>
<%@page import="Entidades.Info_de_pago"%>
<%@page import="Procesos.ProcesosInfo_de_pago"%>
<%@page import="Entidades.Usuario"%>
<%@page import="Procesos.ProcesosUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<h1>Revise su información: </h1>

<%  
    
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String fechanacimiento = request.getParameter("fechanacimiento");
    int telefono = Integer.parseInt(request.getParameter("telefono"));
    String region = request.getParameter("region");
    String email = request.getParameter("email");
    String usuariop = request.getParameter("usuario");
    String password = request.getParameter("password");
    
    Usuario usuario = new Usuario();
    usuario.setNombre(nombre);
    usuario.setApellido(apellido);
    usuario.setFecha_nacimiento(fechanacimiento);
    usuario.setTelefono(telefono);
    usuario.setPais(region);
    usuario.setCorreo(email);
    usuario.setUsuario(usuariop);
    usuario.setContrasena(password);
    
    
    ProcesosUsuario pusuario = new ProcesosUsuario();
    int isSaved = pusuario.guardarUsuario(usuario);
    
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
    
    
    Info_de_pago info_de_pago = new Info_de_pago ();
    info_de_pago.setTipo_de_cuenta(cuenta);
    info_de_pago.setMetodo_de_pago(metodo);
    info_de_pago.setTarjeta(tarjeta);
    info_de_pago.setCodigo_de_seguridad(seguridad);
    info_de_pago.setFecha_de_expiracion(expiracion);
    info_de_pago.setForma_de_cobro(cobro);
    
    
    
    ProcesosInfo_de_pago pinfopago = new ProcesosInfo_de_pago();
    int isSaved2 = pinfopago.guardarInfo_de_pago(info_de_pago);
    
    String rolp = request.getParameter("rol");
    
    Rol rol = new Rol();
    rol.setNombre(rolp);
    
    ProcesosRol guardarol = new ProcesosRol();
    int isSaved3 = guardarol.guardarRol(rol);
    
%>

<h3>Datos personales: </h3> </br>

<p>Nombre: <%= nombre %></p>
<p>Apellido: <%= apellido %></p>
<p>Fecha de nacimineto: <%= fechanacimiento %></p>
<p>telefono: <%= telefono %></p>
<p>Region: <%= region %></p>

<h3>Datos de la cuenta: </h3> </br>

<p>Email: <%= email %></p>
<p>Usuario: <%= usuariop %></p>
<p>contaseña: <%= password %></p>

<h3>Cuenta y metodo de pago: </h3> </br>

<p>Tipo de cuenta: <%= cuenta %></p>
<p>Metodo de pago: <%= metodo %></p>
<p>Tarjeta: <%= tarjeta1 %><%= tarjeta2 %><%= tarjeta3 %><%= tarjeta4 %></p>
<p>Seguridad: <%= seguridad %></p>
<p>Expiración  Fecha/dia:<%= fecha %>/<%= dia %></p>
<p>Forma de pagar: <%= cobro %></p>