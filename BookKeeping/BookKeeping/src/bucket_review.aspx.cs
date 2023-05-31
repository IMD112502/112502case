using _BookKeeping;
using MySql.Data.MySqlClient;
using Org.BouncyCastle.Utilities.Collections;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.Web.Security;
using Google.Protobuf.WellKnownTypes;

namespace BookKeeping.src
{
    public partial class bucket_review : System.Web.UI.Page
    {
        protected string user_id = "boa004";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayWindows();
            }
        }

        protected void DisplayWindows() 
        {
            if (GetArray().Length > 0)
            {
                label1.Text = FindName() + "想要";
                label2.Text = GetArray()[0];
                label3.Text = "可以嗎><？";
                IndexCount.Text = "0";
            }
            else
            {
                label1.Text = "";
                label2.Text = "";
                label3.Text = "";
                RadioButtonList1.Visible = false;
                Panel2.Visible = false;
                Button3.Text = "返回";
                Button3.Click -= Submit_Click;
                Button3.PostBackUrl = "bucket_list.aspx";
                Label l = new Label();
                l.Text = "目前沒有要審核的願望喔!";
                Panel1.Controls.Add(l);
            }
        }

        protected MySqlConnection DBConnection()
        {
            string connectionStrings = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(connectionStrings);
            connection.Open();
            return connection;
        }

        protected string FindName()
        {
            MySqlConnection conn = DBConnection();
            string sql = "SELECT user_name FROM `112-112502`.user基本資料\r\nwhere user_id = @user_id" ;
            string user_name = string.Empty;
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@user_id", user_id);
            MySqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                int length = reader.GetString(0).Length;
                user_name = reader.GetString(0).Substring(length - 2);
            }

            return user_name;

        }
        protected string[] GetArray()
        {
            MySqlConnection conn = DBConnection();
            string sql = "SELECT d_name FROM `112-112502`.願望清單\r\nwhere user_id = @user_id and pass_state = \'r\';";
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@user_id", user_id);
            MySqlDataReader reader = cmd.ExecuteReader();
            List<string> list = new List<string>();
            while (reader.Read())
            {
                string data = reader.GetString(0);
                list.Add(data);
            }
            string[] wish_list = list.ToArray();
            return wish_list;

        }

        protected void ChangeWish_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int index_value = Convert.ToInt32(IndexCount.Text);
            int length = GetArray().Length;
            if (btn.CommandArgument == "plus") 
            {
                index_value++;
            }
            if (btn.CommandArgument == "minus") 
            {
                if (index_value > 0)
                {
                    index_value--;
                }
                else 
                {
                    index_value = GetArray().Length - 1;
                }
            }
            IndexCount.Text = index_value.ToString();
            label2.Text = GetArray()[index_value % length];

        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedValue = RadioButtonList1.SelectedValue;
            if (selectedValue == "y")
            {
                Panel2.Visible = true;
                Panel3.Visible = false;
            }
            if (selectedValue == "n")
            {
                Panel2.Visible = false;
                Panel3.Visible = true;
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            MySqlConnection conn = DBConnection();


            string selectedValue = RadioButtonList1.SelectedValue;
            string wish_name = label2.Text;

            string dNum = "SELECT d_num FROM `112-112502`.願望清單 where `d_name` = @wish_name and `user_id` = @user_id;";

            MySqlCommand cmd = new MySqlCommand(dNum, conn);
            cmd.Parameters.AddWithValue("@wish_name", wish_name);
            cmd.Parameters.AddWithValue("@user_id", user_id);
            MySqlDataReader reader = cmd.ExecuteReader();

            reader.Read();
            string dName = reader.GetString(0);
            conn.Close();
            if (selectedValue == "y")
            {
                int amount;
                if (!int.TryParse(Textbox1.Text, out amount))
                {
                    ErrorMessagel.Text = "請輸入有效的金額!";
                    ErrorMessagel.Visible = true;
                    return;
                }

                int target_count;
                string sql_target = "SELECT count(*) FROM `112-112502`.願望清單 WHERE user_id = @user_id AND run_state = 'y'";
                conn.Open();
                MySqlCommand cmd_target = new MySqlCommand(sql_target, conn);
                cmd_target.Parameters.AddWithValue("@user_id", user_id);
                MySqlDataReader reader_target = cmd_target.ExecuteReader();
                reader_target.Read();
                target_count = Convert.ToInt32(reader_target.GetString(0));
                conn.Close();

                string sql = null;

                if (target_count == 0)
                {
                    sql += "update `112-112502`.願望清單 set pass_amount = @amount , pass_state = 'y',run_state = 'y' where(`d_num` = @dName)";

                }
                else
                {
                    sql += "update `112-112502`.願望清單 set pass_amount = @amount , pass_state = 'y',run_state = 'n' where(`d_num` = @dName)";
            
                }

                conn.Open();
                MySqlCommand command = new MySqlCommand(sql, conn);
                command.Parameters.AddWithValue("@amount", amount);
                command.Parameters.AddWithValue("@dName", dName);
                int rows_affected = command.ExecuteNonQuery();
                conn.Close();

                if (rows_affected > 0)
                {
                    Textbox1.Text = null;
                    ErrorMessagel.Visible = false;
                    Response.Write("<script>alert('新增成功')</script>");
                    DisplayWindows();
                }
                else
                {
                    Textbox1.Text = null;
                    ErrorMessagel.Visible = false;
                    Response.Write("<script>alert('新增失敗')</script>");
                    DisplayWindows();
                }
            }

            if(selectedValue == "n") 
            {
                string reason = Textbox2.Text;
                if (string.IsNullOrEmpty(reason))
                {
                    ErrorMessage2.Text = "請輸入拒絕原因!";
                    ErrorMessage2.Visible = true;
                    return;
                }
                string sql = "update `112-112502`.願望清單 set reason = @reason , pass_state = 'n' where(`d_num` = @dName)";

                conn.Open();

                MySqlCommand command = new MySqlCommand(sql, conn);

                command.Parameters.AddWithValue("@reason", reason);
                command.Parameters.AddWithValue("@dName", dName);

                int rows_affect = command.ExecuteNonQuery();

                if (rows_affect > 0)
                {
                    Textbox1.Text = null;
                    Response.Write("<script>alert('新增成功')</script>");
                    DisplayWindows();
                }
                else 
                {
                    Textbox1.Text = null;
                    Response.Write("<script>alert('新增失敗')</script>");
                    DisplayWindows();
                }
            }
        }
    }
}