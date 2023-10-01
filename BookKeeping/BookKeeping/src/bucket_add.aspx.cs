using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Web.SessionState;

namespace _BookKeeping
{
    public partial class bucket_add : System.Web.UI.Page
    {

        protected string user_id ;
        public object ErrorMessagel { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            user_id = Session["UserID"] as string;
            WishUser.Text = FindName()+"想要";
        }

        protected MySqlConnection DBConnection() 
        {
            string connection = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            MySqlConnection conn = new MySqlConnection(connection);
            conn.Open();
            return conn;
        }

        protected string FindName()
        {
            MySqlConnection conn = DBConnection();
            string sql = "SELECT user_name FROM `112-112502`.user基本資料\r\nwhere user_id = @user_id";
            string user_name = string.Empty;
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@user_id", user_id);
            MySqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                int length = reader.GetString(0).Length;
                user_name = reader.GetString(0).Substring(length - 2);
            }

            return user_name;

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            MySqlConnection conn = DBConnection();


            string d_name = WishTextbox.Text;

            if (string.IsNullOrWhiteSpace(d_name))//判斷是否為空值
            {
                ErrorMessage1.Text = "請輸入願望名稱";
                ErrorMessage1.Visible = true;
                return;
            }

            if (!IsAllChineseLetters(d_name))//判斷是否為中文
            {
                ErrorMessage1.Text = "願望名稱只能包含中文文字";
                ErrorMessage1.Visible = true;
                return;
            }
            string sql_count = "SELECT count(*) FROM `112-112502`.願望清單 where user_id = @user_id;";
            MySqlCommand cmd_count = new MySqlCommand(sql_count, conn);
            cmd_count.Parameters.AddWithValue("@user_id", user_id);
            MySqlDataReader reader = cmd_count.ExecuteReader();
            reader.Read();
            int wish_count = reader.GetInt32(0);
            
            conn.Close();

            //判斷願望是否達到上限
            if (wish_count < 3)
            {
                conn.Open();
                string sql = "insert into `112-112502`.願望清單(user_id, d_name, pass_state) values (@name, @d_name, 'r')";

                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@name", user_id);
                cmd.Parameters.AddWithValue("@d_name", d_name);

                int rowsaffected = cmd.ExecuteNonQuery();
                WishTextbox.Text = null;

                if (rowsaffected > 0)//彈出視窗
                {
                    ClientScript.RegisterStartupScript(GetType(), "新增成功", "alert('新增成功！');", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "新增失敗", "alert('新增失敗！');", true);
                }

            }
            else
            {
                WishTextbox.Text = null;
                ClientScript.RegisterStartupScript(GetType(), "願望已滿", "alert('目前願望已經滿了喔！');", true);
            }
        }



            protected bool IsAllChineseLetters(string input)
        {
            // 是否只包含中文字符
            return System.Text.RegularExpressions.Regex.IsMatch(input, @"^[\u4e00-\u9fa5]+$");

        }



    }
}