﻿using _BookKeeping;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookKeeping.src
{
    public partial class review : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (GetArray().Length > 0)
                {
                    label1.Text = FindName() + "想要";
                    label2.Text = GetArray()[0];
                    label3.Text = "可以嗎><？";
                }
                else
                {
                    RadioButtonList1.Visible = false;
                    Button3.Text = "返回";
                    Button3.Click -= Submit_Click;
                    Button3.PostBackUrl = "bucket_list.aspx";
                    Label l = new Label();
                    l.Text = "目前沒有要審核的願望喔!";
                    Panel1.Controls.Add(l);
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

        protected string FindName()
        {
            MySqlConnection conn = DBConnection();
            string sql = "SELECT user_name FROM `112-112502`.user基本資料\r\nwhere user_id = \'1\';";
            string user_name = string.Empty;
            MySqlCommand cmd = new MySqlCommand(sql, conn);
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
            string sql = "SELECT d_name FROM `112-112502`.願望清單\r\nwhere user_id = \'1\' and pass_state = \'r\';";
            MySqlCommand cmd = new MySqlCommand(sql, conn);
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

        protected int select_index = 0;
        protected void ChangeWish_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            if (btn.CommandArgument == "minus")
            {
                if (select_index == 0)
                {
                    select_index = GetArray().Length - 1;
                }
                else
                {
                    select_index--;
                }

            }
            if (btn.CommandArgument == "plus")
            {
                if (select_index == GetArray().Length - 1)
                {
                    select_index = 0;

                }
                else
                {
                    select_index++;

                }

            }
            label2.Text = GetArray()[select_index];

        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedValue = RadioButtonList1.SelectedValue;
            if (selectedValue == "y")
            {
                label4.Visible = true;
                label5.Visible = true;
                Textbox1.Visible = true;
                Textbox2.Visible = false;
                label6.Visible = false;
            }
            if (selectedValue == "n")
            {
                label4.Visible = false;
                label5.Visible = false;
                Textbox1.Visible = false;
                Textbox2.Visible = true;
                label6.Visible = true;
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {

        }


    }
}