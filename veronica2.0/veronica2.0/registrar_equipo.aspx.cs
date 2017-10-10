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
    public partial class registrar_equipo : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["veronicaConnectionString"].ConnectionString;
        SqlConnection conn;
        SqlDataAdapter adapt;
        DataTable dt;
        SqlCommand comando = new SqlCommand();



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
                mostrardatos();

            }

        }

        protected void mostrardatos()
        {
            dt = new DataTable();
            conn = new SqlConnection(cs);
            conn.Open();
            adapt = new SqlDataAdapter("select id_equipo, tipo_equipo, marca, modelo, corriente, activo_fijo, btu, refrigerante, dir_area from dbo.equipo", conn);
            adapt.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                gv_data.DataSource = dt;
                gv_data.DataBind();

            }
        }


        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (DropDownList1.SelectedValue == "0")
            {
                Response.Write("<script>alert('Por favor, seleecione el tipo de equipo que va a registrar');window.location.href='registrar_equipo.aspx';</script>");
            }
            else
            {
                try
                {
                    conn = new SqlConnection(cs);
                    conn.Open();

                    SqlCommand id = new SqlCommand("select max(id_equipo) from dbo.equipo", conn);
                    id.ExecuteNonQuery();
                    string num_equip = Convert.ToString(id.ExecuteScalar());
                    int numser = Convert.ToInt32(num_equip);
                    int id_equipo = numser + 1;
                    string asignacion = "Sin asignar";
                    comando = new SqlCommand("insert into dbo.equipo (id_equipo, amp, marca, modelo, corriente, activo_fijo, tipo_bombillo, btu, refrigerante, voltios, tipo_equipo, usuario, dir_area) values('" + id_equipo.ToString() + "', '" + tb1.Text + "', '" + tb2.Text + "', '" + tb3.Text + "', '" + tb4.Text + "', '" + tb5.Text + "', '" + tb6.Text + "', '" + tb7.Text + "', '" + tb8.Text + "', '" + tb9.Text + "', '" + DropDownList1.SelectedItem + "', '" + asignacion.ToString() + "', '" + tb10.Text + "' )", conn);
                    comando.ExecuteNonQuery();
                    Response.Write("<script>alert('Sus datos se han guardado satisfactoriamente');window.location.href='registrar_equipo.aspx';</script>");
                    mostrardatos();
                    conn.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Sus datos no se han podido guardar' '" + Server.HtmlEncode(ex.ToString()) + "')</script>");
                }
            }
        }

        protected void gv_data_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gv_data.EditIndex = -1;
            mostrardatos();
        }

        protected void gv_data_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gv_data.EditIndex = e.NewEditIndex;
            mostrardatos();
        }



        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            /*switch (DropDownList1.SelectedValue)
            {
                case "0":
                    tb1.Enabled = false;
                    tb2.Enabled = false;
                    tb3.Enabled = false;
                    tb4.Enabled = false;
                    tb5.Enabled = false;
                    tb6.Enabled = false;
                    tb6.Text = "Disco Duro";
                    tb7.Enabled = false;
                    tb7.Text = "Sistema Operativo";
                    tb8.Enabled = false;
                    tb8.Text = "Memoria Ram";
                    tb9.Enabled = false;
                    tb9.Text = "Procesador";
                    break;
                case "1":
                    tb1.Enabled = true;
                    tb2.Enabled = true;
                    tb3.Enabled = true;
                    tb4.Enabled = true;
                    tb5.Enabled = true;
                    tb6.Enabled = true;
                    tb6.Text = "Disco Duro";
                    tb7.Enabled = true;
                    tb7.Text = "Sistema Operativo";
                    tb8.Enabled = true;
                    tb8.Text = "Memoria Ram";
                    tb9.Enabled = true;
                    tb9.Text = "Procesador";
                    break;
                case "2":
                    tb1.Enabled = true;
                    tb2.Enabled = true;
                    tb3.Enabled = true;
                    tb4.Enabled = true;
                    tb5.Enabled = true;
                    tb6.Enabled = false;
                    tb6.Text = "N/A";
                    tb7.Enabled = false;
                    tb7.Text = "N/A";
                    tb8.Enabled = false;
                    tb8.Text = "N/A";
                    tb9.Enabled = false;
                    tb9.Text = "N/A";
                    break;
                case "3":
                    tb1.Enabled = true;
                    tb2.Enabled = true;
                    tb3.Enabled = true;
                    tb4.Enabled = true;
                    tb5.Enabled = true;
                    tb6.Enabled = false;
                    tb6.Text = "N/A";
                    tb7.Enabled = false;
                    tb7.Text = "N/A";
                    tb8.Enabled = false;
                    tb8.Text = "N/A";
                    tb9.Enabled = false;
                    tb9.Text = "N/A";
                    break;
                case "4":
                    tb1.Enabled = true;
                    tb2.Enabled = true;
                    tb3.Enabled = true;
                    tb4.Enabled = true;
                    tb5.Enabled = true;
                    tb6.Enabled = false;
                    tb6.Text = "N/A";
                    tb7.Enabled = false;
                    tb7.Text = "N/A";
                    tb8.Enabled = false;
                    tb8.Text = "N/A";
                    tb9.Enabled = false;
                    tb9.Text = "N/A";
                    break;
                case"5":
                    tb1.Enabled = true;
                    tb2.Enabled = true;
                    tb3.Enabled = true;
                    tb4.Enabled = true;
                    tb5.Enabled = true;
                    tb6.Enabled = true;
                    tb6.Text = "Disco Duro";
                    tb7.Enabled = true;
                    tb7.Text = "Sistema Operativo";
                    tb8.Enabled = true;
                    tb8.Text = "Memoria Ram";
                    tb9.Enabled = true;
                    tb9.Text = "Procesador";
                    break;
                case"6":
                    tb1.Enabled = true;
                    tb2.Enabled = true;
                    tb3.Enabled = true;
                    tb4.Enabled = true;
                    tb5.Enabled = true;
                    tb6.Enabled = false;
                    tb6.Text = "N/A";
                    tb7.Enabled = false;
                    tb7.Text = "N/A";
                    tb8.Enabled = false;
                    tb8.Text = "N/A";
                    tb9.Enabled = false;
                    tb9.Text = "N/A";
                    break;
                case"7":
                    tb1.Enabled = true;
                    tb2.Enabled = true;
                    tb3.Enabled = true;
                    tb4.Enabled = true;
                    tb5.Enabled = true;
                    tb6.Enabled = false;
                    tb6.Text = "N/A";
                    tb7.Enabled = false;
                    tb7.Text = "N/A";
                    tb8.Enabled = false;
                    tb8.Text = "N/A";
                    tb9.Enabled = false;
                    tb9.Text = "N/A";
                    break;
                case"8":
                    tb1.Enabled = true;
                    tb2.Enabled = true;
                    tb3.Enabled = true;
                    tb4.Enabled = true;
                    tb5.Enabled = true;
                    tb6.Enabled = false;
                    tb6.Text = "N/A";
                    tb7.Enabled = false;
                    tb7.Text = "N/A";
                    tb8.Enabled = false;
                    tb8.Text = "N/A";
                    tb9.Enabled = false;
                    tb9.Text = "N/A";
                    break;
                case"9":
                    tb1.Enabled = true;
                    tb2.Enabled = true;
                    tb3.Enabled = true;
                    tb4.Enabled = true;
                    tb5.Enabled = true;
                    tb6.Enabled = false;
                    tb6.Text = "N/A";
                    tb7.Enabled = false;
                    tb7.Text = "N/A";
                    tb8.Enabled = false;
                    tb8.Text = "N/A";
                    tb9.Enabled = false;
                    tb9.Text = "N/A";
                    break;
            }*/
        }

        protected void gv_data_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id_equipo = gv_data.Rows[e.RowIndex].FindControl("lbl_id_equipo") as Label;
            TextBox corriente = gv_data.Rows[e.RowIndex].FindControl("lbl_corriente") as TextBox;
            TextBox refrigerante = gv_data.Rows[e.RowIndex].FindControl("lbl_refrigerante") as TextBox;
            TextBox marca = gv_data.Rows[e.RowIndex].FindControl("marca") as TextBox;
            TextBox modelo = gv_data.Rows[e.RowIndex].FindControl("modelo") as TextBox;
            TextBox btu = gv_data.Rows[e.RowIndex].FindControl("btu") as TextBox;
            TextBox activo_fijo = gv_data.Rows[e.RowIndex].FindControl("act_fij") as TextBox;
            TextBox dir_area = gv_data.Rows[e.RowIndex].FindControl("dir_area") as TextBox;
            conn = new SqlConnection(cs);
            conn.Open();
            SqlCommand cmd = new SqlCommand("update dbo.equipo set refrigerante='" + refrigerante.Text + "', marca='" + marca.Text + "', modelo='" + modelo.Text + "', corriente='" + corriente.Text + "', btu='" + btu.Text + "', activo_fijo='" + activo_fijo.Text + "', dir_area='" + dir_area.Text + "'  where id_equipo='" + id_equipo.Text + "'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();

            gv_data.EditIndex = -1;
            mostrardatos();
        }

        protected void tb1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}