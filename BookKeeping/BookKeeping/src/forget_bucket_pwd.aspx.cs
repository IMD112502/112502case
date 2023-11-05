using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using MySql.Data.MySqlClient;
using System.Configuration;


namespace BookKeeping
{
    public partial class forget_bucket_pwd : System.Web.UI.Page
    {
        protected string user_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            user_id = Session["UserID"] as string;
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid) // 检查页面是否通过验证
            {
                string selectquestion = securityQuestion.SelectedValue;
                string selectanswer = securityAnswer.Text.Trim();
                string newpwd = UserPwd.Text.Trim();
                string confirmpwd = TextBox1.Text.Trim();

                if (newpwd == confirmpwd) // 检查两个密码字段是否匹配
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

                    using (MySqlConnection conn = new MySqlConnection(connectionString))
                    {
                        conn.Open();

                        string selectQuery = "UPDATE `112-112502`.user SET YNpassword = @password WHERE user_id = @user_id and question2 = @question2 and answer2 = @answer2";
                        MySqlCommand selectCommand = new MySqlCommand(selectQuery, conn);
                        selectCommand.Parameters.AddWithValue("@user_id", user_id);
                        selectCommand.Parameters.AddWithValue("@question2", selectquestion);
                        selectCommand.Parameters.AddWithValue("@answer2", selectanswer);
                        selectCommand.Parameters.AddWithValue("@password", newpwd);

                        int rowsUpdated = selectCommand.ExecuteNonQuery();

                        if (rowsUpdated > 0)
                        {
                            // 密码更新成功
                            // 清空文本框
                            securityQuestion.SelectedValue = "";
                            securityAnswer.Text = "";
                            UserPwd.Text = "";
                            TextBox1.Text = "";

                            // 显示成功消息
                            ClientScript.RegisterStartupScript(GetType(), "更新成功", "alert('密碼更新成功');", true);

                            // 重定向到登录页面
                            Response.AddHeader("REFRESH", "0.5;URL=bucket_password.aspx"); // 替换为实际的登录页面路径
                        }
                    }
                }

                else
                {
                    // 密码不匹配，显示错误消息
                    ClientScript.RegisterStartupScript(this.GetType(), "密碼不相同", "alert('密碼不一致，請重新輸入。');", true);
                }
            }
            else
            {
                // 显示错误消息，提示用户填写信息
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('請填寫信息');", true);
            }

        }
    }
}