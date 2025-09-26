using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Routing;
namespace sweptwings
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            RegisterRoutes(RouteTable.Routes);
        }

        public static void RegisterRoutes(RouteCollection routeCollection)
        {
            routeCollection.MapPageRoute("Imagem", "image/{ID}/{airport}/{airline}/{aircraft}/{reg}", "~/image.aspx");
            //routeCollection.MapPageRoute("Lista", "list/{field}/{valor}", "~/list.aspx");
            //routeCollection.MapPageRoute("search", "search/{valor}", "~/search.aspx");
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            string ipAddress = HttpContext.Current.Request.UserHostAddress;
            Session["newsession"] = ipAddress;
            Session["ID"] = "0";
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            //RegisterRoutes(RouteTable.Routes);
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            Session["newsession"] = null;
            Session["ID"] = "0";
        }

        protected void Application_End(object sender, EventArgs e)
        {
            Session["newsession"] = null;
            Session["ID"] = "0";
        }
    }
}