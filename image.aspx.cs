using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using sweptwings.BAL;
using sweptwings.PROP;
using System.Web.UI.HtmlControls;
using System.Data;
using System.IO;

namespace sweptwings
{
    public partial class image1 : System.Web.UI.Page
    {
        BAL_registo registo = new BAL_registo();

        List<PROP_registo> lista_registo = new List<PROP_registo>();
        //public string Clients;
        protected void Page_Load(object sender, EventArgs e)
        {

         
            //fbdiv.Attributes["data-href"] = HttpContext.Current.Request.Url.AbsoluteUri; Request.QueryString["ID"];
            string ID =Page.RouteData.Values["ID"].ToString();
            //Clients = Request.Url.AbsoluteUri;
  
            //Request.QueryString["ID"] = ID;
            string ipAddress = HttpContext.Current.Request.UserHostAddress;
            //if (string.IsNullOrEmpty(ipAddress))
            //{
            //    ipAddress = Request.ServerVariables["REMOTE_ADDR"];
            //    //Session["newsession"] = ipAddress;
            //}

            //string ID = lblId.Text;
            if (ID != "")
            {
                if (Session["newsession"].ToString() != ipAddress || Session["ID"].ToString() != ID)
                {
                    registo.adicionar_visita(Convert.ToInt32(ID));
                    Session["ID"] = ID;
                }
                //Page.RouteData.Values["ID"] = ID;
                //Response.Redirect("~/image.aspx?ID=" + ID);
            }


            lista_registo = registo.get_registo_by_id(ID);
            lb_aircraft.Text = lista_registo[0].aircraft;
            img1.ImageUrl = "data:image/Jpeg;base64," + Convert.ToBase64String(lista_registo[0].img);
            lb_airline.Text = lista_registo[0].airline;
            lb_airport.Text = lista_registo[0].airport;
            lb_data.Text = lista_registo[0].datar;
            lb_msn.Text = lista_registo[0].msn;
            lb_reg.Text = lista_registo[0].reg;
            lb_remark.Text = lista_registo[0].remark;
            lb_visitas.Text = lista_registo[0].visitas;
            //string airline_url = lista_registo[0].aircraft_url;
            //string airport_url = lista_registo[0].airport_url;
            //string datar_url = lista_registo[0].datar;
            //string msn_url = lista_registo[0].msn_url;
            //string reg_url = lista_registo[0].reg_url;
            //string aircraft_url = lista_registo[0].aircraft_url;

            //HyperLink1.NavigateUrl = String.Format("~/image/{0}/{1}/{2}/{3}", ID, airport_url, airline_url, aircraft_url);
            //HyperLink_aircraft.NavigateUrl = String.Format("~/list/{0}/{1}", "aircraft", aircraft_url);
            //HyperLink_airport.NavigateUrl = String.Format("~/list/{0}/{1}", "airport", airport_url);
            //HyperLink_airline.NavigateUrl = String.Format("~/list/{0}/{1}", "airline", airline_url);
            //HyperLink_datar.NavigateUrl = String.Format("~/list/{0}/{1}", "datar", lb_data.Text);
            //HyperLink_reg.NavigateUrl = String.Format("~/list/{0}/{1}", "reg", reg_url);
            //HyperLink_msn.NavigateUrl = String.Format("~/list/{0}/{1}", "msn", msn_url);

            string page = Request.Url.Segments[Request.Url.Segments.Length - 1];
            string keyword = lb_aircraft.Text + "" + lb_airport.Text + "" + lb_airline.Text + "" + lb_msn.Text + "" + lb_reg.Text;
            //
            //DataTable dtMeta = this.GetData(page);


            //Add Page Title 
            this.Page.Title = lb_aircraft.Text;

            //Add Keywords Meta Tag
            HtmlMeta keywords = new HtmlMeta();
            keywords.HttpEquiv = "keywords";
            keywords.Name = "keywords";
            keywords.Content = keyword;
            this.Page.Header.Controls.Add(keywords);

            ////Add Description Meta Tag
            HtmlMeta description = new HtmlMeta();
            description.HttpEquiv = "description";
            description.Name = "description";
            description.Content = keyword;
            this.Page.Header.Controls.Add(description);

            //"data:image/png;base64," + Convert.ToBase64String(lista_registo[0].img)
            HtmlMeta tag = new HtmlMeta();
            tag.Attributes.Add("property", "og:image");
            tag.Content = "http://www.aviationphotography.pt//fotos/"+ ID+".Jpeg";
            Page.Header.Controls.Add(tag);

            


        }

        //public static Image ConvertByteArrayToImage(byte[] byteArrayIn)
        //{
        //    //var ms = new MemoryStream(byteArrayIn);
        //    //Image returnImage = Image.FromStream(ms);

        //    //return returnImage;
        //    Image ab = new Image();
        //    MemoryStream stream = new MemoryStream(byteArrayIn);
        //    var newImage = System.Drawing.Image.FromStream(stream);
        //    stream.Dispose();
        //    ab.i Image.FromStream(ms);
        //    return newImage;
        //}
        protected void LinkButton_aircraft_click(object sender, EventArgs e)
        {
            //LinkButton btn = (LinkButton)sender;
            //DataListItem item = (DataListItem)btn.NamingContainer;
            //Label lb_aircraft = (Label)item.FindControl("lb_aircraft");
            Response.Redirect("~/list.aspx?field=aircraft&valor=" + lb_aircraft.Text);
        }

        protected void LinkButton_airline_click(object sender, EventArgs e)
        {
            //LinkButton btn = (LinkButton)sender;
            //DataListItem item = (DataListItem)btn.NamingContainer;
            //Label lb_airline = (Label)item.FindControl("lb_airline");
            Response.Redirect("~/list.aspx?field=airline&valor=" + lb_airline.Text);

        }

        protected void LinkButton_reg_click(object sender, EventArgs e)
        {
            //LinkButton btn = (LinkButton)sender;
            //DataListItem item = (DataListItem)btn.NamingContainer;
            //Label lb_reg = (Label)item.FindControl("lb_reg");
            Response.Redirect("~/list.aspx?field=reg&valor=" + lb_reg.Text);

        }

        protected void LinkButton_msn_click(object sender, EventArgs e)
        {
            //LinkButton btn = (LinkButton)sender;
            //DataListItem item = (DataListItem)btn.NamingContainer;
            //Label lb_msn = (Label)item.FindControl("lb_msn");
            Response.Redirect("~/list.aspx?field=msn&valor=" + lb_msn.Text);

        }

        protected void LinkButton_airport_click(object sender, EventArgs e)
        {
            //LinkButton btn = (LinkButton)sender;
            //DataListItem item = (DataListItem)btn.NamingContainer;
            //Label lb_airport = (Label)item.FindControl("lb_airport");
            Response.Redirect("~/list.aspx?field=airport&valor=" + lb_airport.Text);

        }

        protected void LinkButton_datar_click(object sender, EventArgs e)
        {
            //LinkButton btn = (LinkButton)sender;
            //DataListItem item = (DataListItem)btn.NamingContainer;
            //Label lb_data = (Label)item.FindControl("lb_data");

            Response.Redirect("~/list.aspx?field=datar&valor=" + lb_data.Text);
        }
    }
}