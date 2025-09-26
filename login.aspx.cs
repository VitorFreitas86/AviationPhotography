using sweptwings.BAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sweptwings
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        BAL_registo registo = new BAL_registo();

        protected void ValidateUser(object sender, AuthenticateEventArgs e)
        {
            int control = registo.validar_user(Login1.UserName, Login1.Password);
            if (control == 0)
            {
                Login1.FailureText = "Nome de utilizador e/ou palavra-chave incorrectos.";
            }
            else
            {
                Response.Redirect("~\\administracao.aspx");
            }
        }
    }
}