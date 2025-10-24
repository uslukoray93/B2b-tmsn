using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace GedizMakina.user
{
    public partial class gecmis_siparisler : System.Web.UI.Page
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

        protected void gvSiparisler_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "btnKargo")
            {
                Response.Redirect(gvSiparisler.GetRowValues(e.VisibleIndex, "Kargo").ToString());

            }
        }

        protected void gvSiparisler_CustomButtonInitialize(object sender, ASPxGridViewCustomButtonEventArgs e)
        {
            if (e.CellType == DevExpress.Web.GridViewTableCommandCellType.Data)
            {
                ASPxGridView gvSiparisler = sender as ASPxGridView;
                //bool OnKayitKesin = Convert.ToBoolean(gvKursiyerler.GetRowValues(e.VisibleIndex, new string[] { "KesinKayitYok" }));
                //bool KesinKayitKesin = Convert.ToBoolean(gvKursiyerler.GetRowValues(e.VisibleIndex, new string[] { "KesinKayitVar" }));
                string Kargo = Convert.ToString(gvSiparisler.GetRowValues(e.VisibleIndex, new string[] { "Kargo" }));

                if (e.ButtonID == "btnKargo")
                {
                    if (Kargo.Length > 0)
                    {
                        e.Visible = DevExpress.Utils.DefaultBoolean.True;
                    }
                    else
                    {
                        e.Visible = DevExpress.Utils.DefaultBoolean.False;
                    }
                }
            }
        }
    }
}