using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DevExpress.Web;

namespace GedizMakina.Mt
{
    public partial class cari_detay : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CariGetir();
                DateTime _YilinIlkGunu = new DateTime(DateTime.Now.Year, 1, 1);
                dtSiparisBaslangic.Date = Convert.ToDateTime(_YilinIlkGunu.ToString());
                dtSiparisBitis.Date = Convert.ToDateTime(DateTime.Now.ToShortDateString());
            }
        }

        #region Cari Bilgileri
        void CariGetir()
        {
            SqlCommand cm = new SqlCommand("spCariBilgiGetir", cn._Baglan());
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@CariId", Session["sCariId"].ToString());

            SqlDataAdapter da = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            da.Fill(dt);

            Page.Title = dt.Rows[0]["CariAdi"].ToString() + ", cari detay";
            txtCariAdi.Text = dt.Rows[0]["CariAdi"].ToString();
            txtCariKodu.Text = dt.Rows[0]["CariKodu"].ToString();
            txtYetkili.Text = dt.Rows[0]["Yetkili"].ToString();
            txtGorev.Text = dt.Rows[0]["Gorev"].ToString();
            txtTelefon.Text = dt.Rows[0]["Telefon"].ToString();
            txtEposta.Text = dt.Rows[0]["Eposta"].ToString();
            txtAdres1.Text = dt.Rows[0]["Adres1"].ToString();
            txtAdres2.Text = dt.Rows[0]["Adres2"].ToString();
            txtSehir.Text = dt.Rows[0]["Sehir"].ToString();
            txtIlce.Text = dt.Rows[0]["Ilce"].ToString();
            txtVergiDairesi.Text = dt.Rows[0]["VergiDairesi"].ToString();
            txtVergiNo.Text = dt.Rows[0]["VergiNo"].ToString();
            txtIskontoOran.Text = dt.Rows[0]["IskontoOran"].ToString();
            txtLimit.Text = dt.Rows[0]["KalanLimit"].ToString();

            if (Convert.ToBoolean(dt.Rows[0]["LimitAc"].ToString()) == true)
            {
                txtLimit.Enabled = true;
            }
            else
            {
                txtLimit.Enabled = false;
            }
        }
        void CariBilgiGetir()
        {
            SqlCommand cm = new SqlCommand("spCariBilgiGetir", cn._Baglan());
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@CariId", Session["sCariId"].ToString());

            SqlDataAdapter da = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            da.Fill(dt);

            Page.Title = dt.Rows[0]["CariAdi"].ToString() + ", cari detay";
            txtCariAdi.Text = dt.Rows[0]["CariAdi"].ToString();
            txtCariKodu.Text = dt.Rows[0]["CariKodu"].ToString();
            txtYetkili.Text = dt.Rows[0]["Yetkili"].ToString();
            txtGorev.Text = dt.Rows[0]["Gorev"].ToString();
            txtTelefon.Text = dt.Rows[0]["Telefon"].ToString();
            txtEposta.Text = dt.Rows[0]["Eposta"].ToString();
            txtAdres1.Text = dt.Rows[0]["Adres1"].ToString();
            txtAdres2.Text = dt.Rows[0]["Adres2"].ToString();
            txtSehir.Text = dt.Rows[0]["Sehir"].ToString();
            txtIlce.Text = dt.Rows[0]["Ilce"].ToString();
            txtVergiDairesi.Text = dt.Rows[0]["VergiDairesi"].ToString();
            txtVergiNo.Text = dt.Rows[0]["VergiNo"].ToString();
            txtIskontoOran.Text = dt.Rows[0]["IskontoOran"].ToString();
            txtLimit.Text = dt.Rows[0]["KalanLimit"].ToString();

            if (Convert.ToBoolean(dt.Rows[0]["LimitAc"].ToString()) == true)
            {
                txtLimit.Enabled = true;
            }
            else
            {
                txtLimit.Enabled = false;
            }
        }

        protected void btnKaydetCariBilgi_Click(object sender, EventArgs e)
        {
            try
            {
                if (Convert.ToBoolean(chkLimitAc.Checked) == true)
                {
                    SqlCommand cm = new SqlCommand("Update Cariler SET Yetkili = '" + txtYetkili.Text + "', Gorev = '" + txtGorev.Text + "', Telefon = '" + txtTelefon.Text + "', Eposta = '" + txtEposta.Text + "', IskontoOran = '" + txtIskontoOran.Text.Replace(",", ".") + "', LimitAc = '" + Convert.ToBoolean(chkLimitAc.Checked) + "', Limit = '" + txtLimit.Text.Replace(",", ".") + "' Where CariId = " + Session["sCariId"].ToString() + "", cn._Baglan());

                    if (cm.ExecuteNonQuery() != 0)
                    {
                        SqlDataAdapter da = new SqlDataAdapter("Select count(*)Sayi From CariBakiye Where CariId = " + Session["sCariId"].ToString() + " And HareketTurId = 1000000018", cn._Baglan());
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count < 1)
                        {
                            cn.InsUpdDel("Insert Into CariBakiye (CariId, BorcTutar, HareketTurId) Values (" + Session["sCariId"].ToString() + ", '" + txtLimit.Text.Replace(",", ".") + "', 1000000018)");
                        }
                        lblUyariCariBilgi.Text = "Cari Bilgileri Güncellendi";
                    }
                }
                else
                {
                    SqlCommand cm = new SqlCommand("Update Cariler SET Yetkili = '" + txtYetkili.Text + "', Gorev = '" + txtGorev.Text + "', Telefon = '" + txtTelefon.Text + "', Eposta = '" + txtEposta.Text + "', IskontoOran = '" + txtIskontoOran.Text.Replace(",", ".") + "', LimitAc = '" + Convert.ToBoolean(chkLimitAc.Checked) + "', Limit = 0 Where CariId = " + Session["sCariId"].ToString() + "", cn._Baglan());

                    if (cm.ExecuteNonQuery() != 0)
                    {
                        lblUyariCariBilgi.Text = "Cari Bilgileri Güncellendi";
                    }
                }
            }
            catch (Exception ex)
            {
                lblUyariCariBilgi.Text = ex.Message.ToString();
            }
        }

        protected void chkLimitAc_CheckedChanged(object sender, EventArgs e)
        {
            if (chkLimitAc.Checked == true)
            {
                txtLimit.Enabled = true;
            }
            else
            {
                txtLimit.Enabled = false;
            }
        }
        #endregion

        #region Siparişler

        protected void btnSiparisGetir_Click(object sender, EventArgs e)
        {
            gvSiparisler.DataBind();
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton LinkButton1 = sender as LinkButton;

            var container = LinkButton1.NamingContainer as GridViewDataItemTemplateContainer;
            int id = Convert.ToInt32(gvSiparisler.GetRowValues(container.VisibleIndex, gvSiparisler.KeyFieldName));
            Session["sSiparisId"] = id;

            Response.Redirect("/mt/siparis/?sid=" + Session["sSiparisId"].ToString());
        }

        #endregion

        #region Garantiler
        #endregion

        #region İadeler
        protected void gvIadeTalepleri_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "btnOnay")
            {
                cn.InsUpdDel("Update IadeTalepleri SET DurumId = 1000000024 Where TalepId = " + gvIadeTalepleri.GetRowValues(e.VisibleIndex, "TalepId") + "");

                gvIadeTalepleri.DataBind();
            }
            if (e.ButtonID == "btnRet")
            {
                cn.InsUpdDel("Update IadeTalepleri SET DurumId = 1000000025 Where TalepId = " + gvIadeTalepleri.GetRowValues(e.VisibleIndex, "TalepId") + "");

                gvIadeTalepleri.DataBind();
            }
        }
        #endregion

        #region Servis Talepleri
        #endregion

        #region Cari Adresleri
        #endregion

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            LinkButton LinkButton1 = sender as LinkButton;

            var container = LinkButton1.NamingContainer as GridViewDataItemTemplateContainer;
            int id = Convert.ToInt32(gvIadeTalepleri.GetRowValues(container.VisibleIndex, gvIadeTalepleri.KeyFieldName));

            DataRow dr = cn.DataRowGetir("Select * From IadeTalepleri Where TalepId = " + id + "");

            Session["sSiparisId"] = dr["SiparisId"].ToString();

            Response.Redirect("/mt/siparis/?sid=" + Session["sSiparisId"].ToString());
        }
    }
}