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