/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;



public class Quejas {

    private int numDoc;
    private String fecha;
    private String detalle;
    private String solicitud;
    private Proveedor prov;
    private Consumidor Con;
            
    //Constructores
    public Quejas(){};

    public Quejas(int numDoc, String fecha, String detalle, String solicitud) {
        this.numDoc = numDoc;
        this.fecha = fecha;
        this.detalle = detalle;
        this.solicitud = solicitud;
    }

    //Getters
    public int getNumDoc() {
        return numDoc;
    }

    public String getFecha() {
        return fecha;
    }

    public String getDetalle() {
        return detalle;
    }

    public String getSolicitud() {
        return solicitud;
    }


    //Setters
    public void setNumDoc(int numDoc) {
        this.numDoc = numDoc;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    public void setSolicitud(String solicitud) {
        this.solicitud = solicitud;
    }
    
    
    public void guardarQueja(){
        
    }
}

