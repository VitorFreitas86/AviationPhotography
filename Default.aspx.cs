using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using sweptwings.BAL;
using System.Data;
using System.ComponentModel;
using System.Web.UI.HtmlControls;

namespace sweptwings
{
    public partial class Default1 : System.Web.UI.Page
    {
        #region Private Properties
        private int CurrentPage
        {
            get
            {
                object objPage = ViewState["_CurrentPage"];
                int _CurrentPage = 0;
                if (objPage == null)
                {
                    _CurrentPage = 0;
                }
                else
                {
                    _CurrentPage = (int)objPage;
                }
                return _CurrentPage;
            }
            set { ViewState["_CurrentPage"] = value; }
        }
        private int fistIndex
        {
            get
            {

                int _FirstIndex = 0;
                if (ViewState["_FirstIndex"] == null)
                {
                    _FirstIndex = 0;
                }
                else
                {
                    _FirstIndex = Convert.ToInt32(ViewState["_FirstIndex"]);
                }
                return _FirstIndex;
            }
            set { ViewState["_FirstIndex"] = value; }
        }
        private int lastIndex
        {
            get
            {

                int _LastIndex = 0;
                if (ViewState["_LastIndex"] == null)
                {
                    _LastIndex = 0;
                }
                else
                {
                    _LastIndex = Convert.ToInt32(ViewState["_LastIndex"]);
                }
                return _LastIndex;
            }
            set { ViewState["_LastIndex"] = value; }
        }
        #endregion

        BAL_registo registo = new BAL_registo();

        PagedDataSource _PageDataSource = new PagedDataSource();
   
        public DataTable ConvertToDataTable<T>(IList<T> data)
        {
            PropertyDescriptorCollection properties =
               TypeDescriptor.GetProperties(typeof(T));
            DataTable table = new DataTable();
            foreach (PropertyDescriptor prop in properties)
                table.Columns.Add(prop.Name, Nullable.GetUnderlyingType(prop.PropertyType) ?? prop.PropertyType);
            foreach (T item in data)
            {
                DataRow row = table.NewRow();
                foreach (PropertyDescriptor prop in properties)
                    row[prop.Name] = prop.GetValue(item) ?? DBNull.Value;
                table.Rows.Add(row);
            }
            return table;

        }

        private DataTable GetDataTable()
        {
            DataTable dtItems = new DataTable();
            dtItems= ConvertToDataTable(registo.get_all_registo());
            return dtItems;

        }

        private void BindItemsList()
        {

            DataTable dataTable = this.GetDataTable();
            _PageDataSource.DataSource = dataTable.DefaultView;
            _PageDataSource.AllowPaging = true;
            _PageDataSource.PageSize = 25;
            _PageDataSource.CurrentPageIndex = CurrentPage;
            ViewState["TotalPages"] = _PageDataSource.PageCount;

            this.lbtnPrevious.Enabled = !_PageDataSource.IsFirstPage;
            this.lbtnNext.Enabled = !_PageDataSource.IsLastPage;
            this.lbtnFirst.Enabled = !_PageDataSource.IsFirstPage;
            this.lbtnLast.Enabled = !_PageDataSource.IsLastPage;

            this.DataList1.DataSource = _PageDataSource;
            this.DataList1.DataBind();
            this.doPaging();

            this.lblfotoInfo.Text = DataList1.Items.Count + " Photos of " + registo.get_all_registo().Count;
            this.lblPageInfo.Text = "Page " + (CurrentPage + 1) + " of " + _PageDataSource.PageCount;
        }

        private void doPaging()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("PageIndex");
            dt.Columns.Add("PageText");
            fistIndex = CurrentPage - 5;
            if (CurrentPage > 5)
            {
                lastIndex = CurrentPage + 5;
            }
            else
            {
                lastIndex = 10;
            }
            if (lastIndex > Convert.ToInt32(ViewState["TotalPages"]))
            {
                lastIndex = Convert.ToInt32(ViewState["TotalPages"]);
                fistIndex = lastIndex - 10;
            }
            if (fistIndex < 0)
            {
                fistIndex = 0;
            }
            for (int i = fistIndex; i < lastIndex; i++)
            {
                DataRow dr = dt.NewRow();
                dr[0] = i;
                dr[1] = i + 1;
                dt.Rows.Add(dr);
            }

            this.dlPaging.DataSource = dt;
            this.dlPaging.DataBind();
        }

        protected void lbtnNext_Click(object sender, EventArgs e)
        {
            CurrentPage += 1;
            this.BindItemsList();
        }

        protected void lbtnPrevious_Click(object sender, EventArgs e)
        {
            CurrentPage -= 1;
            this.BindItemsList();

        }

        protected void dlPaging_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName.Equals("Paging"))
            {
                CurrentPage = Convert.ToInt16(e.CommandArgument.ToString());
                this.BindItemsList();
            }
        }

        protected void dlPaging_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            LinkButton lnkbtnPage = (LinkButton)e.Item.FindControl("lnkbtnPaging");
            if (lnkbtnPage.CommandArgument.ToString() == CurrentPage.ToString())
            {
                lnkbtnPage.Enabled = false;
                lnkbtnPage.Style.Add("fone-size", "14px");
                lnkbtnPage.Font.Bold = true;

            }
        }

        protected void lbtnLast_Click(object sender, EventArgs e)
        {

            CurrentPage = (Convert.ToInt32(ViewState["TotalPages"]) - 1);
            this.BindItemsList();

        }

        protected void lbtnFirst_Click(object sender, EventArgs e)
        {

            CurrentPage = 0;
            this.BindItemsList();


        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //this.Page.Title = "João Toste Aviation Photography";

            //Add Keywords Meta Tag
            HtmlMeta keywords = new HtmlMeta();
            keywords.HttpEquiv = "keywords";
            keywords.Name = "keywords";
            keywords.Content = "João Toste Aviation Photography Lajes Airfield Aircraft Terceira joao joão Toste";
            this.Page.Header.Controls.Add(keywords);

            ////Add Description Meta Tag
            HtmlMeta description = new HtmlMeta();
            description.HttpEquiv = "description";
            description.Name = "description";
            description.Content = "João Toste Aviation Photography Lajes Airfield Aircraft Terceira joao joão Toste";
            this.Page.Header.Controls.Add(description);
            if (!this.Page.IsPostBack)
            {
                //Session["ID"] = "0";
                this.BindItemsList();
            }
        }

        //protected void LnkAnswer_Click(object sender, EventArgs e)
        //{
        //    LinkButton btn = (LinkButton)sender;
        //    DataListItem item = (DataListItem)btn.NamingContainer;
        //    Label lblId = (Label)item.FindControl("lb_idregisto");
        //    /* Request.ServerVariables["HTTP_X_FORWARDED_FOR"];*/
        //    string ipAddress = HttpContext.Current.Request.UserHostAddress;
        //    //if (string.IsNullOrEmpty(ipAddress))
        //    //{
        //    //    ipAddress = Request.ServerVariables["REMOTE_ADDR"];
        //    //    //Session["newsession"] = ipAddress;
        //    //}

        //    string ID = lblId.Text;
        //    if (ID != "")
        //    {
        //        if (Session["newsession"].ToString() != ipAddress || Session["ID"].ToString() != ID)
        //        {
        //            registo.adicionar_visita(Convert.ToInt32(ID));
        //            Session["ID"] = ID;
        //        }
        //        //Page.RouteData.Values["ID"] = ID;
        //        //Response.Redirect("~/image.aspx?ID=" + ID);
        //    }

        //}

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