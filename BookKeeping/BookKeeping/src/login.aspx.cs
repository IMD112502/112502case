using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _BookKeeping
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }


        protected void register_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx"); // 導向到註冊頁面
        }

        protected MySqlConnection DBConnection()
        {
            string connection = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            MySqlConnection conn = new MySqlConnection(connection);
            conn.Open();
            return conn;
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            MySqlConnection conn = DBConnection();

            string sql = "SELECT * FROM `112-112502`.user基本資料 WHERE user_id = @userid AND password = @password;";
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@userid", UserAcc.Text);
            cmd.Parameters.AddWithValue("@password", UserPwd.Text);

            MySqlDataReader reader = cmd.ExecuteReader();
            // search

            if (reader.Read())
            {
                // 成功
                Response.Redirect("main.aspx");
            }
            else
            {
                // error
                Label1.Text = "帳號或密碼錯誤！";
            }

            conn.Close();
            
        }


    }
}