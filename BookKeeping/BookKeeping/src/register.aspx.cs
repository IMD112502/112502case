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
            Session["UserBirthDate"] = DateTime.Now;
            if (IsPostBack)
            {
                // 获取用户选择的出生日期
                if (DateTime.TryParse(Request.Form["BirthDate"], out DateTime birthdate))
                {
                    BirthDate = birthdate;
                }
            }
            if (!IsPostBack)
            {
                // 检查 Session 是否包含生日值，如果不存在，则创建一个空的 Session 变量
                if (Session["UserBirthDate"] == null)
                {
                    Session["UserBirthDate"] = DateTime.Now; // 设置为今天的日期
                }

                // 获取生日值并将其设置给日期选择器
                DateTime birthDate = (DateTime)Session["UserBirthDate"];
                BirthDate = birthDate;

                // 更新日期选择器的值
                Page.ClientScript.RegisterStartupScript(this.GetType(), "SetBirthDate", "document.getElementById('BirthDate').value = '" + birthDate.ToString("yyyy-MM-dd") + "';", true);
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
            string nickname = RegNickname.Text;
            string gender = RadioButton1.Checked ? "男生" : "女生";
            string password = RegPwd.Text;
            string selectedQuestion1 = Question1.SelectedValue;
            string answer1 = Answer1.Text;
            string confirmPassword = ReRegPwd.Text;
            DateTime selectedDate = BirthDate.Date;

            if (selectedDate != DateTime.MinValue)
            {
                // 将生日存储在 Session 中
                Session["UserBirthDate"] = selectedDate;
            }

            // 检查是否有字段为空
            if (string.IsNullOrWhiteSpace(userid) || string.IsNullOrWhiteSpace(nickname) || string.IsNullOrWhiteSpace(password) || string.IsNullOrWhiteSpace(answer1))
            {
                // 有一个或多个字段为空，显示错误消息
                ClientScript.RegisterStartupScript(GetType(), "欄位未填寫", "alert('請填寫所有欄位。');", true);
                return; // 阻止注册流程
            }

            // 检查生日是否选择
            if (selectedDate == DateTime.MinValue)
            {
                // 日期没有选择，显示错误消息
                ClientScript.RegisterStartupScript(GetType(), "生日未選擇", "alert('請選擇生日日期。');", true);
                return; // 阻止注册流程
            }

            // 检查帐号只包含英文和数字
            if (ContainsNonChineseCharacters(userid))
            {
                // 帐号包含非英文或数字字符，显示错误消息
                ClientScript.RegisterStartupScript(GetType(), "帳號格式錯誤", "alert('帳號只能包含英文和數字，不可包含中文字符。請重新輸入。');", true);
                return; // 阻止注册流程
            }

            // 检查密码和确认密码是否匹配
            if (password != confirmPassword)
            {
                // 密码和确认密码不匹配，显示错误消息
                ClientScript.RegisterStartupScript(GetType(), "密碼不匹配", "alert('密碼和確認密碼不匹配。請重新輸入。');", true);
                return; // 阻止注册流程
            }

            // 检查答案只包含中文
            if (!ContainsChineseCharacters(answer1))
            {
                // 答案包含非中文字符，显示错误消息
                ClientScript.RegisterStartupScript(GetType(), "答案格式錯誤", "alert('答案只能包含中文字符。請重新輸入。');", true);
                return; // 阻止注册流程
            }

            if (IsUsernameAlreadyExists(userid))
            {
                // 帐号已存在，显示错误消息
                ClientScript.RegisterStartupScript(GetType(), "帳號已存在", "alert('此帳號名稱已經存在。請輸入不同的帳號名稱。');", true);
                return; // 阻止注册流程
            }

            // 以上验证通过后，可以执行注册流程

            string defaultClothing = string.Empty;
            string defaultBody = string.Empty;
            if (RadioButton1.Checked)
            {
                // 用户选择了男生，设置男性衣服的默认值
                defaultClothing = "images/cloth/defaulthead_b.png"; // 请根据实际情况设置男性衣服的值
                defaultBody = "images/cloth/defaultbody_b.png";
            }
            else if (RadioButton2.Checked)
            {
                // 用户选择了女生，设置女性衣服的默认值
                defaultClothing = "images/cloth/defaulthead_g.png"; // 请根据实际情况设置女性衣服的值
                defaultBody = "images/cloth/defaultbody_g.png";
            }


            // 在这里添加将用户信息插入数据库的代码
            MySqlConnection conn = DBConnection();

            string sql = "INSERT INTO `112-112502`.user (user_id, nickname, gender, password, question1, answer1, birthday, cloth, cloth2) VALUES (@user_id, @nickname, @gender, @password, @question1, @answer1, @birthdate, @defaultBody, @defaultClothing)";
            MySqlCommand cmd = new MySqlCommand(sql, conn);

            cmd.Parameters.AddWithValue("@user_id", userid);
            cmd.Parameters.AddWithValue("@nickname", nickname);
            cmd.Parameters.AddWithValue("@gender", gender);
            cmd.Parameters.AddWithValue("@password", password);
            cmd.Parameters.AddWithValue("@question1", selectedQuestion1);
            cmd.Parameters.AddWithValue("@answer1", answer1);
            cmd.Parameters.AddWithValue("@birthdate", selectedDate);
            cmd.Parameters.AddWithValue("@defaultClothing", defaultClothing);
            cmd.Parameters.AddWithValue("@defaultBody", defaultBody);

            string SQL = "INSERT INTO `112-112502`.dressing_room (user_id, cloth_id) VALUES (@user_id, @cloth_id)";
            MySqlCommand sqlcmd = new MySqlCommand(SQL, conn);

            sqlcmd.Parameters.AddWithValue("@user_id", userid);
            sqlcmd.Parameters.AddWithValue("@cloth_id", defaultClothing); // 插入默认衣物的路径

            int rowsAffectedClothing = sqlcmd.ExecuteNonQuery();

            sqlcmd.Parameters.Clear(); // 清除之前的参数

            sqlcmd.Parameters.AddWithValue("@user_id", userid);
            sqlcmd.Parameters.AddWithValue("@cloth_id", defaultBody); // 插入默认身体的路径

            int rowsAffectedBody = sqlcmd.ExecuteNonQuery();

            int rowsaffected = cmd.ExecuteNonQuery();

            // 彈出視窗
            if (rowsaffected > 0 && rowsAffectedBody > 0 && rowsAffectedClothing > 0)
            {
                RegAcc.Text = "";
                RegNickname.Text = "";
                RadioButton1.Checked = false;
                RadioButton2.Checked = false;
                RegPwd.Text = "";
                Answer1.Text = "";
                ClientScript.RegisterStartupScript(GetType(), "註冊成功", "alert('註冊成功！');", true);
                Response.AddHeader("REFRESH", "0.5;URL=login.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "註冊失敗", "alert('註冊失敗！');", true);
            }
        }


        private bool IsUsernameAlreadyExists(string userid)
        {
            using (MySqlConnection conn = DBConnection())
            {
                string sql = "SELECT COUNT(*) FROM `112-112502`.user WHERE user_id = @userid";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@userid", userid);

                int count = Convert.ToInt32(cmd.ExecuteScalar());
                return count > 0;
            }
        }

        private bool ContainsChineseCharacters(string input)
        {
            // 使用正則表達式檢查輸入是否包含中文字符
            string pattern = @"[\u4e00-\u9fa5]";
            return Regex.IsMatch(input, pattern);
        }

        private bool ContainsNonChineseCharacters(string input)
        {
            // 使用正则表达式检查输入是否包含非中文字符
            string pattern = @"[^\u4e00-\u9fa5]";
            return !Regex.IsMatch(input, pattern);
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