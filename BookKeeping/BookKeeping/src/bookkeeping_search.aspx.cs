using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;

namespace _BookKeeping
{
    public partial class bookkeeping_search : System.Web.UI.Page
    {
        protected string user_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            user_id = Session["UserID"] as string;
            if (!IsPostBack)
            {
                
                //填充年份、月份下拉式選單內容
                int currentYear = DateTime.Now.Year;
                for (int y = currentYear; y >= currentYear - 5; y--) 
                {
                    YearList.Items.Add(new ListItem(y.ToString(), y.ToString()));
                }
                for (int m = 1; m <= 12; m++) 
                { 
                    MonthList.Items.Add(new ListItem(m.ToString(), m.ToString()));
                }
                

            }
        }

        protected MySqlConnection DBConnection()
        {
            string connectionStrings = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(connectionStrings);
            connection.Open();
            return connection;
        }

        protected void SearchData(string sql , string year , string month , string day  , string category , string keyword)
        {

            MySqlConnection conn = DBConnection();
            

            MySqlCommand cmd = new MySqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@year", year);
            cmd.Parameters.AddWithValue("@month", month);
            cmd.Parameters.AddWithValue("@day", day);
            cmd.Parameters.AddWithValue("@category", category);
            cmd.Parameters.AddWithValue("@keyword", keyword);
            cmd.Parameters.AddWithValue("@user_id", user_id);


            MySqlDataReader reader = cmd.ExecuteReader();
                



            // 將資料繫結到 GridView 控制項上
                SearchView.DataSource = reader;
                SearchView.DataBind();

                reader.Close();

             

          
        }

        protected void Search_Click(object sender, EventArgs e)
        {
           string sql = "SELECT num,date, class, cost, mark FROM `112-112502`.記帳資料 where user_id=@user_id and year(date)=@year ";

           string year = YearList.SelectedValue;
           string month = MonthList.SelectedValue;
           string day = DayList.SelectedValue;

           string category =CategoryList.SelectedValue;

            if(month !="0")
            {
                sql += " ";
                sql += "and month(date)=@month";
            }
            
            if (day != "0")
            {
                sql += " ";
                sql += "and day(date)=@day";
            }


            if (category != "all")
            {
                sql += " ";
                sql += "and class=@category ";
            }

            string keyword = TxtBox.Text.Trim();

            if (!string.IsNullOrEmpty(keyword))
            {
                sql += " ";
                sql += " and (cost=@keyword or mark=@keyword) ";
            }

           

            SearchData(sql , year,month,day , category , keyword);
            

        }

        protected void YearList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int year = Convert.ToInt32(YearList.SelectedValue);
            int month = Convert.ToInt32(MonthList.SelectedValue);
            int i = 0;
            bool isLeapYear = false;
            DayList.Items.Clear();
            DayList.Items.Add(new ListItem("*", 0.ToString()));

            //判斷閏年
            if (year % 4 == 0)
            {
                if (year % 100 != 0 || year % 400 == 0)
                {
                    isLeapYear = true;
                }
            }

            //判斷月份的天數
            if (month != 0) 
            {
                if (month == 2 && isLeapYear)
                {
                    i = 29;
                }
                else if (month == 2)
                {
                    i = 28;
                }
                else if (month == 4 || month == 6 || month == 9 || month == 11)
                {
                    i = 30;
                }
                else 
                {
                    i = 31;
                }
                for (int j = 1; j <= i; j++) 
                {
                    DayList.Items.Add(new ListItem(j.ToString(), j.ToString()));
                }
            }


        }

        protected void MonthList_SelectedIndexChanged(object sender, EventArgs e)
        {
            int year = Convert.ToInt32(YearList.SelectedValue);
            int month = Convert.ToInt32(MonthList.SelectedValue);
            int i = 0;
            bool isLeapYear = false;
            DayList.Items.Clear();
            DayList.Items.Add(new ListItem("*", 0.ToString()));

            //判斷閏年
            if (year % 4 == 0)
            {
                if (year % 100 != 0 || year % 400 == 0)
                {
                    isLeapYear = true;
                }
            }

            //判斷月份的天數
            if (month != 0)
            {
                if (month == 2 && isLeapYear)
                {
                    i = 29;
                }
                else if (month == 2)
                {
                    i = 28;
                }
                else if (month == 4 || month == 6 || month == 9 || month == 11)
                {
                    i = 30;
                }
                else
                {
                    i = 31;
                }
                for (int j = 1; j <= i; j++)
                {
                    DayList.Items.Add(new ListItem(j.ToString(), j.ToString()));
                }
            }
           
        }
    }
}