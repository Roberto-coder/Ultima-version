
package modelo;

public class Cliente {
    private int id;
    private String c_targeta;
    private String nombre;
    private String appat;
    private String direccion;
    private String correo;
    private String usuario;
    private String password;

    public Cliente() {
    }

    public Cliente(int id, String c_targeta, String nombre, String appat, String direccion, String correo, String usuario, String password) {
        this.id = id;
        this.c_targeta = c_targeta;
        this.nombre = nombre;
        this.appat = appat;
        this.direccion = direccion;
        this.correo = correo;
        this.usuario = usuario;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getC_targeta() {
        return c_targeta;
    }

    public void setC_targeta(String c_targeta) {
        this.c_targeta = c_targeta;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getAppat() {
        return appat;
    }

    public void setAppat(String appat) {
        this.appat = appat;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    
}
