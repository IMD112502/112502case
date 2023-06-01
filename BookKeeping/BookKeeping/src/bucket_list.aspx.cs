using Google.Protobuf.WellKnownTypes;
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
        protected string user_id = "boa004";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { 
            DisplayWish();
            }
        }

        

        protected void ChangeTarget_Click(object sender, EventArgs e)
        {
            //MySqlConnection conn = DBConnection();

            //Button btn = (Button)sender;
            //string btn_cmd = btn.CommandArgument;
            //Panel text_panel = (Panel)FindControl("Panel" + btn_cmd + '1');
            //Label text_label = (Label)text_panel.FindControl("Label" + btn_cmd);
            //Label amount_label = (Label)text_panel.FindControl("Label" + btn_cmd + '1');
            //string untarget_text = text_label.Text;
            //int index_amount = amount_label.Text.IndexOf("元");
            //string amount_text = amount_label.Text.Substring(0, index_amount);
            //int untarget_amount = Convert.ToInt32(amount_text);

            ////找出現在目標的主索引值，並且撤換
            //string sql_dnum = "SELECT d_num FROM `112 - 112502`.願望清單 where user_id = @user_id and pass_state = \'y\' and run_state = \'y\';";
            //MySqlCommand cmd_dnum = new MySqlCommand(sql_dnum,conn);
            //cmd_dnum.Parameters.AddWithValue("@user_id", user_id);
            //MySqlDataReader dnum_reader = cmd_dnum.ExecuteReader();
            //dnum_reader.Read();
            //int d_num = dnum_reader.GetInt32(0);
            //conn.Close();

            //string sql_BeUntarget = "UPDATE `112-112502`.`願望清單` SET `run_state` = \'n\' WHERE (`d_num` = @d_num);";
            //MySqlCommand cmd_BeUntarget = new MySqlCommand(sql_BeUntarget,conn);
            //cmd_BeUntarget.Parameters.AddWithValue("@d_num", d_num);
            //int row_affect =  cmd_BeUntarget.ExecuteNonQuery();

            ////確認撤換目標
            //if (row_affect > 0) 
            //{ 
            //    //找出欲更換的目標的主索引值
            //    conn.Open();
            //    string sql_Dnum = "SELECT d_num FROM `112-112502`.願望清單  where user_id = @user_id and  d_name = @target_name and pass_amount = @target_amount and pass_state = \'y\' and run_state = \'n\';";
            //    MySqlCommand cmd_FindDnumTarget = new MySqlCommand(sql_Dnum,conn);
            //    cmd_FindDnumTarget.Parameters.AddWithValue("@user_id", user_id);
            //    cmd_FindDnumTarget.Parameters.AddWithValue("@target_name", untarget_text);
            //    cmd_FindDnumTarget.Parameters.AddWithValue("@target_amount", untarget_amount);

            //    MySqlDataReader reader_dnum = cmd_FindDnumTarget.ExecuteReader();

            //    reader_dnum.Read();

            //    int dNum = reader_dnum.GetInt32(0);
            //    conn.Close();

            //    //更換目標
            //    string sql_update = "UPDATE `112-112502`.`願望清單` SET `run_state` = 'y' WHERE (`d_num` = @dNum);";
            //    MySqlCommand cmd_BeTarget = new MySqlCommand(sql_update, conn);
            //    cmd_BeTarget.Parameters.AddWithValue("@dNum", dNum);

            //    int update_affect = cmd_BeTarget.ExecuteNonQuery();

            //    if (update_affect > 0) 
            //    {
            //        Response.Write("<script>alert('新增成功')</script>");
            //        DisplayWish();
            //    }

            //}



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
            string sql = "SELECT concat(d_name,',',pass_amount) FROM `112-112502`.願望清單 where user_id = @user_id and pass_state = 'y' and run_state = \'y\'";
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@user_id", user_id);
            int target_count = cmd.ExecuteNonQuery();



            conn.Close();

            if (target_count != 0)
            {
                //目標內容設定
                conn.Open();
                MySqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    string name_amount = reader.GetString(0);
                    
                    string[] wish_values = name_amount.Split(',');
                    Panel target_space = new Panel() { CssClass = "ContentFlexLeft" };
                    Panel target_values = new Panel() /*{ BorderStyle = BorderStyle.Dashed }*/;
                    Label title = new Label() { Text = "目標", CssClass = "PickWishTitle" };
                    Label target_name = new Label() { Text = wish_values[0] + "\n", CssClass = "PickWishText", };
                    Label target_amount = new Label() { Text = wish_values[1] + "元", CssClass = "PickWishText" };


                    Target_Background.Visible = true;

                    target_values.Controls.Add(target_name);
                    target_values.Controls.Add(target_amount);
                    target_space.Controls.Add(title);
                    target_space.Controls.Add(target_values);
                    Target_Background.Controls.Add(target_space);
                }
                conn.Close();



                //找尚未被選中的願望
                conn.Open();
                string sql_untarget = "SELECT concat(d_name,',',pass_amount) FROM `112-112502`.願望清單 where user_id = @user_id and pass_state = \'y\' and run_state = \'n\'";
                MySqlCommand cmd_target = new MySqlCommand(sql_untarget, conn);
                cmd_target.Parameters.AddWithValue("@user_id", user_id);
                int untarget_count = cmd.ExecuteNonQuery();

                conn.Close();

                if (untarget_count != 0)
                {
                    List<string[]> list = new List<string[]>();

                    conn.Open();
                    MySqlDataReader untarget_reader = cmd_target.ExecuteReader();

                    while (untarget_reader.Read())
                    {
                        string data = untarget_reader.GetString(0);
                        string[] data_split = data.Split(',');

                        list.Add(data_split);
                    }
                    conn.Close();
                    string[][] untargetArray = list.ToArray();

                    int index = 1;

                    foreach (string[] untarget in untargetArray)
                    {
                        Panel panel1 = new Panel() { ID = "Panel" + index.ToString(), CssClass = "BucFlexRight" };
                        Panel panel2 = new Panel() { ID = "Panel" + index.ToString() + '1', CssClass = "ContentFlexRight" };


                        Button btn = new Button() { CommandArgument = index.ToString(), CssClass = "ButtonStyle ChangeWishButton", Text = "更改目標" };
                        btn.Click += new EventHandler(ChangeTarget_Click);

                        Label label1 = new Label() { Text = untarget[0]  , ID = "Label"+index.ToString() };
                        Label label2 = new Label() { Text = untarget[1] + "元",  ID = "Label"+index.ToString()+'1' }  ;

                        label1.Font.Size = FontUnit.XXLarge;
                        label2.Font.Size = FontUnit.XXLarge;


                        panel2.Controls.Add(label1);
                        panel2.Controls.Add(label2);
                        panel2.Controls.Add(btn);

                        panel1.Controls.Add(panel2);

                        Target_Space.Controls.Add(panel1);

                        index++;
                    }

                }
            }
        }
    }
}