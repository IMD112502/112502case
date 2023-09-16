using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Web.UI.WebControls;

namespace BookKeeping.src
{
    public partial class bucket_record : System.Web.UI.Page
    {
        protected string user_id = "boa004";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (MySqlConnection conn = DBConnection())
                {
                    conn.Open();
                    BucketRecord(conn);
                }
            }
        }

        protected void BucketRecord(MySqlConnection connection)
        {
            string sql = "SELECT d_num, d_name, pass_amount, exchange_time, exchange_state FROM `112-112502`.願望清單 WHERE user_id = @user_id;";
            MySqlCommand cmd = new MySqlCommand(sql, connection);
            cmd.Parameters.AddWithValue("@user_id", user_id);

            using (MySqlDataReader reader = cmd.ExecuteReader())
            {
                GridView2.DataSource = reader;
                GridView2.DataBind();
            }
        }


        protected MySqlConnection DBConnection()
        {
            string connection = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            MySqlConnection conn = new MySqlConnection(connection);
            return conn;
        }

        protected string GetExchangeStatus(object exchangeState)
        {
            if (exchangeState != null && exchangeState.ToString() == "Y")
            {
                return "已兌換";
            }
            else
            {
                return "刪除";
            }
        }

    }
}
