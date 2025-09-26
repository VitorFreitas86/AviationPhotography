using sweptwings.BAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sweptwings
{
    public partial class search : System.Web.UI.Page
    {
        BAL_registo registo = new BAL_registo();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                //string field = Request.QueryString["field"];
                //string valor = /*Page.RouteData.Values["valor"].ToString();*/
                //string field = Page.RouteData.Values["field"].ToString();
                string valor = Request.QueryString["valor"];
                //URLUtils.percentDecode(value);
                //valor = valor.Replace("%20", "  ");

                DataList1.DataSource = registo.select_pesquisa(valor);
                DataList1.DataBind();
            }
        }
        protected void LinkButton_aircraft_click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            DataListItem item = (DataListItem)btn.NamingContainer;
            Label lb_aircraft = (Label)item.FindControl("lb_aircraft");
            Response.Redirect("~/list.aspx?field=aircraft&valor=" + lb_aircraft.Text);
        }

        protected void LinkButton_airline_click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            DataListItem item = (DataListItem)btn.NamingContainer;
            Label lb_airline = (Label)item.FindControl("lb_airline");
            Response.Redirect("~/list.aspx?field=airline&valor=" + lb_airline.Text);

        }

        protected void LinkButton_reg_click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            DataListItem item = (DataListItem)btn.NamingContainer;
            Label lb_reg = (Label)item.FindControl("lb_reg");
            Response.Redirect("~/list.aspx?field=reg&valor=" + lb_reg.Text);

        }

        protected void LinkButton_msn_click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            DataListItem item = (DataListItem)btn.NamingContainer;
            Label lb_msn = (Label)item.FindControl("lb_msn");
            Response.Redirect("~/list.aspx?field=msn&valor=" + lb_msn.Text);

        }

        protected void LinkButton_airport_click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            DataListItem item = (DataListItem)btn.NamingContainer;
            Label lb_airport = (Label)item.FindControl("lb_airport");
            Response.Redirect("~/list.aspx?field=airport&valor=" + lb_airport.Text);

        }

        protected void LinkButton_datar_click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            DataListItem item = (DataListItem)btn.NamingContainer;
            Label lb_data = (Label)item.FindControl("lb_data");

            Response.Redirect("~/list.aspx?field=datar&valor=" + lb_data.Text);
        }
    }
}