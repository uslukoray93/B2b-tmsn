using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GedizMakina.user
{
    public partial class ciro_performansi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblBuYil.InnerText = DateTime.Now.Year + " Ciro Bilgisi";
                lblGecenYil.InnerText = DateTime.Now.Year - 1 + " Ciro Bilgisi";
            }
        }
    }
}