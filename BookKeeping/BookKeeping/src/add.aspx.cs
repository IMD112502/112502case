using MySql.Data.MySqlClient;
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
    public partial class add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 建立資料庫連接字串
            string connectionString = "server=140.131.114.242;userid=IMD112502;password=@Ntubimd06202741;database=112-112502";

            // 建立資料庫連接
            MySqlConnection connection = new MySqlConnection(connectionString);

            // 建立 SQL 查詢命令
            string sql = "SELECT date, class, cost FROM `112-112502`.記帳資料";
            MySqlCommand command = new MySqlCommand(sql, connection);

            // 開啟資料庫連接
            connection.Open();

            // 讀取資料
            MySqlDataReader reader = command.ExecuteReader();

            // 將資料繫結到 GridView 控制項上
            GridView1.DataSource = reader;
            GridView1.DataBind();

            // 關閉資料庫連接
            reader.Close();
        }

        protected void Submit_Click(object sender, EventArgs e) {
            string connection = ConfigurationManager.ConnectionStrings["test1ConnectionString"].ConnectionString;
            MySqlConnection conn = new MySqlConnection(connection);
            conn.Open();

            string name = "aaa";
            DateTime datetime = DateTime.Parse(Request.Form["date"]);
            DateTime date = datetime.Date;
            int cost = Convert.ToInt32(TextBox1.Text);
            string category = Request.Form["radio"].ToString();
            if (category != null)
            {
                string sql = "insert into `112-112502`.記帳資料(user_id , date , class , cost) values (@name , @date , @category , @cost)";

                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@category", category);
                cmd.Parameters.AddWithValue("@date", date);
                cmd.Parameters.AddWithValue("@cost", cost);

                cmd.ExecuteNonQuery();

                // 建立資料庫連接字串
                string connectionString = "server=140.131.114.242;userid=IMD112502;password=@Ntubimd06202741;database=112-112502";

                // 建立資料庫連接
                MySqlConnection con = new MySqlConnection(connectionString);

                MySqlDataAdapter a = new MySqlDataAdapter("SELECT date, class, cost FROM `112-112502`.記帳資料", con);

                //存放資料
                DataSet ds = new DataSet();
                a.Fill(ds, "記帳資料");

                GridView1.DataSource = ds.Tables["記帳資料"];

                // 重新綁定 GridView 控制項的資料來源
                GridView1.DataBind();
            }
        }
        }
    }
