/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

/**
 *
 * @author fboan
 */
public class Usuario {
    private String Usuario;
    private String password;
    private boolean master;

    public Usuario(){
        
    }
    public Usuario(String Usuario, String password, boolean master) {
        this.Usuario = Usuario;
        this.password = password;
        this.master = master;
    }

    public String getUsuario() {
        return Usuario;
    }

    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isMaster() {
        return master;
    }

    public void setMaster(boolean master) {
        this.master = master;
    }
    
    public boolean Login (String usr, String pass){
        
        boolean x = false; 
        if(usr.toLowerCase().equals(this.Usuario.toLowerCase())&& pass.equals(this.password) ){
            x=true;
        }
        
        return x;
    }
    
}
