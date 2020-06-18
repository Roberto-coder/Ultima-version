
package modeloDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import modelo.Carrito;
import modelo.Compra;

public class CompraDAO {
    
    Connection con;
    Conexion cn=new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    int r=0;
   /* 
    public String IdCompras(){ 
        String idcompras=""; 
        String sql="select max(IdCompras) from compras"; 
         try { 
            con=cn.getConnection(); 
            ps=con.prepareStatement(sql); 
            rs=ps.executeQuery(); 
             while (rs.next()) { 
                 idcompras=rs.getString(1); 
             } 
         } catch (Exception e) { 
        } 
         return idcompras; 
     } 
*/
    
    public int GenerarCompra(Compra compra){
        int idcompras;
        String sql="insert into compras(idCliente,idPago,FechaCompras,Monto,Estado)values(?,?,?,?,?);";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.setInt(1, compra.getCliente().getId());
            ps.setInt(2, compra.getIdpago());
            ps.setString(3, compra.getFecha());
            ps.setDouble(4, compra.getMonto());
            ps.setString(5, compra.getEstado());
            
            r=ps.executeUpdate();
            
            sql="Select @@IDENTITY AS idCompras";//ultima compra
            rs=ps.executeQuery(sql);
            rs.next();
            idcompras=rs.getInt("idCompras");
            rs.close();
            //recorrer datos de la lista detalle compras
            for (Carrito detalle : compra.getDetallecompras()) {
                sql="insert into detalle_compras(idProducto,idCompras,Cantidad,PrecioCompra)values(?,?,?,?);";
                ps=con.prepareStatement(sql);
                ps.setInt(1,detalle.getIdProducto());
                ps.setInt(2, idcompras);
                ps.setInt(3,detalle.getCantidad());
                ps.setDouble(4, detalle.getPrecioCompra());
                r=ps.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println("e");
        }
        return r;
    }
}
