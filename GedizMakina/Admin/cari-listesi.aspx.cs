using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GedizMakina.Admin
{
    public partial class cari_listesi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvCariListesi_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "btnGit")
            {
                Session["sCariId"] = gvCariListesi.GetRowValues(e.VisibleIndex, "CariId");
                Response.Redirect("/admin/cari-detay");
            }
        }
    }
}