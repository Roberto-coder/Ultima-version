package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import config.Conexion;
import java.sql.*;
import Utils.Encriptar;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">\n");
      out.write("        <link href=\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\" rel=\"stylesheet\" integrity=\"sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN\" crossorigin=\"anonymous\">\n");
      out.write("        <title>Log in</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container mt-5\">\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-sm\">\n");
      out.write("                    <form method=\"post\" action=\"login.jsp\">\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label>Usuario:</label>\n");
      out.write("                            <input type=\"text\" class=\"form-control\" name=\"usuario\" placeholder=\"Ingresa tu usuario\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label>Contraseña:</label>\n");
      out.write("                            <input type=\"password\" class=\"form-control\" name=\"password\" placeholder=\"Ingresa tu contraseña\">\n");
      out.write("                        </div>\n");
      out.write("                        <button type=\"submit\" class=\"btn btn-primary\" name=\"login\" >Iniciar sesion</button>\n");
      out.write("                    </form>\n");
      out.write("                    <br>\n");
      out.write("                    <form action=\"index.jsp\"> <button type=\"submit\" class=\"btn btn-primary\" name=\"regresar\">Regresar</button></form>\n");
      out.write("                    <br>\n");
      out.write("                    <form action=\"registrarse.jsp\"><button type=\"submit\" class=\"btn btn-primary\" name=\"registrarse\" >Registrarse</button></form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>   \n");
      out.write("    </body>\n");
      out.write("    ");

        if( request.getParameter("login")!=null ){
            String user=request.getParameter("usuario");
            String password=request.getParameter("password");
            HttpSession sesion=request.getSession();
            if(user.equals("admin") && password.equals("admin")){
                sesion.setAttribute("logueado", "1");
                sesion.setAttribute("user", user);
                response.sendRedirect("admin.jsp");
            }
            /*else{
                out.print("<div class=\"alert alert-danger\" role=\"alert\">Ingresaste el usuario o contraseña incorrectamente</div>");
            }*/
        }
        Connection con;
        Conexion cn = new Conexion();
        PreparedStatement ps;
        ResultSet rs;
        Encriptar enc=new Encriptar();
        if( request.getParameter("login")!=null ){
            String user=request.getParameter("usuario");
            String password=request.getParameter("password");
            HttpSession sesion=request.getSession();
            try{
                con = cn.getConnection();
                ps = con.prepareStatement("select * from `cliente` where usuario ='"+user+"'and Password='"+enc.getMD5(password)+"';");
                rs = ps.executeQuery();
                while(rs.next()){
                    sesion.setAttribute("logueado", "1");
                    sesion.setAttribute("user", rs.getString("usuario"));
                    sesion.setAttribute("id", rs.getString("idCliente"));
                    response.sendRedirect("carrito.jsp");
                }
                out.print("<div class=\"alert alert-danger\" role=\"alert\">Ingresaste el usuario o contraseña incorrectamente</div>");
            }catch(Exception e){
                 out.print("<div class=\"alert alert-danger\" role=\"alert\">Ingresaste el usuario o contraseña incorrectamente</div>");
            }
        }
        
    
      out.write("\n");
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
