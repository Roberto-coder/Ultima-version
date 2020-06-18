<%-- 
    Document   : registrarse
    Created on : 31/05/2020, 01:23:47 PM
    Author     : roberto
--%>
<%@page import="Utils.Encriptar"%>
<%@page import="config.Conexion"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <script src="js/validar.js" type="text/javascript"></script>
        <title>Registro</title>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form method="post" action="registrarse.jsp" class="form-register" onsubmit="return validar();">
                        <div class="form-group">
                            <label>Nombre:</label>
                            <input type="text" class="form-control" name="nombre" id="nombre" placeholder="Ingresa tu nombre" required>
                        </div>
                        <div class="form-group">
                            <label>Apellido</label>
                            <input type="text" class="form-control" name="apellido" id="apellido" placeholder="Ingresa tu apellido" required>
                        </div>
                        <div class="form-group">
                            <label>Direccion:</label>
                            <input type="text" class="form-control" name="direccion" id="direccion" placeholder="Ingresa tu direccion" required>
                        </div>
                        <div class="form-group">
                            <label>Correo:</label>
                            <input type="email" class="form-control" name="correo" id="correo" placeholder="Ingresa tu correo" required>
                        </div>
                        <div class="form-group">
                            <label>Usuario:</label>
                            <input type="text" class="form-control" name="usuario" id="usuario" placeholder="Ingresa tu usuario" required>
                        </div>
                        <div class="form-group">
                            <label>Contraseña:</label>
                            <input type="password" class="form-control" name="password" id="password" placeholder="Ingresa tu contraseña" required>
                        </div>
                        <div class="form-group">
                            <label>Targeta:</label>
                            <input type="text" class="form-control" name="targeta" id="targeta" placeholder="Ingresa tu num de targeta" required>
                        </div>
                        <button type="submit" class="btn btn-primary" name="enviar" >Registrarse</button>
                    </form>
                    
                    
                    <br>
                    <form action="index.jsp" > <button type="submit" class="btn btn-primary" name="regresar">Regresar</button></form>
                    <br>
                    <form action="login.jsp" ><button type="submit" class="btn btn-primary" name="registrarse">Iniciar sesion</button></form>
                </div>
            </div>
        </div> 
        <%
            if(request.getParameter("enviar")!=null){
                String nombre =request.getParameter("nombre");
                String apellido =request.getParameter("apellido");
                String direccion =request.getParameter("direccion");
                String correo =request.getParameter("correo");
                String usuario =request.getParameter("usuario");
                String password =request.getParameter("password");
                String targeta =request.getParameter("targeta");
            
            Connection con=null;
            Conexion cn = new Conexion();
            Statement st=null;
            Encriptar enc=new Encriptar();
            try{
                con = cn.getConnection();
                st = con.createStatement();
                st.executeUpdate("Insert into cliente(Nombre_cli,Appat_cli,direccion,correo_cli,usuario,Password,codigo_targeta) values('"+nombre+"','"+apellido+"','"+direccion+"','"+correo+"','"+usuario+"','"+enc.getMD5(password)+"','"+targeta+"')");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }catch(Exception e){
                out.print(e);
                
            }
            }
        %>
    </body>
</html>
