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
    public partial class markalar : System.Web.UI.Page
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
            DataRow dr = cn.DataRowGetir("Select MAX(SN) + 1 Sira From Markalar");

            try
            {
                SqlCommand cm = new SqlCommand("Insert Into Markalar " +
                    "(" +
                    "MarkaAdi, " +
                    "MarkaPath, " +
                    "SN" +
                    ") " +
                    "Values " +
                    "(" +
                    "'" + txtMarka.Text + "', " +
                    "'/marka/'+dbo.KodOlustur(dbo.KodOlustur('" + txtMarka.Text + "')), " +
                    "'" + dr["Sira"].ToString() + "')", cn._Baglan());

                if (cm.ExecuteNonQuery()!=0)
                {
                    string selectIdentity = "Select IDENT_CURRENT('Markalar')";
                    SqlCommand commIdentity = new SqlCommand(selectIdentity, cn._Baglan());
                    object oVal = null;
                    int iVal = 0;

                    oVal = commIdentity.ExecuteScalar();
                    if (oVal != null & oVal != DBNull.Value)
                    {
                        iVal = Convert.ToInt32(oVal);
                        Session["sMarkaId"] = iVal;
                    }

                    cn.InsUpdDel("Update Markalar SET MarkaLogo = '" + Session["sResimAdiTam"].ToString() + "' Where MarkaId = " + Session["sMarkaId"].ToString() + "");

                    txtMarka.Text = "";
                    gvMarkalar.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblUyari.Text = ex.Message.ToString();
            }
        }

        protected void ucIkon_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
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

                    Session["sResimAdiTam"] = "/Resimler/markaresimleri/" + Session["sResimAdi"].ToString();
                    #region ResimBoyutlandir

                    ////////////////////BUYUK RESİM BAŞLA////////////////////
                    //Orijinal Resmi Kaydet
                    e.UploadedFile.SaveAs(Server.MapPath("/Resimler/markaresimleri/" + Session["sResimAdi"].ToString()));

                    //cn.InsUpdDel("Update Markalar SET MarkaLogo = '" + Session["sResimAdiTam"].ToString() + "' Where MarkaId = " + Session["sMarkaId"].ToString() + "");


                    ////////////////////BUYUK RESİM BİTİR////////////////////
                    ///
                    #endregion
                }
            }
        }

     
    }
}