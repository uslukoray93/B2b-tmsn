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
    public partial class hesabim : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CariGetir();
            }
        }

        void CariGetir()
        {
            SqlCommand cm = new SqlCommand("spCariBilgiGetir", cn._Baglan());
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@CariId", Session["sLoginId"].ToString());

            SqlDataAdapter da = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            da.Fill(dt);

            txtAdres.Text = dt.Rows[0]["Adres1"].ToString();
            txtSehir.Text = dt.Rows[0]["Sehir"].ToString();
            txtIlce.Text = dt.Rows[0]["Ilce"].ToString();
            txtVergiDairesi.Text = dt.Rows[0]["VergiDairesi"].ToString();
            txtVergiNo.Text = dt.Rows[0]["VergiNo"].ToString();
            txtTelefon.Text = dt.Rows[0]["Telefon"].ToString();
            txtEposta.Text = dt.Rows[0]["Eposta"].ToString();

            txtKayitAdres.Text = dt.Rows[0]["Adres1"].ToString();
            txtKayitSehir.Text = dt.Rows[0]["Sehir"].ToString();
            txtKayitIlce.Text = dt.Rows[0]["Ilce"].ToString();
            txtKayitVergiDairesi.Text = dt.Rows[0]["VergiDairesi"].ToString();
            txtKayitVergiNo.Text = dt.Rows[0]["VergiNo"].ToString();
            txtKayitTelefon.Text = dt.Rows[0]["Telefon"].ToString();
            txtKayitEposta.Text = dt.Rows[0]["Eposta"].ToString();

            Session["sCariKod"] = dt.Rows[0]["CariKodu"].ToString();
        }

        protected void btnKaydetBilgiler_Click(object sender, EventArgs e)
        {
            cn.InsUpdDel("Update Cariler SET Adres1 = '" + txtKayitAdres.Text + "', Sehir = '" + txtKayitSehir.Text + "', Ilce = '" + txtKayitIlce.Text + "', VergiDairesi = '" + txtKayitVergiDairesi.Text + "', VergiNo = '" + txtKayitVergiNo.Text + "', Telefon = '" + txtKayitTelefon.Text + "', Eposta = '" + txtKayitEposta.Text + "' Where CariId = " + Session["sLoginId"].ToString() + "");

            cn.InsUpdDel("Update [GEDIZLINK].Gediz.dbo.CARIGEN SET ADRES1 = '" + txtKayitAdres.Text + "', SEHIR = '" + txtKayitSehir.Text + "', SEMT = '" + txtKayitIlce.Text + "', VERGID = '" + txtKayitVergiDairesi.Text + "', VERGINO = '" + txtKayitVergiNo.Text + "', TEL = '" + txtKayitTelefon.Text + "', EPOSTA = '" + txtKayitEposta.Text + "' Where CRK = '" + Session["sCariKod"].ToString() + "'");
        }

        protected void btnKaydetSifre_Click(object sender, EventArgs e)
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

                    lblUyariSifre.Text = "Parolanız başarıyla güncellendi";
                }
            }
        }

        protected void btnKaydetYeniAdres_Click(object sender, EventArgs e)
        {

        }
    }
}