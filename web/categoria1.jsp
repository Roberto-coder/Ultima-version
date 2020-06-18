<%-- 
    Document   : categoria1
    Created on : 5/06/2020, 02:16:51 AM
    Author     : roberto
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Boss</title>
    </head>
    <body>
    <section class="post-list">
        <div class="content">
            <c:forEach var="p" items="${productos}">
            <article class="card">
                <div class="card-header">
                    <h2>${p.getNombres()}</h2>
                </div>
                <div class="card-body">
                <span>
                    precio| stock
                </span>
                <div class="post-img-1"></div>
                
                </div>
                <div class="card-footer text-center">
                <p>Descripcion</p>
                <a href="" class="post-link">Comprar</a>
                <a href="" class="btn btn-outline-info">Comprar</a>
                </div>
            </article>

            <article class="post">
            <div class="post-header">
                <div class="post-img-2"></div>
                </div>
                <div class="post-body">
                <span> precio| stock</span>
                <h2>Producto2</h2>
                <p>Descripcion</p>
                <a href="">Adquirir</a>
            </div>
            </article>

            <article class="post">
                <div class="post-header">
                <div class="post-img-3"></div>
                </div>
                <div class="post-body"><span>
                     precio| stock
                </span>
                <h2>Producto 3</h2>
                <p>Descripcion</p>
                <a href="">Adquirir</a>
                </div>
            </article>
        </div>
    </section>
<style>
*{
  margin-left:0;
  padding: 0;
  box-sizing: border-box;
}

body{
  font-family: sans-serif;
}

.post-list{
  display: flex;
  min-height: 100vh;
  align-items: center;
  justify-content: center;
  padding: 30px 15px;
}

.content{
  display: grid;
  grid-template-columns: repeat(3,1fr);
  grid-gap: 20px;
  max-width: 1000px;
  margin:auto;
}

.post-img-1{
  background: url(../img/post.jpg);
  width: 100%;
  height:200px;
  background-size: cover;
  background-position: center;
  transition: .2s;
}

.post-img-2{
  background: url(../img/post1.jpg);
  width: 100%;
  height:200px;
  background-size: cover;
  background-position: center;
  transition: .2s;
}

.post-img-3{
  background: url(../img/post2.jpg);
  width: 100%;
  height:200px;
  background-size: cover;
  background-position: center;
  transition: .2s;
}

.post{
  box-shadow: 0 1px 6px 1px rgba(0,0,0,1);
  transition: .2s;
}

.post:hover{
  transform: translateY(-4px);
  box-shadow: 0 1px 14px 2px rgba(0,0,0,.15);
}

.post-header{
  width: 100%;
  height: 200px;
  overflow: hidden;
  cursor:pointer;
}

.post-img-1,
.post-img-2,
.post-img-3{
  transform: scale(1.1);
}

.post-body .post-link{
  display: block;
  text-decoration: none;
  padding: 10px;
  background: #2b6ebb;
  color: #fff;
  width: 50%;
  margin: auto;
  border-radius: 20px;
  box-shadow: 1px 2px 6px 1px rgba(0,0,0,.1);
  transition: .2s;
}

.post-body .post-link:hover{
  background: #2b6ebb;
  box-shadow: 1px 2px 6px 1px rgba(0,0,0,.2);  
  transform: translateY(-2px);
}

@media (max-width: 840px){
  .content{
    grid-template-columns: repeat(2, 1fr)
  }
}

@media (max-width: 600px){
  .content{
    grid-template-columns: repeat(1, 1fr)
  }
}  
</style>
    </body>
</html>
