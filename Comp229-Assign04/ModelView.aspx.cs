using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp229_Assign04
{
    public partial class ModelView : System.Web.UI.Page
    {
        private ModelData currentModel;
        private List<Action> actions = new List<Action>();
        private List<Specialability> specials = new List<Specialability>();

        protected void Page_Load(object sender, EventArgs e)
        {
            loadModel();
         }           

        protected void loadModel()
        {
            var name = Request.QueryString["name"];
            var faction = Request.QueryString["faction"];

            if (string.IsNullOrEmpty(name))
            {
                Response.Redirect("~/ModelList.aspx");
                return;
            }

            
            currentModel = Global.Models.FirstOrDefault(t => t.name == name & t.faction == faction);

            for (int i = 0; i < currentModel.actions.Length; i++)
            {
                if (currentModel.actions != null)
                {
                    actions.Add(currentModel.actions[i]);
                }
            }
            for (int i = 0; i < currentModel.actions.Length; i++)
            {
                if (currentModel.specialAbilities != null)
                {
                    specials.Add(currentModel.specialAbilities[i]);
                }
            }

            figureImage.ImageUrl = currentModel.imageUrl;
            nameLbl.Text = currentModel.name;
            factionLbl.Text = currentModel.faction;
            RankLbl.Text = currentModel.rank.ToString();
            baseLbl.Text = currentModel._base.ToString();
            sizeLbl.Text = currentModel.size.ToString() + " mm";
            deploymentLbl.Text = currentModel.deploymentZone;
            traitsRepeater.DataSource = currentModel.traits;
            traitsRepeater.DataBind();
            typeRepeater.DataSource = currentModel.types;
            typeRepeater.DataBind();
            defenceRepeater.DataSource = currentModel.defenseChart;
            defenceRepeater.DataBind(); 
            mobilityLbl.Text = currentModel.mobility.ToString();
            willpowerLbl.Text = currentModel.willpower.ToString();
            resilianceLbl.Text = currentModel.resiliance.ToString();
            woundsLbl.Text = currentModel.wounds.ToString();
            actionsRepeater.DataSource = actions;
            actionsRepeater.DataBind();
            specialAbilitiesRepeater.DataSource = specials;
            specialAbilitiesRepeater.DataBind();



        }

        protected void updateCharacter_Click(object sender, EventArgs e)
        {
            var name = Request.QueryString["name"];
            var faction = Request.QueryString["faction"];

            Response.Redirect("~/UpdatePage.aspx?name=" + name + "&faction=" + faction);
        }

        protected void deleteCharacter_Click(object sender, EventArgs e)
        {
            var name = Request.QueryString["name"];
            var faction = Request.QueryString["faction"];
            List<ModelData> tempList = new List<ModelData>();

            tempList = Global.Models.ToList();


            var readitem = (from model in tempList where model.name == name & model.faction == faction select model).ToList();

            foreach (ModelData model in readitem)
            {
                tempList.Remove(model);
            }

            Global.Models = tempList;

            Response.Redirect("~/ModelList.aspx");
        }
    }
}