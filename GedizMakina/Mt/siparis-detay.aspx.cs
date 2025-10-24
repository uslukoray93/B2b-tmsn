using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using DevExpress.Web;

namespace GedizMakina.Mt
{
    public partial class siparis_detay : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SiparisGetir();
            }
        }

        void SiparisGetir()
        {
            SqlCommand cm = new SqlCommand("spAdminSiparisDetayBilgi", cn._Baglan());
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@SiparisId", Request.QueryString["sid"].ToString());

            SqlDataAdapter da = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            da.Fill(dt);

            Session["sCariId"] = dt.Rows[0]["CariId"].ToString();
            lblSiparisNo.InnerText = dt.Rows[0]["SiparisNo"].ToString() + " No'lu sipariş bilgileri";
            Page.Title = dt.Rows[0]["SiparisNo"].ToString() + " No'lu sipariş bilgileri";
            ddDurumlar.DataBind();
            ddDurumlar.SelectedValue = dt.Rows[0]["DurumId"].ToString();
            lblSiparisTarihi.InnerText = dt.Rows[0]["SiparisTarihi"].ToString();
            lblSiparisVerenCari.InnerText = dt.Rows[0]["CariAdi"].ToString();

            ddOdemeTuru.DataBind();
            ddOdemeTuru.SelectedValue = dt.Rows[0]["OdemeTurId"].ToString();

            ddSevkiyatTuru.DataBind();
            ddSevkiyatTuru.SelectedValue = dt.Rows[0]["TeslimatTurId"].ToString();

            if (ddDurumlar.SelectedValue == "1000000008" && ddSevkiyatTuru.SelectedValue == "1000000000")
            {
                divKargo.Visible = true;
            }
            else
            {
                divKargo.Visible = false;
            }

            SepetToplamAlt();
        }

        protected void btnKapat_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("/admin/tum-siparisler");
        }

        protected void btnGuncelle_ServerClick(object sender, EventArgs e)
        {
            cn.InsUpdDel("Delete From SiparisDetay Where SiparisId = " + Request.QueryString["sid"].ToString() + "");

            SqlCommand cm = new SqlCommand("spSepetGetirAktarimAdmin", cn._Baglan());
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@CariId", Session["sCariId"].ToString());
            cm.Parameters.AddWithValue("@OdemeSekli", ddOdemeTuru.SelectedValue);
            cm.Parameters.AddWithValue("@SiparisId", Request.QueryString["sid"].ToString());

            SqlDataAdapter da = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            da.Fill(dt);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                SqlCommand cm2 = new SqlCommand("Insert Into SiparisDetay (SiparisId, CariId, UrunId, Miktar, BirimFiyat, Toplam, KDV, ToplamFiyat) Values " +
                    "(" +
                    "" + Request.QueryString["sid"].ToString() + ", " +
                    "" + Session["sCariId"].ToString() + ", " +
                    "" + dt.Rows[i]["UrunId"].ToString() + ", " +
                    "'" + dt.Rows[i]["Miktar"].ToString() + "', " +
                    "'" + dt.Rows[i]["BirimFiyat"].ToString().Replace(",", ".") + "', " +
                    "'" + dt.Rows[i]["UrunFiyatKDVsiz"].ToString().Replace(",", ".") + "', " +
                    "'" + dt.Rows[i]["KDVTutar"].ToString().Replace(",", ".") + "', " +
                    "'" + dt.Rows[i]["UrunFiyatKDVli"].ToString().Replace(",", ".") + "')", cn._Baglan());

                cm2.ExecuteNonQuery();
            }

            DataRow drSiparisGetir = cn.DataRowGetir("Select SUM(Toplam)Toplam, SUM(Kdv)KDV, SUM(ToplamFiyat)ToplamFiyat From SiparisDetay Where SiparisId = " + Request.QueryString["sid"].ToString() + "");

            SqlCommand cmSiparisGuncelle = new SqlCommand("Update Siparisler SET Tutar = '" + drSiparisGetir["Toplam"].ToString().Replace(",", ".") + "', Kdv = '" + drSiparisGetir["KDV"].ToString().Replace(",", ".") + "', GenelTutar = '" + drSiparisGetir["ToplamFiyat"].ToString().Replace(",", ".") + "', TeslimatTurId = " + ddSevkiyatTuru.SelectedValue + ", OdemeTurId = " + ddOdemeTuru.SelectedValue + ", DurumId = " + ddDurumlar.SelectedValue + ", Kargo = '" + txtKargoBilgisi.Text + "' Where SiparisId = " + Request.QueryString["sid"].ToString() + "", cn._Baglan());

            if (cmSiparisGuncelle.ExecuteNonQuery() != 0)
            {
                Response.Redirect("/mt/tum-siparisler");
            }
        }

        void SepetToplamAlt()
        {
            SqlCommand cm = new SqlCommand("spSepetGetirAltAdmin", cn._Baglan());
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@CariId", Session["sCariId"].ToString());
            cm.Parameters.AddWithValue("@OdemeSekli", ddOdemeTuru.SelectedValue);
            cm.Parameters.AddWithValue("@SiparisId", Request.QueryString["sid"].ToString());

            SqlDataAdapter da = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            da.Fill(dt);

            lblToplam.InnerText = "₺ " + Convert.ToDecimal(dt.Rows[0]["NetTutar"].ToString()).ToString("N2", CultureInfo.GetCultureInfo("tr"));
            lblKdvTutari.InnerText = "₺ " + Convert.ToDecimal(dt.Rows[0]["KdvTutar"].ToString()).ToString("N2", CultureInfo.GetCultureInfo("tr"));
            lblGenelToplam.InnerText = "₺ " + Convert.ToDecimal(dt.Rows[0]["GenelToplam"].ToString()).ToString("N2", CultureInfo.GetCultureInfo("tr"));
            Session["sOdenecekTutar"] = Convert.ToDecimal(dt.Rows[0]["GenelToplam"].ToString()).ToString("N2", CultureInfo.GetCultureInfo("tr"));

            //DataRow dr = cn.DataRowGetir("Select LimitAc, Limit From Cariler Where CariId = " + Session["sCariId"].ToString() + "");
            //lblKrediLimiti.InnerText = "₺ " + Convert.ToDecimal(dr["Limit"].ToString()).ToString("N2", CultureInfo.GetCultureInfo("tr"));


        }

        protected void ddOdemeTuru_SelectedIndexChanged(object sender, EventArgs e)
        {
            SepetToplamAlt();
        }

        protected void ASPxSpinEdit1_Init(object sender, EventArgs e)
        {
            ASPxSpinEdit spinEdit = (ASPxSpinEdit)sender;
            GridViewDataItemTemplateContainer container = (GridViewDataItemTemplateContainer)spinEdit.NamingContainer;
            spinEdit.ClientSideEvents.NumberChanged = string.Format("function(s, e) {{ OnNumberChanged(s, e, {0}); }}", container.VisibleIndex);
            gvSepet.DataBind();
            SepetToplamAlt();
        }

        protected void ASPxCallbackPanel1_Callback(object sender, CallbackEventArgsBase e)
        {
            var rowID = e.Parameter;
            Session["sRowId"] = rowID;
            string[] callbackParam = e.Parameter.Split('|');
            string RowId = callbackParam[0];
            string spinEditValue = callbackParam[1];

            Session["sSatirId"] = gvSepet.GetRowValues(Convert.ToInt32(RowId.ToString()), "SepetId");

            SqlCommand cm = new SqlCommand("Update Sepet2 Set Miktar = " + spinEditValue + " Where SepetId = '" + Session["sSatirId"].ToString() + "'", cn._Baglan());
            cm.ExecuteNonQuery();
            gvSepet.DataBind();
            SepetToplamAlt();
        }

        protected void gvSepet_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "btnSil")
            {
                cn.InsUpdDel("Delete From Sepet2 Where SepetId = " + gvSepet.GetRowValues(e.VisibleIndex, "SepetId") + "");
                gvSepet.DataBind();
                SepetToplamAlt();
            }
        }

        protected void chkSecili_CheckedChanged(object sender, EventArgs e)
        {
            ASPxCheckBox chkSecili = (ASPxCheckBox)sender;
            GridViewDataItemTemplateContainer container = (GridViewDataItemTemplateContainer)chkSecili.NamingContainer;

            int ID = Convert.ToInt32(gvSepet.GetRowValues(container.VisibleIndex, gvSepet.KeyFieldName));
            //Session["id"] = ID;

            if (chkSecili.Checked == true)
            {
                cn.InsUpdDel("Update Sepet2 SET Secili = 'True' Where SepetId = " + ID.ToString() + "");
                gvSepet.DataBind();

                SepetToplamAlt();
            }
            if (chkSecili.Checked == false)
            {
                cn.InsUpdDel("Update Sepet2 SET Secili = 'False' Where SepetId = " + ID.ToString() + "");
                gvSepet.DataBind();

                SepetToplamAlt();
            }
        }

        protected void btnNotEkle_Click(object sender, EventArgs e)
        {
            cn.InsUpdDel("Insert Into SiparisNotlari (SiparisId, CariId, NotAciklama) Values (" + Request.QueryString["sid"].ToString() + ", 1000000584, '" + txtNotAciklama.InnerText + "')");

            txtNotAciklama.InnerText = "";
            repSiparisNotlari.DataBind();
        }

        protected void ddDurumlar_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddDurumlar.SelectedValue == "1000000008" && ddSevkiyatTuru.SelectedValue == "1000000000")
            {
                divKargo.Visible = true;
            }
            else
            {
                divKargo.Visible = false;
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton LinkButton1 = sender as LinkButton;

            var container = LinkButton1.NamingContainer as GridViewDataItemTemplateContainer;
            int id = Convert.ToInt32(gvSepet.GetRowValues(container.VisibleIndex, "UrunId"));
            Session["sUrunId"] = id;

            Response.Redirect("/mt/urun-duzenle");
        }
    }
}