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

                // 檢查是否有存儲的帳號和密碼值
                if (!string.IsNullOrEmpty(HiddenAccount.Value))
                {
                    RegAcc.Text = HiddenAccount.Value;
                }
                if (!string.IsNullOrEmpty(HiddenPassword.Value))
                {
                    RegPwd.Text = HiddenPassword.Value;
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
            string nickname = RegNickname.Text;
            string gender = RadioButton1.Checked ? "男生" : "女生";
            string password = RegPwd.Text;
            string selectedQuestion1 = Question1.SelectedValue;
            string answer1 = Answer1.Text;
            string confirmPassword = ReRegPwd.Text;
            DateTime selectedDate = BirthDate.Date;

            // 將帳號和密碼存儲到 HiddenField 控件中
            HiddenAccount.Value = userid;
            HiddenPassword.Value = password;


            if (ContainsChineseCharacters(userid))
            {
                // 顯示提醒視窗給使用者
                ClientScript.RegisterStartupScript(GetType(), "帳號格式錯誤", "alert('帳號只能包含英文和數字，不可包含中文字符。請重新輸入。');", true);
                return; // 阻止註冊流程
            }
            else if (password != confirmPassword)
            {
                // 密碼和確認密碼不匹配，顯示錯誤消息
                ClientScript.RegisterStartupScript(GetType(), "密碼不匹配", "alert('密碼和確認密碼不匹配。請重新輸入。');", true);
                return; // 阻止註冊流程
            }
            //else if (ContainsNonChineseCharacters(selectedQuestion1))
            //{
            //    // 安全問題包含中文字符，顯示錯誤消息
            //    ClientScript.RegisterStartupScript(GetType(), "安全问题格式错误", "alert('安全问题只能包含中文字符，不可包含其他字符。請重新输入。');", true);
            //    return; // 阻止註冊流程
            //}
            else 
            {
                if (IsUsernameAlreadyExists(userid))
                {
                    // 顯示錯誤訊息給使用者
                    ClientScript.RegisterStartupScript(GetType(), "帳號已存在", "alert('此帳號名稱已經存在。請輸入不同的帳號名稱。');", true);

                    RegAcc.Text = userid;
                    RegPwd.Text = password;
                    Question1.Text = selectedQuestion1;
                    Answer1.Text = answer1;
                    RegNickname.Text = nickname;

                }
                else
                {
                    if (string.IsNullOrWhiteSpace(userid) || string.IsNullOrWhiteSpace(nickname) || string.IsNullOrWhiteSpace(password) ||
                    string.IsNullOrWhiteSpace(answer1)
                    )
                    {
                        // 有一个或多个字段为空，显示错误消息
                        ClientScript.RegisterStartupScript(GetType(), "欄位未填寫", "alert('請填寫所有欄位。');", true);
                    }
                    else
                    {

                        string defaultClothing = string.Empty;
                        string defaultBody = string.Empty;
                        if (RadioButton1.Checked)
                        {
                            // 用户选择了男生，设置男性衣服的默认值
                            defaultClothing = "images/cloth/head_b1.png"; // 请根据实际情况设置男性衣服的值
                            defaultBody = "images/cloth/body_b1.png";
                        }
                        else if (RadioButton2.Checked)
                        {
                            // 用户选择了女生，设置女性衣服的默认值
                            defaultClothing = "images/cloth/head_g1.png"; // 请根据实际情况设置女性衣服的值
                            defaultBody = "images/cloth/body_g1.png";
                        }
                        // 电子邮件地址格式正确，可以继续注册流程
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

                        //彈出視窗
                        if (rowsaffected > 0)
                        {
                            if (rowsAffectedBody > 0)
                            {
                                if (rowsAffectedClothing > 0)
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
                            }
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(GetType(), "註冊失敗", "alert('註冊失敗！');", true);
                        }
                    }
                }
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

        //private bool ContainsNonChineseCharacters(string input)
        //{
        //    // 使用正则表达式检查输入是否包含非中文字符
        //    string pattern = @"[^\u4e00-\u9fa5]";
        //    return !Regex.IsMatch(input, pattern);
        //}

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