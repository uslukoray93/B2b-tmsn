using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace GedizMakina.user
{
    public partial class iade_talebi_yeni : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        string uzanti = null;
        string resimadi = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void gvAlinanUrunler_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "btnSec")
            {
                txtUrunAdi.Text = gvAlinanUrunler.GetRowValues(e.VisibleIndex, "STA").ToString();
                txtMiktar.Text = gvAlinanUrunler.GetRowValues(e.VisibleIndex, "Miktar").ToString();
                Session["sUrunMiktar"] = gvAlinanUrunler.GetRowValues(e.VisibleIndex, "Miktar").ToString();
                txtBirimFiyat.Text = gvAlinanUrunler.GetRowValues(e.VisibleIndex, "BirimFiyat").ToString();
                Session["sSiparisId"] = gvAlinanUrunler.GetRowValues(e.VisibleIndex, "SiparisId");
                Session["sUrunId"] = gvAlinanUrunler.GetRowValues(e.VisibleIndex, "UrunId");
            }
        }

        protected void txtMiktar_TextChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(txtMiktar.Text) < 1)
            {
                txtMiktar.Text = "1";
            }
            if (Convert.ToInt32(txtMiktar.Text) > Convert.ToInt32(Session["sUrunMiktar"].ToString()))
            {
                txtMiktar.Text = Session["sUrunMiktar"].ToString();
            }
        }

        protected void btnGonder_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cm = new SqlCommand("Insert Into IadeTalepleri (CariId, SiparisId, UrunId, Miktar, IadeNedenId, Notlar, UrunDurum, IadeResim1, IadeResim2, IadeVideo) Values (" + Session["sLoginId"].ToString() + ", " + Session["sSiparisId"].ToString() + ", " + Session["sUrunId"].ToString() + ", " + txtMiktar.Text + ", " + ddIadeNedenleri.SelectedValue + ", '" + txtIadeNotu.Text + "', '" + rblDurum.Value + "', '" + Session["sResimAdiTam1"].ToString() + "', , '" + Session["sResimAdiTam2"].ToString() + "', , '" + Session["sResimAdiTam3"].ToString() + "')", cn._Baglan());

                if (cm.ExecuteNonQuery()!=0)
                {
                    lblUyari.Text = "İade Talebiniz Gönderildi";
                }
            }
            catch (Exception ex)
            {
                lblUyari.Text = ex.Message.ToString();
            }
        }

        protected void ucUrunGorsel1_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
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

                    Session["sResimAdi1"] = resimadi;

                    Session["sResimAdiTam1"] = "/Resimler/IadeTalebi/" + Session["sResimAdi1"].ToString();

                    Session["sResimAdiGosterim1"] = Session["sResimAdiTam1"].ToString();

                    #region ResimBoyutlandir

                    ////////////////////BUYUK RESİM BAŞLA////////////////////
                    //Orijinal Resmi Kaydet
                    e.UploadedFile.SaveAs(Server.MapPath(Session["sResimAdiTam1"].ToString()));
                    ////////////////////BUYUK RESİM BİTİR////////////////////
                    ///
                    #endregion
                }
            }
        }

        protected void ucUrunGorsel2_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
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

                    Session["sResimAdi2"] = resimadi;

                    Session["sResimAdiTam2"] = "/Resimler/IadeTalebi/" + Session["sResimAd12"].ToString();

                    Session["sResimAdiGosterim2"] = Session["sResimAdiTam2"].ToString();

                    #region ResimBoyutlandir

                    ////////////////////BUYUK RESİM BAŞLA////////////////////
                    //Orijinal Resmi Kaydet
                    e.UploadedFile.SaveAs(Server.MapPath(Session["sResimAdiTam2"].ToString()));
                    ////////////////////BUYUK RESİM BİTİR////////////////////
                    ///
                    #endregion
                }
            }
        }

        protected void ucUrunVideo_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
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

                    Session["sResimAdi3"] = resimadi;

                    Session["sResimAdiTam3"] = "/Resimler/IadeTalebi/" + Session["sResimAdi3"].ToString();

                    Session["sResimAdiGosterim3"] = Session["sResimAdiTam3"].ToString();

                    #region ResimBoyutlandir

                    ////////////////////BUYUK RESİM BAŞLA////////////////////
                    //Orijinal Resmi Kaydet
                    e.UploadedFile.SaveAs(Server.MapPath(Session["sResimAdiTam3"].ToString()));
                    ////////////////////BUYUK RESİM BİTİR////////////////////
                    ///
                    #endregion
                }
            }
        }
    }
}