<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.Categoria"%>
<%@page import="Procesos.ProcesosCategoria"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>

<div id="sideNavigation" class="sidenav">
    <a href="javascript:void(1)" class="closebtn" onclick="closeNav()">&times;</a>
    <a class="texto_menu_oculto" href="index.jsp">Inicio</a>
    <a href="acerca_de.jsp">Acerca de</a>
    <a href="contacto.jsp">Contacto </a>
    <a href="#"></a>Categorias </a>

    <%
        List<Categoria> categorias_menu_oculto = new ArrayList<Categoria>(); 
        ProcesosCategoria pcategoria_menu_oculto = new ProcesosCategoria();
        
        categorias_menu_oculto = pcategoria_menu_oculto.consultarDatos();
    %>
    <ul class="cuadrocategoria">
        <%for (Categoria categoria_get: categorias_menu_oculto){ %>
            <li>
                <a href="index.jsp?busqueda=<%=categoria_get.getNombre()%>"><%=categoria_get.getNombre()%></a>
            </li>
        <%}%>
    </ul>
</div>