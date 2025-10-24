using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;

namespace GedizMakina.user
{
    public partial class user : System.Web.UI.MasterPage
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["sLoginId"].ToString() == null)
                {
                    Response.Redirect("/giris");
                }
                else
                {
                    if (Session["sYetki"].ToString() != "1000000002")
                    {
                        Response.Redirect("/giris");
                    }
                    else
                    {
                        DataRow dr2 = cn.DataRowGetir("Select Sozlesme From Cariler Where CariId = " + Session["sLoginId"].ToString() + "");

                        if (Convert.ToBoolean(dr2["Sozlesme"].ToString()) == false)
                        {
                            DataRow drSozlesme = cn.DataRowGetir("Select * From SiteYazilari Where YaziId = 1");
                            ltrSozlesme.Text = drSozlesme["Yazi"].ToString();
                            poSozlesme.ShowOnPageLoad = true;
                        }

                        lblPageName.InnerText = Page.Title;
                        lblPageName2.InnerText = Page.Title;

                        DataRow dr = cn.DataRowGetir("Select * From Cariler Where CariId = " + Session["sLoginId"].ToString() + "");
                        lblKullaniciIsim.InnerText = dr["Yetkili"].ToString();
                        lblKullaniciFirma.InnerText = dr["CariAdi"].ToString();

                        SepetKontrol();

                        DataRow drDoviz = cn.DataRowGetir("SELECT TOP (1) dg.EUR, dg.USD FROM DovizGunluk dg ORDER BY Tarih DESC");
                        lblEur.InnerText = drDoviz["EUR"].ToString();
                        lblUsd.InnerText = drDoviz["USD"].ToString();
                    }
                    
                }
            }
        }

        public void SepetKontrol()
        {
            SqlDataAdapter da = new SqlDataAdapter("Select ISNULL(SUM(Miktar),0) Miktar From Sepet Where CariId = " + Session["sLoginId"].ToString() + "", cn._Baglan());
            DataTable dt = new DataTable();
            da.Fill(dt);
            lblSepetMiktar.InnerText = dt.Rows[0]["Miktar"].ToString();
        }

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            Session["sSearchText"] = txtSearch.Value;
            Response.Redirect("/arama-sonuclari");
        }

        protected void btnSozlesmeOnay_Click(object sender, EventArgs e)
        {
            SqlCommand cm = new SqlCommand("Update Cariler SET Sozlesme = 'True', SozlesmeOnayTarihi = GETDATE() Where CariId = " + Session["sLoginId"].ToString() + "", cn._Baglan());

            if (cm.ExecuteNonQuery()!=0)
            {
                DataRow dr = cn.DataRowGetir("Select COUNT(*)Sayi From GirisBilgi Where CariId = " + Session["sLoginId"].ToString() + "");

                if (Convert.ToInt32(dr["Sayi"].ToString()) == 1)
                {
                    poSozlesme.HeaderText = "Parola Değişikliği";
                    ASPxPopupControl1.ShowOnPageLoad = true;
                }
            }
        }

        protected void btnSifreGuncelle_Click(object sender, EventArgs e)
        {
            string _parola = FormsAuthentication.HashPasswordForStoringInConfigFile(txtEskiSifre.Text, "MD5");
            string _parolaYeni = FormsAuthentication.HashPasswordForStoringInConfigFile(txtYeniSifre.Text, "MD5");
            string _parolaYeniTekrar = FormsAuthentication.HashPasswordForStoringInConfigFile(txtYeniSifreTekrar.Text, "MD5");

            SqlDataAdapter da = new SqlDataAdapter("Select * From Cariler Where CariId = " + Session["sLoginId"].ToString() + "", cn._Baglan());
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows[0]["Parola"].ToString() != _parola)
            {
                lblUyariSifre.Text = "Mevcut şifreniz hatalı";
            }
            else
            {
                if (_parolaYeni != _parolaYeniTekrar)
                {
                    lblUyariSifre.Text = "Yeni parolanız eşleşmedi";
                }
                else
                {
                    cn.InsUpdDel("Update Cariler SET Parola = '" + _parolaYeni + "' Where CariId = " + Session["sLoginId"].ToString() + "");

                    Response.Redirect("/cikis");
                }
            }
        }
    }
}