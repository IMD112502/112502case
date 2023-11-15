﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;
using MySql.Data.MySqlClient;
using System.Configuration;


namespace BookKeeping
{
    public partial class forget_bucket_pwd : System.Web.UI.Page
    {
        protected string user_id;
        protected void Page_Load(object sender, EventArgs e)
        {
            user_id = Session["UserID"] as string;
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            if (Page.IsValid) // 检查页面是否通过验证
            {
                string selectquestion = securityQuestion.SelectedValue;
                string selectanswer = securityAnswer.Text.Trim();
                string newpwd = UserPwd.Text.Trim();
                string confirmpwd = TextBox1.Text.Trim();

                if (!string.IsNullOrEmpty(selectquestion) && !string.IsNullOrEmpty(selectanswer) && !string.IsNullOrEmpty(newpwd) && !string.IsNullOrEmpty(confirmpwd))
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;

                    using (MySqlConnection conn = new MySqlConnection(connectionString))
                    {
                        conn.Open();

                        // 从数据库中获取注册时选择的问题和答案
                        string selectQuery = "SELECT question2, answer2 FROM `112-112502`.user WHERE user_id = @user_id";
                        MySqlCommand selectCommand = new MySqlCommand(selectQuery, conn);
                        selectCommand.Parameters.AddWithValue("@user_id", user_id);

                        using (MySqlDataReader reader = selectCommand.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                string originalQuestion = reader["question2"].ToString();
                                string originalAnswer = reader["answer2"].ToString();

                                reader.Close();

                                // 判断用户输入的问题和答案是否与数据库中的一致
                                if (selectquestion == originalQuestion && selectanswer == originalAnswer)
                                {
                                    if (newpwd == confirmpwd) // 检查两个密码字段是否匹配
                                    {
                                        // 更新密码
                                        string updateQuery = "UPDATE `112-112502`.user SET YNpassword = @password WHERE user_id = @user_id";
                                        MySqlCommand updateCommand = new MySqlCommand(updateQuery, conn);
                                        updateCommand.Parameters.AddWithValue("@user_id", user_id);
                                        updateCommand.Parameters.AddWithValue("@password", newpwd);

                                        int rowsUpdated = updateCommand.ExecuteNonQuery();

                                        if (rowsUpdated > 0)
                                        {
                                            // 密码更新成功
                                            // 清空文本框
                                            securityQuestion.SelectedValue = "";
                                            securityAnswer.Text = "";
                                            UserPwd.Text = "";
                                            TextBox1.Text = "";

                                            // 显示成功消息
                                            string script = "var overlay = document.getElementById('overlay');";
                                            script += "overlay.style.display = 'block';"; // 顯示背景遮罩
                                            script += "var imageBox = document.createElement('img');";
                                            script += "imageBox.src = 'images/alert_1Y.png';";
                                            script += "imageBox.className = 'custom-image';";
                                            script += "document.body.appendChild(imageBox);";
                                            script += "setTimeout(function() { overlay.style.display = 'none'; }, 2000);"; // 隱藏背景遮罩
                                            script += "setTimeout(function() { imageBox.style.display = 'none'; window.location.href = '" + ResolveUrl("bucket_password.aspx") + "'; }, 2000);"; // 显示图像一段时间后跳转到登录页面
                                            ClientScript.RegisterStartupScript(GetType(), "修改成功", script, true);
                                        }
                                    }
                                    else
                                    {
                                        // 密码不匹配，显示错误消息
                                        string script = "var overlay = document.getElementById('overlay');";
                                        script += "overlay.style.display = 'block';"; // 顯示背景遮罩
                                        script += "var imageBox = document.createElement('img');";
                                        script += "imageBox.src = 'images/alert_n_whole.png';";
                                        script += "imageBox.className = 'custom-image';";
                                        script += "document.body.appendChild(imageBox);";
                                        script += "setTimeout(function() { overlay.style.display = 'none'; }, 2000);"; // 隱藏背景遮罩
                                        script += "setTimeout(function() { imageBox.style.display = 'none'; }, 2000);"; // 自动隐藏图像
                                        ClientScript.RegisterStartupScript(GetType(), "確認密碼不匹配", script, true);
                                    }
                                }
                                else
                                {
                                    // 安全问题或答案不匹配，显示错误消息
                                    string script = "var overlay = document.getElementById('overlay');";
                                    script += "overlay.style.display = 'block';"; // 顯示背景遮罩
                                    script += "var imageBox = document.createElement('img');";
                                    script += "imageBox.src = 'images/alert_n_whole.png';";
                                    script += "imageBox.className = 'custom-image';";
                                    script += "document.body.appendChild(imageBox);";
                                    script += "setTimeout(function() { overlay.style.display = 'none'; }, 2000);"; // 隱藏背景遮罩
                                    script += "setTimeout(function() { imageBox.style.display = 'none'; }, 2000);"; // 自动隐藏图像
                                    ClientScript.RegisterStartupScript(GetType(), "安全问题或答案不匹配", script, true);
                                }
                            }
                        }
                    }
                }
                else
                {
                    // 显示错误消息，提示用户填写完整的信息
                    string script = "var overlay = document.getElementById('overlay');";
                    script += "overlay.style.display = 'block';"; // 顯示背景遮罩
                    script += "var imageBox = document.createElement('img');";
                    script += "imageBox.src = 'images/alert_n_whole.png';";
                    script += "imageBox.className = 'custom-image';";
                    script += "document.body.appendChild(imageBox);";
                    script += "setTimeout(function() { overlay.style.display = 'none'; }, 2000);"; // 隱藏背景遮罩
                    script += "setTimeout(function() { imageBox.style.display = 'none'; }, 2000);"; // 自动隐藏图像
                    ClientScript.RegisterStartupScript(GetType(), "請填寫完整", script, true);
                }
            }
        }
    }
}