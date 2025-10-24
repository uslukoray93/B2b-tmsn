using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace GedizMakina.user
{
    public partial class urun_detay : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UrunGetir();

                SepetKontrol();
            }
        }

        void UrunGetir()
        {
            string _Metin = Request.Url.PathAndQuery.ToString();

            DataRow dr = cn.DataRowGetir("SELECT ur.UrunId FROM Urunler ur INNER JOIN [GEDIZLINK].DENEME_2024T.dbo.STOKGEN stk ON ur.RefId = stk.REF WHERE '/urun/'+ CONVERT(VARCHAR, ur.UrunId) + '-' + dbo.KodOlustur(dbo.KodOlustur(RTRIM(STA))) = '" + _Metin + "'");
            Session["sUrunId"] = dr["UrunId"].ToString();

            SqlCommand cm = new SqlCommand("spUrunGetirTek", cn._Baglan());
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@UrunId", Session["sUrunId"].ToString());

            SqlDataAdapter da = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            da.Fill(dt);

            lblUrunAdi.InnerText = dt.Rows[0]["STA"].ToString();
            
            lblMarka.InnerText = dt.Rows[0]["UrunMarka"].ToString();
            lblMarka.HRef = dt.Rows[0]["UrunMarkaLink"].ToString();
            lblUrunKodu.InnerText = dt.Rows[0]["STK"].ToString();
            lblStokDurumRenk.Attributes["class"] = dt.Rows[0]["StokDurumRenk"].ToString();
            lblStokDurum.InnerText = dt.Rows[0]["StokDurum"].ToString();

            if (dt.Rows[0]["StokDurum"].ToString() == "VAR" || dt.Rows[0]["StokDurum"].ToString() == "AZ VAR")
            {
                txtMiktar.Enabled = true;
                btnSepeteEkle.Enabled = true;
                btnSepeteEkle.Text = "Sepete Ekle";
            }
            else
            {
                txtMiktar.Enabled = false;
                btnSepeteEkle.Enabled = false;
                btnSepeteEkle.Text = "STOKTA YOK";
            }


            lblListeFiyati.InnerText = Convert.ToDecimal(dt.Rows[0]["SAT1_1"].ToString()).ToString("N2") + " €";

            DataRow drFiyatCevir = cn.DataRowGetir("Select TOP(1) EUR From DovizGunluk Order By Tarih DESC");

            SqlCommand cmFiyat = new SqlCommand("spDetayFiyat", cn._Baglan());
            cmFiyat.CommandType = CommandType.StoredProcedure;
            cmFiyat.Parameters.AddWithValue("@CariId", Session["sLoginId"].ToString());
            cmFiyat.Parameters.AddWithValue("@UrunId", Session["sUrunId"].ToString());

            SqlDataAdapter daFiyat = new SqlDataAdapter(cmFiyat);
            DataTable dtFiyat = new DataTable();
            daFiyat.Fill(dtFiyat);

            //lblFiyatTL.Text = Convert.ToDecimal(dtFiyat.Rows[5]["TLTOPLAM"].ToString()).ToString("N");

            //string _Src = "<script src='https://www.paytr.com/odeme/taksit-tablosu/v2?token=71c73f6303049ae3e7df650d6614bd16fe94fd5ba751c31e952f8d2f04cf40ee&merchant_id=496818&amount=" + lblFiyatTL.Text + "'></script>";

            //divTaksit.InnerHtml = _Src;

            

            lblUrunAciklamasi.Text = dt.Rows[0]["UrunAciklamasi"].ToString();
        }
        void SepetKontrol()
        {
            SqlDataAdapter da = new SqlDataAdapter("Select ISNULL(SUM(Miktar), 0) Miktar From Sepet Where CariId = " + Session["sLoginId"].ToString() + " And UrunId = " + Session["sUrunId"].ToString() + "", cn._Baglan());

            DataTable dt = new DataTable();
            da.Fill(dt);

            if (Convert.ToInt32(dt.Rows[0]["Miktar"].ToString()) > 0)
            {
                lblSepetKontrol.InnerText = "Bu üründen sepetinizde " + dt.Rows[0]["Miktar"].ToString() + " adet bulunmakta";
                ulSepetKontrol.Visible = true;
            }
            else
            {
                ulSepetKontrol.Visible = false;
            }
        }

        protected void txtMiktar_TextChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(txtMiktar.Text) < 1)
            {
                txtMiktar.Text = "1";
            }
        }

        protected void btnSepeteEkle_Click(object sender, EventArgs e)
        {
            SqlDataAdapter da = new SqlDataAdapter("Select * From Sepet Where CariId = " + Session["sLoginId"].ToString() + " And UrunId = " + Session["sUrunId"].ToString() + "", cn._Baglan());

            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count < 1)
            {
                try
                {
                    //DataRow dr = cn.DataRowGetir("Select STK, SUM(GRMIK-CKMIK) MIKTAR From [GEDIZLINK].DENEME_2024T.DBO.STOK_ALT Where STK = '" + Session["sUrunId"].ToString() + "' GROUP BY STK");

                    //int _Eklenecek = Convert.ToInt32(txtMiktar.Text);
                    //int _Stok = Convert.ToInt32(dr["MIKTAR"].ToString());

                    //if (_Eklenecek > _Stok)
                    //{

                    //}

                    SqlCommand cm = new SqlCommand("Insert Into Sepet(CariId, UrunId, Miktar, Secili) Values(" + Session["sLoginId"].ToString() + ", " + Session["sUrunId"].ToString() + ", " + Convert.ToInt32(txtMiktar.Text).ToString() + ", 'True')", cn._Baglan());
                    if (cm.ExecuteNonQuery() !=0)
                    {
                        SqlCommand cm2 = new SqlCommand("Insert Into Sepet2(CariId, UrunId, Miktar, Secili) Values(" + Session["sLoginId"].ToString() + ", " + Session["sUrunId"].ToString() + ", " + Convert.ToInt32(txtMiktar.Text).ToString() + ", 'True')", cn._Baglan());

                        if (cm2.ExecuteNonQuery()!=0)
                        {
                            lblSepetUyari.Text = "Ürün sepetinize eklendi";
                            poSepetUyari.ShowOnPageLoad = true;
                        }
                        
                    }
                }
                catch (Exception ex)
                {
                    lblSepetUyari.Text = ex.Message.ToString();
                    poSepetUyari.ShowOnPageLoad = true;
                }
            }
            else
            {
                try
                {
                    SqlCommand cm = new SqlCommand("Update Sepet SET Miktar = " + Convert.ToInt32(txtMiktar.Text).ToString() + " Where CariId = " + Session["sLoginId"].ToString() + " And UrunId = " + Session["sUrunId"].ToString() + "", cn._Baglan());

                    if (cm.ExecuteNonQuery()!=0)
                    {
                        SqlCommand cm2 = new SqlCommand("Update Sepet2 SET Miktar = " + Convert.ToInt32(txtMiktar.Text).ToString() + " Where CariId = " + Session["sLoginId"].ToString() + " And UrunId = " + Session["sUrunId"].ToString() + "", cn._Baglan());

                        if (cm2.ExecuteNonQuery()!=0)
                        {
                            lblSepetUyari.Text = "Sepetinizdeki ürün miktarı güncellendi";
                            poSepetUyari.ShowOnPageLoad = true;
                        }
                        
                    }
                }
                catch (Exception ex)
                {
                    lblSepetUyari.Text = ex.Message.ToString();
                    poSepetUyari.ShowOnPageLoad = true;
                }   
            }
        }

        protected void btnPoTamam_Click(object sender, EventArgs e)
        {
            Response.Redirect("/dashboard");
        }
    }
}