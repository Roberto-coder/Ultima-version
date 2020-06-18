<%-- 
    Document   : productos
    Created on : 11/06/2020, 08:38:16 PM
    Author     : roberto
--%>

<%@page import="controlador.Controlador"%>
<%@page import="config.Conexion"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <title>Productos</title>
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
                        <li><a href="#">Productos</a>
                            <%--<ul class="submenu">
                                <li><a href="categoria1.jsp">Boss</a></li>
                                <li><a href="categoria1.jsp">Humano</a></li>
                                <li><a href="categoria1.jsp">Demonio</a></li>
                                <li><a href="categoria1.jsp">Secreto</a></li>
                            </ul>--%>
                        </li>
                    </ul>
                </nav>
                <a class="nav-link" href="Controlador?accion=Carrito" style="font-size: 30px; color: yellowgreen; float: right; margin-right: 60px"><i class="fa fa-shopping-cart" aria-hidden="true"></i>(<label style="color: lavenderblush">${contador}</label>)Carrito</a>
            </header>

            <section id="slide1">

            </section > 
            <table style="margin-left: 130px; width:400px ">
                <th>
                    <input type="text" name="nombre" class="form-control" placeholder="Buscar por nombre">  
                </th>
                <th>
                    <input type="submit" value="Buscar" name="buscar" class="form-control btn btn-primary">
                </th>
            </table>
            <div class="container mt-2" >
                <div class="row">
                    <c:forEach var="p" items="${productos}">
                        <div class="col-sm-4" >
                            <div style="color: whitesmoke" class="card" id="objetos" margin-top: 10px">
                                <div class="card-header" style="font-size: 20px; text-align: center">
                                    <label>${p.getNombres()}</label>
                                </div>
                                <div class="card-body" style="text-align: center">
                                    <img src="${p.getFoto()}" width="150" height="150">
                                    <br>
                                    <b><i>$.${p.getPrecio()}</i></b>
                                </div>
                                <div class="card-footer text-center">
                                    <label>${p.getDescripcion()}</label>
                                    <div>
                                        <a href="Controlador?accion=AgregarCarrito&id=${p.getId()}" name="agregar" class=" btn btn-outline-info">Agregar al carrito</a>
                                        <a href="Controlador?accion=Comprar&id=${p.getId()}" name="adquirir" class=" btn btn-danger">Adquirir</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </body>
    <%
        HttpSession sesion = request.getSession();
        
        //String adquirir= request.getParameter("adquirir");
        
            if (request.getParameter("agregar")!= null&&sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")){
                response.sendRedirect("login.jsp");
            }
        
        Connection con;
        Conexion cn = new Conexion();
        PreparedStatement ps;
        ResultSet rs;
    %>
</html>
