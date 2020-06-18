

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect("login.jsp");
            }

        %>
        <div class="container mt-5">
            <div class="row">
                <div class="container"> 
                    <nav class="navbar navbar-light bg-dark"> 
                        <a class="navbar-brand" style="color: yellow">Clientes y productos</a> 
                        <form class="form-inline" action="logout.jsp"> 
                            <a href="datosUsuario.jsp" type="submit" style="color: lightskyblue"><i class="fa fa-user-circle" aria-hidden="true" style="color: lightskyblue"></i> <%= sesion.getAttribute("user")%></a> 
                            <button class="btn btn-outline-danger my-2 my-sm-0 ml-2">Log out</button> 
                        </form> 
                    </nav> 
                    <div class="row mt-2"> 

                        <div class="col-sm">
                            <form action="admin.jsp" method="get">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col" class="text-center"></th>
                                            <th colspan="4" scope="col" class="text-center">
                                                <input  type="text" name="nombre" class="form-control"/>
                                            </th>
                                            <th scope="col" class="text-center">
                                                <input type="submit" value="Buscar" name="buscarcli" class="form-control btn bg-primary"/>
                                            </th>
                                            <th></th>
                                            <th scope="col" >
                                                <a href="crear.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i></a>
                                            </th>
                                        </tr>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th scope="col">Nombre</th>
                                            <th scope="col">Appat</th>
                                            <th scope="col">Direccion</th>
                                            <th scope="col">Correo</th>
                                            <th scope="col">Usuario</th>
                                            <th scope="col">Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <jsp:include page="Usuario"/>
                                    </tbody>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
