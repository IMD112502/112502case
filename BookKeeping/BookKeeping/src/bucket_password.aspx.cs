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
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string enteredPassword = UserPwd.Text.Trim(); // 獲取用戶輸入的密碼
            string correctPassword = GetPasswordForUser(user_id); // 從資料庫中獲取密碼

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