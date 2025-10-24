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
    public partial class havale_bildirim : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void gvHavaleBildirimleri_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "btnDosya")
            {
                Response.Redirect(gvHavaleBildirimleri.GetRowValues(e.VisibleIndex, "DosyaYolu").ToString());
            }
            if (e.ButtonID == "btnOdemeOk")
            {
                cn.InsUpdDel("Update HavaleBildirim SET Onay = 'True' Where BildirimId = " + gvHavaleBildirimleri.GetRowValues(e.VisibleIndex, "BildirimId") + "");

                cn.InsUpdDel("Insert Into GelenOdemeler (CariId, Tutar, OdemeSekliId, Tarih, KartNo, IsimSoyisim, Taksit, Sonuc, ProvizyonNo, PosAdi, BankaId, SiparisId, OdemeDurumu) Select CariId, Tutar, 1000000020, Tarih, NULL, NULL, NULL, NULL, NULL, NULL, BankaId, SiparisNo, 'True' From HavaleBildirim Where SiparisNo = " + gvHavaleBildirimleri.GetRowValues(e.VisibleIndex, "SiparisNo") + "");

                cn.InsUpdDel("Insert Into CariBakiye (SiparisId, CariId, BorcTutar, HareketTurId) Values (" + gvHavaleBildirimleri.GetRowValues(e.VisibleIndex, "SiparisId") + ", " + gvHavaleBildirimleri.GetRowValues(e.VisibleIndex, "CariId") + ", '" + gvHavaleBildirimleri.GetRowValues(e.VisibleIndex, "Tutar").ToString().Replace(",", ".") + "', 1000000019)");

                cn.InsUpdDel("Update Cariler SET KalanLimit = dbo.fnc_KalanLimit(" + gvHavaleBildirimleri.GetRowValues(e.VisibleIndex, "CariId") + ") Where CariId = " + gvHavaleBildirimleri.GetRowValues(e.VisibleIndex, "CariId") + "");

                cn.InsUpdDel("Insert Into GelenOdemeler (SiparisId, CariId, Tutar, OdemeSekliId, SiparisId) Values (" + gvHavaleBildirimleri.GetRowValues(e.VisibleIndex, "SiparisId") + ", " + Session["sCariId"].ToString() + ", '" + gvHavaleBildirimleri.GetRowValues(e.VisibleIndex, "Tutar").ToString().Replace(",", ".") + "', 1000000020, " + gvHavaleBildirimleri.GetRowValues(e.VisibleIndex, "SiparisNo") + ")");

                gvHavaleBildirimleri.DataBind();
            }
        }
    }
}