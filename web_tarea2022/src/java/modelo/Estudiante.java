
package modelo;

import java.awt.HeadlessException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author HP
 */
public class Estudiante extends Persona {
    private String carne;
    private int id_tipo_sangre;
    Conexion cn; 
public Estudiante (){}
    public Estudiante(String carne, int id_tipo_sangre) {
        this.carne = carne;
        this.id_tipo_sangre = id_tipo_sangre;
    }

    public Estudiante(String carne, int id_tipo_sangre, int id, String nombres, String apellidos, String direccion, String telefono, String correo_electronico, String fecha_nacimiento) {
        super(id, nombres, apellidos, direccion, telefono, correo_electronico, fecha_nacimiento);
        this.carne = carne;
        this.id_tipo_sangre = id_tipo_sangre;
    }

    public String getCarne() {
        return carne;
    }

    public void setCarne(String carne) {
        this.carne = carne;
    }

    public int getId_tipo_sangre() {
        return id_tipo_sangre;
    }

    public void setId_tipo_sangre(int id_tipo_sangre) {
        this.id_tipo_sangre = id_tipo_sangre;
    }
    
     public DefaultTableModel leer(){
        DefaultTableModel tabla = new DefaultTableModel ();
        
        try{
        cn = new Conexion();
        cn.abrir_conexion();
        String query;
        query = "SELECT e.id_estudiante as id,e.carne,e.nombres,e.apellidos,e.direccion,e.telefono,e.correo_electronico,p.sangre,e.id_tipo_sangre,e.fecha_nacimiento FROM estudiantes as e inner join tipos_sangre as p on e.id_tipo_sangre = p.id_tipo_sangre;";
        ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
        
        String encabezado[] = {"id","carne","nombres","apellidos","direccion","telefono","correo_electronico","sangre","id_tipo_sangre","fecha_nacimiento"};
        tabla.setColumnIdentifiers(encabezado);
        
        String datos[] = new String[10];
        
        while (consulta.next()){
            datos[0] = consulta.getString("id");
            datos[1] = consulta.getString("carne");
            datos[2] = consulta.getString("nombres");
            datos[3] = consulta.getString("apellidos");
            datos[4] = consulta.getString("direccion");
            datos[5] = consulta.getString("telefono");
            datos[6] = consulta.getString("correo_electronico");
            datos[7] = consulta.getString("sangre");
            datos[8] = consulta.getString("id_tipo_sangre");
            datos[9] = consulta.getString("fecha_nacimiento");
            tabla.addRow(datos);

        }
        cn.cerrar_conexion();
        
        } catch (SQLException ex){
                  cn.cerrar_conexion();
            System.out.println("Error: " + ex.getMessage());
            
        }
        return tabla;
        
    }
    
    @Override
    public int crear(){
        int retorno = 0;
        
        try { 
    PreparedStatement parametro;
    String query = "INSERT INTO estudiantes(carne,nombres,apellidos,direccion,telefono,correo_electronico,id_tipo_sangre,fecha_nacimiento) VALUES (?,?,?,?,?,?,?,?);";
    cn = new Conexion();
    cn.abrir_conexion();
    parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
    parametro.setString(1, getCarne());
    parametro.setString(2, getNombres());
    parametro.setString(3, getApellidos());
    parametro.setString(4, getDireccion());
    parametro.setString(5, getTelefono());
    parametro.setString(6, getCorreo_electronico());
    parametro.setInt(7, this.getId_tipo_sangre());
    parametro.setString(8, getFecha_nacimiento());
    
    int executar = parametro.executeUpdate();
    retorno = executar;
    cn.cerrar_conexion();
   
    
    
} catch(HeadlessException | SQLException ex){
    System.out.println("Error..."+ ex.getMessage());
    
    
}
        
        
        return retorno; 
    }
    @Override
        public int actualizar(){
            int retorno = 0;
        
        try { 
    PreparedStatement parametro;
    String query = "update estudiantes set carne=?,nombres=?,apellidos=?,direccion=?,telefono=?,correo_electronico=?,id_tipo_sangre=?,fecha_nacimiento=? where id_estudiante=?;";
    cn = new Conexion();
    cn.abrir_conexion();
    parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
    parametro.setString(1, getCarne());
    parametro.setString(2, getNombres());
    parametro.setString(3, getApellidos());
    parametro.setString(4, getDireccion());
    parametro.setString(5, getTelefono());
    parametro.setString(6, getCorreo_electronico());
    parametro.setInt(7, this.getId_tipo_sangre());
    parametro.setString(8, getFecha_nacimiento());
    parametro.setInt(9, this.getId());
    
    int executar = parametro.executeUpdate();
    retorno = executar;
    cn.cerrar_conexion();
   
    
    
} catch(HeadlessException | SQLException ex){
    System.out.println("Error..."+ ex.getMessage());
    
    
}
        
        
        return retorno; }
    @Override
    public int borrar (){
        int retorno = 0;
        
        try { 
    PreparedStatement parametro;
    String query = "delete from estudiantes where id_estudiante=?;";
    cn = new Conexion();
    cn.abrir_conexion();
    parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
    parametro.setInt(1, this.getId());
    
    int executar = parametro.executeUpdate();
    retorno = executar;
    cn.cerrar_conexion();
   
    
    
} catch(HeadlessException | SQLException ex){
    System.out.println("Error..."+ ex.getMessage());
    
    
}
        
        
        return retorno;}
}
