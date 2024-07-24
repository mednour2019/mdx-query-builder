using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AnalysisServices;
namespace WebApplication3
{
    public partial class checking : System.Web.UI.Page
    {
        public Microsoft.AnalysisServices.Server serrr { get; set; }
        public Microsoft.AnalysisServices.Database db;
        Helper h;
        Helper h2 = new Helper();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["p2"] != null)
            {
                h = (Helper)Session["p2"];
                serrr = h.anaserv;
                db = h.cubedatab;
                
            }

            string nini = db.Name.ToString();

            foreach (Microsoft.AnalysisServices.Database db in serrr.Databases)
            {
                if (db.Name.ToLower().Equals(nini.ToLower()))
                {   
                    foreach (Measure m in db.Cubes[0].AllMeasures)
                    {
                        cblEmployees.Items.Add(m.Name.ToString());

                    }
                }
            }
            foreach (Microsoft.AnalysisServices.Database db in serrr.Databases)
            {
                if (db.Name.ToLower().Equals(nini.ToLower()))
                {
                    foreach (Microsoft.AnalysisServices.CubeDimension m in db.Cubes[0].Dimensions)
                    {
                        if (m.ToString().ToLower().Contains("calendar") == false)
                        {
                            CheckBoxList1.Items.Add(m.Name.ToString());
                        }
                        

                    }
                }
            }
        }

        protected void CheckBoxList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        private void txtChanged(object sender, EventArgs e)
        {
            

            
        }
        protected void bbb_Click(object sender, EventArgs e)
        {

            h2.dimensionsdispo = new List<String>();
            h2.mesuresdispo = new List<Measure>();
            foreach (ListItem item in cblEmployees.Items)

            {

                if (item.Selected == true)

                {

                    string selectedValue = item.Value;
                    Measure mesure = new Microsoft.AnalysisServices.Measure(selectedValue.ToString());
                    h2.mesuresdispo.Add(mesure);

                }

            }

            foreach (ListItem item in CheckBoxList1.Items)
            {
                if (item.Selected==true)
                {
                    string selectedValue2 = item.Value;
                    CubeDimension dim = new Microsoft.AnalysisServices.CubeDimension(selectedValue2.ToString());
                    h2.dimensionsdispo.Add(selectedValue2.ToString());
                  
                }
            }
            Session["p3"] = h2;
            Response.Redirect("index.aspx");
        }

    }
}