package misrc;

public class Producto {

    private String IdFabrica;
    private String IdProducto;
    private String descripcion;
    private double precio;
    private int existencia;

    public Producto() {
    }

    public Producto(String IdFabrica, String IdProducto, String descripcion, double precio, int existencia) {
        this.IdFabrica = IdFabrica;
        this.IdProducto = IdProducto;
        this.descripcion = descripcion;
        this.precio = precio;
        this.existencia = existencia;
    }

    public String getIdFabrica() {
        return IdFabrica;
    }

    public void setIdFabrica(String IdFabrica) {
        this.IdFabrica = IdFabrica;
    }

    public String getIdProducto() {
        return IdProducto;
    }

    public void setIdProducto(String IdProducto) {
        this.IdProducto = IdProducto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getExistencia() {
        return existencia;
    }

    public void setExistencia(int existencia) {
        this.existencia = existencia;
    }


}
