using Microsoft.AnalysisServices.AdomdClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AnalysisServices;
using Server = Microsoft.AnalysisServices.Server;
using System.Web.Script.Serialization;
using System.Collections;
using Newtonsoft.Json;
using System.Web.Services;
using System.Web.Script.Services;
using System.Data.Entity.Validation;

namespace WebApplication3
{
    public partial class display : System.Web.UI.Page
    {
       
        public static Microsoft.AnalysisServices.Server serrr { get; set; }
        public static  Microsoft.AnalysisServices.Database db;
        public Microsoft.AnalysisServices.Measure m;
        //public ArrayList converted;
        public static List<Microsoft.AnalysisServices.Measure> listemesures { get; set; }
        //public List<string> listecolumn { get; set; } = new List<string>();
        public static List<string> listerow { get; set; } = new List<string>();
        public List<string> listefilter { get; set; } = new List<string>();
        public string chainecolu { get; set; }
        DataTable resultsInTable = new DataTable();

        public List<string> listestring { get; set; } = new List<string>();
        Helper h ;
        
        string ccc = "";
        string ccc2 = "";
        string fff = "";
        string date1 = "";
        string date2 = "";
        string res3 = "";
        string res2 = "";
       public static  string querybuilder { get; set; }
        // static HttpResponse Response;
        // static string k = "";
        public class columns
       {
            public string field { get; set; }
            public string width { get; set; }
            public string headerTemplate { get; set; }
            public columns(string u,string w)
            {
                this.field = "['"+u + "']";
                this.width = w;
            }
            public columns(string u, string w, string h)
            {
                this.field = "['" + u + "']";
                this.width = w;
                this.headerTemplate = h;
            }
        }
        public class dimenscube
        {
           

            public string title { get; set; }
            public List<columns> columns { get; set; }
            
            public dimenscube( string y ,List<columns> c)
            {
              
                this.title = y;

                this.columns = c;

                
            }
          
        }

        public   DataTable dt;
        //public DataTable dtbarchart;
       // public static List<string> listechart;
        //public static  List<string> listechartval;
        public List<object> cols;
      
        public string JSONresult;
        public string output2;
        public string output3;
        public string outputmax;
        public string outputdimensiontitle;
        public string outputdimcolumn;
        public string outputdimgename;
        public static int nbcolonne;
        public static  string dimensioncolumn;
        public static string dimgeneralname;
        public AdomdCommand cmd;
        // public static  string output3;
        // public static  string output4;


        protected void Page_Load(object sender, EventArgs e)
        {

          nbcolonne = 0;
            dimensioncolumn= " ";
             dimgeneralname= " ";
           // cmd= null;
            if (Session["mdxquerybuilder"] == null)
            {
                if (Session["p1"] != null)
                {
                    // If object is present in session, Cast that to our class (PClass) type
                    h = (Helper)Session["p1"];
                    //Now you can use objP1

                    listerow = h.listrows;
                    nbcolonne = h.listcolumnindex;

                    if (h.listcolumns.Count != 0)
                    {
                        dimgeneralname = h.dimensioncolumnname;
                        dimensioncolumn = h.listcolumns[0].ToString();

                    }
                    foreach (string yi in h.listfilters)
                    {
                        if (yi != " ")
                        {
                            listefilter.Add(yi);
                        }



                    }

                    chainecolu = h.chainecolumn;
                    //chainecolu= chainecolu.ToString().Replace("&", string.Empty);
                    date1 = "'" + h.date1 + " 00:00:00" + "'";

                    date2 = "'" + h.date2 + " 00:00:00" + "'";



                }
                if (Session["p2"] != null)
                {
                    h = (Helper)Session["p2"];
                    listemesures = h.mesuresdispo;
                    db = h.cubedatab;
                    serrr = h.anaserv;

                }
                string cubename = "";
                if (serrr != null)
                {
                    foreach (Microsoft.AnalysisServices.Database ez in serrr.Databases)
                    {
                        if (ez.Name == db.Name)
                        {
                            cubename = ez.Cubes[0].Name.ToString();

                        }
                    }
                }
                Microsoft.AnalysisServices.Server servanalysi = new Microsoft.AnalysisServices.Server();


                AdomdConnection con = new AdomdConnection();
                string ss = @"datasource=" + serrr.Name.ToString() + ";catalog=" + db.Name + "; ";
                servanalysi.Connect(ss);
                Console.WriteLine(servanalysi);

                //Console.WriteLine(servanalysi);
                con.ConnectionString = @"datasource=" + serrr.Name.ToString() + ";catalog=" + db.Name + ";";
                con.Open();

               
                cmd = con.CreateCommand();
                if (listefilter.Count() != 0)
                {
                    foreach (string j in listefilter)
                    {
                        if (j != " ")
                        {

                            fff = fff + j + ",";
                        }



                        res3 = fff.Remove(fff.Length - 1, 1);
                    }
                }

                if (listerow.Count() != 0)
                {
                    ccc2 = ccc2 + "[" + listerow[0].ToString() + "]" + ".children" + ",";
                    //foreach (string j in listerow)
                    for (int j = 1; j < listerow.Count; j++)
                    {

                        ccc2 = ccc2 + "[" + listerow[j].ToString() + "]" + ".members" + ",";
                    }
                    res2 = ccc2.Remove(ccc2.Length - 1, 1);
                }



                if ((listefilter.Count() != 0) && (listerow.Count() != 0) && (chainecolu != " ") && (date1 != "'" + " 00:00:00" + "'") && (date2 != "'" + " 00:00:00" + "'"))
                {


                    cmd.CommandText = @"SELECT NON EMPTY (" + res2 + ") ON ROWS," + "NON EMPTY("
                                     + chainecolu +
                                    " ) ON COLUMNS " +
                                  "FROM " + "(SELECT Filter([SendDate].Levels(1).AllMembers," +
                                  "([SendDate].CurrentMember.MemberValue >= CDate(" + date1 + " )" +
                                  "AND [SendDate].CurrentMember.MemberValue <= CDate(" + date2 + ")))" +
                                  " ON COLUMNS  FROM [" + cubename + "])" +
                                  " where ( " + res3 + ")";

                }
                else if ((date1 == "'" + " 00:00:00" + "'") && (date2 == "'" + " 00:00:00" + "'") && (listefilter.Count() == 0) && (listerow.Count() == 0))
                {

                    cmd.CommandText = @"SELECT NON EMPTY("
                 + chainecolu +
                " ) ON COLUMNS " +
              "FROM [ " + cubename + "]";

                }
                else if ((date1 == "'" + " 00:00:00" + "'") && (date2 == "'" + " 00:00:00" + "'") && (listerow.Count() == 0))
                {

                    cmd.CommandText = @"SELECT NON EMPTY("
                 + chainecolu +
                " ) ON COLUMNS " +
              "FROM [" + cubename + "] where" + "(" + res3 + ")";

                }
                else if ((date1 == "'" + " 00:00:00" + "'") && (date2 == "'" + " 00:00:00" + "'") && (listefilter.Count() == 0))
                {

                    cmd.CommandText = @"SELECT NON EMPTY (" + res2 + ") ON ROWS," + "NON EMPTY("
                 + chainecolu +
                " ) ON COLUMNS " +
              "FROM [" + cubename + "]";

                }
                else if ((listerow.Count() == 0) && (listefilter.Count() == 0))
                {

                    cmd.CommandText = @"SELECT NON EMPTY("
                                          + chainecolu +
                                         " ) ON COLUMNS " +
                                       " FROM " + "(SELECT Filter([SendDate].Levels(1).AllMembers," +
                                      " ([SendDate].CurrentMember.MemberValue >= CDate(" + date1 + " )" +
                                      " AND [SendDate].CurrentMember.MemberValue <= CDate(" + date2 + ")))" +
                                      " ON COLUMNS  FROM [" + cubename + "])";

                }

                else if ((date1 == "'" + " 00:00:00" + "'") && (date2 == "'" + " 00:00:00" + "'"))
                {

                    cmd.CommandText = @"SELECT NON EMPTY (" + res2 + ") ON ROWS," + "NON EMPTY("
                                    + chainecolu +
                                   " ) ON COLUMNS " +
                                 "FROM [" + cubename + "] where" + "(" + res3 + ")";

                }


                else if (listefilter.Count() == 0)
                {
                    cmd.CommandText = @"SELECT NON EMPTY (" + res2 + ") ON ROWS," + "NON EMPTY("
                         + chainecolu +
                        " ) ON COLUMNS " +
                                  "FROM " + "(SELECT Filter([SendDate].Levels(1).AllMembers," +
                                  "([SendDate].CurrentMember.MemberValue >= CDate(" + date1 + " )" +
                                  "AND [SendDate].CurrentMember.MemberValue <= CDate(" + date2 + ")))" +
                                  " ON COLUMNS  FROM [" + cubename + "])";

                }
                else if (listerow.Count() == 0)
                {
                    cmd.CommandText = @"SELECT NON EMPTY("
                                   + chainecolu +
                                  " ) ON COLUMNS " +
                                "FROM " + "(SELECT Filter([SendDate].Levels(1).AllMembers," +
                                 "([SendDate].CurrentMember.MemberValue >= CDate(" + date1 + " )" +
                                 "AND [SendDate].CurrentMember.MemberValue <= CDate(" + date2 + ")))" +
                                 " ON COLUMNS  FROM [" + cubename + "])" +
                                 " where ( " + res3 + ")";
                }




            }
            else
            {

                if (Session["addivariableh"] != null)
                {
                    h = (Helper)Session["addivariableh"];
                  

                }
                listerow =(List <string>) Session["listerow"];


                dimensioncolumn = Session["dimcol"].ToString();
                dimgeneralname = Session["dimgenename"].ToString();
                nbcolonne = Convert.ToInt32( Session["nbcol"]);
                listemesures = (List<Microsoft.AnalysisServices.Measure>)Session["newlistemes"];
                string k = Session["mdxquerybuilder"].ToString();
                string server = Session["servername"].ToString();
                string db = Session["dbname"].ToString();
                AdomdConnection con = new AdomdConnection();
                
                con.ConnectionString = @"datasource="+ server+ "; catalog="+db+"; ";
                con.Open();
                cmd = con.CreateCommand();

                cmd.CommandText =k ;
                Session.Remove("mdxquerybuilder");
            }



                querybuilder = cmd.CommandText.ToString();

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

            for (int i = 0; i < resultsInTable.Rows.Count; i++)
               // foreach(DataRow r in resultsInTable.Rows)

                {
               for (int j = 0; j < resultsInTable.Columns.Count; j++)
                      // foreach(DataColumn dc in resultsInTable.Columns)
                        {


                           // if (h.exista(r[dc].ToString(), listerow) == true && r[dc].ToString()== DBNull.Value.ToString())
                            if (h.exista(resultsInTable.Columns[j].ColumnName.ToString(), listerow) == true)
                            {
                                if (resultsInTable.Rows[i][j].ToString() == DBNull.Value.ToString())
                               {
                                    //Response.Write("<script>alert('" + resultsInTable.Columns[j].ColumnName.ToString() + "')</script>");

                                    resultsInTable.Rows[i][j] = "All";
                                    //r[dc] = "All";
                                }



                            }
                        }

                }

            if (listerow.Count == 3)
            {

                for (int ze = 0; ze < resultsInTable.Rows.Count; ze++)
                {
                    if (resultsInTable.Rows[ze][1].ToString() == "All" && resultsInTable.Rows[ze][2].ToString() != "All")
                    {
                        //Response.Write("<script>alert('" + resultsInTable.Columns[j].ColumnName.ToString() + "')</script>");

                        DataRow dr = resultsInTable.Rows[ze];
                        dr.Delete();
                    }
                }
                resultsInTable.AcceptChanges();
            }

            JavaScriptSerializer jss = new JavaScriptSerializer();

           

            dt = new DataTable();
            dt.Columns.Add("id");
            dt.Columns.Add("parentId");
            dt.Columns.Add("Position");
            //string iuoyyy = " ";
            foreach (DataColumn dc in resultsInTable.Columns)
            {
              
                   if(dc.ColumnName.ToString().ToLower().Contains("Measures".ToLower())==true)
                    {

                        dc.ColumnName = dc.ColumnName.ToString().Replace("[", string.Empty);
                        dc.ColumnName = dc.ColumnName.ToString().Replace("]", string.Empty);
                        dc.ColumnName = dc.ColumnName.ToString().Replace(".", string.Empty);
                    dc.ColumnName = dc.ColumnName.ToString().Replace("&", string.Empty);
                    dc.ColumnName = dc.ColumnName.ToString().Replace("(", string.Empty);
                    dc.ColumnName = dc.ColumnName.ToString().Replace(")", string.Empty);
                    dt.Columns.Add(dc.ColumnName.ToString());

                    }
              

            }







           double max = 0;
           double qsd = 0;
            if (listerow.Count == 3)

            {

                for (int i = 0; i < resultsInTable.Rows.Count; i++)
                {

                    if (resultsInTable.Rows[i][1].ToString() == "All" && resultsInTable.Rows[i][2].ToString() == "All")

                    {

                        DataRow _ravi = dt.NewRow();


                        _ravi["id"] = i;
                        _ravi["parentId"] = null;

                        _ravi["Position"] = resultsInTable.Rows[i][0].ToString();

                        for (int j = 3; j < resultsInTable.Columns.Count; j++)
                        {
                            if (resultsInTable.Columns[j].ColumnName.ToString().Contains("Measures") == true)
                            {
                                _ravi[resultsInTable.Columns[j].ColumnName.ToString()] = resultsInTable.Rows[i][j];
                                if (resultsInTable.Rows[i][j].ToString() != DBNull.Value.ToString())

                                {
                                    qsd = Convert.ToDouble(resultsInTable.Rows[i][j].ToString());
                                }
                                if (qsd > max)
                                {
                                    max = qsd;
                                }
                            }
                        }

                        dt.Rows.Add(_ravi);
                        DataRow dr = resultsInTable.Rows[i];
                        dr.Delete();


                    }
                    else if (resultsInTable.Rows[i][1].ToString() != "All" && resultsInTable.Rows[i][2].ToString() == "All")
                    {
                        DataRow _ravi2 = dt.NewRow();
                        _ravi2["id"] = i * 1000;
                        _ravi2["parentId"] = h.posparentid(resultsInTable.Rows[i][0].ToString(), dt);
                        _ravi2["Position"] = resultsInTable.Rows[i][1].ToString();
                        for (int j = 3; j < resultsInTable.Columns.Count; j++)
                        {
                            if (resultsInTable.Columns[j].ColumnName.ToString().Contains("Measures") == true)
                            {
                                _ravi2[resultsInTable.Columns[j].ColumnName.ToString()] = resultsInTable.Rows[i][j];
                            }
                        }

                        dt.Rows.Add(_ravi2);
                        DataRow dr2 = resultsInTable.Rows[i];
                        dr2.Delete();
                    }
                    else if (resultsInTable.Rows[i][1].ToString() != "All" && resultsInTable.Rows[i][2].ToString() != "All")
                    {
                        DataRow _ravi3 = dt.NewRow();
                        _ravi3["id"] = 2;
                        _ravi3["parentId"] = h.getposition2(resultsInTable.Rows[i][0].ToString(), resultsInTable.Rows[i][1].ToString(), dt);
                        _ravi3["Position"] = resultsInTable.Rows[i][2].ToString();
                        for (int j = 3; j < resultsInTable.Columns.Count; j++)
                        {
                            if (resultsInTable.Columns[j].ColumnName.ToString().Contains("Measures") == true)
                            {
                                _ravi3[resultsInTable.Columns[j].ColumnName.ToString()] = resultsInTable.Rows[i][j];
                            }
                        }

                        dt.Rows.Add(_ravi3);
                        DataRow dr3 = resultsInTable.Rows[i];
                        dr3.Delete();
                    }
                }
                resultsInTable.AcceptChanges();

            }
            else
                if (listerow.Count == 2)
            {
                
                for (int i = 0; i < resultsInTable.Rows.Count; i++)
                {
                    if (resultsInTable.Rows[i][1].ToString() == "All")

                    {
                        DataRow _ravi = dt.NewRow();


                        _ravi["id"] = i;
                        _ravi["parentId"] = null;

                        _ravi["Position"] = resultsInTable.Rows[i][0].ToString();

                        for (int j = 3; j < resultsInTable.Columns.Count; j++)
                        {
                            if (resultsInTable.Columns[j].ColumnName.ToString().Contains("Measures") == true)
                            {
                                _ravi[resultsInTable.Columns[j].ColumnName.ToString()] = resultsInTable.Rows[i][j];
                                if (resultsInTable.Rows[i][j].ToString() != DBNull.Value.ToString())

                                {
                                    qsd = Convert.ToDouble(resultsInTable.Rows[i][j].ToString());
                                }
                                if (qsd > max)
                                {
                                    max = qsd;
                                }
                            }
                        }

                        dt.Rows.Add(_ravi);
                        DataRow dr = resultsInTable.Rows[i];
                        dr.Delete();

                    }
                    else if (resultsInTable.Rows[i][1].ToString() != "All")
                    {
                        DataRow _ravi2 = dt.NewRow();
                        _ravi2["id"] = i * 1000;
                        _ravi2["parentId"] = h.posparentid(resultsInTable.Rows[i][0].ToString(), dt);
                        _ravi2["Position"] = resultsInTable.Rows[i][1].ToString();
                        for (int j = 3; j < resultsInTable.Columns.Count; j++)
                        {
                            if (resultsInTable.Columns[j].ColumnName.ToString().Contains("Measures") == true)
                            {
                                _ravi2[resultsInTable.Columns[j].ColumnName.ToString()] = resultsInTable.Rows[i][j];
                                
                            }
                        }

                        dt.Rows.Add(_ravi2);
                        DataRow dr2 = resultsInTable.Rows[i];
                        dr2.Delete();
                    }


                }

                resultsInTable.AcceptChanges();


            }
            else
                if (listerow.Count == 1)
                {
                
                for (int i = 0; i < resultsInTable.Rows.Count; i++)
                    {
                        DataRow _ravi = dt.NewRow();


                        _ravi["id"] = i;
                        _ravi["parentId"] = null;

                        _ravi["Position"] = resultsInTable.Rows[i][0].ToString();

                        for (int j = 2; j < resultsInTable.Columns.Count; j++)
                        {
                            if (resultsInTable.Columns[j].ColumnName.ToString().Contains("Measures") == true)
                            {
                                _ravi[resultsInTable.Columns[j].ColumnName.ToString()] =resultsInTable.Rows[i][j].ToString();
                            if (resultsInTable.Rows[i][j].ToString() != DBNull.Value.ToString())

                            {
                               qsd = Convert.ToDouble(resultsInTable.Rows[i][j].ToString());
                            }
                            if (qsd > max)
                            {
                                max = qsd;
                            }

                        }
                        }

                        dt.Rows.Add(_ravi);
                        DataRow dr = resultsInTable.Rows[i];
                        dr.Delete();
                    }
                }

           double yui = max+10;
           // string dimensiontitle = listerow[0].ToString();
         
            outputmax = jss.Serialize(yui);
            outputdimensiontitle = jss.Serialize(listerow[0].ToString());
            outputdimcolumn = jss.Serialize(dimensioncolumn);
            outputdimgename = jss.Serialize(dimgeneralname);
            // Response.Write(outputdimensiontitle);

            // Response.Write(output3);
            // Response.Write(output4);
            //Response.Write(JSONresult);

            cols = new List<object>();

            if (nbcolonne == 0)

            {


                foreach (DataColumn dec in dt.Columns)

                {
                    if (dec.ColumnName.ToString() != "id" && dec.ColumnName.ToString() != "parentId")
                    {
                        // dec.ColumnName = dec.ColumnName.ToString().Replace("[", string.Empty);
                        // dec.ColumnName = dec.ColumnName.ToString().Replace("]", string.Empty);
                        columns col1 = new columns(dec.ColumnName.ToString(), "200px");
                        cols.Add(col1);
                    }
                }
            }
            else
            //******************************************************************************************************
            {


                // List<object> listefinal = new List<object>();
                List<string> listeattributes = new List<string>();

                List<columns> listecolnonnes;
                dimenscube dim1;
                columns fieldposition = new columns("Position", "300px");
                cols.Add(fieldposition);
                // columns field1 = new columns("column1");
                foreach (Microsoft.AnalysisServices.Measure m in listemesures)
                {
                    // int nb = h.mesuresdispo.Count;
                    listecolnonnes = new List<columns>();
                    /*  if (h.multiheader(m.Name.ToString().ToLower(), dt) == true)
                      { 

                      }*/

                    // foreach (DataColumn dec in dt.Columns)
                    for (int j = 3; j < dt.Columns.Count; j++)

                    {
                        // if (dt.Columns[j].ColumnName.ToString() != "id" && dec.ColumnName.ToString() != "parentId" && dec.ColumnName.ToString() != "Position")
                        // {
                        if (dt.Columns[j].ColumnName.ToString().ToLower().Contains(m.Name.ToString().ToLower()))
                        {
                            // int v = 8 + m.Name.ToString().Length;
                            // String value = dt.Columns[j].ColumnName.ToString();

                            // String substring = value.Substring(v, value.Length - v);

                            // dt.Columns[j].ColumnName= dt.Columns[j].ColumnName.Substring(8 + m.Name.ToString().Length, dt.Columns[j].ColumnName.Length - (8 + m.Name.ToString().Length));

                            // dt.Columns[j].ColumnName = dt.Columns[j].ColumnName.Substring(8 + m.Name.ToString().Length, dt.Columns[j].ColumnName.Length - (8 + m.Name.ToString().Length));
                            // dt.Columns[j].ColumnName = dt.Columns[j].ColumnName.ToString().Replace("Measures", string.Empty);
                            // dt.Columns[j].ColumnName = dt.Columns[j].ColumnName.ToString().Replace(m.Name.ToString(), string.Empty);
                            // string headerTemplate = dt.Columns[j].ColumnName.ToString().Replace(m.Name.ToString(), string.Empty).Replace(dimensioncolumn, string.Empty)string kkk = h.dimensioncolumnname; ;
                            int kza =8+ m.Name.Length + dimensioncolumn.Length + dimgeneralname.Length;
                            String headerTemplate = dt.Columns[j].ColumnName.ToString().Substring(kza, dt.Columns[j].ColumnName.ToString().Length-kza);

                            columns field2 = new columns(dt.Columns[j].ColumnName, "100px", headerTemplate);

                            listecolnonnes.Add(field2);
                        }
                        // }
                    }
                    //listecolnonnes.Add(field2);
                    dim1 = new dimenscube(m.Name.ToString(), listecolnonnes);
                    cols.Add(dim1);

                }

            }








            // output3 = jss.Serialize(listefinal);
            // Response.Write(output3);


            output2 = jss.Serialize(cols);
            JSONresult = JsonConvert.SerializeObject(dt);

            GridView1.DataSource = resultsInTable;
          GridView1.DataBind();







          




        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataSource = resultsInTable;
            GridView1.DataBind();
        }
        protected void Your_GridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
           
          
            
        }
       

        protected void SubmitForm(EventArgs e, object sender)
        {
            
        }
        protected void ShowPopup(object sender, EventArgs e)
        {
           
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static void afficher(string Name)
        {
            string e = Name;
            string z = querybuilder;
            string dimcol = dimensioncolumn;
            int nbcol = nbcolonne;
            string dimgenename = dimgeneralname;
            string  listemesure = String.Join(",",listemesures );
            string listerow = String.Join(",",display.listerow);

            try
            {
                var context = new mdxquerybuilderEntities();
                var visualisation = new Visualisation()
                {


                    Name = e,
                    Mdxquery = z,
                    UserId = Convert.ToInt16(HttpContext.Current.Session["IdUser"]),
                    dimcol = dimcol,
                    nbcol = nbcol,
                    dimgenename = dimgenename,
                    listemesure = listemesure,
                    listerow = listerow,
                    servername = serrr.Name.ToString(),
                    dbname = db.Name.ToString()

            };
                context.Visualisations.Add(visualisation);

                context.SaveChanges();
            }
            catch (DbEntityValidationException ee)
            {
                foreach (var eve in ee.EntityValidationErrors)
                {
                    Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                        eve.Entry.Entity.GetType().Name, eve.Entry.State);
                    foreach (var ve in eve.ValidationErrors)
                    {
                        Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                            ve.PropertyName, ve.ErrorMessage);
                    }
                }
                throw;
            }
        }

    }
}