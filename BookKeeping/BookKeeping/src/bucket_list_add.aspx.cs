using MySql.Data.MySqlClient;
using Org.BouncyCastle.Utilities.Collections;
using System;
using System.Collections.Generic;
using System.Configuration;
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
            //從web.config導入資料庫字串
            string connection = ConfigurationManager.ConnectionStrings["test1ConnectionString"].ConnectionString;
            //連接資料庫
            MySqlConnection conn = new MySqlConnection(connection);
            conn.Open();
            string username = "aaa";
            string wishname = wish_textbox.Text;
            if (wishname != null)
            {
                string sql = "insert into `112-112502`.願望清單 (user_id, d_name) values(@username, @wishname)";

                //寫入資料庫語法
                MySqlCommand cmd = new MySqlCommand(sql, conn);

                //把指定參數帶入sql語法
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue ("@wishname", wishname);

                cmd.ExecuteNonQuery();



            }
        }
    }
}