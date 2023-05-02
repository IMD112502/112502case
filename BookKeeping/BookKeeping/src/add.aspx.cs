using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _BookKeeping
{
    public partial class add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void submit_Click(object sender, EventArgs e) {
            string connection = ConfigurationManager.ConnectionStrings["test1ConnectionString"].ConnectionString;
            MySqlConnection conn = new MySqlConnection(connection);
            conn.Open();

            string name = "aaa";
            DateTime date = DateTime.Parse(Request.Form["date"]);
            int cost = Convert.ToInt32(TextBox1.Text);
            string category = Request.Form["radio"].ToString();
            if (category != null)
            {
                string sql = "insert into `112-112502`.記帳資料(user_id , date , class , cost) values (@name , @date , @category , @cost)";

                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@category", category);
                cmd.Parameters.AddWithValue("@date", date);
                cmd.Parameters.AddWithValue("@cost", cost);



                cmd.ExecuteNonQuery();
            }
        }
        }
    }
