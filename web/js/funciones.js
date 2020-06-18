$(document).ready(function (){
    $("#btnDelete").click(function (){
        var idp=$(this).parent().find("#idp").val();
        eliminar(idp);
    });
    
    function eliminar(idp){
        var url="Controlador?accion=Delete";
        $.ajax({
            type: 'POST',
            url: url,
            data: "idp="+idp,
            succes:function(data, textStatus, jqXHR){
                alert("Registro eliminado!");
            }
        });
    }
    
    $("tr #Cantidad").click(function(){
        var idp=$(this).parent().find("#idpro").val();
        var cantidad=$(this).parent().find("#Cantidad").val();
        var url ="Controlador?accion=ActualizarCantidad";
        $.ajax({
            type: 'POST',
            url: url,
            data:"idp="+idp+"&Cantidad="+cantidad,
            succes:function(data,textStatus,jqXHR){
               location.href="Controlador?accion=Carrito";
            }
        });
    });
    
});