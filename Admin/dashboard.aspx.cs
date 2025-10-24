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
    public partial class dashboard : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlDataAdapter da = new SqlDataAdapter("Select (Select COUNT(*) From Siparisler) SiparisSayisi, ISNULL((Select SUM(GenelTutar) / COUNT(*) From Siparisler), 0)OrtalamaTutar, ISNULL((Select COUNT(*) From Cariler),0) ToplamCari, ISNULL((Select COUNT(*) From Urunler),0) ToplamUrun,  ISNULL((Select ABS(SUM(BorcTutar)) From CariBakiye Where SiparisId IS NOT NULL),0) CariBakiye, ISNULL((Select SUM(GenelTutar) From Siparisler Where Month(SiparisTarihi) = month(getdate()) And YEAR(SiparisTarihi) = year(getdate())),0) BuAykiHasilat, ISNULL((Select SUM(GenelTutar) From Siparisler Where Month(SiparisTarihi) = month(getdate()) - 1 And YEAR(SiparisTarihi) = year(getdate())),0) GecenAykiHasilat, ISNULL((Select SUM(GenelTutar) From Siparisler Where YEAR(SiparisTarihi) = year(getdate())),0) BuYılkiHasilat", cn._Baglan());
                DataTable dt = new DataTable();
                da.Fill(dt);

                lblToplamSiparis.InnerText = dt.Rows[0]["SiparisSayisi"].ToString();
                lblSiparisBasiOrtalama.InnerText = Convert.ToDecimal(dt.Rows[0]["OrtalamaTutar"].ToString()).ToString("N2") + " ₺";
                lblToplamCari.InnerText = dt.Rows[0]["ToplamCari"].ToString();
                lblToplamCari2.InnerText = dt.Rows[0]["ToplamCari"].ToString();
                lblUrunSayisi.InnerText = Convert.ToDecimal(dt.Rows[0]["ToplamUrun"].ToString()).ToString("N0");
                lblCariBakiye.InnerText = Convert.ToDecimal(dt.Rows[0]["CariBakiye"].ToString()).ToString("N2") + " ₺";
                lblBuAy.InnerText = Convert.ToDecimal(dt.Rows[0]["BuAykiHasilat"].ToString()).ToString("N2") + " ₺";
                lblGecenAy.InnerText = Convert.ToDecimal(dt.Rows[0]["GecenAykiHasilat"].ToString()).ToString("N2") + " ₺";
                lblBuYil.InnerText = Convert.ToDecimal(dt.Rows[0]["BuYılkiHasilat"].ToString()).ToString("N2") + " ₺";
            }
        }

        protected void repSiparisler_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "SiparisNo")
            {
                Response.Redirect("/admin/siparis/?sid=" + e.CommandArgument.ToString());
            }
            if (e.CommandName == "CariAdi")
            {
                Response.Redirect("/admin/siparis/?sid=" + e.CommandArgument.ToString());
            }
        }

        protected void repEnCokSatilan5_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Session["sUrunId"] = e.CommandArgument.ToString();
            Response.Redirect("/admin/urun-duzenle");
        }
    }
}