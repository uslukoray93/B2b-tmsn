using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace GedizMakina.Admin
{
    public partial class tum_siparisler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DateTime _YilinIlkGunu = new DateTime(DateTime.Now.Year, 1, 1);
                dtSiparisBaslangic.Date = Convert.ToDateTime(_YilinIlkGunu.ToString());
                dtSiparisBitis.Date = Convert.ToDateTime(DateTime.Now.ToShortDateString());
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton LinkButton1 = sender as LinkButton;

            var container = LinkButton1.NamingContainer as GridViewDataItemTemplateContainer;
            int id = Convert.ToInt32(gvSiparisler.GetRowValues(container.VisibleIndex, gvSiparisler.KeyFieldName));
            Session["sSiparisId"] = id;

            Response.Redirect("/admin/siparis/?sid=" + Session["sSiparisId"].ToString());
        }

        protected void btnSiparisGetir_Click(object sender, EventArgs e)
        {
            gvSiparisler.DataBind();
        }
    }
}