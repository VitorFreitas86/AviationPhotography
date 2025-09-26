using sweptwings.BAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sweptwings
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //string url = String.Format("~/search/{0}", searchText.Text);
            //Response.Redirect(url);
            Response.Redirect("~/search.aspx?valor=" + searchText.Text);
        }

       
    }
}