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
    public partial class register_question : System.Web.UI.Page
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
            string password = RegPwd.Text;
            string selectedQuestion1 = Question1.SelectedValue;
            string answer1 = Answer1.Text;

            MySqlConnection conn = DBConnection();

            string sql = "INSERT INTO `112-112502`.user基本資料 (user_id, user_name, nickname, gender, password, email, question1, answer1) VALUES (@user_id, @user_name, @nickname, @gender, @password, @email, @question1, @answer1)";
            MySqlCommand cmd = new MySqlCommand(sql, conn);

            cmd.Parameters.AddWithValue("@password", password);
            cmd.Parameters.AddWithValue("@question1", selectedQuestion1);
            cmd.Parameters.AddWithValue("@answer1", answer1);


            //int rowsaffected = cmd.ExecuteNonQuery();

            //if (rowsaffected > 0)//彈出視窗
            //{
            //    RegPwd.Text = "";
            //    Answer1.Text = "";
            //    ClientScript.RegisterStartupScript(GetType(), "註冊成功", "alert('註冊成功！');", true);
            //    Response.Redirect("login.aspx");
            //}
            //else
            //{
            //    ClientScript.RegisterStartupScript(GetType(), "註冊失敗", "alert('註冊失敗！');", true);
            //}

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