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
using System.Web.SessionState;

namespace _BookKeeping
{
    public partial class bookkeeping_report : System.Web.UI.Page
    {
        protected string user_id;

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            user_id = Session["UserID"] as string;

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
        protected void PlusMonth_Click(object sender, EventArgs e)
        {
            // 獲取當前日期
            DateTime currentDate = DateTime.ParseExact(Label1.Text, "yyyy年M月", System.Globalization.CultureInfo.InvariantCulture);

            // 增加一個月
            DateTime newDate = currentDate.AddMonths(1);

            // 更新 Label 控件的文本，使用新的日期提取月份
            Label1.Text = newDate.ToString("yyyy年M月");

            MySqlConnection conn = DBConnection();
            UpdateGridView(conn, newDate.Month, newDate.Year);
        }

        protected void MinusMonth_Click(object sender, EventArgs e)
        {
            // 獲取當前日期
            DateTime currentDate = DateTime.ParseExact(Label1.Text, "yyyy年M月", System.Globalization.CultureInfo.InvariantCulture);

            // 減少一個月
            DateTime newDate = currentDate.AddMonths(-1);

            // 更新 Label 控件的文本，使用新的日期提取月份
            Label1.Text = newDate.ToString("yyyy年M月");

            MySqlConnection conn = DBConnection();
            UpdateGridView(conn, newDate.Month, newDate.Year);
        }

        private void UpdateGridView(MySqlConnection connection, int month, int year)
        {
            // 使用新的月份和年份來綁定 GridView
            DataTable dt = GetMonthlyCategoryTotals(connection, month, year);
            GridView1.DataSource = dt;
            GridView1.DataBind();

            // 重新生成圓餅圖
            GenerateChart(connection, month);
        }

        protected DataTable GetMonthlyCategoryTotals(MySqlConnection connection, int month, int year)
        {
            DataTable dt = new DataTable();

            string query = "SELECT class, SUM(cost) AS total_cost " +
                           "FROM `112-112502`.記帳資料 " +
                           "WHERE MONTH(date) = @month AND YEAR(date) = @year AND user_id = @user_id " +
                           "GROUP BY class"; 

            MySqlCommand cmd = new MySqlCommand(query, connection);
            cmd.Parameters.AddWithValue("@month", month);
            cmd.Parameters.AddWithValue("@year", year);
            cmd.Parameters.AddWithValue("@user_id", user_id);
            MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
            adapter.Fill(dt);

            return dt;
        }
    }
}