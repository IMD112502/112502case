using MySql.Data.MySqlClient;
using MySqlX.XDevAPI.Relational;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookKeeping.src
{
    public partial class dressing_room : System.Web.UI.Page
    {
        protected string user_id ;
        protected string currentClothing = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            user_id = Session["UserID"] as string;
            // 獲取資料庫連接字串
            string connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                conn.Open();

                // search database
                string query = "SELECT cloth FROM `112-112502`.user基本資料 WHERE user_id = @user_id";
                using (MySqlCommand cmd = new MySqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@user_id", user_id);
                    using (MySqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // 從資料庫抓出剛剛更新的衣服ID
                            string currentClothingURL = reader["cloth"].ToString();

                            // 設置<asp:Image>的ImageUrl屬性
                            now.ImageUrl = currentClothingURL;
                        }
                    }
                }
            }
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            // 獲取user選擇的新衣物ID
            string selectedClothingID = hiddenClothingID.Value;

            // 獲取資料庫連接字串
            string connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

            using (MySqlConnection conn = new MySqlConnection(connectionString))
            {
                conn.Open();

                // search database
                string updateQuery = "UPDATE `112-112502`.user基本資料 SET cloth = @newClothingID WHERE user_id = @user_id";
                using (MySqlCommand updateCmd = new MySqlCommand(updateQuery, conn))
                {
                    updateCmd.Parameters.AddWithValue("@newClothingID", selectedClothingID);
                    updateCmd.Parameters.AddWithValue("@user_id", user_id);

                    int rowsAffected = updateCmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        // 更新成功，從資料庫抓出剛剛更新的衣服ID
                        string selectQuery = "SELECT cloth FROM `112-112502`.user基本資料 WHERE user_id = @user_id";
                        using (MySqlCommand selectCmd = new MySqlCommand(selectQuery, conn))
                        {
                            selectCmd.Parameters.AddWithValue("@user_id", user_id);

                            using (MySqlDataReader reader = selectCmd.ExecuteReader())
                            {
                                if (reader.Read())
                                {
                                    // 從資料庫中獲取user當前穿著衣物的URL
                                    string currentClothingURL = reader["cloth"].ToString();


                                    // 設置<asp:Image>的ImageUrl屬性
                                    now.ImageUrl = currentClothingURL;
                                }
                            }
                        }
                        ClientScript.RegisterStartupScript(GetType(), "新增成功", "alert('新增成功！');", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(GetType(), "新增失敗", "alert('新增失敗！');", true);
                    }
                }
            }
        }
    }
}