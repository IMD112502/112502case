using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics.Metrics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace _BookKeeping
{
    public partial class achievement : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            UpdateCount();



        }

        protected MySqlConnection DBConnection()
        {
            string connectionStrings = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(connectionStrings);
            connection.Open();
            return connection;
        }

        private void UpdateCount()
        {
            MySqlConnection conn = DBConnection();

            string a = "boa004";

            // 构建 SQL 命令来查询计数
            string sqlCount = "SELECT count(*) FROM `112-112502`.記帳資料 WHERE user_id = @user_id;";
            MySqlCommand cmdCount = new MySqlCommand(sqlCount, conn);
            cmdCount.Parameters.AddWithValue("@user_id", a);

            int c = Convert.ToInt32(cmdCount.ExecuteScalar());

            // 更新每个成就的数量和文本
            UpdateAchievementCount(AchCon1, Button3, count1, c); // 第一个成就
            UpdateAchievementCount(AchCon2, Button4, count2, c); // 第二个成就
            UpdateAchievementCount(AchCon3, Button5, count3, c); // 第三个成就
            UpdateAchievementCount(AchCon4, Button6, count4, c); // 第四个成就

            conn.Close();
        }

        private void UpdateAchievementCount(Label achievementLabel, Button achievementButton, Label countLabel, int totalCount)
        {
            // 获取<asp:Label>的文本
            string labelText = achievementLabel.Text;

            // 这里您可以进一步处理 labelText，例如提取数字部分
            string[] parts = labelText.Split(new string[] { "累計記帳" }, StringSplitOptions.None);
            if (parts.Length > 1)
            {
                string numberPart = parts[1];
                // 现在，numberPart 包含数字部分，例如 "11"

                // 去除数字部分中的 "次" 字
                numberPart = numberPart.Replace("次", "").Trim();

                // 将数字部分转换为整数以进行比较
                int targetCount = int.Parse(numberPart);

                // 检查是否可以领取成就
                if (totalCount >= targetCount)
                {
                    // 如果总数大于或等于目标数量，则启用按钮
                    achievementButton.Enabled = true;
                }
                else
                {
                    // 如果总数小于目标数量，则禁用按钮
                    achievementButton.Enabled = false;
                }

                // 更新按钮的样式
                if (achievementButton.Enabled)
                {
                    // 按钮可用时的样式
                    achievementButton.CssClass = "AchButtonGet";
                }
                else
                {
                    // 按钮不可用时的样式
                    achievementButton.CssClass = "AchButtonGet";
                }

                // 更新成就数量文本
                countLabel.Text = "(" + totalCount.ToString() + "/" + numberPart + ")";
            }
        }


    }
}