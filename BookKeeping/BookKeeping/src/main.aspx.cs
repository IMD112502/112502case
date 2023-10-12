using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using System.Security.Principal;
using System.Xml.Linq;

namespace BookKeeping.src
{
    public partial class main : System.Web.UI.Page
    {
        protected string user_id; // 新增成員變數
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                user_id = Session["UserID"] as string; // 將 Session["UserID"] 賦值給成員變數 user_id

                if (!string.IsNullOrEmpty(user_id))
                {
                    // 使用用户 ID 查询数据库以获取用户数据
                    string connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
                    using (MySqlConnection connection = new MySqlConnection(connectionString))
                    {
                        connection.Open();

                        // 创建 SQL 查询
                        string query = "SELECT nickname, user_id, gender FROM `112-112502`.user基本資料 WHERE user_id = @UserID";

                        using (MySqlCommand cmd = new MySqlCommand(query, connection))
                        {
                            cmd.Parameters.AddWithValue("@UserID", user_id);

                            using (MySqlDataReader reader = cmd.ExecuteReader())
                            {

                                if (reader.Read())
                                {
                                    // 从数据库中获取用户数据并填充到 Label 中
                                    NickName.Text = reader["nickname"].ToString();
                                    UId.Text = reader["user_id"].ToString();

                                    if (reader["gender"].ToString() == "男生")
                                    {
                                        AvatarHead.ImageUrl = "images/avatar/ava_boy.png";
                                    }
                                    else
                                    {
                                        AvatarHead.ImageUrl = "images/avatar/ava_girl.png";
                                    }
                                }
                            }
                        }
                    }
                }
                PigChange();
            }
        }

        protected MySqlConnection DBConnection()
        {
            string connection = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            MySqlConnection conn = new MySqlConnection(connection);
            conn.Open();
            return conn;
        }

        //抓取願望類別的總金額
        protected float GetWishAmount() 
        {
            float wish_amount = 0;
            MySqlConnection conn = DBConnection();

            //判斷願望類別是否有資料
            string sql_count = "SELECT count(*) FROM `112-112502`.記帳資料 where user_id = @user_id and class = \"願望\"";
            MySqlCommand cmd_count = new MySqlCommand(sql_count, conn);
            cmd_count.Parameters.AddWithValue("@user_id", user_id);
             MySqlDataReader reader_count = cmd_count.ExecuteReader(); 
             reader_count.Read();
             int count =  reader_count.GetInt32(0);
             conn.Close();

            //抓取願望類別總金額
            if (count>0) 
            {
                conn.Open ();
                string sql_wish = "SELECT sum(cost) FROM `112-112502`.記帳資料 where user_id = @user_id and class = \"願望\";";
                MySqlCommand cmd_wish = new MySqlCommand(sql_wish, conn);
                cmd_wish.Parameters.AddWithValue("@user_id", user_id);
                MySqlDataReader reader_wish = cmd_wish.ExecuteReader();
                {
                    reader_wish.Read();
                    wish_amount += reader_wish.GetInt32(0);
                }
                
                conn.Close();
            }

            
            

            return wish_amount;
        }
        //抓取目標願望的金額
        protected float GetTargetAmount()
        {
            //判斷是否有目標
            float target_amount = 0;
            MySqlConnection conn = DBConnection();

            //判斷願望類別是否有資料
            string sql_count = "SELECT count(*) FROM `112-112502`.願望清單 where user_id = @user_id and pass_state='y'and run_state = 'y'";
            MySqlCommand cmd_count = new MySqlCommand(sql_count, conn);
            cmd_count.Parameters.AddWithValue("@user_id", user_id);
            MySqlDataReader reader_count = cmd_count.ExecuteReader();
            reader_count.Read();
            int count = reader_count.GetInt32(0);
            conn.Close();

            //抓取目標願望金額
            if (count > 0) 
            {
                string sql_target = "SELECT pass_amount FROM `112-112502`.願望清單 where user_id = @user_id and pass_state='y'and run_state = 'y' ";
                MySqlCommand cmd_target = new MySqlCommand(sql_target, conn);
                cmd_target.Parameters.AddWithValue("@user_id", user_id);
                conn.Open();
                MySqlDataReader reader_target = cmd_target.ExecuteReader();
                reader_target.Read();
                target_amount += reader_target.GetInt32(0);
                conn.Close();
            }

            
     
            
            return target_amount;
        }

        //小豬撲滿變化
        protected void PigChange() 
        { 
            float wish_amount = GetWishAmount();
            float target_amount = GetTargetAmount();
            

            if (target_amount > 0)
            {
                double progress_percent = Math.Round((wish_amount / target_amount * 100));

                if (progress_percent >= 100)
                {
                    PigProgress.Text = "目標已經完成囉!";
                    if (progress_percent > 100)
                    {
                        Pig.ImageUrl = "images/main/pig/pig100up.png";
                    }
                    else
                    {
                        Pig.ImageUrl = "images/main/pig/pig100.png";
                    }
                }
                else 
                {
                    PigProgress.Text = "目標進度:" + wish_amount.ToString() + '/' + target_amount.ToString();

                    if (progress_percent >= 90)
                    {
                        Pig.ImageUrl = "images/main/pig/pig90.png";
                    }
                    else if (progress_percent >= 80) 
                    {
                        Pig.ImageUrl = "images/main/pig/pig80.png";
                    }
                    else if (progress_percent >= 70)
                    {
                        Pig.ImageUrl = "images/main/pig/pig70.png";
                    }
                    else if (progress_percent >= 60)
                    {
                        Pig.ImageUrl = "images/main/pig/pig60.png";
                    }
                    else if (progress_percent >= 50)
                    {
                        Pig.ImageUrl = "images/main/pig/pig50.png";
                    }
                    else if (progress_percent >= 40)
                    {
                        Pig.ImageUrl = "images/main/pig/pig40.png";
                    }
                    else if (progress_percent >= 30)
                    {
                        Pig.ImageUrl = "images/main/pig/pig30.png";
                    }
                    else if (progress_percent >= 20)
                    {
                        Pig.ImageUrl = "images/main/pig/pig20.png";
                    }
                    else if (progress_percent >= 10)
                    {
                        Pig.ImageUrl = "images/main/pig/pig10.png";
                    }
                    else 
                    {
                        Pig.ImageUrl = "images/main/pig/pig0.png";
                    }
                }
            }
            else 
            {
                PigProgress.Text = "目前沒有願望目標喔!";
            }

        }
    }
}