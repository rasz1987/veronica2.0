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
    public partial class registrar_usuario : System.Web.UI.Page
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
            adapt = new SqlDataAdapter("select id_user, area, nom_user, ape_user, user_name, pass_user from dbo.usuarios", conn);
            adapt.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                 gv_data.DataSource = dt;
                gv_data.DataBind();

            }
        }

        protected void gv_data_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gv_data.EditIndex = -1;
            mostrardatos();
            gv_data.Visible = false;

        }

        protected void gv_data_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gv_data.EditIndex = e.NewEditIndex;
            mostrardatos();

        }

        protected void gv_data_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            try
            {


                Label cedula = gv_data.Rows[e.RowIndex].FindControl("lbl_cedula") as Label;
                TextBox nombre = gv_data.Rows[e.RowIndex].FindControl("lbl_user") as TextBox;
                TextBox apellido = gv_data.Rows[e.RowIndex].FindControl("lbl_ape") as TextBox;
                TextBox usuario = gv_data.Rows[e.RowIndex].FindControl("lbl_usuario") as TextBox;
                TextBox clave = gv_data.Rows[e.RowIndex].FindControl("lbl_pass") as TextBox;
                TextBox area = gv_data.Rows[e.RowIndex].FindControl("lbl_area") as TextBox;
                conn = new SqlConnection(cs);
                conn.Open();

                // COMPARACIÓN DE CLAVE
                SqlCommand query2 = new SqlCommand("select pass_user from dbo.usuarios where id_user='" + cedula.Text + "'", conn);
                query2.ExecuteNonQuery();
                string pass = Convert.ToString(query2.ExecuteScalar());

                if (clave.Text == pass)
                {
                    SqlCommand cmd = new SqlCommand("update dbo.usuarios set area='" + area.Text + "', nom_user='" + nombre.Text + "', ape_user='" + apellido.Text + "', user_name='" + usuario.Text + "' where id_user='" + cedula.Text + "'", conn);
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    gv_data.EditIndex = -1;
                    mostrardatos();

                }
                else
                {
                    string source = clave.Text;
                    using (MD5 md5Hash = MD5.Create())
                    {
                        string hash = GetMd5Hash(md5Hash, source);
                        SqlCommand cmd = new SqlCommand("update dbo.usuarios set nom_user='" + nombre.Text + "', ape_user='" + apellido.Text + "', user_name='" + usuario.Text + "', pass_user='" + hash + "' where id_user='" + cedula.Text + "'", conn);
                        cmd.ExecuteNonQuery();
                        conn.Close();
                        gv_data.EditIndex = -1;
                        mostrardatos();
                    }
                }

            }

            catch (SqlException ex)
            {
                System.Windows.Forms.MessageBox.Show("fallo" + ex);
            }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            mostrardatos();
            gv_data.Visible = true;

        }

        protected void gv_data_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            try
            {


                Label cedula = gv_data.Rows[e.RowIndex].FindControl("lbl_cedula") as Label;
                TextBox nombre = gv_data.Rows[e.RowIndex].FindControl("lbl_user") as TextBox;
                TextBox apellido = gv_data.Rows[e.RowIndex].FindControl("lbl_ape") as TextBox;
                TextBox usuario = gv_data.Rows[e.RowIndex].FindControl("lbl_usuario") as TextBox;
                TextBox clave = gv_data.Rows[e.RowIndex].FindControl("lbl_pass") as TextBox;
                conn = new SqlConnection(cs);
                conn.Open();
                string source = clave.Text;
                using (MD5 md5Hash = MD5.Create())
                {
                    string hash = GetMd5Hash(md5Hash, source);
                    SqlCommand cmd = new SqlCommand("delete from dbo.usuarios where id_user='" + cedula.Text + "'", conn);
                    cmd.ExecuteNonQuery();
                    conn.Close();


                    gv_data.EditIndex = -1;
                    mostrardatos();
                }
            }

            catch (SqlException ex)
            {
                System.Windows.Forms.MessageBox.Show("fallo" + ex);
            }


        }


        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string source = tb7.Text;




            //abro la conexión
            //SqlConnection conexion = new SqlConnection("Data Source=ANSIFONTES;Initial Catalog=veronica;Integrated Security=True;Password=SSsa123;Database=veronica");
            conn = new SqlConnection(cs);
            conn.Open();
            //Verifico si tengo el user y ci_user en usuarios
            SqlCommand buscar1 = new SqlCommand("select user_name from dbo.usuarios where user_name='" + tb6.Text + "'", conn);
            buscar1.ExecuteNonQuery();
            string usuario = Convert.ToString(buscar1.ExecuteScalar());
            SqlCommand buscar = new SqlCommand("select ci_user from dbo.usuarios where ci_user = '" + tb5.Text + "'", conn);
            buscar.ExecuteNonQuery();
            string id_user = Convert.ToString(buscar.ExecuteScalar());

            switch (tb1.Text)
            {
                case "Nombre":
                    Response.Write("<script>alert('Por favor, ingrese su nombre');</script>");
                    break;
            }
            switch (tb2.Text)
            {
                case "Apellido":
                    Response.Write("<script>alert('Por favor, ingrese su apellido');</script>");
                    break;
            }
            switch (tb3.Text)
            {
                case "E-mail":
                    Response.Write("<script>alert('Por favor, ingrese su e-mail');</script>");
                    break;
            }
            switch (tb4.Text)
            {
                case "Oficina":
                    Response.Write("<script>alert('Por favor, ingrese la dirección u oficina a la cual usted pertenece');</script>");
                    break;
            }
            switch (tb5.Text)
            {
                case "Cedula":
                    Response.Write("<script>alert('Por favor, ingrese su número de cédula');</script>");
                    break;
            }
            switch (tb6.Text)
            {
                case "Usuario":
                    Response.Write("<script>alert('Por favor, ingrese su nombre de usuario');</script>");
                    break;
            }
            switch (tb7.Text)
            {
                case "Clave":
                    Response.Write("<script>alert('Por favor, ingrese su clave');</script>");
                    break;
            }
            switch (tb8.Text)
            {
                case "Confirmar clave":
                    Response.Write("<script>alert('Por favor, ingrese su confirmación de clave');</script>");
                    break;
            }
            switch (tb9.Text)
            {
                case "Telefono":
                    Response.Write("<script>alert('Por favor, ingrese su número telefónico');</script>");
                    break;
            }

            if (tb7.Text != tb8.Text || tb5.Text == id_user || tb6.Text == usuario)
            {
                if (tb7.Text != tb8.Text)
                {
                    Response.Write("<script>alert('Su password no concide.');</script>");
                }
                if (tb5.Text == id_user)
                {
                    Response.Write("<script>alert('Usted ya se encuentra registrado en el sistema.');</script>");
                }
                if (tb6.Text == usuario)
                {
                    Response.Write("<script>alert('El usuario ingresado ya se encuentra en uso');</script>");
                }
            }
            else
            {
                try
                {
                    //ENCRIPTACIÓN DE CLAVE
                    using (MD5 md5Hash = MD5.Create())
                    {
                        string hash = GetMd5Hash(md5Hash, source);

                        comando.Connection = conn;
                        comando.CommandText = "insert into dbo.usuarios(id_user, nom_user, ape_user, tel_user, user_name, pass_user, ci_user, oficina, area) values (@id,@nombre,@apellido,@telefono,@usuario,@clave,@cedula,@oficina,@area)";
                        comando.Parameters.Clear();

                        comando.Parameters.AddWithValue("id", tb5.Text);
                        comando.Parameters.AddWithValue("nombre", tb1.Text);
                        comando.Parameters.AddWithValue("apellido", tb2.Text);
                        comando.Parameters.AddWithValue("telefono", tb9.Text);
                        comando.Parameters.AddWithValue("usuario", tb6.Text);
                        comando.Parameters.AddWithValue("clave", hash);
                        comando.Parameters.AddWithValue("cedula", tb5.Text);
                        comando.Parameters.AddWithValue("oficina", tb4.Text);
                        comando.Parameters.AddWithValue("area", tb10.Text);
                    }
                    //ENCRIPTACIÓN DE CLAVE
                    int nfilas = comando.ExecuteNonQuery();
                    if (nfilas > 0)
                    {
                        Response.Write("<script>alert('Sus datos han sido guardados');</script>");
                        tb1.Text = "";

                    }
                }
                catch (SqlException ex)
                {
                    System.Windows.Forms.MessageBox.Show("fallo:" + ex);
                }
                conn.Close();
                comando.Dispose();
                /*SqlCommand id = new SqlCommand("select max(id_user) from dbo.usuarios", conexion);
                id.ExecuteNonQuery();
                string num_user = Convert.ToString(id.ExecuteScalar());
                //declaro numser como int y la igualo a num_ser1 convertida a int32
                int num_user1 = Convert.ToInt32(num_user);
                //Declaro variable suma como int y le sumo 1 a numser
                int num_id = num_user1 + 1;
                //TextBox1.Text = num_user_final.ToString();

                //Guardamos datos del usuario
                SqlCommand guardar = new SqlCommand("insert into dbo.usuarios(id_user, nom_user, ape_user, tel_user, user_name, pass_user, ci_user) values('" + ci_user.Text + "', '" + name.Text + "', '" + lbl_apell.Text + "', '" + lbl_tel.Text + "', '" + user.Text + "', '" + pass.Text + "', '" + ci_user.Text + "')", conexion);
                guardar.ExecuteNonQuery();
                Response.Write("<script>alert('Sus datos se han guardado satisfactoriamente');window.location.href='loguin.aspx';</script>");
                conexion.Close();
            }
            catch (SqlException)
            {
                Response.Write("<script>alert('Sus datos no se han podido guardar')</script>"); */

            }


        }

        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {


            if (tb5.Text == "Cedula")
            {
                //System.Windows.Forms.MessageBox.Show("Por favor, introduzca su número de cédula.");
                Response.Write("<script>alert('Por favor, intrduzca un número de cédula')</script>");
                tb5.Focus();
            }
            else
            {
                try
                {
                    conn = new SqlConnection(cs);
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("select count(*) from dbo.usuarios where id_user='" + tb5.Text + "'", conn);
                    cmd.ExecuteNonQuery();
                    int count = Convert.ToInt32(cmd.ExecuteScalar());
                    if (count == 0)
                    {
                        System.Windows.Forms.MessageBox.Show("dato no encontrado.");
                        tb5.Text = "";
                        tb5.Focus();
                    }
                    else
                    {
                        dt = new DataTable();
                        conn = new SqlConnection(cs);
                        conn.Open();
                        adapt = new SqlDataAdapter("select id_user, nom_user, ape_user, user_name, pass_user from dbo.usuarios where id_user='" + tb5.Text + "'", conn);
                        adapt.Fill(dt);
                        if (dt.Rows.Count > 0)
                        {
                            gv_data.DataSource = dt;
                            gv_data.DataBind();
                            gv_data.Visible = true;

                        }

                    }


                }
                catch (SqlException ex)
                {
                    System.Windows.Forms.MessageBox.Show("fallo:" + ex);
                }

            }

        }


        static string GetMd5Hash(MD5 md5Hash, string input)
        {

            // Convert the input string to a byte array and compute the hash.
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

            // Create a new Stringbuilder to collect the bytes
            // and create a string.
            StringBuilder sBuilder = new StringBuilder();

            // Loop through each byte of the hashed data 
            // and format each one as a hexadecimal string.
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }

            // Return the hexadecimal string.
            return sBuilder.ToString();
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        /*ENCRIPTACIÓN DE CLAVE 
         * protected void Button1_Click(object sender, EventArgs e)
        {
            string source = tb7.Text;
            using (MD5 md5Hash = MD5.Create())
            {
                string hash = GetMd5Hash(md5Hash, source);

                System.Windows.Forms.MessageBox.Show("The MD5 hash of " + source + " is: " + hash + ".");
            }
        */
    }

}