using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace Comp229_Assign04
{
    public class Global : HttpApplication
    {
        public static IEnumerable<ModelData> Models;
        private static string jsonModelFilePath = ("~/Data/Assign04.json");
        private static string jsonOutputFilePath = ("~/Data/NewModelsAssign04.json");


        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        private void createModelCollection()
        {
            /*Creates a IEnumberable of Models using the modelData*/
            using (StreamReader reader = new StreamReader(System.Web.Hosting.HostingEnvironment.MapPath(jsonModelFilePath)))
            {
                var jsonString = reader.ReadToEnd();
                Models = JsonConvert.DeserializeObject<List<ModelData>>(jsonString);
            };
            
         }
        public static void CreateAJsonFile()
        {
            /*Creates a Json file with new data.*/
            using (StreamWriter writer = File.CreateText(System.Web.Hosting.HostingEnvironment.MapPath(jsonOutputFilePath)))
            {
                writer.WriteLine(JsonConvert.SerializeObject(Models));
            }

        }