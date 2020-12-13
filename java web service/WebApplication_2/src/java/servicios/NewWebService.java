/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servicios;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author Lenovo
 */
@WebService(serviceName = "NewWebService")
public class NewWebService {

    /**
     * Web service operation
     */
    @WebMethod(operationName = "Consulta")
    public Vector Consulta(@WebParam(name = "ci") final int ci) {
        
        Vector v= new Vector();
        Connection con = null;
        //Statement stm = null;
        PreparedStatement  stm=null;
        try 
        {
                Class.forName("org.postgresql.Driver");
                con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/academico","postgres","123456");
                String sql = "select a.* from Inscripcion i,Asignatura a where i.idasignatura = a.id and i.idalumno=?;";
                stm = con.prepareStatement(sql);
                stm.setInt(1, ci);
                ResultSet rs = stm.executeQuery();
                while(rs.next())
                {
                    
                    //String id_m = rs.getString("id");
                    //String nombre_m = rs.getString("nombre");
                    v.addElement(rs.getString(1)+"  "+rs.getString(2));
                    
                    //System.out.println(id_m+" "+ nombre_m);
                }
        } catch (Exception ex)
                {
                    System.err.println(ex.getMessage());
                    v=null;
                }
        
        
        
        return v;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "suma")
    public Integer suma(@WebParam(name = "a") int a, @WebParam(name = "b") final int b) {
        //TODO write your implementation code here:
        return a+b;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "Nombre_alumno")
    public String Nombre_alumno(@WebParam(name = "ci") final int ci) {
        String ans="";
        Connection con = null;
        PreparedStatement  stm=null;
         try {
                Class.forName("org.postgresql.Driver");
                con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/academico","postgres","123456");
                String sql = "select * from  Alumnos where id=?;";
                stm = con.prepareStatement(sql);
                stm.setInt(1, ci);
                ResultSet rs = stm.executeQuery();
                if(rs==null ){
                    ans="";
                }
                while(rs.next())
                {
                    
                    String nombre = rs.getString("nombre");
                    String paterno = rs.getString("apellido");
                    System.out.println(nombre+" "+paterno);
                    ans=nombre+" "+paterno;
                }

            } catch (Exception ex) {
                System.err.println(ex.getMessage());
                ans="";
            }
        
        
        
        return ans;
    }
    
    /**
     * This is a sample web service operation
     */
 
    
    
}
