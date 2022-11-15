
package Clases;

public class Computadora {
    private String modelo;
    private String tamaño_pantalla;
    private String cantidad_ram;
    private String almacenamiento;
    private String sistema_operativo;
    private int marca_codigo;

    
    public Computadora(String modelo, String tamaño_pantalla, String cantidad_ram, String almacenamiento, String sistema_operativo, int marca_codigo){
        this.modelo=modelo;
        this.tamaño_pantalla=tamaño_pantalla;
        this.cantidad_ram=cantidad_ram;
        this.almacenamiento=almacenamiento;     
        this.sistema_operativo=sistema_operativo;   
        this.marca_codigo=marca_codigo;
    }
    
    

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getTamaño_pantalla() {
        return tamaño_pantalla;
    }

    public void setTamaño_pantalla(String tamaño_pantalla) {
        this.tamaño_pantalla = tamaño_pantalla;
    }

    public String getCantidad_ram() {
        return cantidad_ram;
    }

    public void setCantidad_ram(String cantidad_ram) {
        this.cantidad_ram = cantidad_ram;
    }

    public String getAlmacenamiento() {
        return almacenamiento;
    }

    public void setAlmacenamiento(String almacenamiento) {
        this.almacenamiento = almacenamiento;
    }

    public String getSistema_operativo() {
        return sistema_operativo;
    }

    public void setSistema_operativo(String sistema_operativo) {
        this.sistema_operativo = sistema_operativo;
    }
    
    public int getMarca_codigo(){
        return marca_codigo;
    }
    
    public void setMarca_codigo(int marca_codigo){
        this.marca_codigo = marca_codigo;
    }
    
    

    
    
}
