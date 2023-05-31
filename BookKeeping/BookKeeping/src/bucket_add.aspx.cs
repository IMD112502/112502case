using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;


namespace _BookKeeping
{
    public partial class bucket_add : System.Web.UI.Page
    {

        protected string user_id = "boa004";
        public object ErrorMessagel { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string connection = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            MySqlConnection conn = new MySqlConnection(connection);
            conn.Open();

            string name = "1"; //user_id
            string d_name = WishTextbox.Text;

            if (string.IsNullOrWhiteSpace(d_name))//判斷是否為空值
            {
                ErrorMessage1.Text = "請輸入願望名稱";
                ErrorMessage1.Visible = true;
                return;
            }

            if (!IsAllChineseLetters(d_name))//判斷是否為中文
            {
                ErrorMessage1.Text = "願望名稱只能包含中文文字";
                ErrorMessage1.Visible = true;
                return;
            }

            string sql = "insert into `112-112502`.願望清單(user_id, d_name, pass_state) values (@name, @d_name, 'r')";

            MySqlCommand cmd = new MySqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@d_name", d_name);

            int rowsaffected = cmd.ExecuteNonQuery();
            WishTextbox.Text = null;

            if (rowsaffected > 0)//彈出視窗
            {
                ClientScript.RegisterStartupScript(GetType(), "新增成功", "alert('新增成功！');", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "新增失敗", "alert('新增失敗！');", true);
            }
        }



        protected bool IsAllChineseLetters(string input)
        {
            // 是否只包含中文字符
            return System.Text.RegularExpressions.Regex.IsMatch(input, @"^[\u4e00-\u9fa5]+$");

        }



    }
}