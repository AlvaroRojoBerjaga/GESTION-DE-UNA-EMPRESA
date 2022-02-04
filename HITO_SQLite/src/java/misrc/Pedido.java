/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package misrc;

import java.util.Date;

/**
 *
 * @author Tecnicos
 */
public class Pedido {
    private int IdPedido;
    private int IdVendedor;
    private int IdCliente;
    private String IdFabrica;
    private String IdProducto;
    private String fechaPedido;        
    private int cantidad;
    private double importe;

    public Pedido() {
    }

    public Pedido(int IdPedido, int IdVendedor, int IdCliente, String IdFabrica, String IdProducto, String fechaPedido, int cantidad, double importe) {
        this.IdPedido = IdPedido;
        this.IdVendedor = IdVendedor;
        this.IdCliente = IdCliente;
        this.IdFabrica = IdFabrica;
        this.IdProducto = IdProducto;
        this.fechaPedido = fechaPedido;
        this.cantidad = cantidad;
        this.importe = importe;
    }

   

    public int getIdPedido() {
        return IdPedido;
    }

    public void setIdPedido(int IdPedido) {
        this.IdPedido = IdPedido;
    }

    public String getFechaPedido() {
        return fechaPedido;
    }

    public void setFechaPedido(String fechaPedido) {
        this.fechaPedido = fechaPedido;
    }

    public int getIdCliente() {
        return IdCliente;
    }

    public void setIdCliente(int IdCliente) {
        this.IdCliente = IdCliente;
    }

    public int getIdVendedor() {
        return IdVendedor;
    }

    public void setIdVendedor(int IdVendedor) {
        this.IdVendedor = IdVendedor;
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

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getImporte() {
        return importe;
    }

    public void setImporte(double importe) {
        this.importe = importe;
    }
    
}
