using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _BookKeeping
{

    public partial class bucket_list : System.Web.UI.Page
    {
        protected string user_id = "1";

        protected void Page_Load(object sender, EventArgs e)
        {
            DisplayWish();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected MySqlConnection DBConnection()
        {
            string connectionStrings = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(connectionStrings);
            connection.Open();
            return connection;
        }

        protected void DisplayWish()
        {
            MySqlConnection conn = DBConnection();

            //找現有的目標
            string sql = "SELECT concat(d_name,',',pass_amount) FROM `112-112502`.願望清單 where user_id = @user_id and run_state = \'y\'";
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@user_id" , user_id);
            int wish_count = cmd.ExecuteNonQuery();

            if (wish_count != 0)
            {
                //目標內容設定
                MySqlDataReader reader = cmd.ExecuteReader();
                reader.Read();
                string name_amount = reader.GetString(0);
                string[] wish_values = name_amount.Split(',');
                Panel target_space = new Panel() { CssClass = "ContentFlexLeft" };
                Panel target_values = new Panel() /*{ BorderStyle = BorderStyle.Dashed }*/;
                Label title = new Label() { Text = "目標" , CssClass= "PickWishTitle" };
                Label target_name = new Label() { Text = wish_values[0]+"\n" , CssClass = "PickWishText" };
                Label target_amount = new Label() { Text = wish_values[1]+"元" , CssClass = "PickWishText" };

                Target_Background.Visible = true;

                target_values.Controls.Add(target_name);
                target_values.Controls.Add(target_amount);
                target_space.Controls.Add(title);
                target_space.Controls.Add(target_values);
                Target_Background.Controls.Add(target_space);

                //找尚未被選中的願望

            }



        }
    }
}