
<%@page import="controlador.Controlador"%>
<%@page import="config.Conexion"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>
<!DOCTYPE html>
<!DOCTYPE html>


<html>
    <head>
        <title>Doomshop</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div id="principal">
            <header>
                <div id="logo">
                    <img src="doom.jpg">
                </div>

                <nav id="navegacion">
                    <ul class="menu">
                        <li><a href="index.jsp">Inicio</a></li>
                        <li><a href="#">Nosotros</a></li>
                        <li><a href="Controlador?accion=home">Productos</a>
                           <%-- <ul class="submenu">
                                <li><a href="categoria1.jsp">Boss</a></li>
                                <li><a href="categoria1.jsp">Humano</a></li>
                                <li><a href="categoria1.jsp">Demonio</a></li>
                                <li><a href="categoria1.jsp">Secreto</a></li>
                            </ul>--%>
                        </li>
                    </ul>
                </nav> 
            </header>
            <%--<a class="nav-link" href="Controlador?accion=Carrito" style="font-size: 15px; color: yellowgreen; float: right"><i class="fas fa-shopping-cart">(<label style="color: lavenderblush">${contador}</label>)</i>Carrito</a>
            --%>
            <section id="slide">
                <img src="img/oferta.png" width="900" height="250">
            </section> 
            <form id="sesion" action="registrarse.jsp">
                <a href="login.jsp" style="color:chartreuse ;"><i class="fa fa-user-circle" aria-hidden="true"></i> Inicia Sesion</a>
                <br>
                <button  style=" color:highlighttext; width: 335px; height: 40px; font-size: 20px" class="btn btn-outline-danger my-2 my-sm-2 ml-2" type="submit"><b>Registrate</b></button>
            </form>
            <%
                Connection con;
                Conexion cn = new Conexion();
                PreparedStatement ps;
                ResultSet rs;
                try {
                    con = cn.getConnection();
                    ps = con.prepareStatement("Select * from producto where idTipo=" + 1);
                    rs = ps.executeQuery();
                    while (rs.next()) {

                    
            %>
            <section id = "categorias" class="col-sm-4">
                <section class="uno">
                    <h2><%= rs.getString(2)%></h2>
                    <p>
                        <%= rs.getString(4)%>
                    </p>
                    <img src="<%= rs.getString(3)%>" width="150" height="150">
                    <br>
                    <a href="Controlador?accion=home" class="leer-mas">Ver mas</a><br>
                </section>
            </section>
                <%
            }
        } catch (Exception e) {
            out.print("error mysql " + e);
        }
    %>
        </div>
    </body>
</html>
