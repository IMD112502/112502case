using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace BookKeeping.src
{
    public partial class game_first : System.Web.UI.Page
    {
        private List<int> faceValues = new List<int> { 1, 5, 10, 50, 100, 500, 1000 };
        private Random random = new Random();
        private int currentQuestionIndex = 0;
        private int correctAnswerIndex = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 初始化游戏
                InitializeGame();
            }
        }

        protected void InitializeGame()
        {
            // 随机选择一个面额作为当前问题
            currentQuestionIndex = random.Next(faceValues.Count);

            // 随机生成三个选项，其中一个是正确答案
            correctAnswerIndex = random.Next(3);

            List<string> options = new List<string>();
            for (int i = 0; i < 3; i++)
            {
                if (i == correctAnswerIndex)
                {
                    options.Add(faceValues[currentQuestionIndex].ToString() + "元");
                }
                else
                {
                    // 选择另一个不等于正确答案的面额
                    int randomIndex;
                    do
                    {
                        randomIndex = random.Next(faceValues.Count);
                    }
                    while (randomIndex == currentQuestionIndex);

                    options.Add(faceValues[randomIndex].ToString() + "元");
                }
            }

            // 设置问题和选项
            question.Text = "請問下圖中為多少金額？";
            Image1.ImageUrl = "images/game/money_" + faceValues[currentQuestionIndex] + ".png";
            Ans1.Text = options[0];
            Ans2.Text = options[1];
            Ans3.Text = options[2];
        }

        protected void CheckAnswer(object sender, EventArgs e)
        {
            // 获取用户选择的答案
            Button selectedButton = (Button)sender;
            int selectedAnswerIndex = int.Parse(selectedButton.ID.Substring(3)) - 1;

            // 检查答案是否正确
            if (selectedAnswerIndex == correctAnswerIndex)
            {
                // 显示答对的动画（你可以自定义动画效果）
                // 进行下一题
                InitializeGame();
            }
            else
            {
                // 显示答错的动画（你可以自定义动画效果）
                // 游戏结束或者继续进行下一题
                InitializeGame();
            }
        }
    }
}
