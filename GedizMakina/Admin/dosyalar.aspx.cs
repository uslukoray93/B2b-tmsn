using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace GedizMakina.Admin
{
    public partial class dosyalar : System.Web.UI.Page
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
                    Session["sUzanti"] = uzanti;
                    //resime atanacak yeni ad
                    resimadi = DateTime.Now.Day.ToString() + DateTime.Now.Month +
                        DateTime.Now.Year + DateTime.Now.Hour + DateTime.Now.Second +
                        DateTime.Now.Minute + DateTime.Now.Millisecond + uzanti;

                    Session["sResimAdi"] = resimadi;

                    Session["sResimAdiTam"] = "/Dosyalar/" + Session["sResimAdi"].ToString();
                    #region ResimBoyutlandir

                    ////////////////////BUYUK RESİM BAŞLA////////////////////
                    //Orijinal Resmi Kaydet
                    e.UploadedFile.SaveAs(Server.MapPath("/Dosyalar/" + Session["sResimAdi"].ToString()));

                    


                    ////////////////////BUYUK RESİM BİTİR////////////////////
                    ///
                    #endregion
                }
            }
        }

        protected void ASPxCallbackPanel1_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            if (Session["sUzanti"].ToString() == ".pdf")
            {
                Session["sResimFormat"] = "/img/dosyaikon/pdf.png";
            }
            if (Session["sUzanti"].ToString() == ".doc" || Session["sUzanti"].ToString() == ".docx")
            {
                Session["sResimFormat"] = "/img/dosyaikon/doc.png";
            }
            if (Session["sUzanti"].ToString() == ".jpg" || Session["sUzanti"].ToString() == ".png" || Session["sUzanti"].ToString() == ".bmp" || Session["sUzanti"].ToString() == ".jpeg")
            {
                Session["sResimFormat"] = "/img/dosyaikon/jpg.png";
            }
            if (Session["sUzanti"].ToString() == ".xls" || Session["sUzanti"].ToString() == ".xlsx")
            {
                Session["sResimFormat"] = "/img/dosyaikon/xls.png";
            }

            
        }

        protected void ASPxCallbackPanel2_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            if (Session["sUzanti"].ToString() == ".pdf")
            {
                Session["sResimFormat"] = "/img/dosyaikon/pdf.png";
            }
            if (Session["sUzanti"].ToString() == ".doc" || Session["sUzanti"].ToString() == ".docx")
            {
                Session["sResimFormat"] = "/img/dosyaikon/doc.png";
            }
            if (Session["sUzanti"].ToString() == ".jpg" || Session["sUzanti"].ToString() == ".png" || Session["sUzanti"].ToString() == ".bmp" || Session["sUzanti"].ToString() == ".jpeg")
            {
                Session["sResimFormat"] = "/img/dosyaikon/jpg.png";
            }
            if (Session["sUzanti"].ToString() == ".xls" || Session["sUzanti"].ToString() == ".xlsx")
            {
                Session["sResimFormat"] = "/img/dosyaikon/xls.png";
            }
        }

        protected void ucKapakResim_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
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
                    Session["sUzantiKapak"] = uzanti;
                    //resime atanacak yeni ad
                    resimadi = DateTime.Now.Day.ToString() + DateTime.Now.Month +
                        DateTime.Now.Year + DateTime.Now.Hour + DateTime.Now.Second +
                        DateTime.Now.Minute + DateTime.Now.Millisecond + uzanti;

                    Session["sResimAdiKapak"] = resimadi;

                    Session["sResimAdiTamKapak"] = "/Dosyalar/kapak/" + Session["sResimAdiKapak"].ToString();
                    #region ResimBoyutlandir

                    ////////////////////BUYUK RESİM BAŞLA////////////////////
                    //Orijinal Resmi Kaydet
                    e.UploadedFile.SaveAs(Server.MapPath("/Dosyalar/kapak/" + Session["sResimAdiKapak"].ToString()));




                    ////////////////////BUYUK RESİM BİTİR////////////////////
                    ///
                    #endregion
                }
            }
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            cn.InsUpdDel("Insert Into Dosyalar (DosyaAdi, DosyaYolu, DosyaResim) Values ('" + txtDosyaAdi.Text + "', '" + Session["sResimAdiTam"].ToString() + "', '" + Session["sResimAdiTamKapak"].ToString() + "')");
            txtDosyaAdi.Text = "";
            gvDosyalar.DataBind();
        }

        protected void gvDosyalar_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "btnSil")
            {
                cn.InsUpdDel("Delete From Dosyalar Where DosyaId = '" + gvDosyalar.GetRowValues(e.VisibleIndex, "DosyaId") + "'");
                gvDosyalar.DataBind();
            }
        }
    }
}