using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookKeeping.src
{
    public partial class main : System.Web.UI.Page
    {

        protected string user_id = "boa004"; 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
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

        protected int GetWishAmount() 
        { 
            MySqlConnection conn = DBConnection();
            string sql_wish = "SELECT sum(cost) FROM `112-112502`.記帳資料 where user_id = @user_id and class = \"願望\";";
            MySqlCommand cmd_wish = new MySqlCommand(sql_wish, conn);
            cmd_wish.Parameters.AddWithValue("@user_id", user_id);
            MySqlDataReader reader_wish = cmd_wish.ExecuteReader();
            reader_wish.Read();
            int wish_amount = reader_wish.GetInt32(0);
            conn.Close();

            return wish_amount;
        }

        protected int GetTargetAmount()
        {
            int target_amount = 0;
            MySqlConnection conn = DBConnection();
            string sql_target = "SELECT pass_amount FROM `112-112502`.願望清單 where user_id = \"boa004\" and pass_state='y'and run_state = 'y' ";
            MySqlCommand cmd_target = new MySqlCommand(sql_target, conn);
            cmd_target.Parameters.AddWithValue("@user_id", user_id);
            int rows_affect = cmd_target.ExecuteNonQuery();
            conn.Close();
            if (rows_affect != 0)
            {
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
            int wish_amount = GetWishAmount();
            int target_amount = GetTargetAmount();

            if (target_amount > 0)
            {
                int progress_percent = wish_amount / target_amount * 100;
                if (progress_percent > 100)
                {
                    PigProgress.Text = "目標已經完成囉!";
                    Pig.ImageUrl = "images/pig100up.png";
                }
                else if(progress_percent==100)
                {
                    PigProgress.Text = "目標已經完成囉!";
                    Pig.ImageUrl = "images/pig100.png";
                }
                else
                {
                    PigProgress.Text = "目標進度:" + wish_amount.ToString() + '/' + target_amount.ToString();
                    if (progress_percent >= 90)
                    {
                        Pig.ImageUrl = "images/pig90.png";
                    }
                    else if (progress_percent >= 80)
                    {
                        Pig.ImageUrl = "images/pig80.png";
                    }
                    else if (progress_percent >= 70)
                    {
                        Pig.ImageUrl = "images/pig70.png";
                    }
                    else if (progress_percent >= 60)
                    {
                        Pig.ImageUrl = "images/pig60.png";
                    }
                    else if (progress_percent >= 50)
                    {
                        Pig.ImageUrl = "images/pig50.png";
                    }
                    else if (progress_percent >= 40)
                    {
                        Pig.ImageUrl = "images/pig40.png";
                    }
                    else if (progress_percent >= 30)
                    {
                        Pig.ImageUrl = "images/pig30.png";
                    }
                    else if (progress_percent >= 20)
                    {
                        Pig.ImageUrl = "images/pig20.png";
                    }
                    else if (progress_percent >= 10)
                    {
                        Pig.ImageUrl = "images/pig10.png";
                    }
                    else 
                    { 
                        Pig.ImageUrl = "images/pig0.png";
                    }

                }
                
            }
            else 
            {
                PigProgress.Text = "目前尚無目標喔!";
            }

        }
    }
}