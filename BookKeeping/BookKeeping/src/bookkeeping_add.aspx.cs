﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _BookKeeping
{
    public partial class bookkeeping_add : System.Web.UI.Page
    {
        protected string user_id = "boa004";
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                MySqlConnection conn = DBConnection();

                SearchSelectMonth(conn, DateTime.Now.Month);
               


            }
        }

        protected MySqlConnection DBConnection() {
            string connectionStrings = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(connectionStrings);
            connection.Open();
            return connection;
        }

        protected void SearchSelectMonth( MySqlConnection connection , int month) 
        {

            Label1.Text = DateTime.Now.Year.ToString() + "年" + month.ToString() + "月";
            string sql = "SELECT date, class, cost, mark FROM `112-112502`.記帳資料 where user_id = @user_id and year(date) = @year and month(date) = @month order by date;";
            MySqlCommand cmd = new MySqlCommand(sql, connection);
            cmd.Parameters.AddWithValue("@year", DateTime.Now.Year);
            cmd.Parameters.AddWithValue("@month", month);
            cmd.Parameters.AddWithValue("@user_id", user_id);

            MySqlDataReader reader = cmd.ExecuteReader();



            // 將資料繫結到 GridView 控制項上
            GridView1.DataSource = reader;
            GridView1.DataBind();

            reader.Close();
        }
        protected void MinusMonth_Click(object sender, EventArgs e) 
        {
            MySqlConnection conn = DBConnection();
            Button btn = (Button)sender;
            //邊界值
            int MinMonth = 1;
            //求現在顯示的月份
            int indexMonth = Convert.ToInt32(Label1.Text[Label1.Text.IndexOf("年") + 1].ToString());
            if (indexMonth > MinMonth)
            {
                indexMonth -= 1;
                SearchSelectMonth(conn, indexMonth);
            }
            
        }

        protected void PlusMonth_Click(object sender, EventArgs e)
        {
            MySqlConnection conn = DBConnection();
            Button btn = (Button)sender;
            //邊界值
            int MaxMonth = DateTime.Now.Month;
            //求現在顯示的月份
            int indexMonth = Convert.ToInt32(Label1.Text[Label1.Text.IndexOf("年") + 1].ToString());
            if (indexMonth < MaxMonth)
            {
                indexMonth += 1;
                SearchSelectMonth(conn, indexMonth);
            }

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            // 資料庫連接
            MySqlConnection conn = DBConnection();

              
            DateTime datetime = DateTime.Parse(Request.Form["date"]);
            DateTime date = datetime.Date;

            string costInput = TextBox1.Text;
            if (!string.IsNullOrEmpty(costInput))
            {
                if (int.TryParse(costInput, out int cost))
                {
                    
                    string mark = TextBox2.Text;
                    string category = Request.Form["radio"].ToString();

                    string sql = "INSERT INTO `112-112502`.記帳資料(user_id, date, class, cost, mark) VALUES (@name, @date, @category, @cost, @mark)";

                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@name", user_id);
                    cmd.Parameters.AddWithValue("@category", category);
                    cmd.Parameters.AddWithValue("@date", date);
                    cmd.Parameters.AddWithValue("@cost", cost);
                    cmd.Parameters.AddWithValue("@mark", mark);

                    int rows_affect = cmd.ExecuteNonQuery();
                    if (rows_affect > 0)
                     {
                        TextBox1.Text = null;
                        TextBox2.Text = null;
                        ClientScript.RegisterStartupScript(GetType(), "新增成功", "alert('新增成功！');", true);

                        SearchSelectMonth(conn, date.Month);
                     }
                    else
                     {
                        ClientScript.RegisterStartupScript(GetType(), "新增失敗", "alert('新增失敗！');", true);
                     }
                    
                    


                    

                    // 重新綁定 GridView 控制項的資料來源
                    
                }
                else
                {
                    ErrorMessageLabel.Visible = true;
                    ErrorMessageLabel.Text = "請輸入有效的數字!";
                }
            }
            else
            {
                ErrorMessageLabel.Visible = true;
                ErrorMessageLabel.Text = "請輸入數字!";
            }
        }



    }
}
