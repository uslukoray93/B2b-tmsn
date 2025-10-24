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
    public partial class kampanya_detay : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                KampanyaGetir();
            }
        }
        void KampanyaGetir()
        {
            DataRow dr = cn.DataRowGetir("Select * From Kampanyalar Where KampanyaId = " + Session["sKampanyaId"].ToString() + "");

            txtKampanyaAdi.Text = dr["KampanyaAdi"].ToString();
            Page.Title = dr["KampanyaAdi"].ToString() + " detay";
            dtBaslangic.Date = Convert.ToDateTime(dr["Baslangic"].ToString());
            dtBitis.Date = Convert.ToDateTime(dr["Bitis"].ToString());
        }
        protected void ddKampanyaTur_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddKampanyaTur.Value.ToString() == "1")
            {
                //SEÇİLECEK HER ÜRÜNE FİYAT GİRİLECEK
                MultiView1.ActiveViewIndex = 0;
            }
            if (ddKampanyaTur.Value.ToString() == "2")
            {
                //TÜM ÜRÜNLERE YÜZDESEL İNDİRİM
                MultiView1.ActiveViewIndex = 1;
            }
            if (ddKampanyaTur.Value.ToString() == "3")
            {
                //SEÇİLEN KATEGORİYE YÜZDESEL İNDİRİM
                MultiView1.ActiveViewIndex = 2;
            }
            if (ddKampanyaTur.Value.ToString() == "4")
            {
                //SEÇİLEN MARKAYA YÜZDESEL İNDİRİM
                MultiView1.ActiveViewIndex = 3;
            }
            if (ddKampanyaTur.Value.ToString() == "5")
            {
                MultiView1.ActiveViewIndex = 4;
            }
            if (ddKampanyaTur.Value.ToString() == "6")
            {
                MultiView1.ActiveViewIndex = 5;
            }
        }
        protected void btnKaydetNetFiyat_Click(object sender, EventArgs e)
        {
            //BU BÖLÜMDE SEÇİLEN ÜRÜNLERE VERİLEN FİYAT UYGULANACAKTIR.
            SqlDataAdapter da = new SqlDataAdapter("Select * From KampanyaDetay Where UrunId = " + ddNetFiyat.Value + "", cn._Baglan());
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                DataRow dr = cn.DataRowGetir("Select * From Kampanyalar Where KampanyaId = " + dt.Rows[0]["KampanyaId"].ToString() + "");

                lblUyariNetFiyat.Text = "Seçtiğiniz ürün, " + dr["KampanyaAdi"].ToString() + " kampanyasında yer almaktadır";
            }
            else
            {
                cn.InsUpdDel("Insert Into KampanyaDetay (KampanyaId, KampanyaAltTurId, UrunId, AlmasiGerereken, Hediye, HediyeUrunId, Fiyat, ParaBirimId) Values (" + Session["sKampanyaId"].ToString() + ", " + ddKampanyaTur.Value + ", " + ddNetFiyat.Value + ", 1, NULL, NULL, '" + Convert.ToDecimal(txtNetFiyat.Text.Replace(",", ".")) + "', " + ddParaBirimi.Value + ")");

                gvNetFiyat.DataBind();
            }
        }
        protected void btnKaydetTumUrunIndirim_Click(object sender, EventArgs e)
        {
            //BU BÖLÜMDE TÜM ÜRÜNLERE BELİRTİLEN YÜZDE KADAR İNDİRİM UYGULANACAKTIR.

            SqlDataAdapter da = new SqlDataAdapter("Select * From UrunKategori Where KategoriId = 1000000066 And UrunId IN (Select UrunId From Urunler EXCEPT Select UrunId From KampanyaDetay)", cn._Baglan());
            DataTable dt = new DataTable();
            da.Fill(dt);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                SqlDataAdapter da2 = new SqlDataAdapter("SELECT ROW_NUMBER () OVER (ORDER BY ur.UrunId) Satir, ur.UrunId, ur.RefId, stk.REF, stk.SAT1_1 FROM Urunler ur INNER JOIN[GEDIZLINK].DENEME_2024T.dbo.STOKGEN stk ON ur.RefId = stk.REF Where ur.Aktif = 'True' And ur.UrunId = " + dt.Rows[i]["UrunId"].ToString() + "", cn._Baglan());
                DataTable dt2 = new DataTable();
                da2.Fill(dt2);

                decimal _EskiFiyat = Convert.ToDecimal(dt2.Rows[0]["SAT1_1"].ToString());
                decimal _Indirim = Convert.ToDecimal(txtTumUrunIndirim.Text);
                decimal _YeniFiyat = _EskiFiyat - ((_EskiFiyat / 100) * _Indirim);

                cn.InsUpdDel("Insert Into KampanyaDetay (KampanyaId, KampanyaAltTurId, UrunId, AlmasiGerereken, Hediye, HediyeUrunId, Fiyat, ParaBirimId, EskiFiyat) Values (" + Session["sKampanyaId"].ToString() + ", " + ddKampanyaTur.Value + ", " + dt2.Rows[0]["UrunId"].ToString() + ", 1, NULL, NULL, '" + Convert.ToDecimal(_YeniFiyat).ToString().Replace(",", ".") + "', 1000000000, '" + Convert.ToDecimal(dt2.Rows[0]["SAT1_1"].ToString()).ToString().Replace(",", ".") + "')");
            }

            lblUyariTumUrunIndirim.Text = "İndirim tüm ürünlere uygulandı";
        }
        protected void btnKaydetKategoriyeIndirim_Click(object sender, EventArgs e)
        {
            //BU BÖLÜMDE SEÇİLEN KATEGORİDEKİ ÜRÜNLERE BELİRTİLEN YÜZDE KADAR İNDİRİM UYGULANACAKTIR.
            SqlDataAdapter da = new SqlDataAdapter("Select * From UrunKategori Where KategoriId = " + ddKategoriyeIndirim.Value + " And UrunId IN (Select UrunId From Urunler EXCEPT Select UrunId From KampanyaDetay)", cn._Baglan());
            DataTable dt = new DataTable();
            da.Fill(dt);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                SqlDataAdapter da2 = new SqlDataAdapter("SELECT ROW_NUMBER () OVER (ORDER BY ur.UrunId) Satir, ur.UrunId, ur.RefId, stk.REF, stk.SAT1_1 FROM Urunler ur INNER JOIN[GEDIZLINK].DENEME_2024T.dbo.STOKGEN stk ON ur.RefId = stk.REF Where ur.Aktif = 'True' And ur.UrunId = " + dt.Rows[i]["UrunId"].ToString() + "", cn._Baglan());
                DataTable dt2 = new DataTable();
                da2.Fill(dt2);

                decimal _EskiFiyat = Convert.ToDecimal(dt2.Rows[0]["SAT1_1"].ToString());
                decimal _Indirim = Convert.ToDecimal(txtKategoriyeIndirim.Text);
                decimal _YeniFiyat = _EskiFiyat - ((_EskiFiyat / 100) * _Indirim);

                cn.InsUpdDel("Insert Into KampanyaDetay (KampanyaId, KampanyaAltTurId, UrunId, AlmasiGerereken, Hediye, HediyeUrunId, Fiyat, ParaBirimId, EskiFiyat) Values (" + Session["sKampanyaId"].ToString() + ", " + ddKampanyaTur.Value + ", " + dt2.Rows[0]["UrunId"].ToString() + ", 1, NULL, NULL, '" + Convert.ToDecimal(_YeniFiyat).ToString().Replace(",", ".") + "', 1000000000, '" + Convert.ToDecimal(dt2.Rows[0]["SAT1_1"].ToString()).ToString().Replace(",", ".") + "')");
            }

            lblUyariMarkayaIndirim.Text = "Kategorinin tüm ürünlerine indirim uygulandı";
        }
        protected void btnMarkayaIndirim_Click(object sender, EventArgs e)
        {
            //BU BÖLÜMDE SEÇİLEN MARKADAKİ ÜRÜNLERE BELİRTİLEN YÜZDE KADAR İNDİRİM UYGULANACAKTIR.
            SqlDataAdapter da = new SqlDataAdapter("Select * From Urunler Where MarkaId = " + ddMarkayaIndirim.Value + " And UrunId IN (Select UrunId From Urunler EXCEPT Select UrunId From KampanyaDetay)", cn._Baglan());
            DataTable dt = new DataTable();
            da.Fill(dt);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                SqlDataAdapter da2 = new SqlDataAdapter("SELECT ROW_NUMBER () OVER (ORDER BY ur.UrunId) Satir, ur.UrunId, ur.RefId, stk.REF, stk.SAT1_1 FROM Urunler ur INNER JOIN[GEDIZLINK].DENEME_2024T.dbo.STOKGEN stk ON ur.RefId = stk.REF Where ur.Aktif = 'True' And ur.UrunId = " + dt.Rows[i]["UrunId"].ToString() + "", cn._Baglan());
                DataTable dt2 = new DataTable();
                da2.Fill(dt2);

                decimal _EskiFiyat = Convert.ToDecimal(dt2.Rows[0]["SAT1_1"].ToString());
                decimal _Indirim = Convert.ToDecimal(txtMarkayaIndirim.Text);
                decimal _YeniFiyat = _EskiFiyat - ((_EskiFiyat / 100) * _Indirim);

                cn.InsUpdDel("Insert Into KampanyaDetay (KampanyaId, KampanyaAltTurId, UrunId, AlmasiGerereken, Hediye, HediyeUrunId, Fiyat, ParaBirimId, EskiFiyat) Values (" + Session["sKampanyaId"].ToString() + ", " + ddKampanyaTur.Value + ", " + dt2.Rows[0]["UrunId"].ToString() + ", 1, NULL, NULL, '" + Convert.ToDecimal(_YeniFiyat).ToString().Replace(",", ".") + "', 1000000000, '" + Convert.ToDecimal(dt2.Rows[0]["SAT1_1"].ToString()).ToString().Replace(",", ".") + "')");
            }

            lblUyariMarkayaIndirim.Text = "Markanın tüm ürünlerine indirim uygulandı";
        }
        protected void btnKaydetUrununAynisi_Click(object sender, EventArgs e)
        {
            //BU BÖLÜMDE SEÇİLEN ÜRÜNÜN AYNISINDAN HEDİYE UYGULANACAKTIR.
            SqlDataAdapter da = new SqlDataAdapter("Select * From KampanyaDetay Where UrunId = " + ddUrununAynisiHediye.Value + "", cn._Baglan());
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                DataRow dr = cn.DataRowGetir("Select * From Kampanyalar Where KampanyaId = " + dt.Rows[0]["KampanyaId"].ToString() + "");

                lblUyariUrununAynisi.Text = "Seçtiğiniz ürün, " + dr["KampanyaAdi"].ToString() + " kampanyasında yer almaktadır";
            }
            else
            {
                SqlDataAdapter da2 = new SqlDataAdapter("SELECT ROW_NUMBER () OVER (ORDER BY ur.UrunId) Satir, ur.UrunId, ur.RefId, stk.REF, stk.SAT1_1 FROM Urunler ur INNER JOIN[GEDIZLINK].DENEME_2024T.dbo.STOKGEN stk ON ur.RefId = stk.REF Where ur.Aktif = 'True' And ur.UrunId = " + ddUrununAynisiHediye.Value + "", cn._Baglan());
                DataTable dt2 = new DataTable();
                da2.Fill(dt2);

                cn.InsUpdDel("Insert Into KampanyaDetay (KampanyaId, " +
                    "KampanyaAltTurId, " +
                    "UrunId, " +
                    "AlmasiGerereken, " +
                    "Hediye, " +
                    "HediyeUrunId, " +
                    "Fiyat, " +
                    "ParaBirimId) " +
                    "Values " +
                    "(" + Session["sKampanyaId"].ToString() + ", " +
                    "" + ddKampanyaTur.Value + ", " +
                    "" + ddUrununAynisiHediye.Value + ", " +
                    "" + Convert.ToInt32(txtUrununAynisiAnaUrun.Text) + ", " +
                    "" + Convert.ToInt32(txtUrununAynisiHediye.Text) + ", " +
                    "" + ddUrununAynisiHediye.Value + ", " +
                    "'" + Convert.ToDecimal(dt2.Rows[0]["SAT1_1"].ToString()).ToString().Replace(",", ".") + "', " +
                    "" + ddParaBirimi.Value + ")");
            }
        }
        protected void btnKaydetUruneFarkliUrun_Click(object sender, EventArgs e)
        {
            //BU BÖLÜMDE SEÇİLEN ÜRÜNDEN FARKLI ÜRÜN HEDİYE UYGULANACAKTIR.
            SqlDataAdapter da = new SqlDataAdapter("Select * From KampanyaDetay Where UrunId = " + ddUruneFarkliUrunAnaUrun.Value + "", cn._Baglan());
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                DataRow dr = cn.DataRowGetir("Select * From Kampanyalar Where KampanyaId = " + dt.Rows[0]["KampanyaId"].ToString() + "");

                lblUyariUrununAynisi.Text = "Seçtiğiniz ürün, " + dr["KampanyaAdi"].ToString() + " kampanyasında yer almaktadır";
            }
            else
            {
                SqlDataAdapter da2 = new SqlDataAdapter("SELECT ROW_NUMBER () OVER (ORDER BY ur.UrunId) Satir, ur.UrunId, ur.RefId, stk.REF, stk.SAT1_1 FROM Urunler ur INNER JOIN[GEDIZLINK].DENEME_2024T.dbo.STOKGEN stk ON ur.RefId = stk.REF Where ur.Aktif = 'True' And ur.UrunId = " + ddUruneFarkliUrunAnaUrun.Value + "", cn._Baglan());
                DataTable dt2 = new DataTable();
                da2.Fill(dt2);

                cn.InsUpdDel("Insert Into KampanyaDetay (KampanyaId, " +
                    "KampanyaAltTurId, " +
                    "UrunId, " +
                    "AlmasiGerereken, " +
                    "Hediye, " +
                    "HediyeUrunId, " +
                    "Fiyat, " +
                    "ParaBirimId) " +
                    "Values " +
                    "(" + Session["sKampanyaId"].ToString() + ", " +
                    "" + ddKampanyaTur.Value + ", " +
                    "" + ddUruneFarkliUrunAnaUrun.Value + ", " +
                    "" + Convert.ToInt32(txtUruneFarkliUrunAnaUrun.Text) + ", " +
                    "" + Convert.ToInt32(txtFarkliUruneHediye.Text) + ", " +
                    "" + ddUruneFarkliUrunHediye.Value + ", " +
                    "'" + Convert.ToDecimal(dt2.Rows[0]["SAT1_1"].ToString()).ToString().Replace(",", ".") + "', " +
                    "" + ddParaBirimi.Value + ")");
            }
        }
    }
}