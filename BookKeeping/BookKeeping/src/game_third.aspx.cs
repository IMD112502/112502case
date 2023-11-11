using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;

namespace BookKeeping.src
{
    public partial class game_third : System.Web.UI.Page
    {
        protected Dictionary<string, int> questionQuantities;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Repeater1.DataSource = GetImageData();
                Repeater1.DataBind();

                // Serialize questionQuantities to JSON
                var jsonQuestionQuantities = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(questionQuantities);

                // Inject the JSON string into the JavaScript code
                Page.ClientScript.RegisterStartupScript(this.GetType(), "QuestionQuantitiesScript", $"var questionQuantities = {jsonQuestionQuantities};", true);
            }
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

                images.Add(new GameImage
                {
                    SisRandomNumber = (itemName == "Siss") ? questionQuantities["Siss"] : rand.Next(1, 4),
                    GlueRandomNumber = (itemName == "Gluee") ? questionQuantities[itemName] : rand.Next(1, 4),
                    CorRandomNumber = (itemName == "Corr") ? questionQuantities[itemName] : rand.Next(1, 4),
                    RulerRandomNumber = (itemName == "Rulerr") ? questionQuantities[itemName] : rand.Next(1, 4),
                    RedRandomNumber = (itemName == "Redd") ? questionQuantities[itemName] : rand.Next(1, 4),
                    GreenRandomNumber = (itemName == "Greenn") ? questionQuantities[itemName] : rand.Next(1, 4),
                    BlueRandomNumber = (itemName == "Bluee") ? questionQuantities[itemName] : rand.Next(1, 4),
                    BlackRandomNumber = (itemName == "Blackk") ? questionQuantities[itemName] : rand.Next(1, 4),
                });
            }

            return images;
        }



    }
}