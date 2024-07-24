using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        public string name;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] != null)
            {
                string a = Session["name"].ToString();
                name = a;

            }
        
        }
        protected void login_ServerClick(object sender, EventArgs e)
        {
            Response.ClearHeaders();
            Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);




            Session.Abandon();
            Session.Clear();
            Session.RemoveAll();
          //  Session.Abandon();
          

            Response.Redirect("~/Login.aspx");
        }
    }
}