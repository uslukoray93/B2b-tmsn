using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

namespace GedizMakina.user
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

            lblSiparisNo.InnerText = dt.Rows[0]["SiparisNo"].ToString() + " No'lu sipariş bilgileri";
            lblSiparisDurum.InnerText = dt.Rows[0]["DurumAdi"].ToString();
            lblSiparisTarihi.InnerText = dt.Rows[0]["SiparisTarihi"].ToString();
            lblSiparisVerenCari.InnerText = dt.Rows[0]["CariAdi"].ToString();
            lblOdemeTuru.InnerText = dt.Rows[0]["OdemeTuru"].ToString();

            Session["sOdemeTurId"] = dt.Rows[0]["OdemeTurId"].ToString();

            lblSevkiyatTuru.InnerText = dt.Rows[0]["TeslimatTuru"].ToString();


            lblFaturaAdresi.InnerText = dt.Rows[0]["FaturaAdresi"].ToString();
            lblFaturaSehir.InnerText = dt.Rows[0]["FaturaSehir"].ToString();
            lblFaturaIlce.InnerText = dt.Rows[0]["FaturaIlce"].ToString();

            lblSevkiyatAdresi.InnerText = dt.Rows[0]["SevkiyatAdresi"].ToString();
            lblSevkiyatSehir.InnerText = dt.Rows[0]["SevkiyatSehir"].ToString();
            lblSevkiyatIlce.InnerText = dt.Rows[0]["SevkiyatIlce"].ToString();



            SqlCommand cm2 = new SqlCommand("spSepetGetirAltAdmin", cn._Baglan());
            cm2.CommandType = CommandType.StoredProcedure;
            cm2.Parameters.AddWithValue("@CariId", Session["sLoginId"].ToString());
            cm2.Parameters.AddWithValue("@OdemeSekli", Session["sOdemeTurId"].ToString());
            cm2.Parameters.AddWithValue("@SiparisId", Request.QueryString["sid"].ToString());

            SqlDataAdapter da2 = new SqlDataAdapter(cm2);
            DataTable dt2 = new DataTable();
            da2.Fill(dt2);

            lblToplam.InnerText = "₺ " + Convert.ToDecimal(dt2.Rows[0]["NetTutar"].ToString()).ToString("N2", CultureInfo.GetCultureInfo("tr"));
            lblKdvTutari.InnerText = "₺ " + Convert.ToDecimal(dt2.Rows[0]["KdvTutar"].ToString()).ToString("N2", CultureInfo.GetCultureInfo("tr"));
            lblGenelToplam.InnerText = "₺ " + Convert.ToDecimal(dt2.Rows[0]["GenelToplam"].ToString()).ToString("N2", CultureInfo.GetCultureInfo("tr"));
            Session["sOdenecekTutar"] = Convert.ToDecimal(dt2.Rows[0]["GenelToplam"].ToString()).ToString("N2", CultureInfo.GetCultureInfo("tr"));


            //DataRow dr = cn.DataRowGetir("Select s.SiparisId, s.Tutar, s.Kdv, s.GenelTutar, (Select SUM(sd.Miktar) From SiparisDetay sd Where sd.SiparisId = s.SiparisId) UrunMiktar From Siparisler s Where s.SiparisId = " + Request.QueryString["sid"].ToString() + "");

            //lblUrunMiktari.InnerText = dr["UrunMiktar"].ToString() + " adet ürün";
            //lblToplam.InnerText = Convert.ToDecimal(dr["Tutar"].ToString()).ToString("N2");
            //lblKdvTutari.InnerText = Convert.ToDecimal(dr["Kdv"].ToString()).ToString("N2");
            //lblGenelToplam.InnerText = Convert.ToDecimal(dr["GenelTutar"].ToString()).ToString("N2");
        }

        protected void btnNotEkle_Click(object sender, EventArgs e)
        {
            cn.InsUpdDel("Insert Into SiparisNotlari (SiparisId, CariId, NotAciklama) Values (" + Request.QueryString["sid"].ToString() + ", " + Session["sLoginId"].ToString() + ", '" + txtNotAciklama.InnerText + "')");

            txtNotAciklama.InnerText = "";
            repSiparisNotlari.DataBind();
        }
    }
}