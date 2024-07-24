using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Microsoft.AnalysisServices;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AnalysisServices.AdomdClient;
using System.Web.Services;
using System.Threading;

//using Microsoft.SqlServer.Management.Smo;
namespace WebApplication3
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        DataTable resultsInTable = new DataTable();
        public Microsoft.AnalysisServices.Server serrr { get; set; }
        public Microsoft.AnalysisServices.Database db;
       

        Helper h = new Helper();
     
        Helper h2;

        public List<Microsoft.AnalysisServices.Measure> mesmesures { get; set; }
        public List<string> attdispo { get; set; } = new List<string>();
       
        public List<string> listeres = new List<string>();
        public List<string> listeres2 = new List<string>();
        public DataTable dt;
        string mondimensioncolumn = " ";

        protected void Page_Load(object sender, EventArgs e)
        {
            

          

            if (Session["p2"] != null)
            {
                h2 = (Helper)Session["p2"];
                serrr = h2.anaserv;
                db = h2.cubedatab;
                mesmesures = h2.mesuresdispo;
            }
            


    
            string h = db.Name.ToString();
      


            string nini = db.Name.ToString();
            
            if (!Page.IsPostBack)
            {
                dt = new DataTable() { Columns = { new DataColumn("field") } };


                foreach (Microsoft.AnalysisServices.Measure m in mesmesures)
                {

                    CheckBoxList1.Items.Add(m.Name.ToString());
                    foreach (ListItem item in CheckBoxList1.Items)
                    {
                        item.Selected = true;
                    }
                    CheckBoxList1.Enabled = false;


                }

                foreach (Microsoft.AnalysisServices.Database db in serrr.Databases)
                {
                    if (db.Name.ToLower().Equals(nini.ToLower()))
                    {
                        foreach (Microsoft.AnalysisServices.CubeDimension m in db.Cubes[0].Dimensions)
                        {
                            foreach (string jh in h2.dimensionsdispo)
                            {

                                if (m.Name.ToString().ToLower() == jh.ToLower())
                                {
                                    foreach (Microsoft.AnalysisServices.CubeAttribute oui in m.Attributes)
                                    {

                                        // CheckBoxList3.Items.Add(oui.ToString());
                                        if (oui.ToString().Contains("ID") == false)
                                        {
                                            dt.Rows.Add(oui.ToString());
                                        }
                                        

                                    }
                                }

                            }

                        }
                    }



                }

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            foreach (Microsoft.AnalysisServices.Database db in serrr.Databases)
            {
                if (db.Name.ToLower().Equals(nini.ToLower()))
                {
                    foreach (Microsoft.AnalysisServices.CubeDimension m in db.Cubes[0].Dimensions)
                    {
                        foreach (string jh in h2.dimensionsdispo)
                        {

                            if (m.Name.ToString().ToLower() == jh.ToLower())
                            {
                                foreach (Microsoft.AnalysisServices.CubeAttribute oui in m.Attributes)
                                {
                                    attdispo.Add(oui.ToString());


                                }
                            }

                        }

                    }
                }



            }
            string dim = "DimSites";
            string att = "Site Name";
           

            for (var j = 0; j < 20; j++)
            {
                listeres.Add(" ");
            }
            for (var j = 0; j < 2; j++)
            {
                listeres2.Add(" ");
            }



            UpdatePanel.Update();
            UpdatePanel1.Update();
            UpdatePanel2.Update();
            UpdatePanel3.Update();
            UpdatePanel4.Update();

        }
       

       
        
      
      
        
       

        
        protected void cancelfilter_Click(object sender, EventArgs e)
        {
            List<string> removedItems = new List<string>();

            List<ListItem> itemsNotselected = new List<ListItem>();
            List<string> listf = new List<string>();

            foreach (ListItem item in ListBox3.Items)

            {

                if (item.Selected == false)
                {

                    itemsNotselected.Add(item);
                }


            }
            foreach (ListItem item3 in ListBox3.Items)
            {
                if (item3.Selected == true)
                {
                    listf.Add(item3.ToString());
                }
            }
            if (itemsNotselected.Count == 0)
            {
                foreach (string ui in listf)
                {
                    string s = ui;
                    int h1 = s.IndexOf('[') + 1;
                    s = s.Substring(h1, s.Length - h1);
                    int h22 = s.IndexOf(']');
                    s = s.Substring(0, h22);

                    int k = h2.positiondr(s.ToString(), GridView1);
                    GridView1.Rows[k].Enabled = true;

                }
                ListBox3.Items.Clear();
            }

            foreach (string ui in listf)
            {
                string s = ui;
                int h1 = s.IndexOf('[') + 1;
                s = s.Substring(h1, s.Length - h1);
                int h22 = s.IndexOf(']');
                s = s.Substring(0, h22);

                if (h2.found(itemsNotselected, s) == true)
                { removedItems.Add(ui); }
                else
                {

                    int k = h2.positiondr(s.ToString(), GridView1);
                    GridView1.Rows[k].Enabled = true;
                    removedItems.Add(ui);
                }




            }


            foreach (string item in removedItems)
            {
                ListBox3.Items.Remove(item);
            }
        }
        
            public void col_Click(object sender, EventArgs e)
            {
            var rowIndex = ((GridViewRow)((Control)sender).NamingContainer).RowIndex;

            GridView1.Rows[rowIndex].Enabled = false;

            ListBox11.Items.Add(GridView1.Rows[rowIndex].Cells[0].Text.ToString());

            }
       
              public void cancelcol_Click(object sender, EventArgs e)
              {
                    for (int i = 0; i < ListBox11.Items.Count; i++)

                    {
                        if (ListBox11.Items[i].Selected == true)
                        {
                            // foreach (GridViewRow r in GridViewrow.Rows)
                            int k = h2.positiondr(ListBox11.Items[i].ToString(), GridView1);
                            GridView1.Rows[k].Enabled = true;



                            ListBox11.Items.Remove(ListBox11.Items[i]);


                        }


                    }


              }
            public void row_Click(object sender, EventArgs e)
        {
            var rowIndex = ((GridViewRow)((Control)sender).NamingContainer).RowIndex;
          
            GridView1.Rows[rowIndex].Enabled = false;

            ListBox2.Items.Add(GridView1.Rows[rowIndex].Cells[0].Text.ToString());
        }
        public void clearow_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < ListBox2.Items.Count; i++)

            {
                if (ListBox2.Items[i].Selected == true)
                {
                    // foreach (GridViewRow r in GridViewrow.Rows)
                    int k = h2.positiondr(ListBox2.Items[i].ToString(), GridView1);
                    GridView1.Rows[k].Enabled = true;
                  


                    ListBox2.Items.Remove(ListBox2.Items[i]);


                }


            }
        }
        public void fil_Click(object sender, EventArgs e)
        {
            ListBox5.Items.Clear();
            var rowIndex = ((GridViewRow)((Control)sender).NamingContainer).RowIndex;

            // GridView1.Rows[rowIndex].Enabled = false;
         
            string kk = GridView1.Rows[rowIndex].Cells[0].Text.ToString();
            string nini = db.Name.ToString();
            string diim = "";
            foreach (Microsoft.AnalysisServices.Database db in serrr.Databases)
            {
                if (db.Name.ToLower().Equals(nini.ToLower()))
                {
                    foreach (Microsoft.AnalysisServices.CubeDimension m in db.Cubes[0].Dimensions)
                    {
                        foreach (Microsoft.AnalysisServices.CubeAttribute oui in m.Attributes)
                        {
                            if (oui.ToString() == kk)
                            {
                                diim += m.Name.ToString();
                            }

                        }

                    }
                }



            }

            string cubename = "";
            foreach (Microsoft.AnalysisServices.Database ez in serrr.Databases)
            {
                if (ez.Name == db.Name)
                {
                    cubename = ez.Cubes[0].Name.ToString();

                }
            }

          //  string a = db.Name.ToString();
          //  string z = db.Cubes[1].Name;

            Microsoft.AnalysisServices.Server servanalysi = new Microsoft.AnalysisServices.Server();

            AdomdConnection con = new AdomdConnection();
            string ss = @"datasource="+serrr.Name.ToString()+"; catalog=" + db.Name.ToString() + ";"; servanalysi.Connect(ss);
                Console.WriteLine(servanalysi);

            //Console.WriteLine(servanalysi);
            con.ConnectionString = @"datasource=" + serrr.Name.ToString() + ";catalog=" + db.Name.ToString() + ";";
            con.Open();

                AdomdCommand cmd;
                cmd = con.CreateCommand();

            cmd.CommandText = @"select  non empty distinct{[" + diim + "].[" + kk + "].CHILDREN} on columns from [" + cubename + "]";
            AdomdDataAdapter ad = new AdomdDataAdapter(cmd);
                ad.Fill(resultsInTable);
                int numberColumns;
                numberColumns = resultsInTable.Columns.Count - 1;
                for (int i = 0; i <= numberColumns; i++)
                {
                    DataColumn current;
                    string colName;
                    string baseName = "column_";
                    current = resultsInTable.Columns[i];
                    if (BaseDataList.IsBindableType(current.DataType) == false)
                    {
                        colName = current.ColumnName.ToString();
                        current.ColumnName = baseName + i.ToString();
                        DataColumn col = new DataColumn(colName, System.Type.GetType("System.String"), "Convert(" + current.ColumnName + ", 'System.String')");
                        resultsInTable.Columns.Add(col);
                    }
                
                }
            foreach (DataColumn k in resultsInTable.Columns)
            {
                string f = "column";
                if (k.ColumnName.ToString().ToLower().Contains(f.ToLower()) == false)
                {
                    // string l = k.ColumnName.ToString();

                    //int h2 = l.IndexOf('&') + 1;

                    // l = l.Substring(h2);
                    string s = k.ColumnName.ToString();
                    int h = s.IndexOf('.') + 1;

                    s = s.Substring(h, s.Length - h);


                    ListBox5.Items.Add(s/*k.ColumnName.ToString()*/);
                    //Response.Write("<script>alert('" + k.ColumnName.ToString() + "')</script>");

                }
            }
        }

        public void addfilter_Click(object sender, EventArgs e)
        {

            
                    int k = h2.positiondr2(ListBox5.Items[0].ToString(), GridView1);
                    GridView1.Rows[k].Enabled = false;



                 


               


            

            foreach (ListItem item in ListBox5.Items)
            {
                if (item.Selected == true)
                {
                    ListBox3.Items.Add(item.ToString());
                }


            }
            ListBox5.Items.Clear();



        }

        
        public void display_Click(object sender, EventArgs e)
        {
            if (ListBox11.Items.Count > 0)
            {
                foreach (Microsoft.AnalysisServices.Database db in serrr.Databases)
                {
                    if (db.Name.ToLower().Equals(db.Name.ToString()))
                    {
                        foreach (Microsoft.AnalysisServices.CubeDimension m in db.Cubes[0].Dimensions)
                        {
                            foreach (string jh in h2.dimensionsdispo)
                            {

                                if (m.Name.ToString().ToLower() == jh.ToLower())
                                {
                                    foreach (Microsoft.AnalysisServices.CubeAttribute oui in m.Attributes)
                                    {
                                        if (oui.ToString() == ListBox11.Items[0].Value.ToString())
                                        {
                                            mondimensioncolumn = jh;
                                        }


                                    }
                                }

                            }

                        }
                    }



                }
            }
            if (ListBox2.Items.Count == 0)
            {
               
               
                return;
            }

            h.dimensioncolumnname = mondimensioncolumn;
            h.listrows = new List<string>();
            h.listfilters = new List<string>();
            h.listcolumns = new List<string>();
            if (ListBox11.Items.Count != 0)
            {
                h.listcolumns.Add(ListBox11.Items[0].Value.ToString());
            }
            foreach (ListItem item in ListBox2.Items)
            {
                h.listrows.Add(item.ToString());

            }

            List<string> listf2 = new List<string>();
            foreach (ListItem item3 in ListBox11.Items)
            {
                listf2.Add(item3.ToString());
            }
            foreach (ListItem item in CheckBoxList1.Items)
            {
                item.Selected = true;
                listeres2[0] = listeres2[0] + "," + "[" + item.Text.ToString() + "]";

            }

            for (var j = 0; j < listf2.Count; j++)

            {
                listeres2[1] = listeres2[1] + "," + "[" + listf2[j] + "]" + ".children";



            }
            for (var j = 0; j < listeres2.Count; j++)

            {

                if (listeres2[j] != " ")
                {
                    listeres2[j] = listeres2[j].Remove(0, 2);


                }

            }
            if (listeres2[0] != " ")
            { listeres2[0] = "{" + listeres2[0] + "}"; }
            string calme = " ";
            if ((listeres2[0] != " ") && (listeres2[1] != " "))
            {
                calme = listeres2[0] + "," + listeres2[1];

            }
            else if (listeres2[0] == " ")
            {
                calme = listeres2[1];
            }
            else if (listeres2[1] == " ")
            {
                calme = listeres2[0];
            }
            h.chainecolumn = calme;
            h.date1 = TextBox2.Text;
            h.date2 = TextBox3.Text;
            List<string> listf = new List<string>();
            if (ListBox3.Items.Count != 0)
            {
                foreach (ListItem item3 in ListBox3.Items)
                {
                    listf.Add(item3.ToString());
                }




                if (listeres[0] == " ")
                {
                    listeres.Add(listf[0]);
                    listf.Remove(listf[0]);
                }



                int comp = 0;


                for (var j = 0; j < listf.Count; j++)

                {

                    string s = listf[j];
                    int h1 = s.IndexOf('[') + 1;
                    s = s.Substring(h1, s.Length - h1);
                    int h22 = s.IndexOf(']');
                    s = s.Substring(0, h22);

                    if (h2.exist(listeres, s) == true)
                    {
                        int pos = h2.position(s, listeres);

                        listeres[pos] = listeres[pos] + "," + listf[j];


                    }
                    else
                    {



                        comp = comp + 1;
                        listeres[comp] = listf[j];



                    }







                }


                for (var j = 0; j < listeres.Count; j++)

                {

                    if (listeres[j] != " ")
                    {
                        listeres[j] = '{' + listeres[j] + '}';
                        //  Response.Write("<script>alert('" + listeres[j].ToString()+ "')</script>");

                    }


                }

            }
            h.listfilters = listeres;
            h.listcolumnindex = ListBox11.Items.Count;
            Session["p1"] = h;



            Response.Redirect("display.aspx");
        }
    }
}