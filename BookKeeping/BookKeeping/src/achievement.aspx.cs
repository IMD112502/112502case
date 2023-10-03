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

        private void BindTaskList()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            string user_id = Session["UserID"].ToString();

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                //將已完成的成就存放至陣列中
                List<string> finishTaskLists = new List<string>();

                string query = "SELECT a_id FROM `112-112502`.使用者成就完成 WHERE user_id = @user_id";
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




                // 獲取記帳次數和許願次數
                int accountingCount = GetAccountingCount(connection);
                int wishingCount = GetWishingCount(connection);

                // 創建任務清單數據
                DataTable dt = new DataTable();
                dt.Columns.Add("TaskID", typeof(int));
                dt.Columns.Add("ImageUrl", typeof(string));
                dt.Columns.Add("TaskName", typeof(string));
                dt.Columns.Add("TaskDescription", typeof(string));
                dt.Columns.Add("ProgressBarStyle", typeof(string));
                dt.Columns.Add("IsTaskCompleted", typeof(bool));
               

                // 任務1：記帳次數達5次 (finishTaskArray 不包含 '1' 才新增）
                if (!finishTaskArray.Contains("1"))
                {
                    DataRow task1 = dt.NewRow();
                    task1["TaskID"] = 1;
                    task1["ImageUrl"] = ResolveUrl("~/src/images/clothing1.png");
                    task1["TaskName"] = "記帳次數達5次";
                    task1["TaskDescription"] = $"您已記帳 {accountingCount} 次";
                    task1["ProgressBarStyle"] = $"width: {(accountingCount >= 5 ? 100 : (accountingCount * 20))}%";
                    task1["IsTaskCompleted"] = (accountingCount >= 5);
                    dt.Rows.Add(task1);
                }

                // 任務2：許願10次( finishTaskArray 不包含 '2' 才新增）
                if (!finishTaskArray.Contains("2"))
                {
                    DataRow task2 = dt.NewRow();
                    task2["TaskID"] = 2;
                    task2["ImageUrl"] = ResolveUrl("~/src/images/clothing2.png");
                    task2["TaskName"] = "許願10次";
                    task2["TaskDescription"] = $"您已許願 {wishingCount} 次";
                    task2["ProgressBarStyle"] = $"width: {(wishingCount >= 10 ? 100 : (wishingCount * 10))}%";
                    task2["IsTaskCompleted"] = (wishingCount >= 10);
                    dt.Rows.Add(task2);
                }

                

                TaskRepeater.DataSource = dt;
                TaskRepeater.DataBind();
                connection.Close();
            }
        }

        private int GetAccountingCount(MySqlConnection connection)
        {
            // 執行 SQL 查詢以獲取記帳次數
            string query = "SELECT COUNT(*) FROM `112-112502`.記帳資料 WHERE user_id = @user_id";
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
            string query = "SELECT COUNT(*) FROM `112-112502`.願望清單 WHERE user_id = @user_id";
            string user_id = Session["UserID"].ToString();
            using (MySqlCommand command = new MySqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@user_id", user_id);
                return Convert.ToInt32(command.ExecuteScalar());
            }
        }

        protected void ClaimButton_Click(object sender, EventArgs e)
        {
            // 验证是否成功获取了用户ID
            if (Session["UserID"] != null)
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

                MySqlConnection connection = new MySqlConnection(connectionString);
                connection.Open();

                Button claimButton = (Button)sender;
                string taskId = claimButton.CommandArgument.ToString();

                // 根据 taskId 执行相应的操作，例如发放奖励

                string sql = "INSERT INTO `112-112502`.使用者成就完成 (user_id, a_id , get_state) VALUES (@user_id , @task_id , 'y')";

                // 使用 Session 中的用户ID
                string user_id = Session["UserID"].ToString();

                using (MySqlCommand cmd = new MySqlCommand(sql, connection))
                {
                    cmd.Parameters.AddWithValue("@user_id", user_id); // 使用 userId 而不是 user_id
                    cmd.Parameters.AddWithValue("@task_id", taskId);

                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        ClientScript.RegisterStartupScript(GetType(), "新增成功", "alert('新增成功！');", true);
                    }
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