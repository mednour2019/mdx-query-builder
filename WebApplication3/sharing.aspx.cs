using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
  
    public partial class sharing : System.Web.UI.Page
    {
        public  static IQueryable<Visualisation> blogs { get; set; }
        public IQueryable<User> blogs2 { get; set; }

        public List<Visualisation> liste { get; set; }
        public List<User> users{ get; set; }
       public static mdxquerybuilderEntities context = new mdxquerybuilderEntities();
     public static    mdxquerybuilderEntities1 context1 = new mdxquerybuilderEntities1();

        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt16(Session["IdUser"]);
      
            using (var context = new mdxquerybuilderEntities())
            {
                // Query for all blogs with names starting with B
                blogs = from b in context.Visualisations
                        where b.UserId == id
                        select b;
                liste = blogs.ToList();
               
            }
            using (var context1 = new mdxquerybuilderEntities1())
            {
                // Query for all blogs with names starting with B
                blogs2 = from b in context1.Users
                        where b.userid != id
                        select b;
                users = blogs2.ToList();

            }

        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static void afficher(string reportid,string userid)
        {
            int reportidd = Convert.ToInt32(reportid);
            int useridd = Convert.ToInt32(userid);
            Visualisation u;
            using (var context = new mdxquerybuilderEntities())
            {
                // Query for all blogs with names starting with B
                blogs = from b in context.Visualisations
                        where b.ReportId == reportidd
                        select b;
                u = blogs.ToList()[0];
                u.UserId = useridd;
            }
            context.Visualisations.Add(u);

            context.SaveChanges();
        }

    }
}