/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package misrc;

/**
 *
 * @author Tecnicos
 */
public class Oficina {

    private int IdOficina;
    private int IdDirector;
    private String ciudad;
    private String region;
    private double objetivo;
    private double ventas;

    public Oficina() {
    }

    public Oficina(int IdOficina, int IdDirector, String ciudad, String region, double objetivo, double ventas) {
        this.IdOficina = IdOficina;
        this.IdDirector = IdDirector;
        this.ciudad = ciudad;
        this.region = region;
        this.objetivo = objetivo;
        this.ventas = ventas;
    }

    public int getIdOficina() {
        return IdOficina;
    }

    public void setIdOficina(int IdOficina) {
        this.IdOficina = IdOficina;
    }

    public int getIdDirector() {
        return IdDirector;
    }

    public void setIdDirector(int IdDirector) {
        this.IdDirector = IdDirector;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public double getObjetivo() {
        return objetivo;
    }

    public void setObjetivo(double objetivo) {
        this.objetivo = objetivo;
    }

    public double getVentas() {
        return ventas;
    }

    public void setVentas(double ventas) {
        this.ventas = ventas;
    }


}
