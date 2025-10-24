using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace GedizMakina.Admin
{
    public partial class urun_listesi : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void gvUrunListesi_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "btnGit")
            {
                Session["sUrunId"] = gvUrunListesi.GetRowValues(e.VisibleIndex, "UrunId");
                Response.Redirect("/admin/urun-duzenle");
            }
        }
    }
}