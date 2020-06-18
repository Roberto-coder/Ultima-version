package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Cliente buscar(String id) {
        Cliente c = new Cliente();
        String sql = "Select * from cliente where idCliente=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                c.setId(rs.getInt(1));
                c.setNombre(rs.getString(2));
                c.setAppat(rs.getString(3));
                c.setDireccion(rs.getString(4));
                c.setCorreo(rs.getString(5));
                c.setUsuario(rs.getString(6));
                c.setPassword(rs.getString(7));
                c.setC_targeta(rs.getString(8));

            }
        } catch (Exception e) {
        }
        return c;
    }

    public List listar() {
        String sql = "select * from cliente";
        List<Cliente> lista = new ArrayList<>();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cliente cl = new Cliente();
                cl.setId(rs.getInt(1));
                cl.setNombre(rs.getString(2));
                cl.setAppat(rs.getString(3));
                cl.setDireccion(rs.getString(4));
                cl.setCorreo(rs.getString(5));
                cl.setUsuario(rs.getString(6));
                cl.setC_targeta(rs.getString(7));
                lista.add(cl);
            }
        } catch (Exception e) {
        }
        return lista;
    }

    public int agregar(Cliente cl) {
        String sql = "insert into cliente(Nombre_cli,Appat_cli,direccion,correo_cli,usuario,Password,codigo_targeta)values(?,?,?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, cl.getNombre());
            ps.setString(2, cl.getAppat());
            ps.setString(3, cl.getDireccion());
            ps.setString(4, cl.getCorreo());
            ps.setString(5, cl.getUsuario());
            ps.setString(6, cl.getPassword());
            ps.setString(7, cl.getC_targeta());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }

    public Cliente listarId(int id) {
        Cliente cli = new Cliente();
        String sql = "select * from cliente where IdCliente=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                cli.setNombre(rs.getString(2));
                cli.setAppat(rs.getString(3));
                cli.setDireccion(rs.getString(4));
                cli.setCorreo(rs.getString(5));
                cli.setUsuario(rs.getString(6));
                cli.setPassword(rs.getString(7));
                cli.setC_targeta(rs.getString(8));
            }
        } catch (Exception e) {
        }
        return cli;
    }

    public int actualizar(Cliente em) {
        String sql = "update cliente set Nombre_cli=?,Appat_cli=?, direccion=?,correo_cli=?,usuario=?,Password=?,codigo_targeta=? where IdCliente=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, em.getNombre());
            ps.setString(2, em.getAppat());
            ps.setString(3, em.getDireccion());
            ps.setString(4, em.getCorreo());
            ps.setInt(5, em.getId());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }

    public void delete(int id) {
        String sql = "delete from cliente where IdCliente=" + id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

}
