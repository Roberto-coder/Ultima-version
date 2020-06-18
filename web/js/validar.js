function validar(){
    var nombre,apellido,direccion,correo,usuario,password,targeta,expresion,user,password1;
    nombre=document.getElementById("nombre").value;
    apellido=document.getElementById("apellido").value;
    direccion=document.getElementById("direccion").value;
    correo=document.getElementById("correo").value;
    usuario=document.getElementById("usuario").value;
    password=document.getElementById("password").value;
    targeta=document.getElementById("targeta").value;
    password=document.getElementById("password1").value;
    user=document.getElementById("user").value;
expresion = /\w+@\w+\.+[a-z]/;

    if(nombre==="" || apellido==="" || direccion==="" || correo==="" || usuario==="" || password==="" || targeta==="" || user==="" || password1===""){
        alert("Todos los campos son obligatorios");
        return false;
    }else if(nombre.length>45){
        alert("Nombre muy largo");
        return false;
    }else if(apellido.length>45){
        alert("Apellido muy largo");
        return false;
    }else if(direccion.length>80){
        alert("Direccion muy larga");
        return false;
    }else if(correo.length>80){
        alert("Correo muy largo");
        return false;
    }else if(!expresion.test(correo)){
        alert("Correo invalido");
        return false;
    }else if(usuario.length>20){
        alert("Usuario muy largo");
        return false;
    }else if(password.length>20){
        alert("Contraseña muy larga");
        return false;
    }else if(targeta.length!==5){
        alert("El codigo tiene que ser de 5 caracteres");
        return false;
    }else if(password1.length>20){
        alert("Contraseña muy larga");
        return false;
    }else if(user.length>20){
        alert("Contraseña muy larga");
        return false;
    }
}

