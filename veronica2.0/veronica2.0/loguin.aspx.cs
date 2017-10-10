using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Windows.Forms;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web.Security;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace veronica2._0
{
    public partial class loguin1 : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["veronicaConnectionString"].ConnectionString;
        SqlConnection con;

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


        protected void Page_Load(object sender, EventArgs e)
        {
            //EVITA QUE SE GUARDE EN CACHE
            //Response.Cache.SetCacheability(HttpCacheability.ServerAndNoCache);
            //Response.Cache.SetNoStore();


            Session.Abandon();
            FormsAuthentication.SignOut();

        }

        private bool ValidateUser(string userName, string passWord)
        {
            string lookupPassword = null;

            con = new SqlConnection(cs);
            con.Open();
            

            SqlCommand query = new SqlCommand("select pass_user from dbo.usuarios where user_name = '" + userName + "'", con);
            query.ExecuteNonQuery();

            //recuperamos la password de la base
            lookupPassword = Convert.ToString(query.ExecuteScalar());
            con.Close();

            //si no hay resultados, se devuelve falso
            if (null == lookupPassword)
            {
                return false;
            }

            //se compara la password de la base con la digitada, usando case sensitive

            using (MD5 md5Hash = MD5.Create())
            {
                string hash = GetMd5Hash(md5Hash, passWord.ToString());

                return (0 == string.Compare(lookupPassword.Trim(), hash.Trim(), false));
            }
        }


        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            if (ValidateUser(Login1.UserName, Login1.Password))
                {
                    FormsAuthentication.RedirectFromLoginPage(Login1.UserName, Login1.RememberMeSet);
                }
                
            }


        }
    }


