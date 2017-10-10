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
    public partial class mantenimientos : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["veronicaConnectionString"].ConnectionString;
        SqlConnection conn;
        SqlDataAdapter adapt;
        DataTable dt;
        SqlCommand comando = new SqlCommand();
        string id_equipo;


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


            if (!IsPostBack)
            {

            }

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

                    SqlCommand id = new SqlCommand("select max(nro_mantenimiento) from dbo.mant_correctivo", conn);
                    id.ExecuteNonQuery();
                    string sql1 = Convert.ToString(id.ExecuteScalar());
                    int num = Convert.ToInt32(sql1);
                    int nro_mant = num + 1;
                    id_equipo = DropDownList1.SelectedValue;
                    comando = new SqlCommand("insert into dbo.mant_correctivo (nro_mantenimiento, id_equipo, fecha, desc_mantenimiento, falla_presentada) values('" + nro_mant.ToString() + "', '" + id_equipo.ToString() + "', '" + tb5.Text + "', '" + tb1.Text + "', '" + tb3.Text + "')", conn);
                    comando.ExecuteNonQuery();
                    Response.Write("<script>alert('Sus datos se han guardado satisfactoriamente');window.location.href='mant_correctivo2.aspx';</script>");
                    //mostrardatos();
                    conn.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Sus datos no se han podido guardar' '" + Server.HtmlEncode(ex.ToString()) + "')</script>");
                }



                //TextBox1.Text = DropDownList1.SelectedValue;
            }
        }

        protected void tb3_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
