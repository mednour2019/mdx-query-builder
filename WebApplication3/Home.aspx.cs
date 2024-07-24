using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class Home : System.Web.UI.Page
    {
        public int nbusers;
        public List<string> listeinitiales { get; set; }
        public List<string> listecategories { get; set; }
    public List<int> listedata { get; set; }
        public string output2;
        public string output3;
        public int maxvalue;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["name"] != null)
            {
                string a = Session["name"].ToString();
                string b = a;



            }

            mdxquerybuilderEntities1 context = new mdxquerybuilderEntities1();
             nbusers = context.Users.Count();
            listeinitiales = new List<string>();
           listecategories = new List<string>();
            listedata = new List<int>();

            foreach (User u in context.Users)
            {
                listeinitiales.Add(u.Country.ToString());
             
            
            }
            /*     for (int i = 0; i < listeinitiales.Count; i++)
                 {
                     listecategories.Add("nour");
                 }*/
            
            //  listecategories[0] = listeinitiales[0];
            // listedata[0] = 1;
            //  listeinitiales.RemoveAt(0);
            // for (int i = 0; i < listeinitiales.Count; i++)
            // int nb = 0;
            // foreach(string c in listeinitiales)
            listecategories =listeinitiales.Distinct().ToList();
            for (int i = 0; i < listecategories.Count; i++)
            {
                listedata.Add(0);
            }
              for (int i = 0; i < listecategories.Count; i++)
              {
                listedata[i] = nbocc(listecategories[i], listeinitiales);
                      


              }
              maxvalue = listedata.Max()+2;
           

            JavaScriptSerializer jss = new JavaScriptSerializer();
            output2 = jss.Serialize(listecategories);
            output3 = jss.Serialize(listedata);
        }
        /*  public bool exist(string k, List<string> listeinitiale )
          {

              //foreach (DataRow dr in dat.Rows)
              foreach(string u in listeinitiale)
              {

                  if (k.ToString().ToLower() == u.ToString().ToLower())
                  {
                      return true;

                  }


              }
              return false;
          }*/
        public int nbocc(string k, List<string> listeinitiale)
        {
            int nb = 0;
            foreach (string u in listeinitiale)
            {
                if (u.ToLower() == k.ToLower())
                {
                    nb++;
                }
            }

                return nb;
        }

    }
}