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
using System.IO;

namespace GedizMakina.Mt
{
    public partial class urun_duzenle : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        string uzanti = null;
        string resimadi = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UrunBilgiGetir();
            }
        }

        #region Ürün Bilgileri
        void UrunBilgiGetir()
        {
            SqlCommand cm = new SqlCommand("spUrunGetirTekAdmin", cn._Baglan());
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@UrunId", Session["sUrunId"].ToString());

            SqlDataAdapter da = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            da.Fill(dt);

            decimal _kdv = Convert.ToDecimal(dt.Rows[0]["KDV"].ToString()) / 100;

            Page.Title = dt.Rows[0]["STA"].ToString() + " düzenleme";

            txtUrunAdi.Text = dt.Rows[0]["STA"].ToString(); //Muhasebe Programındaki Ürün Adı Alanı
            txtUrunKodu.Text = dt.Rows[0]["STK"].ToString(); //Muhasebe Programındaki Ürün Kodu Alanı
            txtBirim.Text = dt.Rows[0]["STB"].ToString(); //Muhasebe Programındaki Ürün Birimi Alanı
            txtAlisFiyati.Text = Convert.ToDecimal(dt.Rows[0]["ALIS1_1"].ToString()).ToString("N2", CultureInfo.GetCultureInfo("tr")); //Muhasebe Programındaki Ürün Alış Fiyatı Alanı
            txtSatisFiyati.Text = Convert.ToDecimal(dt.Rows[0]["SAT1_1"].ToString()).ToString("N2", CultureInfo.GetCultureInfo("tr")); //Muhasebe Programındaki Ürün Satış Fiyatı Alanı
            txtKdvOrani.Text = Convert.ToDecimal(_kdv).ToString("P2", CultureInfo.GetCultureInfo("tr")); //Muhasebe Programındaki Ürün KDV Alanı
            ddMarka.DataBind();
            ddMarka.Value = dt.Rows[0]["MarkaId"].ToString(); //B2B Veri Tabanındaki Urunler tablosunda bulunan MarkaId alanı
            txtStok.Text = dt.Rows[0]["GercekStok"].ToString(); //Muhasebe Programındaki Ürün Stok Miktarı Alanı
            txtKritik.Text = dt.Rows[0]["Kritik"].ToString();
            chkAktif.Checked = Convert.ToBoolean(dt.Rows[0]["Aktif"].ToString());

            txtUrunAciklamasi.Html = dt.Rows[0]["UrunAciklamasi"].ToString();
        }

        protected void btnKaydetUrunBilgi_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cm = new SqlCommand("Update Urunler SET UrunAciklamasi = '" + txtUrunAciklamasi.Html + "', MarkaId = " + ddMarka.Value + ", Kritik = '" + txtKritik.Text + "', Aktif = '" + Convert.ToBoolean(chkAktif.Checked) + "', SeriSonu = '" + Convert.ToBoolean(chkSeriSonu.Checked) + "' Where UrunId = " + Session["sUrunId"].ToString() + "", cn._Baglan());

                if (cm.ExecuteNonQuery() != 0)
                {
                    lblUyariUrunBilgi.Text = "Ürün Bilgileri Güncellendi";
                }
            }
            catch (Exception ex)
            {
                lblUyariUrunBilgi.Text = ex.Message.ToString();
            }
        }
        #endregion

        #region Kategoriler

        protected void lbKategori1_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataRow dr = cn.DataRowGetir("Select Count(*) Sayi From Kategoriler Where UstKategoriId = " + lbKategori1.Value + "");

            if (Convert.ToInt32(dr["Sayi"].ToString()) > 0)
            {
                lbKategori2.DataSource = cn.DataTableGetir("Select * From Kategoriler Where UstKategoriId = " + lbKategori1.Value + "");
                lbKategori2.ValueField = "KategoriId";
                lbKategori2.TextField = "KategoriAdi";
                lbKategori2.DataBind();
                divKategori2.Visible = true;
                divKaydetKategori.Visible = true;
                lblHangisi.Text = "2";
            }
            else
            {
                divKategori2.Visible = false;
                divKaydetKategori.Visible = true;
                lblHangisi.Text = "1";
            }
        }

        protected void lbKategori2_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataRow dr = cn.DataRowGetir("Select Count(*) Sayi From Kategoriler Where UstKategoriId = " + lbKategori2.Value + "");

            if (Convert.ToInt32(dr["Sayi"].ToString()) > 0)
            {
                lbKategori3.DataSource = cn.DataTableGetir("Select * From Kategoriler Where UstKategoriId = " + lbKategori2.Value + "");
                lbKategori3.ValueField = "KategoriId";
                lbKategori3.TextField = "KategoriAdi";
                lbKategori3.DataBind();
                divKategori3.Visible = true;
                lblHangisi.Text = "3";
            }
            else
            {
                divKategori3.Visible = false;
                divKaydetKategori.Visible = true;
                lblHangisi.Text = "2";
            }
        }

        protected void lbKategori3_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataRow dr = cn.DataRowGetir("Select Count(*) Sayi From Kategoriler Where UstKategoriId = " + lbKategori3.Value + "");

            if (Convert.ToInt32(dr["Sayi"].ToString()) > 0)
            {
                lbKategori4.DataSource = cn.DataTableGetir("Select * From Kategoriler Where UstKategoriId = " + lbKategori3.Value + "");
                lbKategori4.ValueField = "KategoriId";
                lbKategori4.TextField = "KategoriAdi";
                lbKategori4.DataBind();
                divKategori4.Visible = true;
                lblHangisi.Text = "4";
            }
            else
            {
                divKategori4.Visible = false;
                divKaydetKategori.Visible = true;
                lblHangisi.Text = "3";
            }
        }

        protected void lbKategori4_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataRow dr = cn.DataRowGetir("Select Count(*) Sayi From Kategoriler Where UstKategoriId = " + lbKategori4.Value + "");

            if (Convert.ToInt32(dr["Sayi"].ToString()) > 0)
            {
                lbKategori5.DataSource = cn.DataTableGetir("Select * From Kategoriler Where UstKategoriId = " + lbKategori4.Value + "");
                lbKategori5.ValueField = "KategoriId";
                lbKategori5.TextField = "KategoriAdi";
                lbKategori5.DataBind();
                divKategori5.Visible = true;
                lblHangisi.Text = "5";
            }
            else
            {
                divKategori5.Visible = false;
                divKaydetKategori.Visible = true;
                lblHangisi.Text = "4";
            }
        }

        protected void lbKategori5_SelectedIndexChanged(object sender, EventArgs e)
        {
            divKaydetKategori.Visible = true;
        }

        protected void btnKaydetKategori_Click(object sender, EventArgs e)
        {
            if (lblHangisi.Text == "1")
            {
                cn.InsUpdDel("Insert Into UrunKategori (UrunId, KategoriId, UrunKategoriYol) Values (" + Session["sUrunId"].ToString() + ", " + lbKategori1.Value + ", '" + lbKategori1.SelectedItem.Text + "')");
            }
            if (lblHangisi.Text == "2")
            {
                DataRow dr1 = cn.DataRowGetir("Select COUNT (*) Sayi From UrunKategori Where UrunId = " + Session["sUrunId"].ToString() + " And KategoriId = " + lbKategori1.Value + "");

                if (Convert.ToInt32(dr1["Sayi"].ToString()) > 0)
                {
                    DataRow dr2 = cn.DataRowGetir("Select COUNT (*) Sayi From UrunKategori Where UrunId = " + Session["sUrunId"].ToString() + " And KategoriId = " + lbKategori2.Value + "");

                    if (Convert.ToInt32(dr2["Sayi"].ToString()) > 0)
                    {
                        lblUyariKategori.Text = "Bu kategori daha önce eklenmiş";
                    }
                    else
                    {
                        cn.InsUpdDel("Insert Into UrunKategori (UrunId, KategoriId, UrunKategoriYol) Values (" + Session["sUrunId"].ToString() + ", " + lbKategori2.Value + ", '" + lbKategori1.SelectedItem.Text + " / ' + '" + lbKategori2.SelectedItem.Text + "')");
                    }
                }
                else
                {
                    cn.InsUpdDel("Insert Into UrunKategori (UrunId, KategoriId, UrunKategoriYol) Values (" + Session["sUrunId"].ToString() + ", " + lbKategori1.Value + ", '" + lbKategori1.SelectedItem.Text + "')");
                    cn.InsUpdDel("Insert Into UrunKategori (UrunId, KategoriId, UrunKategoriYol) Values (" + Session["sUrunId"].ToString() + ", " + lbKategori2.Value + ", '" + lbKategori1.SelectedItem.Text + " / ' + '" + lbKategori2.SelectedItem.Text + "')");
                }
            }
            if (lblHangisi.Text == "3")
            {

            }
            if (lblHangisi.Text == "4")
            {

            }
            if (lblHangisi.Text == "5")
            {

            }

            gvKategoriler.DataBind();
        }

        protected void gvKategoriler_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "btnKategoriSil")
            {
                cn.InsUpdDel("Delete From UrunKategori Where KayitId = " + gvKategoriler.GetRowValues(e.VisibleIndex, "KayitId") + "");
                gvKategoriler.DataBind();
            }
        }

        #endregion

        #region Ürün Resimleri

        protected void btnSil_Click(object sender, EventArgs e)
        {
            ASPxButton btn = (ASPxButton)sender;
            DataViewItemTemplateContainer container = (DataViewItemTemplateContainer)btn.NamingContainer;
            Session["sResimId"] = DataBinder.Eval(container.DataItem, "ResimId");
            cn.InsUpdDel("Delete From UrunResimleri Where ResimId = '" + Session["sResimId"].ToString() + "'");
            dvResimler.DataBind();
        }

        protected void btnDefault_Click(object sender, EventArgs e)
        {
            ASPxButton btnDefault = (ASPxButton)sender;
            DataViewItemTemplateContainer container = (DataViewItemTemplateContainer)btnDefault.NamingContainer;
            Session["sResimId"] = DataBinder.Eval(container.DataItem, "ResimId");
            cn.InsUpdDel("Update UrunResimleri SET AnaResim = 'False' Where UrunId = '" + Session["sUrunId"].ToString() + "'");
            cn.InsUpdDel("Update UrunResimleri SET AnaResim = 'True' Where ResimId = '" + Session["sResimId"].ToString() + "'");
            dvResimler.DataBind();
        }

        protected void btnDefault_Init(object sender, EventArgs e)
        {
            ASPxButton btnDefault = (ASPxButton)sender;
            DataViewItemTemplateContainer container = btnDefault.NamingContainer as DataViewItemTemplateContainer;
            var dataID = DataBinder.Eval(container.DataItem, "ResimId");
        }

        protected void btnSil_Init(object sender, EventArgs e)
        {
            ASPxButton btn2 = (ASPxButton)sender;
            DataViewItemTemplateContainer container = btn2.NamingContainer as DataViewItemTemplateContainer;
            var dataID = DataBinder.Eval(container.DataItem, "ResimId");
        }

        protected void ASPxUploadControl1_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            HttpFileCollection files = Request.Files;
            for (int i = 0; i < files.Count; i++)
            {
                string file = e.UploadedFile.FileName.ToString();
                Int64 ContentLength = e.UploadedFile.FileBytes.Length;
                if (ContentLength > 0)
                {
                    //resmin adı
                    string filename = Path.GetFileName(e.UploadedFile.FileName);

                    //resim uzantısı
                    uzanti = Path.GetExtension(e.UploadedFile.FileName);

                    //resime atanacak yeni ad
                    resimadi = DateTime.Now.Day.ToString() + DateTime.Now.Month +
                        DateTime.Now.Year + DateTime.Now.Hour + DateTime.Now.Second +
                        DateTime.Now.Minute + DateTime.Now.Millisecond + uzanti;

                    Session["sResimAdi"] = resimadi;

                    Session["sResimAdiTam"] = "/Resimler/urunresimleri/" + Session["sResimAdi"].ToString();

                    Session["sResimAdiGosterim"] = Session["sResimAdiTam"].ToString();

                    #region ResimBoyutlandir

                    ////////////////////BUYUK RESİM BAŞLA////////////////////
                    //Orijinal Resmi Kaydet
                    e.UploadedFile.SaveAs(Server.MapPath(Session["sResimAdiTam"].ToString()));

                    cn.InsUpdDel("Insert Into UrunResimleri (UrunId, ResimYolu) Values ('" + Session["sUrunId"].ToString() + "', '" + Session["sResimAdiTam"].ToString() + "')");
                    ////////////////////BUYUK RESİM BİTİR////////////////////
                    ///
                    #endregion
                }
            }

            dvResimler.DataBind();
        }


        #endregion

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton LinkButton1 = sender as LinkButton;

            var container = LinkButton1.NamingContainer as GridViewDataItemTemplateContainer;
            int id = Convert.ToInt32(gvUrunSatislari.GetRowValues(container.VisibleIndex, gvUrunSatislari.KeyFieldName));
            Session["sSiparisId"] = id;

            Response.Redirect("/mt/siparis/?sid=" + Session["sSiparisId"].ToString());
        }
    }
}