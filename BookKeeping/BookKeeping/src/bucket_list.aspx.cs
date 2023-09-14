﻿using Google.Protobuf.WellKnownTypes;
using MySql.Data.MySqlClient;
using Org.BouncyCastle.Asn1.X509;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZstdSharp.Unsafe;

namespace _BookKeeping
{

    public partial class bucket_list : System.Web.UI.Page
    {
        protected string user_id = "boa004";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayWishList();
            }
        }

        protected MySqlConnection DBConnection()
        {
            string connectionStrings = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(connectionStrings);
            connection.Open();
            return connection;
        }

        protected void DisplayWishList()
        {
            MySqlConnection conn = DBConnection();


            //搜尋願望
            string wishQuery = "SELECT d_num, d_name, pass_amount FROM 願望清單 WHERE user_id = @user_id AND run_state = 'y'";
            MySqlCommand cmd = new MySqlCommand(wishQuery, conn);
            cmd.Parameters.AddWithValue("@user_id", user_id);
            
            //使用Repeater 繫結資料
            using (MySqlDataReader reader = cmd.ExecuteReader())
            {
                Wish_Repeater.DataSource = reader;
                Wish_Repeater.DataBind();
            }

        }
        //檢查是否能兌換願望
        protected bool IsRedeemVisible(object passAmountObj)
        {
            if (passAmountObj == null || passAmountObj == DBNull.Value)
            {
                return false;
            }

            int passAmount = Convert.ToInt32(passAmountObj);
            MySqlConnection conn = DBConnection();

            //計算現有存款
            string depositQuery = @"
            SELECT 
                COALESCE((SELECT SUM(cost) FROM `112-112502`.記帳資料 WHERE user_id = 'boa004' AND class = '願望'), 0) -
                COALESCE((SELECT SUM(cost) FROM `112-112502`.記帳資料 WHERE user_id = 'boa004' AND class = '1'), 0) AS 現有存款";

            MySqlCommand depositCommand = new MySqlCommand(depositQuery, conn);

            // 執行查詢並獲取結果
            int currentUserAmount = Convert.ToInt32(depositCommand.ExecuteScalar());

            // 檢查是否可以兌換
            return currentUserAmount >= passAmount;
        }

        protected void Repeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "DeleteWish")
            {
                string dNum = e.CommandArgument.ToString();

                MySqlConnection conn = DBConnection();

                string deleteQuery = "UPDATE 願望清單 SET run_state = 'd' WHERE d_num = @dNum";
                MySqlCommand deleteCmd = new MySqlCommand(deleteQuery, conn);
                deleteCmd.Parameters.AddWithValue("@dNum", dNum);
                deleteCmd.ExecuteNonQuery();

                DisplayWishList();

            }
            else if (e.CommandName == "RedeemWish")
            {
                // 獲取要兌換的願望的 d_num
                string dNum = e.CommandArgument.ToString();

                MySqlConnection conn = DBConnection();

                string deleteQuery = "UPDATE 願望清單 SET run_state = 'r' WHERE d_num = @dNum";
                MySqlCommand deleteCmd = new MySqlCommand(deleteQuery, conn);
                deleteCmd.Parameters.AddWithValue("@dNum", dNum);
                deleteCmd.ExecuteNonQuery();

                DisplayWishList();
            }






        }
    }
}