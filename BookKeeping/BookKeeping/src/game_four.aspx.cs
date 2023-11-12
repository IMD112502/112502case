using System;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Linq;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookKeeping.src
{
    public partial class game_four : System.Web.UI.Page
    {
      
        int[] prices = { 25, 10, 53, 37, 8, 20, 45, 12 };
        string[] stationeryNames = { "Redd", "Greenn", "Bluee", "Blackk", "Siss", "Gluee", "Corr", "Rulerr" };

        // 對應文具的數量
        Dictionary<string, int> itemQuantities = new Dictionary<string, int>
        {
            { "Redd", 3 },
            { "Greenn", 1 },
            { "Bluee", 2 },
            { "Blackk", 2 },
            { "Siss", 1 },
            { "Gluee", 1 },
            { "Corr", 2 },
            { "Rulerr", 1 },
        };
        protected void Page_Load(object sender, EventArgs e)
        {
           if (!IsPostBack) 
            {

                InitializeGame3_2();
            }
        }

        protected void InitializeGame3_2() 
        {
            int paymentAmount = CalculatePaymentAmount(stationeryNames , itemQuantities, prices);

            Page.ClientScript.RegisterStartupScript(this.GetType(), "PaymentAmountScript", $"var totalPaymentAmount = {paymentAmount}; updateTotalPayment();", true);
            

        }

        private int CalculatePaymentAmount(string[] stationeryNames, Dictionary<string, int> itemQuantities, int[] prices)
        {
            int totalAmount = 0;

            for (int i = 0; i < stationeryNames.Length; i++)
            {
                string itemName = stationeryNames[i];
                int quantity = itemQuantities[itemName];
                int price = prices[i];

                totalAmount += quantity * price;
            }

            return totalAmount;
        }

        protected void Check_Click(object sender, EventArgs e)
        {
            int paymentAmount = CalculatePaymentAmount(stationeryNames, itemQuantities, prices);
            int totalAmount = Convert.ToInt32(Request.Form["hiddentotal"].ToString());
            if (paymentAmount == totalAmount)
            {
                ClientScript.RegisterStartupScript(GetType(), "答對了", "alert('答對了！');", true);
            }
            else 
            {
                ClientScript.RegisterStartupScript(GetType(), "答錯了", "alert('答錯了！');", true);
            }
        }
    }
}