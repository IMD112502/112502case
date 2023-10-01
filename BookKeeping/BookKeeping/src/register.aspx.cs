using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _BookKeeping
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected MySqlConnection DBConnection()
        {
            string connection = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            MySqlConnection conn = new MySqlConnection(connection);
            conn.Open();
            return conn;
        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            string userid = RegAcc.Text;
            string username = RegName.Text;
            string nickname = RegNickname.Text;
            string gender = RadioButton1.Checked ? "男生" : "女生";
            string password = RegPwd.Text;
            string ynpwd = YNPwd.Text;
            string email = Email.Text;

            MySqlConnection conn = DBConnection();
            
            string sql = "INSERT INTO `112-112502`.user基本資料 (user_id, user_name, nickname, gender, password, YNpassword, email) VALUES (@user_id, @user_name, @nickname, @gender, @password, @YNpassword, @email)";
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            
            cmd.Parameters.AddWithValue("@user_id", userid);
            cmd.Parameters.AddWithValue("@user_name", username);
            cmd.Parameters.AddWithValue("@nickname", nickname);
            cmd.Parameters.AddWithValue("@gender", gender); 
            cmd.Parameters.AddWithValue("@password", password);
            cmd.Parameters.AddWithValue("@YNpassword", ynpwd);
            cmd.Parameters.AddWithValue("@email", email);

            int rowsaffected = cmd.ExecuteNonQuery();

            if (rowsaffected > 0)//彈出視窗
            {
                RegAcc.Text = "";
                RegName.Text = "";
                RegNickname.Text = "";
                RadioButton1.Checked = false;
                RadioButton2.Checked = false;
                RegPwd.Text = "";
                YNPwd.Text = "";
                Email.Text = "";
                ClientScript.RegisterStartupScript(GetType(), "註冊成功", "alert('註冊成功！');", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "註冊失敗", "alert('註冊失敗！');", true);
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
           
        }

        protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
        {
            
        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox4_TextChanged(object sender, EventArgs e)
        {
            
        }
    }
}