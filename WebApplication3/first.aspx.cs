using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AnalysisServices;
using Microsoft.SqlServer.Server;
using Microsoft.SqlServer.Management.Common;
using Microsoft.SqlServer.Management.Sdk;
using Microsoft.SqlServer.Management.Smo;
using System.Web.UI.DataVisualization.Charting;



namespace WebApplication3
{
    public partial class config : System.Web.UI.Page
    {
        Microsoft.SqlServer.Management.Smo.Server serveur;
        Microsoft.AnalysisServices.Server servanalysi;
        Microsoft.AnalysisServices.Database k;
        public Microsoft.AnalysisServices.Server serrr { get; set; }
        public Microsoft.AnalysisServices.Database db;
		string nini = " ";
        Helper h = new Helper();
        public string name;
        protected void Page_Load(object sender, EventArgs e)
        {
            serveur = new Microsoft.SqlServer.Management.Smo.Server();


            string nour = serveur.Name;
            string strConnection = "Data Source=" + nour;
            servanalysi = new Microsoft.AnalysisServices.Server();
            if (servanalysi.Connected)
                servanalysi.Disconnect();
            else
                servanalysi.Connect(strConnection);
            serrr = servanalysi;
            // servanalysi.Connect(ss2);
            if (!Page.IsPostBack)
            {






                // ListBox1.Items.Clear();
                // foreach (Microsoft.AnalysisServices.Database db in servanalysi.Databases)
                // { ListBox1.Items.Add(db.Name); }
                //DropDownList1.Items.Remove(DropDownList1.Items[0]);

                DropDownList1.Items.Add(servanalysi.ToString());



            }

            if (Session["name"] != null)
            {
                string a = Session["name"].ToString();
                name = a;

            }
        }
        protected void listIndexChanged(object sender, EventArgs e)
        {

            CheckBoxList1.Items.Clear();
            cblEmployees.Items.Clear();
            db = new Microsoft.AnalysisServices.Database(ListBox1.SelectedValue);

            nini = db.Name.ToString();

            foreach (Microsoft.AnalysisServices.Database db in serrr.Databases)
            {
                if (db.Name.ToLower().Equals(nini.ToLower()))
                {
                    foreach (Microsoft.AnalysisServices.CubeDimension m in db.Cubes[0].Dimensions)
                    {
                        if (m.Dimension.Type.ToString().Equals("Time") == false)
                        {
                            CheckBoxList1.Items.Add(m.Name.ToString());
                        }


                    }
                }
            }
            foreach (Microsoft.AnalysisServices.Database db in serrr.Databases)
            {
                if (db.Name.ToLower().Equals(nini.ToLower()))
                {
                    foreach (Measure m in db.Cubes[0].AllMeasures)
                    {
                        cblEmployees.Items.Add(m.Name.ToString());

                    }
                    foreach (MdxScript m in db.Cubes[0].MdxScripts)
                    {
                        cblEmployees.Items.Add(m.ToString());
                    }
                }
            }
        }
        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {






        }
        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            // string message = ddlFruits.SelectedItem.Text + " - " + ddlFruits.SelectedItem.Value;
            /* if (ddlFruits.SelectedItem.Value.ToString() == "nour")

             {
                 ListBox1.Visible = true;
                 ListBox1.Items.Clear();
                 ListBox1.Items.Add("nour");
             }*/

            ListBox1.Visible = true;
            // ListBox1.Items.Clear();
            foreach (Microsoft.AnalysisServices.Database db in servanalysi.Databases)
            { ListBox1.Items.Add(db.Name); }
            // DropDownList1.Items.Remove(DropDownList1.Items[0]);
            /* else if (ddlFruits.SelectedItem.Value.ToString() == "karim")

             {
                 ListBox1.Visible = true;
                 ListBox1.Items.Clear();
                 ListBox1.Items.Add("karim");
             }*/

        }

        protected void next_Click(object sender, EventArgs e)
        {
            h.anaserv = servanalysi;
            k = new Microsoft.AnalysisServices.Database(ListBox1.SelectedValue);
            h.cubedatab = k;
            h.dimensionsdispo = new List<String>();
            h.mesuresdispo = new List<Measure>();
            foreach (ListItem item in cblEmployees.Items)

            {

                if (item.Selected == true)

                {

                    string selectedValue = item.Value;
                    Measure mesure = new Microsoft.AnalysisServices.Measure(selectedValue.ToString());
                    h.mesuresdispo.Add(mesure);

                }

            }
            foreach (ListItem item in CheckBoxList1.Items)
            {
                if (item.Selected == true)
                {
                    string selectedValue2 = item.Value;
                    CubeDimension dim = new Microsoft.AnalysisServices.CubeDimension(selectedValue2.ToString());
                    h.dimensionsdispo.Add(selectedValue2.ToString());

                }
            }
            Session["p2"] = h;
            Response.Redirect("index.aspx");
            //Response.Write("<script>alert('fini')</script>");
        }

        protected void val_Click(object sender, EventArgs e)
        {

        }



    }
}