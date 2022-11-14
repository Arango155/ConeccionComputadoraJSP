
package Clases;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class LibroController {
      Libro[] tablaLibro;
    int indiceArray;
    private ConexionBaseDeDatos conectorBD;
    private Connection conexion;
    private PreparedStatement statement = null;
    private ResultSet result = null;
    
    public LibroController(){
        this.tablaLibro = new Libro[100];
        this.indiceArray=0;
    }
    
     public void guardarLibro(Libro alumno){
        this.tablaLibro[this.indiceArray]=alumno;  
        this.indiceArray=this.indiceArray+1;
        // procedimiento para almacenar en la Base de Datos
    }
    
    public Libro[] getLibro(){
        return this.tablaLibro;
    }
    
    public void abrirConexion(){
        conectorBD= new ConexionBaseDeDatos();
        conexion=conectorBD.conectar();
    }
    
    public boolean getLibro2(Libro libro){        
        String sql = "INSERT INTO final_progra.libro(codigo_libro, nombre, fecha_lanzamiento, autor, tipo_pasta_id) ";
             sql += " VALUES( ?,?,?,?,?)"; 
        try{
            abrirConexion();
            statement = conexion.prepareStatement(sql); 
            statement.setInt(1, libro.getCodigo_libro());
            statement.setString(2, libro.getNombre());
            statement.setString(3, libro.getFecha_lanzamiento());
            statement.setString(4, libro.getAutor());
            statement.setString(5, libro.getTipo_pasta_id());
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

