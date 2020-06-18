<%@page import="Utils.Encriptar"%>
<%@page import="config.Conexion"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <script src="js/validar.js" type="text/javascript"></script>
        <title>Usuario</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")){
                response.sendRedirect("login.jsp");
            }
        Connection con=null;
        Conexion cn = new Conexion();
        Statement st=null;
        Encriptar enc=new Encriptar();
        %>
        <div class="container mt-5"> 
            <div class="row"> 
                <div class="col-sm"> 
                    <form action="datosUsuario.jsp" method="post" class="form-register" onsubmit="return validar();> 
                        <div class="form-group"> 
                            <label >User</label> 
                            <input type="text" class="form-control" name="user"  value="<%=sesion.getAttribute("user")%>" placeholder="user" required> 
                        </div> 
                        <div class="form-group"> 
                            <label >Password</label> 
                            <input type="text" class="form-control" name="password1"  placeholder="password" required> 
                        </div> 
                        <div class="form-group"> 
                            <label >Respita su password</label> 
                            <input type="text" class="form-control" name="password2"  placeholder="Repita su password" required> 
                        </div> 
                        <button type="submit" name="guardar" class="btn btn-primary">Guardar</button> 
                    </form> 
                </div> 
            </div> 
        </div> 
        <%
            if (request.getParameter("guardar") != null) {
                    
                    String user = request.getParameter("user");
                    String pword1 = request.getParameter("password1");
                    String pword2 = request.getParameter("password2");
                    if (pword1.equals(pword2))  {
                            try {
                                con = cn.getConnection();
                                st = con.createStatement();
                                st.executeUpdate("update cliente set usuario='" + user + "', Password='" + enc.getMD5(pword1) + "' where idCliente='" + sesion.getAttribute("id")+ "';");
                                sesion.setAttribute("user", user);
                                response.sendRedirect("carrito.jsp");
                            } catch (Exception e) {
                                out.print(e);
                            }
                        }else{
                        out.print("Las contraseñas no coinciden");
                    }
                    
                }
        %>
    </body> 

</body>
</html>
