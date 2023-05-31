using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _BookKeeping
{
    public partial class bookkeeping_search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MySqlConnection conn = DBConnection();

                SearchSelectMonth(conn, DateTime.Now.Month);



            }
        }

        protected MySqlConnection DBConnection()
        {
            string connectionStrings = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(connectionStrings);
            connection.Open();
            return connection;
        }

        protected void SearchSelectMonth(MySqlConnection connection, int month)
        {

            Label1.Text = DateTime.Now.Year.ToString() + "年" + month.ToString() + "月";
            string sql = "SELECT date, class, cost FROM `112-112502`.記帳資料 where year(date) = @year and month(date) = @month;";
            MySqlCommand cmd = new MySqlCommand(sql, connection);
            cmd.Parameters.AddWithValue("@year", DateTime.Now.Year);
            cmd.Parameters.AddWithValue("@month", month);
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
    }
}