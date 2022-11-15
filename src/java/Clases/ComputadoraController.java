
package Clases;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author JP
 */
public class ComputadoraController {
      Computadora[] tablaLibro;
    int indiceArray;
    private ConexionBaseDeDatos conectorBD;
    private Connection conexion;
    private PreparedStatement statement = null;
    private ResultSet result = null;
    
    public ComputadoraController(){
        this.tablaLibro = new Computadora[100];
        this.indiceArray=0;
    }
    
     public void guardarComputadora(Computadora object){
        this.tablaLibro[this.indiceArray]=object;  
        this.indiceArray=this.indiceArray+1;
        // procedimiento para almacenar en la Base de Datos
    }
    
    public Computadora[] getComputadora(){
        return this.tablaLibro;
    }
    
    public void abrirConexion(){
        conectorBD= new ConexionBaseDeDatos();
        conexion=conectorBD.conectar();
    }
    
    public boolean getComputadora2(Computadora computadora){        
        String sql = "INSERT INTO final_progra.computadora(modelo,tamaño_pantalla,cantidad_ram,almacenamiento,sistema_operativo,marca_codigo) ";
             sql += " VALUES( ?,?,?,?,?,?)"; 
        try{
            abrirConexion();
            statement = conexion.prepareStatement(sql); 
            statement.setString(1, computadora.getModelo());
            statement.setString(2, computadora.getTamaño_pantalla());
            statement.setString(3, computadora.getCantidad_ram());
            statement.setString(4, computadora.getAlmacenamiento());
            statement.setString(5, computadora.getSistema_operativo());
            statement.setInt(6,computadora.getMarca_codigo());
             int resultado = statement.executeUpdate(); 
                if(resultado > 0){
                    return true;
                }else{
                    return false;
                }
        }catch(SQLException e){
            String error = e.getMessage();  
            return false;
        }    
    }
    
    
}

