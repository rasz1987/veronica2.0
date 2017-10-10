using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web.Security;
using System.Windows.Forms;
using System.Configuration;
namespace veronica2._0
{
    public partial class solicitud : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["veronicaConnectionString"].ConnectionString;
        SqlConnection con;
        //SqlConnection conn = new SqlConnection("Data Source=ANSIFONTES;Initial Catalog=veronica;Integrated Security=True;user id=sa; Password=sssa123;Database=veronica");
        SqlCommand comando = new SqlCommand();
        string info;
        string fec = DateTime.Today.ToString("dd/MM/yyyy");

        protected void Page_Load(object sender, EventArgs e)
        {
            //EVITA QUE SE GUARDE EN CACHE
            Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
            Response.Cache.SetNoStore();


            //conexion a base de datos
            string cs = ConfigurationManager.ConnectionStrings["veronicaConnectionString"].ConnectionString;
            SqlConnection con;


            con = new SqlConnection(cs);
            con.Open();

            //string info = ("Bienvenido : " + User.Identity.Name + "" + "Tipo de Autentificacion Usada : " + User.Identity.AuthenticationType + "");
            string info = ("" + User.Identity.Name + "");
            string fecha1 = DateTime.Today.ToString("dd/MM/yyyy");
            //usuario.Text = info.ToString(); 
            //fecha.Text = DateTime.Today.ToShortDateString();

            //fecha2.Text = fecha1.ToString();
            SqlCommand nombre = new SqlCommand("select nom_user from dbo.usuarios where user_name= '" + info.ToString() + "'", con);
            nombre.ExecuteNonQuery();
            string name = Convert.ToString(nombre.ExecuteScalar());
            Label1.Text = name.ToString();


        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            //DECLARO EL SELECT PARA EL NOMBRE, APELLIDO Y COORD. DEL USUARIO
            con = new SqlConnection(cs);
            con.Open();
            info = ("" + User.Identity.Name + "");
            SqlCommand nombre = new SqlCommand("select nom_user from dbo.usuarios where user_name= '" + info.ToString() + "'", con);
            nombre.ExecuteNonQuery();
            string name = Convert.ToString(nombre.ExecuteScalar());
            SqlCommand apellido = new SqlCommand("select ape_user from dbo.usuarios where user_name= '" + info.ToString() + "'", con);
            apellido.ExecuteNonQuery();
            string surname = Convert.ToString(apellido.ExecuteScalar());
            string nombre_completo = name.ToString() + " " + surname.ToString();

            SqlCommand coord = new SqlCommand("select oficina from dbo.usuarios where user_name= '" + info.ToString() + "'", con);
            coord.ExecuteNonQuery();
            string coordinacion = Convert.ToString(coord.ExecuteScalar());



            //DECLARO EL SELECT PARA LA CEDULA DEL USUARIO
            SqlCommand cedula = new SqlCommand("select ci_user from dbo.usuarios where user_name= '" + info.ToString() + "'", con);        //GENERO EL SELECT CON CONEXIÓN A LA DATABASE
            cedula.ExecuteNonQuery();                                                                                                       //EJECUTO EL QUERY
            string ci = Convert.ToString(cedula.ExecuteScalar());                                                                           //DECLARO VARIABLE CI E IGUALO A CEDULA Y EJECUTO UN EXECUTESCALAR

            //GENERO EL ÚLTIMO NÚMERO DE SERVICIO
            SqlCommand query = new SqlCommand("select max(num_ser) from dbo.sol_ser", con);
            query.ExecuteNonQuery();                                                                                                        //ejecuto el query
            string num_ser1 = Convert.ToString(query.ExecuteScalar());                                                                      //declaro num_ser1 como string y la igualo al query convertida en string y le realizo un executescalar
            int numser = Convert.ToInt32(num_ser1);                                                                                         //declaro numser como int y la igualo a num_ser1 convertida a int32
            int suma = numser + 1;                                                                                                          //Declaro variable suma como int y le sumo 1 a numser
            string status = "en proceso";                                                                                                   //declaro query2 para guardar la información
            //string coordinacion = "OSG";

            if (tb1.Text == "")
            {

                Response.Write("<script>alert('Por favor, describa su solicitud requerida');</script>");
                tb1.Focus();

            }
            else
            {

                try
                {
                    comando.Connection = con;
                    comando.CommandText = "insert into dbo.sol_ser(desc_ser, num_ser, nom_user, fecha, estatus, id_user, coord) values (@desc,@numero,@nombre,@fecha,@estatus,@id,@coord)";
                    comando.Parameters.Clear();

                    comando.Parameters.AddWithValue("desc", tb1.Text);
                    comando.Parameters.AddWithValue("numero", suma.ToString());
                    comando.Parameters.AddWithValue("nombre", nombre_completo.ToString());
                    comando.Parameters.AddWithValue("fecha", fec.ToString());
                    comando.Parameters.AddWithValue("estatus", status.ToString());
                    comando.Parameters.AddWithValue("id", ci.ToString());
                    comando.Parameters.AddWithValue("coord", coordinacion.ToString());

                    int nfilas = comando.ExecuteNonQuery();
                    if (nfilas > 0)
                    {
                        Response.Write("<script>alert('Su solicitud está siendo procesada, en pocos minutos será atendido por nuestro personal');</script>");
                        tb1.Text = "";

                    }
                }
                catch (SqlException ex)
                {
                    MessageBox.Show("fallo:" + ex);
                }
                con.Close();
                comando.Dispose();


            }
        }
    }
}