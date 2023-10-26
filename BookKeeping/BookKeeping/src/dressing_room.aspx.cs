using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Web.UI;

namespace BookKeeping.src
{
    public partial class dressing_room : System.Web.UI.Page
    {
        protected string user_id;
        protected string currentHead = "";
        protected string currentBody = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            user_id = Session["UserID"] as string;

            if (!IsPostBack) // 只在初次載入頁面時執行
            {
                // 獲取資料庫連接字串
                string connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

                using (MySqlConnection conn = new MySqlConnection(connectionString))
                {
                    conn.Open();

                    // 搜尋資料庫
                    string query = "SELECT cloth, cloth2, gender FROM `112-112502`.user基本資料 WHERE user_id = @user_id";
                    using (MySqlCommand cmd = new MySqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@user_id", user_id);
                        using (MySqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                // 從資料庫抓出剛剛更新的衣服ID
                                string currentBodyURL = reader["cloth"].ToString();
                                string currentHeadURL = reader["cloth2"].ToString();
                                string gen = reader["gender"].ToString();

                                // 設置 <asp:Image> 的 ImageUrl 屬性
                                NowBody.ImageUrl = currentBodyURL;
                                NowHead.ImageUrl = currentHeadURL;
                                gender.Text = gen;
                            }
                        }
                    }
                }
            }
        }

        protected void BtnConfirm_Click(object sender, EventArgs e)
        {
            // 獲取user選擇的新衣物ID
            string selectedBodyID = hiddenBodyID.Value;
            string selectedHeadID = hiddenHeadID.Value;

            // 獲取資料庫連接字串
            string connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                conn.Open();

                // 更新資料庫
                string updateQuery = "UPDATE `112-112502`.user基本資料 SET ";
                List<string> updatedColumns = new List<string>();

                if (!string.IsNullOrEmpty(selectedBodyID))
                {
                    updateQuery += "cloth = @newBodyID";
                    updatedColumns.Add("cloth");
                }
                if (!string.IsNullOrEmpty(selectedHeadID))
                {
                    if (updatedColumns.Count > 0)
                    {
                        updateQuery += ", ";
                    }
                    updateQuery += "cloth2 = @newHeadID";
                    updatedColumns.Add("cloth2");
                }

                if (updatedColumns.Count > 0)
                {
                    updateQuery += " WHERE user_id = @user_id";

                    using (MySqlCommand updateCmd = new MySqlCommand(updateQuery, conn))
                    {
                        if (updatedColumns.Contains("cloth"))
                        {
                            updateCmd.Parameters.AddWithValue("@newBodyID", selectedBodyID);
                        }
                        if (updatedColumns.Contains("cloth2"))
                        {
                            updateCmd.Parameters.AddWithValue("@newHeadID", selectedHeadID);
                        }
                        updateCmd.Parameters.AddWithValue("@user_id", user_id);

                        int rowsAffected = updateCmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            // 更新成功，從資料庫抓出剛剛更新的衣服ID
                            string selectQuery = "SELECT cloth, cloth2 FROM `112-112502`.user基本資料 WHERE user_id = @user_id";
                            using (MySqlCommand selectCmd = new MySqlCommand(selectQuery, conn))
                            {
                                selectCmd.Parameters.AddWithValue("@user_id", user_id);

                                using (MySqlDataReader reader = selectCmd.ExecuteReader())
                                {
                                    if (reader.Read())
                                    {
                                        // 從資料庫中獲取user當前穿著衣物的URL
                                        string currentBodyURL = reader["cloth"].ToString();
                                        string currentHeadURL = reader["cloth2"].ToString();

                                        // 設置 <asp:Image> 的 ImageUrl 屬性
                                        NowBody.ImageUrl = currentBodyURL;
                                        NowHead.ImageUrl = currentHeadURL;
                                    }
                                }
                            }
                            ClientScript.RegisterStartupScript(GetType(), "更新成功", "alert('更新成功！');", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(GetType(), "更新失敗", "alert('更新失敗！');", true);
                        }
                    }
                }
            }
        }
    }
}