using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace _BookKeeping
{
    public partial class bookkeeping_report : System.Web.UI.Page
    {
        protected string user_id = "boa004";
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                MySqlConnection conn = DBConnection();

                GenerateChart(conn, DateTime.Now.Month);



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
            // 如果有 Session 變數 "currentMonth"，則使用它作為目前顯示的月份
            if (Session["currentMonth"] != null)
            {
                month = Convert.ToInt32(Session["currentMonth"]);
            }
            else
            {
                // 如果 Session 變數 "currentMonth" 不存在，將當前月份存入 Session 變數中
                Session["currentMonth"] = month;
            }

            // 將月份限制在有效範圍內
            int currentMonth = Math.Max(1, Math.Min(DateTime.Now.Month, month));

            Label1.Text = DateTime.Now.Year.ToString() + "年" + currentMonth.ToString() + "月";
            string sql = "SELECT num, date, class, cost, mark FROM `112-112502`.記帳資料 where user_id = @user_id and year(date) = @year and month(date) = @month order by date;";
            MySqlCommand cmd = new MySqlCommand(sql, connection);
            cmd.Parameters.AddWithValue("@year", DateTime.Now.Year);
            cmd.Parameters.AddWithValue("@month", currentMonth);
            cmd.Parameters.AddWithValue("@user_id", user_id);

            MySqlDataReader reader = cmd.ExecuteReader();

            // 將資料繫結到 GridView 控制項上
            GridView1.DataSource = reader;
            GridView1.DataBind();

            reader.Close();
        }

        protected void GenerateChart(MySqlConnection connection, int month)
        {
            string year = DateTime.Now.Year.ToString();

            Label1.Text = year + "年" + month.ToString() + "月";

            // 定義四個類別
            string[] categories = { "願望", "飲食", "娛樂", "其他" };

            foreach (string category in categories)
            {
                MySqlCommand cmd = new MySqlCommand("SELECT sum(cost) FROM `112-112502`.記帳資料 WHERE user_id=@user_id AND class=@class AND YEAR(date)=@year AND MONTH(date)=@month", connection);
                cmd.Parameters.AddWithValue("@user_id", user_id);
                cmd.Parameters.AddWithValue("@class", category);
                cmd.Parameters.AddWithValue("@year", year);
                cmd.Parameters.AddWithValue("@month", month);

                object result = cmd.ExecuteScalar();
                if (result != null && !Convert.IsDBNull(result))
                {
                    int cost = Convert.ToInt32(result);
                    Chart1.Series["Series1"].Points.AddXY(category, cost);

                }

            }
            foreach (DataPoint point in Chart1.Series["Series1"].Points)
            {
                double percentage = (point.YValues[0] / Chart1.Series["Series1"].Points.Sum(p => p.YValues[0])) * 100;
                point.Label = string.Format("{0}: {1:F2}%", point.AxisLabel, percentage);
            }




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
                GenerateChart(conn, indexMonth);
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
                GenerateChart(conn, indexMonth);
            }

        }



    }
}