package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import controlador.Controlador;
import config.Conexion;
import java.sql.*;
import java.util.*;
import java.text.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Doomshop</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">\n");
      out.write("        <link href=\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\" rel=\"stylesheet\" integrity=\"sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN\" crossorigin=\"anonymous\">\n");
      out.write("        <link href=\"css/style.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div id=\"principal\">\n");
      out.write("            <header>\n");
      out.write("                <div id=\"logo\">\n");
      out.write("                    <img src=\"doom.jpg\">\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <nav id=\"navegacion\">\n");
      out.write("                    <ul class=\"menu\">\n");
      out.write("                        <li><a href=\"index.jsp\">Inicio</a></li>\n");
      out.write("                        <li><a href=\"#\">Nosotros</a></li>\n");
      out.write("                        <li><a href=\"Controlador?accion=home\">Productos</a>\n");
      out.write("                           ");
      out.write("\n");
      out.write("                        </li>\n");
      out.write("                    </ul>\n");
      out.write("                </nav> \n");
      out.write("            </header>\n");
      out.write("            ");
      out.write("\n");
      out.write("            <section id=\"slide\">\n");
      out.write("                <img src=\"img/oferta.png\" width=\"900\" height=\"250\">\n");
      out.write("            </section> \n");
      out.write("            <form id=\"sesion\" action=\"registrarse.jsp\">\n");
      out.write("                <a href=\"login.jsp\" style=\"color:chartreuse ;\"><i class=\"fa fa-user-circle\" aria-hidden=\"true\"></i> Inicia Sesion</a>\n");
      out.write("                <br>\n");
      out.write("                <button  style=\" color:highlighttext; width: 335px; height: 40px; font-size: 20px\" class=\"btn btn-outline-danger my-2 my-sm-2 ml-2\" type=\"submit\"><b>Registrate</b></button>\n");
      out.write("            </form>\n");
      out.write("            ");

                Connection con;
                Conexion cn = new Conexion();
                PreparedStatement ps;
                ResultSet rs;
                try {
                    con = cn.getConnection();
                    ps = con.prepareStatement("Select * from producto where idTipo=" + 1);
                    rs = ps.executeQuery();
                    while (rs.next()) {

                    
            
      out.write("\n");
      out.write("            <section id = \"categorias\" class=\"col-sm-4\">\n");
      out.write("                <section class=\"uno\">\n");
      out.write("                    <h2>");
      out.print( rs.getString(2));
      out.write("</h2>\n");
      out.write("                    <p>\n");
      out.write("                        ");
      out.print( rs.getString(4));
      out.write("\n");
      out.write("                    </p>\n");
      out.write("                    <img src=\"");
      out.print( rs.getString(3));
      out.write("\" width=\"150\" height=\"150\">\n");
      out.write("                    <br>\n");
      out.write("                    <a href=\"Controlador?accion=home\" class=\"leer-mas\">Ver mas</a><br>\n");
      out.write("                </section>\n");
      out.write("            </section>\n");
      out.write("                ");

            }
        } catch (Exception e) {
            out.print("error mysql " + e);
        }
    
      out.write("\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
