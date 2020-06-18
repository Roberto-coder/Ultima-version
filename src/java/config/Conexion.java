package config;
import java.sql.*;

public class Conexion {
    Connection con;
    String URL = "jdbc:mysql://localhost:3306/doomtienda";
    String userName = "root";
    String password = "n0m3l0";
    public Connection getConnection(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(URL, userName, password);
        }catch(Exception e){
            
        }
        return con;
    }
}
