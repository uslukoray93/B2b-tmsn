using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace GedizMakina.Mt
{
    public partial class iade_listesi : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void gvIadeTalepleri_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "btnOnay")
            {
                cn.InsUpdDel("Update IadeTalepleri SET DurumId = 1000000024 Where TalepId = " + gvIadeTalepleri.GetRowValues(e.VisibleIndex, "TalepId") + "");

                cn.InsUpdDel("Insert Into CariBakiye (SiparisId, CariId, BorcTutar, HareketTurId) Values (" + gvIadeTalepleri.GetRowValues(e.VisibleIndex, "SiparisId") + ", " + gvIadeTalepleri.GetRowValues(e.VisibleIndex, "CariId") + ", '" + gvIadeTalepleri.GetRowValues(e.VisibleIndex, "IadeTutari").ToString().Replace(",", ".") + "', 1000000026)");

                gvIadeTalepleri.DataBind();
            }
            if (e.ButtonID == "btnRet")
            {
                cn.InsUpdDel("Update IadeTalepleri SET DurumId = 1000000025 Where TalepId = " + gvIadeTalepleri.GetRowValues(e.VisibleIndex, "TalepId") + "");

                gvIadeTalepleri.DataBind();
            }
            if (e.ButtonID == "btnResim1")
            {
                Response.Redirect(gvIadeTalepleri.GetRowValues(e.VisibleIndex, "IadeResim1").ToString());
            }
            if (e.ButtonID == "btnResim2")
            {
                Response.Redirect(gvIadeTalepleri.GetRowValues(e.VisibleIndex, "IadeResim2").ToString());
            }
            if (e.ButtonID == "btnVideo")
            {
                Response.Redirect(gvIadeTalepleri.GetRowValues(e.VisibleIndex, "IadeVideo").ToString());
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton LinkButton1 = sender as LinkButton;

            var container = LinkButton1.NamingContainer as GridViewDataItemTemplateContainer;
            int id = Convert.ToInt32(gvIadeTalepleri.GetRowValues(container.VisibleIndex, gvIadeTalepleri.KeyFieldName));

            DataRow dr = cn.DataRowGetir("Select * From IadeTalepleri Where TalepId = " + id + "");

            Session["sSiparisId"] = dr["SiparisId"].ToString();

            Response.Redirect("/mt/siparis/?sid=" + Session["sSiparisId"].ToString());
        }
    }
}