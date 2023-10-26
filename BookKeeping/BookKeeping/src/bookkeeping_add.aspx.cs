using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.Types;
using System.Web.SessionState;

namespace _BookKeeping
{
    public partial class bookkeeping_add : System.Web.UI.Page
    {
        protected string user_id;
        protected int currentMonth;

        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            user_id = Session["UserID"] as string;

            if (!IsPostBack)
            {
                if (string.IsNullOrEmpty(user_id))
                {
                    // 如果使用者未登入，可以執行相應的處理，例如導向到登入頁面
                    Response.Redirect("login.aspx");
                }

                MySqlConnection conn = DBConnection();
                currentMonth = DateTime.Now.Month; // 紀錄顯示的月份
                SearchSelectMonth(conn, currentMonth);
            }
        }


        protected MySqlConnection DBConnection()
        {
            string connectionStrings = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            MySqlConnection connection = new MySqlConnection(connectionStrings);
            connection.Open();
            return connection;
        }

        protected void SearchSelectMonth(MySqlConnection connection, int month)
        {
            // 如果有 Session 變數 "currentMonth"，則使用它作為目前顯示的月份
            if (Session["currentMonth"] != null)
            {
                month = Convert.ToInt32(Session["currentMonth"]);
            }
            else
            {
                // 如果 Session 變數 "currentMonth" 不存在，將當前月份存入 Session 變數中
                Session["currentMonth"] = month;
            }

            // 將月份限制在有效範圍內
            int currentMonth = Math.Max(1, Math.Min(DateTime.Now.Month, month));

            Label1.Text = DateTime.Now.Year.ToString() + "年" + currentMonth.ToString() + "月";
            string sql = "SELECT num, date, b.cls_name, cost, mark FROM `112-112502`.記帳資料 as a\r\njoin `112-112502`.記帳類別 as b on a.class_id = b.cls_id where user_id = @user_id and year(date) = @year and month(date) = @month order by date;";
            MySqlCommand cmd = new MySqlCommand(sql, connection);
            cmd.Parameters.AddWithValue("@year", DateTime.Now.Year);
            cmd.Parameters.AddWithValue("@month", currentMonth);
            cmd.Parameters.AddWithValue("@user_id", user_id);

            //MySqlDataReader reader = cmd.ExecuteReader();

            // 將資料繫結到 GridView 控制項上
            //GridView1.DataSource = reader;
            //GridView1.DataBind();

            //reader.Close();

            // 使用 DataTable 來存儲數據
            DataTable dataTable = new DataTable();

            // 使用 MySqlDataAdapter 從數據庫中檢索數據並填充 DataTable
            using (MySqlDataAdapter adapter = new MySqlDataAdapter(cmd))
            {
                adapter.Fill(dataTable);
            }

            // 設置 GridView 的數據來源為 DataTable
            GridView1.DataSource = dataTable;
            GridView1.DataBind();
        }

        protected void MinusMonth_Click(object sender, EventArgs e)
        {
            MySqlConnection conn = DBConnection();
            Button btn = (Button)sender;
            //邊界值
            int MinMonth = 1;
            //求現在顯示的月份
            int indexMonth = Convert.ToInt32(Label1.Text.Substring(Label1.Text.IndexOf("年") + 1, Label1.Text.Length - 6).ToString());
            if (indexMonth > MinMonth)
            {
                indexMonth -= 1;
                currentMonth = indexMonth; // 更新顯示的月份
                Session["currentMonth"] = currentMonth; // 更新 Session 變數
                SearchSelectMonth(conn, indexMonth);
            }
        }


        protected void PlusMonth_Click(object sender, EventArgs e)
        {
            MySqlConnection conn = DBConnection();
            Button btn = (Button)sender;
            //邊界值
            int MaxMonth = DateTime.Now.Month;
            //求現在顯示的月份
            int indexMonth = Convert.ToInt32(Label1.Text.Substring(Label1.Text.IndexOf("年") + 1, Label1.Text.Length - 6).ToString());
            if (indexMonth < MaxMonth)
            {
                indexMonth += 1;
                currentMonth = indexMonth; // 更新顯示的月份
                Session["currentMonth"] = currentMonth; // 更新 Session 變數
                SearchSelectMonth(conn, indexMonth);
            }
        }


        protected void Submit_Click(object sender, EventArgs e)
        {
            // 資料庫連接
            MySqlConnection conn = DBConnection();


            DateTime datetime = DateTime.Parse(Request.Form["date"]);
            DateTime date = datetime.Date;

            string costInput = TextBox1.Text;
            if (!string.IsNullOrEmpty(costInput))
            {
                if (int.TryParse(costInput, out int cost))
                {

                    string mark = TextBox2.Text;
                    string category = Request.Form["radio"].ToString();

                    string sql = "INSERT INTO `112-112502`.記帳資料(user_id, date, class_id, cost, mark) VALUES (@name, @date, @category, @cost, @mark)";

                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@name", user_id);
                    cmd.Parameters.AddWithValue("@category", category);
                    cmd.Parameters.AddWithValue("@date", date);
                    cmd.Parameters.AddWithValue("@cost", cost);
                    cmd.Parameters.AddWithValue("@mark", mark);

                    int rows_affect = cmd.ExecuteNonQuery();
                    if (rows_affect > 0)
                    {
                        TextBox1.Text = null;
                        TextBox2.Text = null;
                        ClientScript.RegisterStartupScript(GetType(), "新增成功", "alert('新增成功！');", true);

                        SearchSelectMonth(conn, date.Month);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(GetType(), "新增失敗", "alert('新增失敗！');", true);
                    }


                    // 重新綁定 GridView 控制項的資料來源

                }
                else
                {
                    ErrorMessageLabel.Visible = true;
                    ErrorMessageLabel.Text = "請輸入有效的數字!";
                }
            }
            else
            {
                ErrorMessageLabel.Visible = true;
                ErrorMessageLabel.Text = "請輸入數字!";
            }
        }



        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // 取得要刪除的資料的主鍵值
            string num = GridView1.DataKeys[e.RowIndex]["num"].ToString();

            // 執行刪除資料的操作
            DeleteRecord(num);

            // 取得目前顯示的月份
            int currentMonth = Convert.ToInt32(Session["currentMonth"]);

            // 重新載入該月份的資料
            MySqlConnection conn = DBConnection();
            SearchSelectMonth(conn, currentMonth);
        }




        protected void DeleteRecord(string num)
        {
            // 資料庫連接
            MySqlConnection conn = DBConnection();

            string sql = "DELETE FROM `112-112502`.記帳資料 WHERE num = @num";

            MySqlCommand cmd = new MySqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@num", num);

            int rowsAffected = cmd.ExecuteNonQuery();

            if (rowsAffected > 0)
            {
                ClientScript.RegisterStartupScript(GetType(), "刪除成功", "alert('資料已成功刪除！');", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "刪除失敗", "alert('資料刪除失敗！');", true);
            }

            conn.Close();
        }


        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            MySqlConnection conn = DBConnection();
            GridView1.EditIndex = e.NewEditIndex;
            int indexMonth = Convert.ToInt32(Label1.Text[Label1.Text.IndexOf("年") + 1].ToString());
            SearchSelectMonth(conn, indexMonth);

        }


        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            MySqlConnection conn = DBConnection();
            GridView1.EditIndex = -1;
            int indexMonth = Convert.ToInt32(Label1.Text[Label1.Text.IndexOf("年") + 1].ToString());
            SearchSelectMonth(conn, indexMonth);
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            MySqlConnection conn = DBConnection();
            GridViewRow row = GridView1.Rows[e.RowIndex];

            // 取得要編輯的資料的主鍵值
            string num = GridView1.DataKeys[e.RowIndex]["num"].ToString();

            // 取得編輯後的資料
            string dateStr = ((TextBox)row.FindControl("txtdate")).Text;
            string category = ((DropDownList)row.FindControl("txtclass")).SelectedValue;
            string costStr = ((TextBox)row.FindControl("txtcost")).Text;
            string mark = ((TextBox)row.FindControl("txtmark")).Text;

            // 將字串轉換為日期型別
            DateTime date = DateTime.Parse(dateStr);

            // 將字串轉換為整數型別
            int cost = int.Parse(costStr);

            // 更新資料庫中的資料
            string sql = "UPDATE `112-112502`.記帳資料 SET date = @date, class_id = @category, cost = @cost, mark = @mark WHERE user_id = @user_id AND num = @num";

            MySqlCommand cmd = new MySqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@date", date);
            cmd.Parameters.AddWithValue("@category", category);
            cmd.Parameters.AddWithValue("@cost", cost);
            cmd.Parameters.AddWithValue("@mark", mark);
            cmd.Parameters.AddWithValue("@user_id", user_id);
            cmd.Parameters.AddWithValue("@num", num);

            int rowsAffected = cmd.ExecuteNonQuery();

            if (rowsAffected > 0)
            {
                ClientScript.RegisterStartupScript(GetType(), "更新成功", "alert('資料已成功更新！');", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "更新失敗", "alert('資料更新失敗！');", true);
            }

            GridView1.EditIndex = -1;

            // 取得目前顯示的月份
            int currentMonth = Convert.ToInt32(Session["currentMonth"]);

            // 重新載入該月份的資料
            SearchSelectMonth(conn, currentMonth);

            conn.Close();
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // 获取当前行数据
                DataRowView rowView = (DataRowView)e.Row.DataItem;
                string category = rowView["cls_name"].ToString(); // 这里假设你的类别信息在 "class" 列中

                // 找到编辑和删除按钮的控件
                Button btnEdit = (Button)e.Row.FindControl("btnEdit");
                Button btnDelete = (Button)e.Row.FindControl("btnDelete");

                // 如果類別是"願望"或"兌換願望"，則隱藏編輯和刪除按鈕
                if (category == "願望" || category == "兌換願望")
                {
                    btnEdit.Visible = false;
                    btnDelete.Visible = false;
                }
            }
        }









    }
}