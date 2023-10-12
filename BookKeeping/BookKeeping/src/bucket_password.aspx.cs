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
    public partial class bucket_password : System.Web.UI.Page
    {
        protected string user_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            user_id = Session["UserID"] as string;

            if (!IsPostBack)
            {
                // 在页面加载时检查用户是否已经注册审核密码
                bool hasAuditPassword = CheckUserHasAuditPassword(user_id);

                if (hasAuditPassword)
                {
                    // 用户已经注册了审核密码，不需要进行额外操作
                }
                else
                {
                    // 用户尚未注册审核密码，更改页面元素以显示相应的信息
                    ErrorMessageLabel.Text = "尚未註冊審核密碼，請在上方輸入密碼";
                    UserPwd.Visible = true; // 显示审核密码输入框
                    LoginButton.Text = "註冊審核密碼"; // 更改按钮文本
                }
            }
        }

        private bool CheckUserHasAuditPassword(string user_id)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                conn.Open();

                string sql = "SELECT COUNT(*) FROM `112-112502`.user基本資料 WHERE user_id = @user_id AND YNpassword IS NOT NULL";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@user_id", user_id);

                int count = Convert.ToInt32(cmd.ExecuteScalar());

                // 如果 count 大于 0，表示用户已经注册了审核密码
                return count > 0;
            }
        }



        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string enteredPassword = UserPwd.Text.Trim(); // 獲取用戶輸入的密碼
            bool userHasAuditPassword = CheckUserHasAuditPassword(user_id);

            if (userHasAuditPassword)
            {
                string correctPassword = GetPasswordForUser(user_id);
                if (enteredPassword == correctPassword)
                {
                    // 密碼正確，將用戶重定向到審核介面
                    Response.Redirect("bucket_review.aspx");
                }
                else
                {
                    // 密碼不正確，顯示提醒文字
                    ErrorMessageLabel.Text = "密碼不正確，請重試。";
                }
            }
            else
            {
                // 用户尚未注册审核密码，将用户输入的密码更新到数据库
                UpdateAuditPasswordForUser(user_id, enteredPassword);

                // 密码更新后，将用户重定向回原始页面
                Response.Redirect("bucket_password.aspx");
            }
        }

        private void UpdateAuditPasswordForUser(string user_id, string newPassword)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                conn.Open();

                string sql = "UPDATE `112-112502`.user基本資料 SET YNpassword = @newPassword WHERE user_id = @user_id";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@newPassword", newPassword);
                cmd.Parameters.AddWithValue("@user_id", user_id);

                cmd.ExecuteNonQuery();
            }
        }


        private string GetPasswordForUser(string user_id)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                conn.Open();

                string sql = "SELECT YNpassword FROM `112-112502`.user基本資料 where user_id = @user_id";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@user_id", user_id);

                using (MySqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        // 從資料庫中獲取密碼並返回
                        return reader["YNpassword"].ToString();
                    }
                    else
                    {
                        // 如果未找到用戶，可以返回 null 或其他適當的值
                        return null;
                    }
                }

            }
        }

    }
}