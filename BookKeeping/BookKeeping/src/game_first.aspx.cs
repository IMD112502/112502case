using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.EnterpriseServices;
using System.Linq;
using System.Web.UI.WebControls;

namespace BookKeeping.src
{
    public partial class game_first : System.Web.UI.Page
    {
        private List<int> faceValues = new List<int> { 1, 5, 10, 50, 100, 500, 1000 };
        private Random random = new Random();
        private int currentQuestionIndex = 0;
        private int totalQuestions = 7;
        private int currentQuestion = 0;
        public Dictionary<string, int> questionQuantities;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                correctcnt.Text = "0";
                GameProgress.Text = currentQuestion.ToString() + "/" + totalQuestions.ToString();
                // 初始化游戏
                InitializeGame1();
            }
        }

        protected void InitializeGame1()
        {
            FirstGamePanel.Visible = true;
            SecondGamePanel.Visible = false;
            ThirdGamePanel1.Visible = false;
            ThirdGamePanel2.Visible = false;

            currentQuestionIndex = random.Next(faceValues.Count);

            List<string> options = new List<string>();

            // 随机生成一个位置作为正确答案的位置
            int correctAnswerIndex = random.Next(0, 2);
            randomNum.Text = correctAnswerIndex.ToString();

            // 生成一个列表包含所有可能的错误答案的索引
            List<int> possibleWrongAnswers = Enumerable.Range(0, faceValues.Count).ToList();

            // 移除正确答案的索引
            possibleWrongAnswers.Remove(currentQuestionIndex);

            for (int i = 0; i < 3; i++)
            {
                if (i == correctAnswerIndex)
                {
                    options.Add(faceValues[currentQuestionIndex].ToString() + "元");
                }
                else
                {
                    // 随机选择一个错误答案
                    int randomWrongAnswerIndex = random.Next(possibleWrongAnswers.Count);
                    int wrongAnswerIndex = possibleWrongAnswers[randomWrongAnswerIndex];

                    options.Add(faceValues[wrongAnswerIndex].ToString() + "元");

                    // 移除已经选中的错误答案，以确保没有重复
                    possibleWrongAnswers.RemoveAt(randomWrongAnswerIndex);
                }
            }



            // 设置问题和选项
            question1.Text = "請問下圖中為多少金額？";
            Image1.ImageUrl = "images/game/money_" + faceValues[currentQuestionIndex] + ".png";
            Ans1.Text = options[0];
            Ans2.Text = options[1];
            Ans3.Text = options[2];

            UpdateProgressText();
        }
        protected void InitializeGame2()
        {
            FirstGamePanel.Visible = false;
            SecondGamePanel.Visible = true;
            ThirdGamePanel1.Visible = false;
            ThirdGamePanel2.Visible = false;
            // 生成隨機數量（例如，0到3之間的隨機數量）
            Random random = new Random();

            // 面額數量的字典
            Dictionary<int, int> denominationCounts = new Dictionary<int, int>
                {
                    {1000, 0},
                    {500, 0},
                    {100, 0},
                    {50, 0},
                    {10, 0},
                    {5, 0},
                    {1, 0}
                };

            // 遍歷每個面額，生成隨機數量的圖片並添加到對應的<asp:Panel>元素
            var tempDenominationCounts = new Dictionary<int, int>(denominationCounts);

            foreach (var denomination in tempDenominationCounts.Keys)
            {
                int randomQuantity = random.Next(0, 3); // 0到3之間的隨機數

                // 更新字典中的數量
                denominationCounts[denomination] = randomQuantity;

                // 找到對應的<asp:Panel>元素
                Panel denominationPanel = (Panel)FindControl("Panel" + denomination);

                // 清空<asp:Panel>元素的內容
                denominationPanel.Controls.Clear();

                // 生成隨機數量的圖片，然後將它們添加到<asp:Panel>元素中
                for (int i = 0; i < randomQuantity; i++)
                {
                    Image image = new Image();
                    image.ImageUrl = "images/game/money_" + denomination + ".png"; // 圖片的URL
                    image.Height = GetImageHeight(denomination); // 設置圖片高度
                    image.Width = GetImageWidth(denomination); // 設置圖片寬度
                    denominationPanel.Controls.Add(image); // 將圖片添加到<asp:Panel>元素中
                }
            }


            // 計算總金額
            int totalAmount = CalculateTotalAmount(denominationCounts);


            GenerateAnswers(totalAmount);

            UpdateProgressText();
        }


        // 根據面額返回圖片高度
        private int GetImageHeight(int denomination)
        {
            switch (denomination)
            {
                case 1000:
                    return 90;
                case 500:
                    return 85;
                case 100:
                    return 80;
                case 50:
                    return 90;
                case 10:
                    return 80;
                case 5:
                    return 75;
                default:
                    return 65;
            }
        }


        // 根據面額返回圖片寬度
        private int GetImageWidth(int denomination)
        {
            switch (denomination)
            {
                case 1000:
                    return 240;
                case 500:
                    return 220;
                case 100:
                    return 190;
                case 50:
                    return 90;
                case 10:
                    return 80;
                case 5:
                    return 75;
                default:
                    return 65;
            }
        }


        // 計算總金額

        private int CalculateTotalAmount(Dictionary<int, int> denominationCounts)
        {
            int totalAmount = 0;

            // 創建一個臨時集合以遍歷
            var denominationsToIterate = denominationCounts.Keys.ToList();

            foreach (var denomination in denominationsToIterate)
            {
                totalAmount += denomination * denominationCounts[denomination];
            }

            return totalAmount;
        }
        private void GenerateAnswers(int totalAmount)
        {
            Random random = new Random();

            // 生成兩個不同的錯誤答案
            int wrongAnswer1 = totalAmount;
            int wrongAnswer2 = totalAmount;
            while (wrongAnswer1 == totalAmount)
            {
                int changeAmount = random.Next(1, 500); // 隨機生成一個金額來加減
                bool addAmount = random.Next(0, 2) == 0; // 隨機決定是加還是減
                if (addAmount)
                    wrongAnswer1 += changeAmount;
                else
                    wrongAnswer1 -= changeAmount;
            }

            while (wrongAnswer2 == totalAmount || wrongAnswer2 == wrongAnswer1)
            {
                int changeAmount = random.Next(1, 500); // 隨機生成一個金額來加減
                bool addAmount = random.Next(0, 2) == 0; // 隨機決定是加還是減
                if (addAmount)
                    wrongAnswer2 += changeAmount;
                else
                    wrongAnswer2 -= changeAmount;
            }

            // 隨機分配答案到按鈕
            int correctButtonIndex = random.Next(4, 7); // 隨機選擇1、2或3
            int answer1 = 0, answer2 = 0, answer3 = 0;
            randomNum.Text = correctButtonIndex.ToString();
            if (correctButtonIndex == 4)
            {
                answer1 = totalAmount;
                answer2 = wrongAnswer1;
                answer3 = wrongAnswer2;
            }
            else if (correctButtonIndex == 5)
            {
                answer1 = wrongAnswer1;
                answer2 = totalAmount;
                answer3 = wrongAnswer2;
            }
            else
            {
                answer1 = wrongAnswer1;
                answer2 = wrongAnswer2;
                answer3 = totalAmount;
            }

            // 設置按鈕的文字為答案
            Ans4.Text = answer1.ToString() + "元";
            Ans5.Text = answer2.ToString() + "元";
            Ans6.Text = answer3.ToString() + "元";
        }



        private void UpdateProgressText()
        {
            int count = int.Parse(GameProgress.Text[0].ToString());
                count++;
                GameProgress.Text = count.ToString() + "/" + totalQuestions.ToString();

                // 更新进度条样式
                double progress = (double)count / totalQuestions * 100;
                GameProgress.Style["width"] = progress + "%";
        }

        protected void CheckAnswer(object sender, EventArgs e)
        {
            // 获取用户选择的答案
            Button selectedButton = (Button)sender;
            int selectedAnswerIndex = int.Parse(selectedButton.CommandArgument);
            int correctAnswerIndex = int.Parse(randomNum.Text);
            int nextquestion = int.Parse(GameProgress.Text[0].ToString()) + 1;
            int corcnt = Convert.ToInt32(correctcnt.Text);
            // 检查答案是否正确
            if (selectedAnswerIndex == correctAnswerIndex)
            {
                corcnt++;
                correctcnt.Text = corcnt.ToString();
                ClientScript.RegisterStartupScript(GetType(), "答對了", "alert('答對了！');", true);
               
                if (nextquestion <= 2)
                {
                    InitializeGame1();
                }
                else if (nextquestion <= 6)
                {
                    InitializeGame2();
                }
                else
                {
                    InitializeGame3_1();
                }

            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "答錯了", "alert('答錯了！');", true);

                if (nextquestion <= 2)
                {
                    InitializeGame1();
                }
                else if (nextquestion <= 6)
                {
                    InitializeGame2();
                }
                else
                {
                    InitializeGame3_1();
                }
            }
        }
        protected void InitializeGame3_1()
        {
            FirstGamePanel.Visible = false;
            SecondGamePanel.Visible = false;
            ThirdGamePanel1.Visible = true;
            ThirdGamePanel2.Visible = false;
            Repeater1.DataSource = GetImageData();
            Repeater1.DataBind();

            // Serialize questionQuantities to JSON
            var jsonQuestionQuantities = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(questionQuantities);

            // Inject the JSON string into the JavaScript code
            Page.ClientScript.RegisterStartupScript(this.GetType(), "QuestionQuantitiesScript", $"var questionQuantities = {jsonQuestionQuantities};", true);
        }

        public class GameImage
        {
            public int SisRandomNumber { get; set; }
            public int GlueRandomNumber { get; set; }
            public int CorRandomNumber { get; set; }
            public int RulerRandomNumber { get; set; }
            public int RedRandomNumber { get; set; }
            public int GreenRandomNumber { get; set; }
            public int BlueRandomNumber { get; set; }
            public int BlackRandomNumber { get; set; }
        }

        protected List<GameImage> GetImageData()
        {
            List<GameImage> images = new List<GameImage>();

            Random rand = new Random();

            questionQuantities = new Dictionary<string, int>();

            var itemNames = new List<string> { "Redd", "Greenn", "Bluee", "Blackk", "Siss", "Gluee", "Corr", "Rulerr" };

            foreach (var itemName in itemNames)
            {
                int randomNumber = rand.Next(1, 4);
                questionQuantities.Add(itemName, randomNumber);
            }
            images.Add(new GameImage
            {
                RedRandomNumber = questionQuantities["Redd"],
                GreenRandomNumber = questionQuantities["Greenn"],
                BlueRandomNumber = questionQuantities["Bluee"],
                BlackRandomNumber = questionQuantities["Blackk"],
                SisRandomNumber = questionQuantities["Siss"],
                GlueRandomNumber = questionQuantities["Gluee"],
                CorRandomNumber = questionQuantities["Corr"],
                RulerRandomNumber = questionQuantities["Rulerr"]

            });

            return images;
        }

        protected int[] GetRandomList(int r, int g, int b, int k, int s, int gl, int c, int ru)
        {
            int[] randomList = new int[8];
            randomList[0] = r;
            randomList[1] = g;
            randomList[2] = b;
            randomList[3] = k;
            randomList[4] = s;
            randomList[5] = gl;
            randomList[6] = c;
            randomList[7] = ru;

            return randomList;
        }

        protected void Check3_1_Click(object sender, EventArgs e)
        {
            int redQ, greenQ, blueQ, blackQ, sisQ, glueQ, corQ, rulerQ;
            int cnt = 0;
            int red = Convert.ToInt32(Request.Form["hiddenred"].ToString());
            int green = Convert.ToInt32(Request.Form["hiddengreen"].ToString());
            int blue = Convert.ToInt32(Request.Form["hiddenblue"].ToString());
            int black = Convert.ToInt32(Request.Form["hiddenblack"].ToString());
            int sis = Convert.ToInt32(Request.Form["hiddensis"].ToString());
            int glue = Convert.ToInt32(Request.Form["hiddenglue"].ToString());
            int cor = Convert.ToInt32(Request.Form["hiddencor"].ToString());
            int ruler = Convert.ToInt32(Request.Form["hiddenruler"].ToString());

            // 获取 Red 的数量
            Label redLabel = (Label)Repeater1.Controls[0].FindControl("Red");
            redQ = Convert.ToInt32(redLabel.Text);

            // 获取 Green 的数量
            Label greenLabel = (Label)Repeater1.Controls[0].FindControl("Green");
            greenQ = Convert.ToInt32(greenLabel.Text);

            // 获取 Blue 的数量
            Label blueLabel = (Label)Repeater1.Controls[0].FindControl("Blue");
            blueQ = Convert.ToInt32(blueLabel.Text);

            // 获取 Black 的数量
            Label blackLabel = (Label)Repeater1.Controls[0].FindControl("Black");
            blackQ = Convert.ToInt32(blackLabel.Text);

            // 获取 Sis 的数量
            Label sisLabel = (Label)Repeater1.Controls[0].FindControl("Sis");
            sisQ = Convert.ToInt32(sisLabel.Text);

            // 获取 Glue 的数量
            Label glueLabel = (Label)Repeater1.Controls[0].FindControl("Glue");
            glueQ = Convert.ToInt32(glueLabel.Text);

            // 获取 Cor 的数量
            Label corLabel = (Label)Repeater1.Controls[0].FindControl("Cor");
            corQ = Convert.ToInt32(corLabel.Text);

            // 获取 Ruler 的数量
            Label rulerLabel = (Label)Repeater1.Controls[0].FindControl("Ruler");
            rulerQ = Convert.ToInt32(rulerLabel.Text);


            if (red == redQ)
            {
                cnt++;
            }
            if (green == greenQ)
            {
                cnt++;
            }
            if (blue == blueQ)
            {
                cnt++;
            }
            if (black == blackQ)
            {
                cnt++;
            }
            if (sis == sisQ)
            {
                cnt++;
            }
            if (glue == glueQ)
            {
                cnt++;
            }
            if (cor == corQ)
            {
                cnt++;
            }
            if (ruler == rulerQ)
            {
                cnt++;
            }

            if (cnt == 8)
            {
                ClientScript.RegisterStartupScript(GetType(), "答對了", "alert('答對了！');", true);
                InitializeGame3_2();
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "答錯了", "alert('答錯了！');", true);
                GameReord();
            }
        }
        protected void InitializeGame3_2()
        {
            FirstGamePanel.Visible = false;
            SecondGamePanel.Visible = false;
            ThirdGamePanel1.Visible = false;
            ThirdGamePanel2.Visible = true;
            int paymentAmount = CalculatePaymentAmount();

            Page.ClientScript.RegisterStartupScript(this.GetType(), "PaymentAmountScript", $"var totalPaymentAmount = {paymentAmount}; updateTotalPayment();", true);
        }

        private int CalculatePaymentAmount()
        {
            int redQ, greenQ, blueQ, blackQ, sisQ, glueQ, corQ, rulerQ;

            // 获取 Red 的数量
            Label redLabel = (Label)Repeater1.Controls[0].FindControl("Red");
            redQ = Convert.ToInt32(redLabel.Text);

            // 获取 Green 的数量
            Label greenLabel = (Label)Repeater1.Controls[0].FindControl("Green");
            greenQ = Convert.ToInt32(greenLabel.Text);

            // 获取 Blue 的数量
            Label blueLabel = (Label)Repeater1.Controls[0].FindControl("Blue");
            blueQ = Convert.ToInt32(blueLabel.Text);

            // 获取 Black 的数量
            Label blackLabel = (Label)Repeater1.Controls[0].FindControl("Black");
            blackQ = Convert.ToInt32(blackLabel.Text);

            // 获取 Sis 的数量
            Label sisLabel = (Label)Repeater1.Controls[0].FindControl("Sis");
            sisQ = Convert.ToInt32(sisLabel.Text);

            // 获取 Glue 的数量
            Label glueLabel = (Label)Repeater1.Controls[0].FindControl("Glue");
            glueQ = Convert.ToInt32(glueLabel.Text);

            // 获取 Cor 的数量
            Label corLabel = (Label)Repeater1.Controls[0].FindControl("Cor");
            corQ = Convert.ToInt32(corLabel.Text);

            // 获取 Ruler 的数量
            Label rulerLabel = (Label)Repeater1.Controls[0].FindControl("Ruler");
            rulerQ = Convert.ToInt32(rulerLabel.Text);
            int[] prices = { 25, 10, 53, 37, 8, 20, 45, 12 };
            int[] items = GetRandomList(redQ, greenQ, blueQ, blackQ, sisQ, glueQ, corQ, rulerQ);
            int totalAmount = 0;

            for (int i = 0; i < prices.Length; i++)
            {
                int quantity = items[i];
                int price = prices[i];

                totalAmount += quantity * price;
            }

            return totalAmount;
        }

        protected void Check3_2_Click(object sender, EventArgs e)
        {
            int paymentAmount = CalculatePaymentAmount();
            int totalAmount = Convert.ToInt32(Request.Form["hiddentotal"].ToString());
            int corcnt = Convert.ToInt32(correctcnt.Text);
            if (paymentAmount == totalAmount)
            {
                corcnt++;
                correctcnt.Text = corcnt.ToString();
                ClientScript.RegisterStartupScript(GetType(), "答對了", "alert('答對了！');", true);
                
            }
            else
            {

                ClientScript.RegisterStartupScript(GetType(), "答錯了", "alert('答錯了！');", true);
            }
            GameReord();
        }

        protected void GameReord() 
        {
            string connectionString = ConfigurationManager.ConnectionStrings["DBConnectionString"].ConnectionString;
            string user_id = Session["UserID"].ToString();
            int corcnt = Convert.ToInt32(correctcnt.Text);
            DateTime overtime = DateTime.Now;
           
            using (MySqlConnection connection = new MySqlConnection(connectionString)) 
            { 
                connection.Open();

                string sql = "INSERT INTO `112-112502`.`gamedata` (user_id , time , score ) VALUES (@userid , @time , @score);";
                using (MySqlCommand cmd = new MySqlCommand(sql ,connection)) 
                {
                    cmd.Parameters.AddWithValue("@userid", user_id);
                    cmd.Parameters.AddWithValue("@time", overtime);
                    cmd.Parameters.AddWithValue("@score", corcnt);

                    int rowsaffected = cmd.ExecuteNonQuery();

                    if (rowsaffected > 0) 
                    {
                        // 彈出視窗
                        string script = $"alert('您總共答對 {corcnt} 題'); window.location.href = 'game_menu.aspx';";
                        ClientScript.RegisterStartupScript(this.GetType(), "ShowCorrectAnswersAlert", script, true);
                    }
                }
            }
        }
    }
}