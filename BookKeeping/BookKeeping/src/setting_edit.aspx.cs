using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Configuration;


namespace BookKeeping.src
{
    public partial class setting_edit : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 判断是否是首次加载页面，避免在 postback 时重新加载数据

                // 获取用户的原始数据
                string userId = Session["UserID"] as string;
                UserData userData = GetUserData(userId); // 假设 GetUserData 方法返回用户数据对象

                // 将数据填充到 TextBox 控件
                if (userData != null)
                {
                    SetName.Text = userData.Name;
                    SetNickname.Text = userData.Nickname;
                    TextBox1.Text = userData.Account;
                    TextBox2.Text = userData.Birthdate.Year.ToString(); // 假设 Birthdate 是 DateTime 类型
                    TextBox3.Text = userData.Birthdate.Month.ToString();
                    TextBox4.Text = userData.Birthdate.Day.ToString();

                    // 根据用户性别设置 RadioButton
                    if (userData.Gender == "男生")
                    {
                        RadioButton1.Checked = true;
                    }
                    else if (userData.Gender == "女生")
                    {
                        RadioButton2.Checked = true;
                    }
                }
            }
        }

        public UserData GetUserData(string userId)
        {
            UserData user = new UserData();

            // 从配置文件中获取数据库连接字符串
            string connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                // 创建 SQL 查询，根据用户ID检索用户数据
                string query = "SELECT user_name, nickname, gender, user_id, birthday FROM `112-112502`.user基本資料 WHERE user_id = @UserId";

                using (MySqlCommand cmd = new MySqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@UserId", userId);

                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            user.Name = reader["user_name"].ToString();
                            user.Nickname = reader["nickname"].ToString();
                            user.Gender = reader["gender"].ToString();
                            user.Account = reader["user_id"].ToString();
                            user.Birthdate = Convert.ToDateTime(reader["birthday"]);
                        }
                    }
                }
            }

            return user;
        }

        public class UserData
        {
            public string Name { get; set; }
            public string Nickname { get; set; }
            public string Gender { get; set; }
            public string Account { get; set; }
            public DateTime Birthdate { get; set; }
        }

        protected void EditOk_Click(object sender, EventArgs e)
        {
            // 获取用户输入的数据
            UserData modifiedUserData = new UserData
            {
                Name = SetName.Text,
                Nickname = SetNickname.Text,
                Account = TextBox1.Text,
                Gender = RadioButton1.Checked ? "男生" : "女生",
                Birthdate = new DateTime(
                    int.Parse(TextBox2.Text),
                    int.Parse(TextBox3.Text),
                    int.Parse(TextBox4.Text))
               
            };

            // 调用保存数据的方法
            bool updateSuccess = UpdateUserData(modifiedUserData);

            if (updateSuccess)
            {
                // 如果更新成功，你可以进行相应的处理，例如重定向到设置页面或显示成功消息
                Response.Redirect("setting.aspx");
            }
            else
            {
                // 如果更新失败，显示错误消息给用户
                Response.Write("<script>alert('新增失敗')</script>");
            }
        }

        public bool UpdateUserData(UserData modifiedUserData)
        {
            // 从配置文件中获取数据库连接字符串
            string connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                // 创建 SQL 命令，更新用户数据
                string query = "UPDATE `112-112502`.user基本資料 " +
                               "SET user_name = @Name, " +
                               "    nickname = @Nickname, " +
                               "    gender = @Gender, " +
                               "    birthday = @Birthdate " +
                               "WHERE user_id = @Account";

                using (MySqlCommand cmd = new MySqlCommand(query, connection))
                {
                    cmd.Parameters.AddWithValue("@Name", modifiedUserData.Name);
                    cmd.Parameters.AddWithValue("@Nickname", modifiedUserData.Nickname);
                    cmd.Parameters.AddWithValue("@Gender", modifiedUserData.Gender);
                    cmd.Parameters.AddWithValue("@Birthdate", modifiedUserData.Birthdate.ToString("yyyy-MM-dd"));
                    cmd.Parameters.AddWithValue("@Account", modifiedUserData.Account);

                    int rowsAffected = cmd.ExecuteNonQuery();
                    return rowsAffected > 0; // 返回是否更新成功
                }
            }
        }



        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}