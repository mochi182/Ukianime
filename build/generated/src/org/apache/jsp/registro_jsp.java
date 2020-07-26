package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class registro_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"UTF-8\">\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("    <title>Document</title>\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"css/paginas/estilo-registro.css\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>    \r\n");
      out.write("    <div class=\"tab\">\r\n");
      out.write("      <button class=\"tablinks\" onclick=\"pestana(event, 'Personales')\">1. Datos Personales</button>\r\n");
      out.write("      <button class=\"tablinks\" onclick=\"pestana(event, 'Cuenta')\">2. Datos de la cuenta</button>\r\n");
      out.write("      <button class=\"tablinks\" onclick=\"pestana(event, 'Pago')\">3. Mï¿½todo de pago</button>\r\n");
      out.write("    </div>\r\n");
      out.write("    <form id=\"formulario\" class=\"formulario\" method=\"POST\" action=\"formulario.jsp\">\r\n");
      out.write("\r\n");
      out.write("        <section id=\"Personales\" class=\"tabcontent\">\r\n");
      out.write("            <div class=\"contenido\">\r\n");
      out.write("                    <h3>PASO 1 - DATOS PERSONALES</h3>\r\n");
      out.write("                        <input type=\"text\" name=\"nombre\" id=\"nombre\" placeholder=\"Nombre\" required>\r\n");
      out.write("                        <input type=\"text\" name=\"apellido\" id=\"apellido\" placeholder=\"Apellido\" required>\r\n");
      out.write("                        <input type=\"date\" name=\"fechanacimiento\" id=\"Fechanacimiento\" min=\"1920-04-08\" max=\"2015-04-08\" required>\r\n");
      out.write("                        <input type=\"text\" name=\"telefono\" class=\"telefono\" placeholder=\"Telï¿½fono\" required>\r\n");
      out.write("                        <p>Seleccione su region: </p>\r\n");
      out.write("                        <label><input type=\"radio\" id=\"region\" name=\"region\" name=\"region\" value=\"Norteamerica\"> Norteamerica</label> <br>\r\n");
      out.write("                        <label><input type=\"radio\" id=\"region\" name=\"region\" name=\"region\" value=\"Latinoamerica\"> Latinoamerica</label> <br>\r\n");
      out.write("                        <label><input type=\"radio\" id=\"region\" name=\"region\" name=\"region\" value=\"Europa\"> Europa</label> <br>\r\n");
      out.write("\r\n");
      out.write("                        \r\n");
      out.write("                    \r\n");
      out.write("                        <input type=\"button\" value=\"Siguiente\" onclick=\"pestana(event, 'Cuenta')\">\r\n");
      out.write("                        <a href=\"login.html\" class=\"salir\">Salir</a>\r\n");
      out.write("            </div>       \r\n");
      out.write("        </section>\r\n");
      out.write("    \r\n");
      out.write("        <section id=\"Cuenta\" class=\"tabcontent\">\r\n");
      out.write("            <div class=\"contenido\">\r\n");
      out.write("                <h3>PASO 2 - DATOS DE LA CUENTA</h3>\r\n");
      out.write("                    <input type=\"email\" id=\"email\" name=\"email\" placeholder=\"Correo Electronico\" required>\r\n");
      out.write("                    <input type=\"text\" id=\"usuario\" name=\"usuario\" placeholder=\"Usuario\" required>\r\n");
      out.write("                    <input type=\"password\" id=\"password\" name=\"password\" placeholder=\"Contraseï¿½a\" required>\r\n");
      out.write("                    <input type=\"password\" id=\"password2\" name=\"password2\" placeholder=\"Repetir Contraseï¿½a\" required>\r\n");
      out.write("                \r\n");
      out.write("                    <input type=\"button\" value=\"siguiente\"  onclick=\"pestana(event, 'Pago')\">\r\n");
      out.write("                    <a class=\"salir\" onclick=\"pestana(event, 'Personales')\"> Regresar </a>\r\n");
      out.write("                    <a href=\"login.html\" class=\"salir\" >Salir</a>\r\n");
      out.write("            </div>\r\n");
      out.write("        </section>\r\n");
      out.write("    \r\n");
      out.write("        <section id=\"Pago\" class=\"tabcontent\">\r\n");
      out.write("            <div class=\"contenido\">\r\n");
      out.write("                <h3>PASO 3 - DATOS DE LA CUENTA</h3>\r\n");
      out.write("\r\n");
      out.write("                <p style=\"text-align: left; font-size: 20px;\">Tipo de cuenta</p>\r\n");
      out.write("                <input type=\"radio\" id=\"cuenta\" class=\"cuenta\" name=\"cuenta\" value=\"basica\">\r\n");
      out.write("                <label for=\"Basica\">Basica...   20.00$</label><br>\r\n");
      out.write("                <input type=\"radio\" id=\"cuenta\" class=\"cuenta\" name=\"cuenta\" value= \"Premiun\">\r\n");
      out.write("                <label for=\"Premiun\">Premiun... 50.00$</label><br>\r\n");
      out.write("\r\n");
      out.write("                <p style=\"text-align: left; font-size: 20px;\">Metodo de Pago</p>\r\n");
      out.write("                <input type=\"radio\" id=\"metodo\" class=\"metodo\" name=\"metodo\" value=\"Visa\" required>\r\n");
      out.write("                <label for=\"Visa\">Visa</label><br>\r\n");
      out.write("                <input type=\"radio\" id=\"metodo\" class=\"metodo\" name=\"metodo\" value= \"MasterCard\" required>\r\n");
      out.write("                <label for=\"MasterCard\">MasterCard</label><br>\r\n");
      out.write("\r\n");
      out.write("                <p style=\"text-align: center; font-size: 20px;\">Nï¿½mero de tarjeta</p> <br>\r\n");
      out.write("                <input type=\"text\" id=\"tarjeta\" name=\"tarjeta1\" class=\"tarke\" placeholder=\"xxxx\" maxlength=\"4\" required>\r\n");
      out.write("                <input type=\"text\" id=\"tarjeta\" name=\"tarjeta2\" class=\"tarke\" placeholder=\"xxxx\" maxlength=\"4\" required>\r\n");
      out.write("                <input type=\"text\" id=\"tarjeta\" name=\"tarjeta3\" class=\"tarke\" placeholder=\"xxxx\" maxlength=\"4\" required>\r\n");
      out.write("                <input type=\"text\" id=\"tarjeta\" name=\"tarjeta4\" class=\"tarke\" placeholder=\"xxxx\" maxlength=\"4\" required>\r\n");
      out.write("\r\n");
      out.write("                \r\n");
      out.write("                <input type=\"text\" id=\"seguridad\" name=\"seguridad\" class=\"tarke1\" placeholder=\"xxxxxx\" maxlength=\"6\" required>\r\n");
      out.write("\r\n");
      out.write("                <input type=\"text\" id=\"fecha\" name=\"fecha\" class=\"tarkes\" placeholder=\"dï¿½a\" maxlength=\"2\" required>\r\n");
      out.write("                <span>/</span>\r\n");
      out.write("                <input type=\"text\" id=\"dia\" name=\"dia\" class=\"tarkes\" placeholder=\"aï¿½o\" maxlength=\"2\" required> <br>\r\n");
      out.write("\r\n");
      out.write("                <span class=\"textoag\">Codigo de Seguridad </span>    \r\n");
      out.write("                <span class=\"textoag\">Fecha de Expiraciï¿½n </span>\r\n");
      out.write("                <br>\r\n");
      out.write("\r\n");
      out.write("                <p style=\"text-align: left; font-size: 20px;\">Forma de cobro</p>\r\n");
      out.write("                <input type=\"radio\" id=\"cobro\" class=\"manual\" name=\"cobro\" value=\"Manual\" required>\r\n");
      out.write("                <label for=\"Manual\">Manual</label><br>\r\n");
      out.write("                <input type=\"radio\" id=\"cobro\" class=\"automatico\" name=\"cobro\" value= \"Automatico\" required>\r\n");
      out.write("                <label for=\"Automï¿½tico\">Automï¿½tico</label><br>\r\n");
      out.write("\r\n");
      out.write("                <input type=\"submit\" value=\"Registrarme\" onclick=\"boton_loco()\">\r\n");
      out.write("\r\n");
      out.write("                <a class=\"salir\" onclick=\"pestana(event, 'Cuenta')\"> Regresar </a>\r\n");
      out.write("                <a href=\"login.html\" class=\"salir\">Salir</a>\r\n");
      out.write("            </div>\r\n");
      out.write("        </section>\r\n");
      out.write("        \r\n");
      out.write("    </form>\r\n");
      out.write("    \r\n");
      out.write("    <script src=\"js/script-registro.js\"></script>\r\n");
      out.write("    <script>\r\n");
      out.write("        function boton_loco(){\r\n");
      out.write("            window.location.href = 'menu.html';\r\n");
      out.write("        }\r\n");
      out.write("    </script>\r\n");
      out.write("    <script src=\"js/formulario.js\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
