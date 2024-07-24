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
    public partial class Login : System.Web.UI.Page
    {
       mdxquerybuilderEntities1 context = new mdxquerybuilderEntities1();
        public string error;

        protected void Page_Load(object sender, EventArgs e)
        {
           

        }
        public void klik(object sender, EventArgs e)
        {
            foreach (User u in context.Users)
            {
                string oi = this.exampleInputUser1.Value;
                string upo = this.exampleInputPassword1.Value;
                if (this.exampleInputUser1.Value == u.username && this.exampleInputPassword1.Value == u.password)
                {
                    Session["name"] = this.exampleInputUser1.Value;
                    Session["IdUser"] = u.userid;
                    Response.Redirect("Home.aspx");
                }
               


            }
             
                error = "username or password invalid!";
                this.exampleInputUser1.Value = "";
                this.exampleInputPassword1.Value = "";
            

        }

       // [WebMethod]
       // [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
       // public static bool validerlogin(string Username,string Password, object sender, EventArgs e)
       // {
           // bool res = false;
          //  string a= Username;
          //  string b = Password;
           // List<User> userlist = new List<User>();
           /* var context = new mdxquerybuilderEntities1();
            var mmm = context.Users;
            foreach (User u in mmm)
            {
                //userlist.Add(u);
                if (u.username == Username && u.password == Password)

                {
                    res = true;
                    HttpContext.Current.Session["name"] = Username;
                    HttpContext.Current.Response.Redirect("dashboard.aspx");

                }
            }*/

          /*  foreach (User u in userlist)
            {
                if (a == u.username && b == u.password)
                {
                    res = true;
                }

            }*/
          /*  if (res == true)
            {
                
                HttpContext.Current.Session["name"] =a;

            }*/

           // return res;

       // }

    }
}