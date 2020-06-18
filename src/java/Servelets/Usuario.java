package Servelets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import config.Conexion;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Usuario extends HttpServlet {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        try (PrintWriter out = response.getWriter()) {
            try {
                con = cn.getConnection();
                String query="SELECT * FROM `cliente` ";
                String where="where 1=1";
                String nombre=request.getParameter("nombre");
                if(nombre!=null){
                    //out.println(query);
                    //nombre=nombre.replaceAll("'", "\\\\'");
                    nombre=this.mysql_real_scape_string(nombre);
                    where=where+" and Nombre_cli='"+nombre+"' ";
                }
                query=query+where;
                ps = con.prepareStatement(query);
                rs = ps.executeQuery();
                while (rs.next()) {
                    out.print("<tr>"
                            + "<th scope=\"row\">" + rs.getString(1) + "</th>"
                            + "<th scope=\"row\">" + rs.getString(2) + "</th>"
                            + "<td>" + rs.getString(3) + "</td>"
                            + "<td>" + rs.getString(4) + "</td>"
                            + "<td>" + rs.getString(5) + "</td>"
                            + "<td>" + rs.getString(6) + "</td>"
                            + "<td>"
                            + "<a href=\"#\" ><i class=\"fa fa-pencil\" aria-hidden=\"true\"></i></a>"
                            + "<a href=\"#\" class=\"ml-1\"><i class=\"fa fa-trash\" aria-hidden=\"true\"></i></a>"
                            + "</td>"
                            + "</tr>"
                    );
                }
            } catch (Exception e) {
                out.print("error mysql " + e);
            }finally{
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

        }
    }
    public String mysql_real_scape_string( String texto){
        texto=texto.replaceAll("\\\\", "\\\\\\\\'");//comilla invertida 
        texto=texto.replaceAll("\\n", "\\\\n'");//retorno de linea
        texto=texto.replaceAll("\\r", "\\\\r'");//retorno de carro
        texto=texto.replaceAll("\\t", "\\\\t'");//tabuladores
        texto=texto.replaceAll("\\n", "\\\\n'");
        texto=texto.replaceAll("'", "\\\\'");
        return texto;
    }
    
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
