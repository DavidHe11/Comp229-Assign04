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
        private ModelData CurrentModel;

        protected void Page_Load(object sender, EventArgs e)
        {
            title.Text = Page.Title;

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

            
            CurrentModel = Global.Models.FirstOrDefault(t => t.name == name & t.faction == faction);

            namelbl.Text = CurrentModel.name.ToString();




        }

    }
}