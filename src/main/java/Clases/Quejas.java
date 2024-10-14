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
    private Consumidor con;
            
    //Constructores
    public Quejas(){};

    public Quejas(int numDoc, String fecha, String detalle, String solicitud, Proveedor prov, Consumidor con) {
        this.numDoc = numDoc;
        this.fecha = fecha;
        this.detalle = detalle;
        this.solicitud = solicitud;
        this.prov = prov; 
        this.con = con; 
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
    
    public Proveedor getProveedor(){
        return prov;
    }
    
    public Consumidor getConsumidor(){
        return con;
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
    
    public void setProveedor(Proveedor prov){
        this.prov = prov;
    }
    
    public void setConsumidor(Consumidor con){
        this.con = con;
    }
    
    public void guardarQueja(){
        
    }
}

