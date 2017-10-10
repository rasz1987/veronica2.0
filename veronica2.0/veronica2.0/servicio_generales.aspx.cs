using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace veronica2._0
{
    public partial class servicio_generales : System.Web.UI.Page
    {
        // CONEXIÓN A LA BASE DE DATOS MEDIANTE EL CONNECTIONSTRING DEL WEB.CONFIG.
        string cs = ConfigurationManager.ConnectionStrings["veronicaConnectionString"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter adapt;
        DataTable dt;
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





            if (!IsPostBack)
            {
                this.MaintainScrollPositionOnPostBack = true;
                showdata();
            }

        }
        // MÉTODO PARA MOSTRAR LOS DATOS EN EL GRIDVIEW
        protected void showdata()
        {
            dt = new DataTable();
            con = new SqlConnection(cs);
            con.Open();
            //adapt = new SqlDataAdapter("select num_ser, fecha, desc_ser, nom_user, estatus, fecha_fin from dbo.sol_ser where coord='OSG'order by (fecha) desc", con);
            adapt = new SqlDataAdapter("select num_ser, fecha, desc_ser, nom_user, estatus, fecha_fin from dbo.sol_ser order by (fecha) desc", con);
            adapt.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                gv_data.DataSource = dt;
                gv_data.DataBind();
            }
        }


        protected void gv_data_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            Timer1.Enabled = true;
            gv_data.EditIndex = -1;
            showdata();
        }

        protected void gv_data_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Timer1.Enabled = false;
            gv_data.EditIndex = e.NewEditIndex;
            showdata();
        }

        protected void gv_data_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Timer1.Enabled = true;
            // FORMA PARA ENCONTRAR LOS CONTROLES A ACTUALIZAR
            Label num_ser = gv_data.Rows[e.RowIndex].FindControl("lbl_num_ser") as Label;
            Label lbl_fec_ser = gv_data.Rows[e.RowIndex].FindControl("lbl_fec_sol") as Label;
            Label lbl_desc_ser = gv_data.Rows[e.RowIndex].FindControl("lbl_desc_ser") as Label;
            Label usuario = gv_data.Rows[e.RowIndex].FindControl("usuario") as Label;
            Label fec_fin = gv_data.Rows[e.RowIndex].FindControl("fec_fin") as Label;
            TextBox estatus = gv_data.Rows[e.RowIndex].FindControl("estatus") as TextBox;
            con = new SqlConnection(cs);
            con.Open();
            // GUARDADO DE LA DATA
            SqlCommand cmd = new SqlCommand("Update dbo.sol_ser set estatus='" + estatus.Text + "', fecha_fin='" + fec.ToString() + "' where num_ser=" + Convert.ToInt32(num_ser.Text), con);
            cmd.ExecuteNonQuery();
            con.Close();
            // CANCELAMOS EL MODO EDICIÓN AL COLOCAR EL VALOR DEL EDITINDEX EN -1
            gv_data.EditIndex = -1;
            // LLAMAMOS EL MÉTODO SHOWDATA
            showdata();
        }





        protected void Timer1_Tick(object sender, EventArgs e)
        {
            showdata();

        }



    }
}