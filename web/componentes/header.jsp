<%@page import="Procesos.ProcesosUsuario"%>
<%@page import="Entidades.Usuario"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>

<section id="contenido_de_header">

    <div id="tercio_1">
        <a href="#" onclick="openNav()">
            <img src="https://icongr.am/fontawesome/bars.svg?size=25&color=ffffff" alt="menu_burger">
        </a>

        <a class="inicio" href="index.jsp">
            <img src="https://i.imgur.com/bYacHHK.png" alt="logo" id="logo">
            <span id="titulo">Ukianime</span>
        </a> 
    </div>

    <div id="tercio_2">
        <form method="POST" action="index.jsp" style="margin:0px;">
            <div class="busqueda">
                <img src="https://icongr.am/clarity/search.svg?color=ffffff&size=15px" alt="lupa" class="lupa">
                <input  autocomplete="off" name="busqueda" type="search" placeholder="Buscar..." class="search1" id="input_busqueda">
                <input type="submit" value="Buscar" class="input_escondido">
            </div>
        </form>
    </div>
    
    <%
        Usuario usuario_header = new Usuario();
        ProcesosUsuario pusuario_header = new ProcesosUsuario();
        usuario_header = pusuario_header.consultarPrimerUsuario();
    
    %>
    <div id="tercio_3">
        <h4 id="mi_lista"><%= usuario_header.getUsuario() %></h4> 
            <img src="https://www.kindpng.com/picc/m/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png" id="icono_perfil" onclick="clic_perfil()">
    </div>
    
    <div id="menu_usuario">
        <a href="cuenta.jsp">Cuenta</a>
        <p>
            <a href="panel_de_listas.jsp">Administrar sitio</a>
        </p>
        <hr>
        <a href="login.jsp">Cerrar sesión</a>
    </div>
    
    <script>
        function clic_perfil(){
            document.getElementById("menu_usuario").style.display ="inline";
        }
        function clic_cerrar_perfil(){
            document.getElementById("menu_usuario").style.display ="none";
        }
        document.body.addEventListener('click', clic_cerrar_perfil, true);
    </script>

</section>
