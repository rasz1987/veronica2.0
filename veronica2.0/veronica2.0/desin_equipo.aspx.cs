using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;




namespace veronica2._0
{
    public partial class desin_equipo : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["veronicaConnectionString"].ConnectionString;
        SqlConnection conn;
        SqlDataAdapter adapt;
        DataTable dt;
        SqlCommand comando = new SqlCommand();
        string id_equipo;
        string info;
        string fec = DateTime.Today.ToString("dd/MM/yyyy");
        string activo_fijo;


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

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (DropDownList1.SelectedValue == "1")
            {
                Response.Write("<script>alert('Por favor, seleecione el activo fijo del equipo que le hará mantenimiento correctivo');window.location.href='mant_correctivo2.aspx';</script>");
            }
            else
            {
                try
                {
                    conn = new SqlConnection(cs);
                    conn.Open();

                    //Obtener nombre y apellido del usuario
                    info = ("" + User.Identity.Name + "");
                    SqlCommand nombre = new SqlCommand("select nom_user from dbo.usuarios where user_name= '" + info.ToString() + "'", conn);
                    nombre.ExecuteNonQuery();
                    string name = Convert.ToString(nombre.ExecuteScalar());
                    SqlCommand apellido = new SqlCommand("select ape_user from dbo.usuarios where user_name= '" + info.ToString() + "'", conn);
                    apellido.ExecuteNonQuery();
                    string surname = Convert.ToString(apellido.ExecuteScalar());
                    string nombre_completo = name.ToString() + " " + surname.ToString();
                    //Obtener nombre y apellido del usuario



                    SqlCommand id = new SqlCommand("select max(nro_desin) from dbo.equipo_desin", conn);
                    id.ExecuteNonQuery();
                    string sql1 = Convert.ToString(id.ExecuteScalar());
                    int num = Convert.ToInt32(sql1);
                    int nro_desin = num + 1;
                    id_equipo = DropDownList1.SelectedValue;
                    activo_fijo = DropDownList1.SelectedItem.Text;
                    comando = new SqlCommand("insert into dbo.equipo_desin (nro_desin, razon, usuario, fecha, id_equipo, activo_fijo) values('" + nro_desin.ToString() + "', '" + tb1.Text + "', '" + nombre_completo.ToString() + "', '" + fec.ToString() + "', '" + id_equipo.ToString() + "', '" + activo_fijo.ToString() + "')", conn);
                    comando.ExecuteNonQuery();
                    SqlCommand desincorporacion = new SqlCommand("delete from dbo.equipo where id_equipo='" + id_equipo.ToString() + "' ", conn);
                    desincorporacion.ExecuteNonQuery();
                    Response.Write("<script>alert('Su equipo se ha desincorporado satisfactoriamente');window.location.href='desin_equipo.aspx';</script>");
                    //mostrardatos();
                    conn.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Su equipo no se ha podido desincorporar' '" + Server.HtmlEncode(ex.ToString()) + "')</script>");
                }



                //TextBox1.Text = DropDownList1.SelectedValue;
            }
        }

        protected void tb3_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
