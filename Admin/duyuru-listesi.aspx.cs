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
    public partial class duyuru_listesi : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void gvDuyurular_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "btnDetay")
            {
                Session["sDuyuruId"] = gvDuyurular.GetRowValues(e.VisibleIndex, "DuyuruId");
                Response.Redirect("/admin/duyuru-detay");
            }
            if (e.ButtonID == "btnSil")
            {
                cn.InsUpdDel("Delete From Duyurular Where DuyuruId = " + gvDuyurular.GetRowValues(e.VisibleIndex, "DuyuruId") + "");
                gvDuyurular.DataBind();
            }
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("/admin/duyuru-ekle");
        }
    }
}