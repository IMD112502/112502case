using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace BookKeeping.src
{
	public partial class forget_pw : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}
        protected void ReturnButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }



        protected void Comfirm_Click (object sender, EventArgs e)
		{
            if (Page.IsValid) // 检查页面是否通过验证
            {
                string selectquestion = secretQuestion.SelectedValue;
			    string selectanswer = secretAnswer.Text.Trim();
			    string newpwd = newanswer.Text.Trim();
                string account = enteraccount.Text.Trim();

                string connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

                using (MySqlConnection conn = new MySqlConnection(connectionString))
                {
                    conn.Open();

                    string selectQuery = "UPDATE `112-112502`.user基本資料 SET password = @password WHERE user_id = @user_id and question1 = @question1 and answer1 = @answer1";
                    MySqlCommand selectCommand = new MySqlCommand(selectQuery, conn);
                    selectCommand.Parameters.AddWithValue("@question1", selectquestion);
                    selectCommand.Parameters.AddWithValue("@answer1", selectanswer);
                    selectCommand.Parameters.AddWithValue("@password", newpwd);
                    selectCommand.Parameters.AddWithValue("@user_id", account);

                    int rowsUpdated = selectCommand.ExecuteNonQuery();

                    if (rowsUpdated > 0)
                    {
                        // 密码更新成功
                        // 清空文本框
                        secretAnswer.Text = "";
                        newanswer.Text = "";
                        enteraccount.Text = "";

                        // 显示成功消息
                        ClientScript.RegisterStartupScript(GetType(), "更新成功", "alert('密碼更新成功');", true);

                        // 重定向到登录页面
                        Response.AddHeader("REFRESH", "0.5;URL=login.aspx"); // 替换为实际的登录页面路径
                    }
                    else
                    {
                        // 密码更新失败或没有匹配的记录
                        // 可以显示错误消息
                    }
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