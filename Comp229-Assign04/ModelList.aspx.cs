using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp229_Assign04
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            displayModels();
            
        }
        protected void displayModels()
        {
            
            modelListRepeater.DataSource = Global.Models;
            modelListRepeater.DataBind();
            
            
        }

        protected void saveNewJsonFile_Click(object sender, EventArgs e)
        {
            try
            {
                Global.CreateAJsonFile();
                fileCreationConfirmation.Text = "file created!";
            }
            catch(Exception ex)
            {
                fileCreationConfirmation.Text = "file couldn't be created!";
            }
        }

        protected void EmailJsonFile(string clientEmailAddress, string clientName, string attachmentFileName)
        {
            SmtpClient smtpClient = new SmtpClient("smtp-mail.outlook.com", 587);
            smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            
            MailMessage message = new MailMessage();
            try
            {
                MailAddress fromAddress = new MailAddress("cc-comp229f2016@outlook.com", "Comp229-Assign04");
                MailAddress toAddress = new MailAddress(clientEmailAddress, clientName);
                message.From = fromAddress;
                message.To.Add(toAddress);
                message.Subject = "David He 300844568 Comp229-Assign04 email";
                message.Body = "Here is your new file!";
                smtpClient.Host = "smtp-mail.outlook.com";
                smtpClient.EnableSsl = true;
                smtpClient.UseDefaultCredentials = false;
                smtpClient.Credentials = new System.Net.NetworkCredential("cc-comp229f2016@outlook.com", "comp229pwd");
                System.Net.Mime.ContentType contentType = new System.Net.Mime.ContentType();
                contentType.MediaType = System.Net.Mime.MediaTypeNames.Application.Octet;
                contentType.Name = attachmentFileName;
                message.Attachments.Add(new Attachment(System.Web.Hosting.HostingEnvironment.MapPath(Global.getJsonModelFilePath()), contentType));

                smtpClient.Send(message);
                mailConfirmation.Text = "Email Sent";
            }
            catch (Exception ex)
            {
                mailConfirmation.Text = "Couldn't send the message!";
            }
        }

        protected void sendMailButton_Click(object sender, EventArgs e)
        {
            EmailJsonFile(fromMailAddressTB.Text, nameTB.Text, "Assign04Updated.json");
        }

        protected void createCharacter_Click(object sender, EventArgs e)
        {
            ModelData createCharacter = new ModelData(createNameTB.Text, createfactionTB.Text);
            List<ModelData> templist = new List<ModelData>();

            templist = Global.Models.ToList();

            templist.Add(createCharacter);

            Global.Models = templist;

            Response.Redirect("~/ModelView.aspx?name=" + createNameTB.Text + "&faction=" + createfactionTB.Text);
        }
    }
}