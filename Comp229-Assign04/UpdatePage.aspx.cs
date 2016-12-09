using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp229_Assign04
{
    public partial class UpdatePage : System.Web.UI.Page
    {
        private ModelData currentModel;
        private List<Action> actions = new List<Action>();
        private List<Specialability> specials = new List<Specialability>();

        protected void Page_Load(object sender, EventArgs e)
        {
            loadUpdate();
        }

        protected void loadUpdate()
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
            nameTB.Text = currentModel.name;
            factionTB.Text = currentModel.faction;
            RankTB.Text = currentModel.rank.ToString();
            baseTB.Text = currentModel._base.ToString();
            sizeTB.Text = currentModel.size.ToString() + " mm";
            deploymentTB.Text = currentModel.deploymentZone;
            traitsRepeater.DataSource = currentModel.traits;
            traitsRepeater.DataBind();
            typeRepeater.DataSource = currentModel.types;
            typeRepeater.DataBind();
            defenceRepeater.DataSource = currentModel.defenseChart;
            defenceRepeater.DataBind();
            mobilityTB.Text = currentModel.mobility.ToString();
            willpowerTB.Text = currentModel.willpower.ToString();
            resilianceTB.Text = currentModel.resiliance.ToString();
            woundsTB.Text = currentModel.wounds.ToString();
            actionsRepeater.DataSource = actions;
            actionsRepeater.DataBind();
            specialAbilitiesRepeater.DataSource = specials;
            specialAbilitiesRepeater.DataBind();
        }

        protected void updateConfirm_Click(object sender, EventArgs e)
        {
            var name = Request.QueryString["name"];
            var faction = Request.QueryString["faction"];
            List<ModelData> tempList = new List<ModelData>();

            currentModel = Global.Models.FirstOrDefault(t => t.name == name & t.faction == faction);

            currentModel.name = nameTB.Text;
            currentModel.faction = factionTB.Text;
            currentModel.rank = Int32.Parse(RankTB.Text);
            currentModel._base = Int32.Parse(baseTB.Text);
            currentModel.size = Int32.Parse(sizeTB.Text);
            currentModel.deploymentZone = deploymentTB.Text;
            string[] updateTraits = new string[100];
            foreach(RepeaterItem trait in traitsRepeater.Items)
            {
                updateTraits[trait.ItemIndex] = trait.ToString();
            }
            currentModel.traits = updateTraits;


            string[] updatetypes = new string[100];
            foreach (RepeaterItem type in typeRepeater.Items)
            {
                updatetypes[type.ItemIndex] = type.ToString();
            }
            currentModel.types = updatetypes;

            string[] updatedefenseChart = new string[100];
            foreach (RepeaterItem defence in defenceRepeater.Items)
            {
                updatedefenseChart[defence.ItemIndex] = defence.ToString();
            }
            currentModel.defenseChart = updatedefenseChart;

            currentModel.mobility = Int32.Parse(mobilityTB.Text);
            currentModel.willpower = Int32.Parse(willpowerTB.Text);
            currentModel.resiliance = Int32.Parse(resilianceTB.Text);
            currentModel.wounds = Int32.Parse(woundsTB.Text);


            Action[] updateactions = new Action[100];
            foreach (RepeaterItem action in actionsRepeater.Items)
            {
                Action tempAction = new Action();
                tempAction.name = (action.FindControl("actionName") as TextBox).Text;
                tempAction.type = (action.FindControl("actionType") as TextBox).Text;
                tempAction.rating = Int32.Parse((action.FindControl("actionRating") as TextBox).Text);
                tempAction.range = (action.FindControl("actionRange") as TextBox).Text;
                tempAction.description = (action.FindControl("actionDesc") as TextBox).Text;

                updateactions[action.ItemIndex] = tempAction;
            }
            currentModel.actions = updateactions;

            Specialability[] updatespecialAbilities = new Specialability[100];
            foreach(RepeaterItem special in specialAbilitiesRepeater.Items)
            {
                Specialability tempSpecial = new Specialability();
                tempSpecial.name = (special.FindControl("specialName")as TextBox).Text;
                tempSpecial.description = (special.FindControl("specialDesc") as TextBox).Text;
                updatespecialAbilities[special.ItemIndex] = tempSpecial;
            }
            currentModel.specialAbilities = updatespecialAbilities;
            

            tempList = Global.Models.ToList();


            var readitem = (from model in tempList where model.name == name & model.faction == faction select model).ToList();

            foreach (ModelData model in readitem)
            {
                tempList.Remove(model);
            }

            tempList.Add(currentModel);

        }

        protected void cancelConfirm_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ModelList.aspx");
        }
    }
}