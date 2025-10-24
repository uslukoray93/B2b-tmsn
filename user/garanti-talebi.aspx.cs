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
    public partial class garanti_talebi : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataRow dr = cn.DataRowGetir("Select CariAdi, Adres1, Sehir, Ilce, Telefon, Eposta From Cariler Where CariId = " + Session["sLoginId"].ToString() + "");
                txtCariAdi.Text = dr["CariAdi"].ToString();
                txtCariAdres.Text = dr["Adres1"].ToString();
                txtCariSehir.Text = dr["Sehir"].ToString();
                txtCariIlce.Text = dr["Ilce"].ToString();
                txtCariTelefon.Text = dr["Telefon"].ToString();
                txtCariEposta.Text = dr["Eposta"].ToString();
            }
        }

        protected void rblGarantiTip_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblGarantiTip.SelectedValue == "1")
            {
                lblSeriNo.Visible = true;
                txtSeriNo.Visible = true;
                lblParcalar.Visible = true;
                btnParcaEkle.Visible = true;
            }
            else
            {
                lblSeriNo.Visible = false;
                txtSeriNo.Visible = false;
                lblParcalar.Visible = false;
                btnParcaEkle.Visible = false;
            }
        }

        protected void ddUrunKodu_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataRow dr = cn.DataRowGetir("Select sd.DetayId, sd.SiparisId, sd.UrunId, (Select format(s.SiparisTarihi, 'dd.MM.yyyy') From Siparisler s Where s.SiparisId = sd.SiparisId) SatisTarihi, stk.STA UrunAdi From SiparisDetay sd Inner Join Urunler ur ON ur.UrunId = sd.UrunId INNER JOIN[GEDIZLINK].DENEME_2024T.dbo.STOKGEN stk ON ur.RefId = stk.REF Where sd.DetayId = " + ddUrunKodu.Value + "");

            txtUrunAdi.Text = dr["UrunAdi"].ToString();
            txtUretici.Text = "";
            txtSatisTarihi.Text = dr["SatisTarihi"].ToString();
            lblUrunId.Text = dr["UrunId"].ToString();
        }

        protected void btnGonder_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cm = new SqlCommand("Insert Into GarantiTalepleri (GarantiTipId, CariId, SiparisDetayId, UrunId, SeriNo, Aciklama, FaturaNo, MamulSahibi, MamulSahibiTelefon, FaturaResim, UrunResim, UrunVideo) Values (" + rblGarantiTip.SelectedValue + ", " + Session["sLoginId"].ToString() + ", " + ddUrunKodu.Value + ", " + lblUrunId.Text + ", '" + txtSeriNo.Text + "', '" + txtAciklama.Text + "', '" + txtFaturaNo.Text + "', '" + txtMamulSahibi.Text + "', '" + txtMamulSahibiTelefon.Text + "', 'FaturaResim', 'UrunResim', 'UrunVideo')", cn._Baglan());

                if (cm.ExecuteNonQuery()!=0)
                {
                    Response.Redirect("/garanti-takibi");
                }
            }
            catch (Exception ex)
            {
                lblUyari.Text = ex.Message.ToString();
            }
        }
    }
}