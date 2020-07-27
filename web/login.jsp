<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="Entidades.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="Procesos.ProcesosUsuario"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio</title>
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
                <%
                    ProcesosUsuario pUsuario = new ProcesosUsuario();
                    List<Usuario> usuarios = pUsuario.consultarDatos();
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");
                    System.out.println("email");
                    
                    
                    
                    for(Usuario usuario : usuarios) {
                        if((email == usuario.getEmail())&&(password == usuario.getContrasena()))
                        {
                %> <p>Entrar</p> <% response.sendRedirect("subir_video.jsp");
                            break;
                        }
                        else
                        {
                            %> <p>Usuario o contraseña incorrecta</p> <%
                        }
                    }
                    
                %>
            </form>
        </div>
    </div>
</body>
</html>