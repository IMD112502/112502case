using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace _BookKeeping
{
    public partial class register : System.Web.UI.Page
    {
        protected DateTime BirthDate { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (IsPostBack)
            {
                // 获取用户选择的出生日期
                if (DateTime.TryParse(Request.Form["BirthDate"], out DateTime birthdate))
                {
                    BirthDate = birthdate;
                }
            }

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
            string email = Email.Text;
            string selectedQuestion1 = Question1.SelectedValue;
            string answer1 = Answer1.Text;
            DateTime selectedDate = BirthDate.Date;

            if (string.IsNullOrWhiteSpace(userid) || string.IsNullOrWhiteSpace(username) || string.IsNullOrWhiteSpace(nickname)
                || string.IsNullOrWhiteSpace(password)
                || string.IsNullOrWhiteSpace(email)
                || string.IsNullOrWhiteSpace(selectedQuestion1) ||
                string.IsNullOrWhiteSpace(answer1)
                )
            {
                // 有一个或多个字段为空，显示错误消息
                ClientScript.RegisterStartupScript(GetType(), "欄位未填寫", "alert('請填寫所有欄位。');", true);
            }
            else if (IsValidEmail(email))
            {

                string defaultClothing = string.Empty;
                string defaultBody = string.Empty;
                if (RadioButton1.Checked)
                {
                    // 用户选择了男生，设置男性衣服的默认值
                    defaultClothing = "images/cloth/Head_b1.png"; // 请根据实际情况设置男性衣服的值
                    defaultBody = "images/cloth/body_b1.png";
                }
                else if (RadioButton2.Checked)
                {
                    // 用户选择了女生，设置女性衣服的默认值
                    defaultClothing = "images/cloth/Head_g1.png"; // 请根据实际情况设置女性衣服的值
                    defaultBody = "images/cloth/body_g1.png";
                }
                // 电子邮件地址格式正确，可以继续注册流程
                // 在这里添加将用户信息插入数据库的代码
                MySqlConnection conn = DBConnection();

                string sql = "INSERT INTO `112-112502`.user基本資料 (user_id, user_name, nickname, gender, password, email, question1, answer1, birthday, cloth, cloth2) VALUES (@user_id, @user_name, @nickname, @gender, @password, @email, @question1, @answer1, @birthdate, @defaultBody, @defaultClothing)";
                MySqlCommand cmd = new MySqlCommand(sql, conn);

                cmd.Parameters.AddWithValue("@user_id", userid);
                cmd.Parameters.AddWithValue("@user_name", username);
                cmd.Parameters.AddWithValue("@nickname", nickname);
                cmd.Parameters.AddWithValue("@gender", gender);
                cmd.Parameters.AddWithValue("@password", password);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@question1", selectedQuestion1);
                cmd.Parameters.AddWithValue("@answer1", answer1);
                cmd.Parameters.AddWithValue("@birthdate", selectedDate);
                cmd.Parameters.AddWithValue("@defaultClothing", defaultClothing);
                cmd.Parameters.AddWithValue("@defaultBody", defaultBody);

                string SQL = "INSERT INTO `112-112502`.更衣間 (user_id, cloth_id) VALUES (@user_id, @cloth_id)";
                MySqlCommand sqlcmd = new MySqlCommand(SQL, conn);

                sqlcmd.Parameters.AddWithValue("@user_id", userid);
                sqlcmd.Parameters.AddWithValue("@cloth_id", defaultClothing); // 插入默认衣物的路径

                int rowsAffectedClothing = sqlcmd.ExecuteNonQuery();

                sqlcmd.Parameters.Clear(); // 清除之前的参数

                sqlcmd.Parameters.AddWithValue("@user_id", userid);
                sqlcmd.Parameters.AddWithValue("@cloth_id", defaultBody); // 插入默认身体的路径

                int rowsAffectedBody = sqlcmd.ExecuteNonQuery();


                int rowsaffected = cmd.ExecuteNonQuery();

                //彈出視窗
                if (rowsaffected > 0)
                {
                    if (rowsAffectedBody > 0)
                    {
                        if(rowsAffectedClothing > 0)
                        {
                            RegAcc.Text = "";   
                            RegName.Text = "";
                            RegNickname.Text = "";
                            RadioButton1.Checked = false;
                            RadioButton2.Checked = false;
                            RegPwd.Text = "";
                            Email.Text = "";
                            Answer1.Text = "";
                            ClientScript.RegisterStartupScript(GetType(), "註冊成功", "alert('註冊成功！');", true);
                            Response.AddHeader("REFRESH", "0.5;URL=login.aspx");
                        }  
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "註冊失敗", "alert('註冊失敗！');", true);
                }
            }
            else
            {
                // 电子邮件地址格式不正确，显示错误消息
                ClientScript.RegisterStartupScript(GetType(), "電子信箱格式錯誤", "alert('請輸入有效電子信箱');", true);
            }
        }

        public bool IsValidEmail(string email)
        {
            // 使用正则表达式验证电子邮件地址格式
            string pattern = @"^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$";

            return Regex.IsMatch(email, pattern);
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