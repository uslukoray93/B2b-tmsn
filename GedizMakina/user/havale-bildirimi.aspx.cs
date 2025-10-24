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
    public partial class havale_bildirimi : System.Web.UI.Page
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

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cm = new SqlCommand("Insert Into HavaleBildirim (CariId, Tutar, SiparisNo, BankaId, DosyaYolu, Nots) Values (" + Session["sLoginId"].ToString() + ", '" + txtTutar.Text.Replace(",", ".") + "', " + ddSiparisNo.SelectedValue + ", " + ddBanka.SelectedValue + ", '" + Session["sResimAdiTam"].ToString() + "', '" + txtNot.Text + "')", cn._Baglan());

                if (cm.ExecuteNonQuery()!=0)
                {
                    lblUyari.Text = "Havale bildiriminiz gönderildi";
                }
            }
            catch (Exception ex)
            {
                lblUyari.Text = ex.Message.ToString();
            }
        }

        protected void ucFile_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
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

                    Session["sResimAdiTam"] = "/Resimler/HavaleBildirim/" + Session["sResimAdi"].ToString();
                    #region ResimBoyutlandir

                    ////////////////////BUYUK RESİM BAŞLA////////////////////
                    //Orijinal Resmi Kaydet
                    e.UploadedFile.SaveAs(Server.MapPath("/Resimler/HavaleBildirim/" + Session["sResimAdi"].ToString()));

                    //cn.InsUpdDel("Update Durumlar SET DurumResim = '" + Session["sResimAdiTam"].ToString() + "' Where DurumId = " + Session["sDurumId"].ToString() + "");


                    ////////////////////BUYUK RESİM BİTİR////////////////////
                    ///
                    #endregion
                }
            }
        }
    }
}