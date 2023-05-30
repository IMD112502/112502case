using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace _BookKeeping
{
    public partial class bucket_list_add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string connection = ConfigurationManager.ConnectionStrings["test1ConnectionString"].ConnectionString;
            MySqlConnection conn = new MySqlConnection(connection);
            conn.Open();

            string name = "aaa"; //user_id
            string d_name = WishTextbox.Text;
      
            if (d_name != null)
            {
                string sql = "insert into `112-112502`.願望清單(user_id,d_name,pass_state) values (@name,@d_name , 'r')";

                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@d_name", d_name);

                int rowsaffected =  cmd.ExecuteNonQuery();
                WishTextbox.Text = null;

                if (rowsaffected > 0)
                {
                    ClientScript.RegisterStartupScript(GetType(), "新增成功", "alert('新增成功！');", true);//彈出視窗
                   
                }
                else 
                {
                    ClientScript.RegisterStartupScript(GetType(), "新增失敗", "alert('新增失敗！');", true);
                    
                }

                

                
            }


        }
    }
}