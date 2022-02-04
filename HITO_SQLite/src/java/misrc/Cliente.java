/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package misrc;

/**
 *
 * @author Tecnicos
 */
public class Cliente {

    private int IdCliente;
    private String empresa;
    private int IdVendedor;
    private double limiteCredito;

    public Cliente() {
    }

    public Cliente(int IdCliente, String empresa, int IdVendedor, double limiteCredito) {
        this.IdCliente = IdCliente;
        this.empresa = empresa;
        this.IdVendedor = IdVendedor;
        this.limiteCredito = limiteCredito;
    }

    public int getIdCliente() {
        return IdCliente;
    }

    public void setIdCliente(int IdCliente) {
        this.IdCliente = IdCliente;
    }

    public String getEmpresa() {
        return empresa;
    }

    public void setEmpresa(String empresa) {
        this.empresa = empresa;
    }

    public int getIdVendedor() {
        return IdVendedor;
    }

    public void setIdVendedor(int IdVendedor) {
        this.IdVendedor = IdVendedor;
    }

    public double getLimiteCredito() {
        return limiteCredito;
    }

    public void setLimiteCredito(double limiteCredito) {
        this.limiteCredito = limiteCredito;
    }

}
