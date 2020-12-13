using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;


namespace WebApplication_Framework
{
    /// <summary>
    /// Descripción breve de WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {

        [WebMethod]
        public DataSet alumno_examlple(int i)
        {
            //Ingresar ci y returna las materias inscritas del alumno
            SqlConnection conexion = Conexion();
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conexion;
            cmd.CommandText = "select a.Id,a.Nombre from Inscripcion t,Asignatura a where t.IdAsignatura = a.Id and t.IdAlumno= @i";
            cmd.Parameters.Add("@i", SqlDbType.Int).Value = i;

            SqlDataAdapter da = new SqlDataAdapter(cmd);

            da.Fill(ds, "Asignatura");
            
            return ds;
        }
        [WebMethod]
        public String Nombre_alumno(int i)
        {
            //ingrese ci y returno el nombre del alumno
            String nombre = "";
            String apellido="";
            String ans = "";
            SqlConnection conexion = Conexion();
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conexion;
            cmd.CommandText = "select * from Alumnos where Id= @i";
            cmd.Parameters.Add("@i", SqlDbType.Int).Value = i;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds, "Alumnos");
            if (ds!=null && (ds.Tables["Alumnos"].Rows.Count > 0))
            {
                nombre = ds.Tables["Alumnos"].Rows[0][1].ToString();
                apellido = ds.Tables["Alumnos"].Rows[0][2].ToString();
                ans = nombre + " " + apellido;

            }
            else
            {
                ans = "NO EXISTE EL ESTUDIANTE CON EL CI : "+i;
            }
            
            return ans;
        }
        
        public SqlConnection Conexion()
        {
            SqlConnection conexion = new SqlConnection();
            conexion.ConnectionString = "server=(local);user=admwilson;pwd=123456;database=academico";
            return conexion;
        }

    }
}
