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
    <link href="css/paginas/formulario.css" rel="stylesheet" type="text/css"/>
    <link href="css/estilos_comunes.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <h1 class="principal">Revise su información: </h1> <br>

<%  
    
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String fechanacimiento = request.getParameter("fechanacimiento");
    String telefono = request.getParameter("telefono");   
    String region = request.getParameter("region");
    String email = request.getParameter("email");
    String usuariop = request.getParameter("usuario");
    String password = request.getParameter("password");
    String rol = "Normal";
    
    
    String slash="/";
    String cuenta = request.getParameter("cuenta");
    String metodo = request.getParameter("metodo");
    String tarjeta1 = request.getParameter("tarjeta1");
    String tarjeta2 = request.getParameter("tarjeta2");
    String tarjeta3 = request.getParameter("tarjeta3");
    String tarjeta4 = request.getParameter("tarjeta4");
    String tarjeta = tarjeta1+tarjeta2+tarjeta3+tarjeta4;
    int seguridad = Integer.parseInt(request.getParameter("seguridad"));
    String fecha = request.getParameter("fecha");
    String dia = request.getParameter("dia");
    String expiracion =  fecha+slash+dia;
    String cobro = request.getParameter("cobro");
    
%>

<h3 class="titulos">Datos personales: </h3> </br>

<form method="POST" action="login.jsp"> 
    
    <h1 class="resul">Nombre:<span  class="paraspan"><%= nombre %></span></h1> <br>
    <input type="text" name="nombre" class="input_escondido" value="<%= nombre %>">

    <h1 class="resul">Apellido:<span class="paraspan"><%= apellido %></span></h1><br>
    <input type="text" name="apellido" class="input_escondido" value="<%= apellido %>">

    <h1 class="resul">Fecha de nacimineto: <span class="paraspan"><%= fechanacimiento %></span></h1><br>
    <input type="text" name="fechanacimiento" class="input_escondido" value="<%= fechanacimiento %>">

    <h1 class="resul">Telefono:<span class="paraspan"><%= telefono %></span></h1><br>
    <input type="text" name="telefono" class="input_escondido" value="<%= telefono %>">

    <h1 class="resul">Region: <span class="paraspan" > <%= region %></span></h1><br><br>
    <input type="text" name="region" class="input_escondido" value="<%= region %>">

    <h3 class="titulos">Datos de la cuenta: </h3> </br>

    <h1 class="resul">Email: <span class="paraspan"> <%= email %></span></h1><br>
    <input type="text" name="email" class="input_escondido" value="<%= email %>">

    <h1 class="resul">Usuario:<span class="paraspan"> <%= usuariop %></span></h1><br>
    <input type="text" name="usuario" class="input_escondido" value="<%= usuariop %>">

    <h1 class="resul">Contraseña:<span class="paraspan"> <%= password %></span></h1><br>
    <input type="text" name="password" class="input_escondido" value="<%= password %>">

    <h1 class="resul">Su rol:<span class="paraspan"> <%= rol %></span></h1><br><br>

    <h3 class="titulos">Cuenta y metodo de pago: </h3> </br>

    <h1 class="resul">Tipo de cuenta:<span class="paraspan"><%= cuenta %></span></h1> <br>
    <input type="text" name="cuenta" class="input_escondido" value="<%= cuenta %>">

    <h1 class="resul">Metodo de pago:<span class="paraspan"><%= metodo %></span></h1> <br>
    <input type="text" name="metodo" class="input_escondido" value="<%= metodo %>">

    <h1 class="resul">Tarjeta:<span class="paraspan"> <%= tarjeta %></span></h1> <br>
    <input type="text" name="tarjeta" class="input_escondido" value="<%= tarjeta %>">

    <h1 class="resul">Seguridad: <span class="paraspan"><%= seguridad %></span></h1><br>
    <input type="text" name="seguridad" class="input_escondido" value="<%= seguridad %>">


    <h1 class="resul">Expiración[Fecha/dia]:<span class="paraspan"> <%= expiracion %></span></h1> <br>
    <input type="text" name="expiracion" class="input_escondido" value="<%= expiracion %>">

    <h1 class="resul">Forma de pagar: <span class="paraspan"> <%= cobro %></span></h1> <br>
    <input type="text" name="cobro" class="input_escondido" value="<%= cobro %>">


    <input type="submit" value="Registrarme" name="control" class="botonaceptar">
</form>
<br>
<br>
<div class="resul">
<a href="registro-usuario.jsp" style="color: white;" > Regresar </a>
</div>

</body>
</html>