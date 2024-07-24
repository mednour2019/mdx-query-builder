using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class guess : System.Web.UI.Page
    {
      //  public List<string> reportlist { get; set; }
        public IQueryable<Visualisation> blogs { get; set; }
        public List<Visualisation> liste { get; set; }
        Helper h = new Helper();
        mdxquerybuilderEntities context = new mdxquerybuilderEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
           // var context = new mdxquerybuilderEntities();
            int id = Convert.ToInt16(Session["IdUser"]);
            // var userLinq = context.Visualisations.(u => u.UserId ==id );
            // string j = userLinq.Name;
           // reportlist = new List<string>();
            using (var context = new mdxquerybuilderEntities())
            {
                // Query for all blogs with names starting with B
                 blogs = from b in context.Visualisations
                            where b.UserId == id
                            select b;
                liste = blogs.ToList();
                /* foreach (var dail in blogs)
                 {
                     // string h = dail.Name.ToString();
                     reportlist.Add(dail.Name.ToString());
                 }*/
            }
        }
        public void klik(object sender, EventArgs e)
        {

            string u = Request.Form["SendA"];
            string dimcol= Request.Form["Sendimcol"];
            int nbcol = Convert.ToInt32( Request.Form["Sendnbcol"]);
           string dimgenename = Request.Form["Sendimgenename"];
            string listemes= Request.Form["Sendlistemesure"];
            string lister = Request.Form["Sendlisterow"];
            string server = Request.Form["Sendserver"];
            string db = Request.Form["Sendb"];
            List <string> listemesures = listemes.Split(',').ToList();
            List<Microsoft.AnalysisServices.Measure> newlistemes = new List<Microsoft.AnalysisServices.Measure>();
            foreach (string mes in listemesures)
            {
                Microsoft.AnalysisServices.Measure m1 = new Microsoft.AnalysisServices.Measure(mes);

                newlistemes.Add(m1);

            }

                List<string> listerow = lister.Split(',').ToList();



            //  string yu = u;
            //Visualisation  u = context.Visualisations[0]

            Session["mdxquerybuilder"] = u;
            Session["addivariableh"] = h;
            Session["dimcol"] = dimcol;
            Session["nbcol"] = nbcol;
            Session["dimgenename"] = dimgenename;
            Session["newlistemes"] = newlistemes;
            Session["listerow"] = listerow;
            Session["servername"] = server;
            Session["dbname"] = db;
            Response.Redirect("display.aspx");
        }
    }
}