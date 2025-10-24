using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace GedizMakina.user
{
    public partial class bekleyen_siparisler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton LinkButton1 = sender as LinkButton;
            
            var container = LinkButton1.NamingContainer as GridViewDataItemTemplateContainer;
            int id = Convert.ToInt32(gvSiparisler.GetRowValues(container.VisibleIndex, gvSiparisler.KeyFieldName));
            Session["sSiparisId"] = id;

            Response.Redirect("/siparis/?sid=" + Session["sSiparisId"].ToString());
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            LinkButton LinkButton2 = sender as LinkButton;

            var container = LinkButton2.NamingContainer as GridViewDataItemTemplateContainer;
            int id = Convert.ToInt32(gvSiparisler.GetRowValues(container.VisibleIndex, gvSiparisler.KeyFieldName));
            Session["sSiparisId"] = id;

            Response.Redirect("/siparis/?sid=" + Session["sSiparisId"].ToString());
        }
    }
}