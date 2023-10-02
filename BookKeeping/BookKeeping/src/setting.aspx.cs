using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;

namespace BookKeeping.src
{
    public partial class setting : System.Web.UI.Page
    {
        protected string user_id; // 新增成員變數

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                user_id = Session["UserID"] as string; // 將 Session["UserID"] 賦值給成員變數 user_id

                if (!string.IsNullOrEmpty(user_id))
                {
                    // 使用者已登入，顯示使用者名稱
                    name.Text = user_id ;
                }

            }
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            // 清除用戶的 Session，以確保用戶登出
            Session.Clear();

            // 重定向到登入頁面
            Response.Redirect("login.aspx");
        }
    }
}