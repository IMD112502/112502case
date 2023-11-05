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



        protected void Comfirm_Click(object sender, EventArgs e)
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

                    string selectQuery = "UPDATE `112-112502`.user SET password = @password WHERE user_id = @user_id and question1 = @question1 and answer1 = @answer1";
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
                        string script = "var imageBox = document.createElement('img');";
                        script += "imageBox.src = 'images/alert_1Y.png';"; // 设置图像的路径
                        script += "imageBox.className = 'custom-image';"; // 添加自定义CSS类
                        script += "document.body.appendChild(imageBox);";
                        script += "setTimeout(function() { imageBox.style.display = 'none'; }, 2000);"; // 自动隐藏图像
                        ClientScript.RegisterStartupScript(GetType(), "修改成功", script, true);

                        // 重定向到登录页面
                        Response.AddHeader("REFRESH", "0.5;URL=login.aspx"); // 替换为实际的登录页面路径
                    }
                    else
                    {
                        // 密码更新失败或没有匹配的记录
                        // 可以显示错误消息
                        string script = "var imageBox = document.createElement('img');";
                        script += "imageBox.src = 'images/alert_pw_n_same.png';"; // 设置图像的路径
                        script += "imageBox.className = 'custom-image';"; // 添加自定义CSS类
                        script += "document.body.appendChild(imageBox);";
                        script += "setTimeout(function() { imageBox.style.display = 'none'; }, 2000);"; // 自动隐藏图像
                        ClientScript.RegisterStartupScript(GetType(), "密碼不一致", script, true);
                    }
                }
            }
            else
            {
                // 显示错误消息，提示用户填写信息
                string script = "var imageBox = document.createElement('img');";
                script += "imageBox.src = 'images/alert_n_whole.png';"; // 设置图像的路径
                script += "imageBox.className = 'custom-image';"; // 添加自定义CSS类
                script += "document.body.appendChild(imageBox);";
                script += "setTimeout(function() { imageBox.style.display = 'none'; }, 2000);"; // 自动隐藏图像
                ClientScript.RegisterStartupScript(GetType(), "請填寫完整", script, true);
            }
        }
    }
}