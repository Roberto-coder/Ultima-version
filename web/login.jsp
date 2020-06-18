<%@page import="config.Conexion"%>
<%@page import="java.sql.*"%>
<%@page import="Utils.Encriptar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Log in</title>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form method="post" action="login.jsp">
                        <div class="form-group">
                            <label>Usuario:</label>
                            <input type="text" class="form-control" name="usuario" placeholder="Ingresa tu usuario">
                        </div>
                        <div class="form-group">
                            <label>Contraseña:</label>
                            <input type="password" class="form-control" name="password" placeholder="Ingresa tu contraseña">
                        </div>
                        <button type="submit" class="btn btn-primary" name="login" >Iniciar sesion</button>
                    </form>
                    <br>
                    <form action="index.jsp"> <button type="submit" class="btn btn-primary" name="regresar">Regresar</button></form>
                    <br>
                    <form action="registrarse.jsp"><button type="submit" class="btn btn-primary" name="registrarse" >Registrarse</button></form>
                </div>
            </div>
        </div>   
    </body>
    <%
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
        
    %>
</html>
