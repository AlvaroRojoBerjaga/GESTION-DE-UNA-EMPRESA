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
public class Vendedor {

    private int IdVendedor;
    private String nombre;
    private int edad;
    private int IdOficina;
    private String titulo;
    private String contrato;
    private double couta;
    private double ventas;
    private int IdVendedorJefe;

    public Vendedor() {
    }

    public Vendedor(int IdVendedor, String nombre, int edad, int IdOficina, String titulo, String contrato, double couta, double ventas, int IdVendedorJefe) {
        this.IdVendedor = IdVendedor;
        this.nombre = nombre;
        this.edad = edad;
        this.IdOficina = IdOficina;
        this.titulo = titulo;
        this.contrato = contrato;
        this.couta = couta;
        this.ventas = ventas;
        this.IdVendedorJefe = IdVendedorJefe;
    }

    public int getIdVendedor() {
        return IdVendedor;
    }

    public void setIdVendedor(int IdVendedor) {
        this.IdVendedor = IdVendedor;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public int getIdOficina() {
        return IdOficina;
    }

    public void setIdOficina(int IdOficina) {
        this.IdOficina = IdOficina;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getContrato() {
        return contrato;
    }

    public void setContrato(String contrato) {
        this.contrato = contrato;
    }

    public int getIdVendedorJefe() {
        return IdVendedorJefe;
    }

    public void setIdVendedorJefe(int IdVendedorJefe) {
        this.IdVendedorJefe = IdVendedorJefe;
    }

    public double getCouta() {
        return couta;
    }

    public void setCouta(double couta) {
        this.couta = couta;
    }

    public double getVentas() {
        return ventas;
    }

    public void setVentas(double ventas) {
        this.ventas = ventas;
    }


}
