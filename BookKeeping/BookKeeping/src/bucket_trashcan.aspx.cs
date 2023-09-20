using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Diagnostics;

namespace _BookKeeping
{
    public partial class bucket_trashcan : System.Web.UI.Page
    {
        protected int currentRowIndex = 0; // 用于跟踪当前数据的索引
        protected int totalRows = 0; // 用于跟踪查询结果的总行数

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowCannotBuyReason();
            }
        }

        protected void ShowCannotBuyReason()
        {
            string user_id = "boa004"; // 您的用户ID
            string connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                conn.Open();

                string sql = "SELECT d_name, reason FROM `112-112502`.願望清單 WHERE user_id = @user_id AND pass_state = 'n'";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@user_id", user_id);

                using (MySqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.HasRows)
                    {
                        // 获取查询结果的总行数
                        totalRows = 0;
                        while (reader.Read())
                        {
                            totalRows++;
                        }

                        // 更新当前数据的索引，确保它在有效范围内
                        if (currentRowIndex < 0)
                        {
                            currentRowIndex = totalRows - 1;
                        }
                        if (currentRowIndex >= totalRows)
                        {
                            currentRowIndex = 0;
                        }
                    }
                }

                // 查询当前索引的数据
                cmd.CommandText = sql + $" LIMIT {currentRowIndex}, 1";

                using (MySqlDataReader dataReader = cmd.ExecuteReader())
                {
                    if (dataReader.Read())
                    {
                        string d_name = dataReader["d_name"].ToString();
                        string reason = dataReader["reason"].ToString();
                        CantBuy.Text = "不能買：" + d_name;
                        Cause.Text = "因為" + reason;
                    }

                    else
                    {
                        CantBuy.Text = "目前沒有被拒絕的願望喔~";
                        Cause.Text = "";
                    }
                }
            }
        }

        protected void Next_Click(object sender, EventArgs e)
        {
            Debug.WriteLine("Next button clicked"); // 或者使用 Response.Write
            currentRowIndex++; // 切换到下一个数据

            // 如果 currentRowIndex 超出了总行数，将其重置为0
            if (currentRowIndex >= totalRows)
            {
                currentRowIndex = 0;
            }

            ShowCannotBuyReason();
        }


        protected void Last_Click(object sender, EventArgs e)
        {
            currentRowIndex--; // 切换到上一个数据

            // 如果 currentRowIndex 小于0，将其设置为最后一笔数据的索引
            if (currentRowIndex < 0)
            {
                currentRowIndex = totalRows - 1;
            }

            ShowCannotBuyReason();
        }





    }
}
