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
using System.Data;
using System.Web.SessionState;
using MySqlX.XDevAPI;
using System.Threading.Tasks;

namespace _BookKeeping
{
    public partial class achievement : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                BindTaskList();
                
            }
        }
        private string UserGender(MySqlConnection connection) 
        {
            string gender = "";
            string query = "SELECT gender FROM `112-112502`.user WHERE user_id = @user_id";
            string user_id = Session["UserID"].ToString();
           

            using (MySqlCommand command = new MySqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@user_id", user_id);
                string cmdGender = command.ExecuteScalar().ToString();
                if (cmdGender == "男生")
                {
                    gender += "b";
                }
                else
                {
                    gender += "g";
                }

            }
            
           

            return gender;
        }

        private void BindTaskList()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            string user_id = Session["UserID"].ToString();
            

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                //將已完成的成就存放至陣列中
                List<string> finishTaskLists = new List<string>();
                int[] taskCount = { 5, 10, 20, 50 };

                string query = "SELECT a_id FROM `112-112502`.achievement WHERE user_id = @user_id";
                MySqlCommand command = new MySqlCommand(query, connection);
                command.Parameters.AddWithValue("@user_id", user_id);

                // 執行 SQL 查詢
                using (MySqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string finishTaskList = reader.GetString("a_id");
                        finishTaskLists.Add(finishTaskList);
                    }

                }

                //將清單轉換成陣列
                string[] finishTaskArray = finishTaskLists.ToArray();




                // 獲取記帳次數、許願次數和使用者性別
                int accountingCount = GetAccountingCount(connection);
                int wishingCount = GetWishingCount(connection);
                string gender = UserGender(connection);

                // 創建任務清單數據
                DataTable dt = new DataTable();
                dt.Columns.Add("TaskID", typeof(int));
                dt.Columns.Add("ImageUrl", typeof(string));
                dt.Columns.Add("TaskName", typeof(string));
                dt.Columns.Add("TaskDescription", typeof(string));
                dt.Columns.Add("ProgressBarStyle", typeof(string));
                dt.Columns.Add("IsTaskCompleted", typeof(bool));


                // 任務1：記帳次數達5次 (finishTaskArray 不包含 '1' 才新增）
                for (int i = 1; i <= 7; i += 2)
                {
                    if (!finishTaskArray.Contains(i.ToString()))
                    {
                        int countIndex = i / 2;
                        int clothIndex = countIndex + 1; // 更改为从2号衣服开始
                        int cnt = taskCount[countIndex];
                        DataRow task1 = dt.NewRow();
                        task1["TaskID"] = i.ToString();
                        task1["ImageUrl"] = ResolveUrl("~/src/images/cloth/body_" + gender + clothIndex.ToString() + ".png");
                        task1["TaskName"] = "記帳次數達" + cnt.ToString() + "次";
                        task1["TaskDescription"] = $"您已記帳 {accountingCount} 次";
                        task1["ProgressBarStyle"] = $"width: {(accountingCount >= cnt ? 100 : (accountingCount * 100 / cnt))}%";
                        task1["IsTaskCompleted"] = (accountingCount >= cnt);
                        dt.Rows.Add(task1);

                        break;
                    }
                }


                // 任務2：許願10次( finishTaskArray 不包含 '2' 才新增）
                for (int j = 2; j <= 8; j += 2)
                {
                    if (!finishTaskArray.Contains(j.ToString()))
                    {
                        int countIndex = j / 2 - 1;
                        int clothIndex = countIndex + 1;
                        int cnt = taskCount[countIndex];
                        DataRow task2 = dt.NewRow();
                        task2["TaskID"] = 2;
                        task2["ImageUrl"] = ResolveUrl("~/src/images/cloth/head_" + gender + clothIndex.ToString() + ".png");
                        task2["TaskName"] = "許願次數達" + cnt.ToString() + "次";
                        task2["TaskDescription"] = $"您已許願 {wishingCount} 次";
                        task2["ProgressBarStyle"] = $"width: {(wishingCount >= cnt ? 100 : (wishingCount * 100 / cnt))}%";
                        task2["IsTaskCompleted"] = (wishingCount >= cnt);
                        dt.Rows.Add(task2);
                        break;
                    }
                }


                TaskRepeater.DataSource = dt;
                TaskRepeater.DataBind();
                connection.Close();
            }
        }

        private int GetAccountingCount(MySqlConnection connection)
        {
            // 執行 SQL 查詢以獲取記帳次數
            string query = "SELECT COUNT(*) FROM `112-112502`.bookkeeping_data WHERE user_id = @user_id";
            string user_id = Session["UserID"].ToString();

            using (MySqlCommand command = new MySqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@user_id", user_id);
                return Convert.ToInt32(command.ExecuteScalar());
            }
        }

        private int GetWishingCount(MySqlConnection connection)
        {
            // 執行 SQL 查詢以獲取許願次數
            string query = "SELECT COUNT(*) FROM `112-112502`.bucket_list WHERE user_id = @user_id";
            string user_id = Session["UserID"].ToString();
            using (MySqlCommand command = new MySqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@user_id", user_id);
                return Convert.ToInt32(command.ExecuteScalar());
            }
        }

        protected void ClaimButton_Click(object sender, EventArgs e)
        {

            int rowsAffected = 0;
            

            // 验证是否成功获取了用户ID
            if (Session["UserID"] != null)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

                MySqlConnection connection = new MySqlConnection(connectionString);
                connection.Open();

                Button claimButton = (Button)sender;
                string taskId = claimButton.CommandArgument.ToString();
                string gender = UserGender(connection);

                // 根据 taskId 执行相应的操作，例如发放奖励

                string sql_ach = "INSERT INTO `112-112502`.achievement (user_id, a_id , get_state) VALUES (@user_id , @task_id , 'y')";

                // 使用 Session 中的用户ID
                string user_id = Session["UserID"].ToString();

                using (MySqlCommand cmd = new MySqlCommand(sql_ach, connection))
                {
                    cmd.Parameters.AddWithValue("@user_id", user_id); // 使用 userId 而不是 user_id
                    cmd.Parameters.AddWithValue("@task_id", taskId);

                    rowsAffected += cmd.ExecuteNonQuery();

                }

                // 确保 task_id 是一个整数
                if (int.TryParse(taskId, out int taskIdValue))
                {
                    // 基于 task_id 是否为奇数来构建 @cloth_id
                    string clothIdValue = (taskIdValue % 2 == 1)
                    ? $"images/cloth/body_{gender}{Convert.ToInt32(taskId) + 1}.png"
                    : $"images/cloth/head_{gender}{Convert.ToInt32(taskId) + 1}.png";

                    string sql_cloth = "INSERT INTO `112-112502`.dressing_room (user_id, cloth_id) VALUES (@user_id, @cloth_id);";

                    using (MySqlCommand cmd_cloth = new MySqlCommand(sql_cloth, connection))
                    {
                        cmd_cloth.Parameters.AddWithValue("@user_id", user_id);
                        cmd_cloth.Parameters.AddWithValue("@cloth_id", clothIdValue);

                        rowsAffected += cmd_cloth.ExecuteNonQuery();
                    }
                }

                if (rowsAffected > 1)
                {
                    string script = "var imageBox = document.createElement('img');";
                    script += "imageBox.src = 'images/alert_4Y.png';"; // 设置图像的路径
                    script += "imageBox.className = 'custom-image';"; // 添加自定义CSS类
                    script += "document.body.appendChild(imageBox);";
                    script += "setTimeout(function() { imageBox.style.display = 'none'; }, 2000);"; // 自动隐藏图像
                    ClientScript.RegisterStartupScript(GetType(), "領取成功", script, true);
                }
                else
                {
                    string script = "var imageBox = document.createElement('img');";
                    script += "imageBox.src = 'images/alert_4N.png';"; // 设置图像的路径
                    script += "imageBox.className = 'custom-image';"; // 添加自定义CSS类
                    script += "document.body.appendChild(imageBox);";
                    script += "setTimeout(function() { imageBox.style.display = 'none'; }, 2000);"; // 自动隐藏图像
                    ClientScript.RegisterStartupScript(GetType(), "領取失敗", script, true);
                }

                // 重新绑定任务清单以更新任务状态
                BindTaskList();
            }
            else
            {
                // 处理未能获取用户ID的情况，可以显示错误消息或者采取其他操作
                // 例如：ClientScript.RegisterStartupScript(GetType(), "UserIDMissing", "alert('未能获取用户ID！');", true);
            }
        }

    }
}