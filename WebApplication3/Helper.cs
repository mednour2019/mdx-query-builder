using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Microsoft.AnalysisServices;
using System.Data;



namespace WebApplication3
{
    public class Helper
    {

        public string dimensioncolumnname;
        public List<string> listrows { get; set; }
        public List<string> listcolumns { get; set; }
        public List<string> listfilters { get; set; }
        public int listcolumnindex { get; set; }
        public string chainecolumn { get; set; }
        public string chainefilter { get; set; }
        public List<Measure> chosmeasures { get; set; }
        public Microsoft.AnalysisServices.CubeAttribute att1 { get; set; }
        public Microsoft.AnalysisServices.CubeAttribute att2 { get; set; }
       // public Microsoft.AnalysisServices.CubeDimension dim1 { get; set; }
       // public Microsoft.AnalysisServices.CubeDimension dim2 { get; set; }
       public string date1 { get; set; }
        public string date2 { get; set; }
        public Microsoft.AnalysisServices.Server anaserv;
        public Microsoft.AnalysisServices.Database cubedatab;
        public List<Microsoft.AnalysisServices.Measure> mesuresdispo { get; set; }
        public List<String> dimensionsdispo { get; set; }
        public Helper(List<Measure> chosmeasures, Microsoft.AnalysisServices.CubeAttribute att1,
            Microsoft.AnalysisServices.CubeAttribute att2/*,Microsoft.AnalysisServices.CubeDimension dim1,
            Microsoft.AnalysisServices.CubeDimension dim2*/,string date1, string date2, 
            Microsoft.AnalysisServices.Server anaserv, Microsoft.AnalysisServices.Database cubedatab
          )
        {
            this.chosmeasures = chosmeasures;
            this.att1 = att1;
            this.att2 = att2;
            this.date1 = date1;
            this.date2 = date2;
         
            //  this.dim1 = dim1;
            // this.dim2 = dim2;
            this.anaserv = anaserv;
            this.cubedatab = cubedatab;
        }
        //constructeu vide
        public Helper()
        {
        }

        public bool exist(List<string> listeres,string s)
        {


            foreach (string k in listeres)
            {

                if ( k.Contains(s))
                { return true; }


            }
            return false;
        }
        public bool found(List<ListItem> listeres, string s)
        {


            foreach (ListItem k in listeres)
            {

                if (k.ToString().Contains(s))
                { return true; }


            }
            return false;
        }
        public bool exist2(CheckBoxList l, string s)
        {


            foreach (ListItem item in l.Items)
            {

                if (item.ToString().Contains(s))
                { return true; }


            }
            return false;
        }
        public int position(string s,List<string> listeres)
        {
            int ll=0;
            for (var j = 0; j < listeres.Count; j++)

            {

                if (listeres[j].Contains(s))
                {
                    ll = j;
                }


            }
            return ll;

        }
        public int position2( List<string> listeres)
        {
            int ll = 0;
            for (var j = 0; j < listeres.Count; j++)

            {

                if (listeres[j]==" ")
                {
                    ll = j;
                }


            }
            return ll;

        }
      /*  public bool testexistance(string k, List<string> listrow)
        {

            foreach (string az in listrow)
            {

                if (k.ToString().ToLower().Contains(az.ToLower()))
                { return true; }


            }
            return false;
        }*/
        public bool existedatatable(string k, DataTable dat)
        {

            //foreach (DataRow dr in dat.Rows)
                for (int i = 0; i <dat.Rows.Count; i++)
                {

                if (k.ToLower()==dat.Rows[i][2].ToString().ToLower() )
                    { return true;
                
                     }


                }
            return false;
        }
        public bool exist(string k, DataTable dat)
        {

            //foreach (DataRow dr in dat.Rows)
            for (int i = 0; i < dat.Rows.Count; i++)
            {

                if (k == dat.Rows[i][0].ToString())
                {
                    return true;

                }


            }
            return false;
        }
        public int getpositiondiffeferent(DataTable dat)
        {
            //int jj=0;
            int zer=0;
            //foreach (DataRow dr in dat.Rows)
            // if(exist(j.ToString(),dat)==false  )
            for (int jj = 0; jj< 500; jj++)
             
            {
             
            //if(dat.Rows[i][0].ToString() == Convert.ToString(jj))
            if(exist(jj.ToString(),dat)==false)
                

                {

                    zer = jj;

                }



              
            }

            return zer;
           
        }
       public int posparentid(string k, DataTable dt)
       {
           string z = "nour";
            int ko = 0;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (k == dt.Rows[i][2].ToString())
                {
                    z = dt.Rows[i][0].ToString();
                }

            }
            ko = Convert.ToInt32(z);
            return ko;
        }


        public int getidprincipal(string se, DataTable dt)
        { string z = "";
            int ko = 0;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (se == dt.Rows[i][0].ToString())
                {
                    z = dt.Rows[i][0].ToString();
                }


            }

           // ko = int.Parse(z);
            ko = Convert.ToInt32(z);
            return ko;

        }

            public int getposition2(string cell0, string cell1, DataTable dt)
        {
            
          
            int nour = 0;
            int resultatfinal = 0;
            for (int i = 0; i < dt.Rows.Count; i++)
               

            {
                if (dt.Rows[i][2].ToString() == cell0)
                {
                    nour =Convert.ToInt32( dt.Rows[i][0].ToString());
                }
            }

            for (int j = 0; j <dt.Rows.Count; j++)


            {
                if ( dt.Rows[j][1].ToString()!= DBNull.Value.ToString() && nour == Convert.ToInt32(dt.Rows[j][1].ToString()) && cell1==dt.Rows[j][2].ToString())
                {
                    resultatfinal = Convert.ToInt32( dt.Rows[j][0].ToString());
                }


            }
           
            
            return resultatfinal ;
        }




        public bool exista( string k ,List<string> lis)
        {

            foreach (string zee in lis)
            {
                if (k.Contains(zee)==true)
                {
                    return true;
                }
            }
            return false;
        }


        public int positiondr(string y, GridView er)
        {
            int az = 0;
            for (int j = 0; j < er.Rows.Count; j++)
            {
                if (er.Rows[j].Cells[0].Text.ToString().ToLower() == y.ToLower())
                {


                    az = j;
                }
            }
            return az;
        }

        public int positiondr2(string y, GridView er)
        {
            int az = 0;
            for (int j = 0; j < er.Rows.Count; j++)
            {
                if (y.ToLower().Contains(  er.Rows[j].Cells[0].Text.ToString().ToLower()))
                {


                    az = j;
                }
            }
            return az;
        }

    }

}