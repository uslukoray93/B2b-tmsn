using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GedizMakina.Admin
{
    public partial class mt_listesi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnYeniEkle_Click(object sender, EventArgs e)
        {
            Response.Redirect("/admin/mt-ekle");
        }

        protected void gvMtListesi_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "btnGit")
            {
                Session["sMtId"] = gvMtListesi.GetRowValues(e.VisibleIndex, "CariId");
                Response.Redirect("/admin/mt-duzenle");
            }
            if (e.ButtonID == "btnSil")
            {

            }
        }
    }
}