using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Web.UI;
using System.Linq;
using System.Runtime.InteropServices;
using MySqlX.XDevAPI.Relational;


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

                    // 查询用户的所有衣服ID頭部
                    string clothQuery = "SELECT cloth_id FROM `112-112502`.更衣間 WHERE user_id = @user_id and cloth_id like '%body%'";
                    using (MySqlCommand clothCmd = new MySqlCommand(clothQuery, conn))
                    {
                        clothCmd.Parameters.AddWithValue("@user_id", user_id);
                        using (MySqlDataReader clothReader = clothCmd.ExecuteReader())
                        {
                            imageRepeater.DataSource = clothReader;
                            imageRepeater.DataBind();
                        }
                    }

                    // 查询用户的所有衣服ID套裝
                    string headQuery = "SELECT cloth_id FROM `112-112502`.更衣間 WHERE user_id = @user_id and cloth_id like '%Head%'";
                    using (MySqlCommand headCmd = new MySqlCommand(headQuery, conn))
                    {
                        headCmd.Parameters.AddWithValue("@user_id", user_id);
                        using (MySqlDataReader headReader = headCmd.ExecuteReader())
                        {
                            headRepeater.DataSource = headReader;
                            headRepeater.DataBind();
                        }
                    }
                }
            }
        }

        protected void BtnConfirm_Click(object sender, EventArgs e)
        {
            // 獲取user選擇的新衣物ID和新頭饰ID
            string selectedClothingID = hiddenClothingID.Value;
            string selectedHeadwearID = hiddenHeadwearID.Value;

            // 獲取資料庫連接字串
            string connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                conn.Open();

                // 獲取用戶目前的衣物ID和頭饰ID
                string currentClothingID = NowBody.ImageUrl;
                string currentHeadwearID = NowHead.ImageUrl;

                // 更新資料庫
                string updateQuery = "UPDATE `112-112502`.user基本資料 SET cloth = @newClothingID, cloth2 = @newHeadwearID WHERE user_id = @user_id ";
                using (MySqlCommand updateCmd = new MySqlCommand(updateQuery, conn))
                {
                    // 根據用戶的選擇來更新或保留衣物ID和頭饰ID
                    updateCmd.Parameters.AddWithValue("@newClothingID", string.IsNullOrEmpty(selectedClothingID) ? currentClothingID : selectedClothingID);
                    updateCmd.Parameters.AddWithValue("@newHeadwearID", string.IsNullOrEmpty(selectedHeadwearID) ? currentHeadwearID : selectedHeadwearID);
                    updateCmd.Parameters.AddWithValue("@user_id", user_id);

                    int rowsAffected = updateCmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        // 更新成功，執行服务器端数据绑定以更新页面上的控件
                        BindUserData();

                        ClientScript.RegisterStartupScript(GetType(), "新增成功", "alert('新增成功！');", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(GetType(), "新增失敗", "alert('新增失敗！');", true);
                    }
                }
            }
        }

        protected void BindUserData()
        {
            // 获取数据库连接字符串
            string connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                conn.Open();

                // 查询用户的衣物和头饰数据
                string userQuery = "SELECT cloth, cloth2 FROM `112-112502`.user基本資料 WHERE user_id = @user_id";
                using (MySqlCommand userCmd = new MySqlCommand(userQuery, conn))
                {
                    userCmd.Parameters.AddWithValue("@user_id", user_id);
                    using (MySqlDataReader userReader = userCmd.ExecuteReader())
                    {
                        if (userReader.Read())
                        {
                            // 从数据库抓出用户的衣物URL和头饰URL
                            string currentClothingURL = userReader["cloth"].ToString();
                            string currentHeadURL = userReader["cloth2"].ToString();

                            // 设置<asp:Image>的ImageUrl属性
                            NowBody.ImageUrl = currentClothingURL;
                            NowHead.ImageUrl = currentHeadURL;
                        }
                    }
                }
            }
        }
    }
}