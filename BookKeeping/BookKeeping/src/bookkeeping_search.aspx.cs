using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _BookKeeping
{
    public partial class bookkeeping_search : System.Web.UI.Page
    {
        protected string user_id = "boa004";
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

            if (!IsPostBack)
            {
                
            }
        }

        protected MySqlConnection DBConnection()
        {
            string connectionStrings = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(connectionStrings);
            connection.Open();
            return connection;
        }

        protected void SearchData(string sql , DateTime date , string category , string keyword)
        {

            MySqlConnection conn = DBConnection();
            

            MySqlCommand cmd = new MySqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@date", date);
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
            string sql = "SELECT num,date, class, cost, mark FROM `112-112502`.記帳資料 where user_id=@user_id and date=@date ";

            DateTime datetime = DateTime.Parse(Request.Form["date"]);
            DateTime date = datetime.Date;

            string category = DropDownList1.Text;


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

           

            SearchData(sql , date , category , keyword);

        }

      
    }
}