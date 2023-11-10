using System;
using System.Collections.Generic;
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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GameProgress.Text = currentQuestion.ToString() + "/" + totalQuestions.ToString();
                // 初始化游戏
                InitializeGame();
            }
        }

        protected void InitializeGame()
        {
            // 随机选择一个面额作为当前问题
            currentQuestionIndex = random.Next(faceValues.Count);

            List<string> options = new List<string>();

            // 随机生成一个位置作为正确答案的位置
            int correctAnswerIndex = random.Next(0,2);
            randomNum.Text=correctAnswerIndex.ToString();

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

        

        private void UpdateProgressText()
        {
            int count = int.Parse(GameProgress.Text[0].ToString());
            if (count == totalQuestions)
            {
                ClientScript.RegisterStartupScript(GetType(), "答題結束", "alert('答題結束！');", true);
                Response.Redirect("game_menu.aspx");
            }
            else 
            {
                count++;
                GameProgress.Text = count.ToString() + "/" + totalQuestions.ToString();
               
                // 更新进度条样式
                double progress = (double)count / totalQuestions * 100;
                GameProgressBar.Style["width"] = progress + "%";
            }
            
        }

        protected void CheckAnswer(object sender, EventArgs e)
        {
            // 获取用户选择的答案
            Button selectedButton = (Button)sender;
            int selectedAnswerIndex = int.Parse(selectedButton.CommandArgument);
            int correctAnswerIndex = int.Parse(randomNum.Text);

            // 检查答案是否正确
            if (selectedAnswerIndex == correctAnswerIndex)
            {
                ClientScript.RegisterStartupScript(GetType(), "答對了", "alert('答對了！');", true);
                // 显示答对的动画（你可以自定义动画效果）
                // 进行下一题
                InitializeGame();
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "答錯了", "alert('答錯了！');", true);
                // 显示答错的动画（你可以自定义动画效果）
                // 游戏结束或者继续进行下一题
                InitializeGame();
            }
        }


    }
}
