using sweptwings.BAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sweptwings
{
    public partial class utilizadores : System.Web.UI.Page
    {
        BAL_registo registo = new BAL_registo();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                GridView_user.DataSource = registo.get_utilizador();
                GridView_user.DataBind();
            }
        }
        protected void LoginButton_Click(object sender, EventArgs e)
        {
            registo.create_utilizador(UserName.Text, Password.Text);
        }

        protected void GridView_user_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == System.Web.UI.WebControls.DataControlRowType.DataRow)
            {
                // when mouse is over the row, save original color to new attribute, and change it to highlight color
                e.Row.Attributes.Add("onmouseover", "this.originalstyle=this.style.backgroundColor;this.style.backgroundColor='#66CCFF'");
                // when mouse leaves the row, change the bg color to its original value   
                e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor=this.originalstyle;");
            }
        }

        protected void GridView_user_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.ToString() == "apagar")
            {
           
                GridViewRow linha = (GridViewRow)((Control)e.CommandSource).NamingContainer;
                int DemoId = Convert.ToInt32(linha.RowIndex.ToString());
                int ID = Convert.ToInt32(GridView_user.DataKeys[linha.RowIndex].Value.ToString());
                registo.delete_utilizador(ID);
                GridView_user.DataSource = registo.get_all_registo();
                GridView_user.DataBind();
            }
        }

        protected void GridView_user_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string nome = (GridView_user.Rows[e.RowIndex].FindControl("tb_nome") as TextBox).Text;
            string pass = (GridView_user.Rows[e.RowIndex].FindControl("tb_pass") as TextBox).Text;
            int ID = Convert.ToInt32(GridView_user.DataKeys[e.RowIndex].Value);
            registo.update_utilizador(ID, nome, pass);
            GridView_user.EditIndex = -1;
            GridView_user.DataSource = registo.get_utilizador();
            GridView_user.DataBind();
        }

        protected void GridView_user_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView_user.EditIndex = e.NewEditIndex;
            GridView_user.DataSource = registo.get_utilizador();
            GridView_user.DataBind();
        }

        protected void GridView_user_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView_user.EditIndex = -1;
            GridView_user.DataSource = registo.get_utilizador();
            GridView_user.DataBind();
        }
    }
}