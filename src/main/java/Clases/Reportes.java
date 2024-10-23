/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

/**
 *
 * @author david
 */
public class Reportes {
    
    
    private int numQueja;
    private String nombreConsumidor;
    private String nombreEmpresa;
    private String detalle;
    private String solicitud;

    public Reportes(int numQueja, String nombreConsumidor, String nombreEmpresa, String detalle, String solicitud) {
        this.numQueja = numQueja;
        this.nombreConsumidor = nombreConsumidor;
        this.nombreEmpresa = nombreEmpresa;
        this.detalle = detalle;
        this.solicitud = solicitud;
    }

    public int getNumQueja() {
        return numQueja;
    }

    public String getNombreConsumidor() {
        return nombreConsumidor;
    }

    public String getNombreEmpresa() {
        return nombreEmpresa;
    }

    public String getDetalle() {
        return detalle;
    }

    public String getSolicitud() {
        return solicitud;
    }

    public void setNumQueja(int numQueja) {
        this.numQueja = numQueja;
    }

    public void setNombreConsumidor(String nombreConsumidor) {
        this.nombreConsumidor = nombreConsumidor;
    }

    public void setNombreEmpresa(String nombreEmpresa) {
        this.nombreEmpresa = nombreEmpresa;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    public void setSolicitud(String solicitud) {
        this.solicitud = solicitud;
    }
    
    
    
}
