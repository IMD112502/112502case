using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _BookKeeping
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }


        protected void register_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx"); // 導向到註冊頁面
        }
    }
}