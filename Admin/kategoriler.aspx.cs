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
    public partial class kategoriler : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["sSayfaAdi"] = "Kategoriler";
            }
        }
        protected void gvKategori_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "btnAltKategori")
            {
                Session["sUstKategoriIds"] = gvKategori.GetRowValues(e.VisibleIndex, "KategoriId");
                Session["sUstKategoriAdis"] = gvKategori.GetRowValues(e.VisibleIndex, "KategoriAdi");
                lblUstKategoriIdYeni.Text = Session["sUstKategoriIds"].ToString();
                lblKategoriAdi.Text = Session["sUstKategoriAdis"].ToString() + " kategorisi altında işlem yapıyorsunuz.";
                gvKategori.DataSourceID = null;
                gvKategori.DataSource = dsAltKategori;
                gvKategori.Settings.ShowTitlePanel = true;
                gvKategori.DataBind();
                lblKategori.Text = Session["sUstKategoriAdis"].ToString();
                btnGeri.Enabled = true;
            }
            if (e.ButtonID == "btnDuzenle")
            {
                Session["sKategoriId"] = gvKategori.GetRowValues(e.VisibleIndex, "KategoriId");
                txtKategoriAdi.Text = gvKategori.GetRowValues(e.VisibleIndex, "KategoriAdi").ToString();
                //ASPxTextBox3.Text = gvKategori.GetRowValues(e.VisibleIndex, "KategoriPath").ToString();
                lblUstKategoriId.Text = "0";
            }
            if (e.ButtonID == "btnSil")
            {
                cn.InsUpdDel("Delete From Kategoriler Where KategoriId = '" + gvKategori.GetRowValues(e.VisibleIndex, "KategoriId") + "'");
                gvKategori.DataBind();
            }
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            try
            {
                if (lblUstKategoriId.Text == "0")
                {
                    //KATEGORİ DÜZENLEME
                    SqlCommand cm = new SqlCommand("Update Kategoriler SET KategoriAdi = '" + txtKategoriAdi.Text + "', KategoriPath = '/kategori/' + dbo.KodOlustur(dbo.KodOlustur('" + txtKategoriAdi.Text + "')) Where KategoriId = " + Session["sKategoriId"].ToString() + "", cn._Baglan());
                    //SqlCommand cm = new SqlCommand("Insert Into Kategoriler (KategoriAdi, KategoriPath) Values ('" + txtKategoriAdi.Text + "', '/kategori/' + dbo.KodOlustur(dbo.KodOlustur('" + txtKategoriAdi.Text + "')))", cn._Baglan());
                    if (cm.ExecuteNonQuery() != 0)
                    {
                        txtKategoriAdi.Text = "";
                        gvKategori.DataSourceID = null;
                        gvKategori.DataSource = dsAltKategori;
                        gvKategori.DataBind();
                        txtKategoriAdi.Focus();
                    }
                }
                else if (lblUstKategoriId.Text == "2")
                {
                    if (lblUstKategoriIdYeni.Text == "999")
                    {
                        DataRow dr = cn.DataRowGetir("Select MAX(SiraNo) + 1 SiraNo From Kategoriler");

                        //YENİ KATEGORİ EKLEME
                        SqlCommand cm = new SqlCommand("Insert Into Kategoriler (UstKategoriId, KategoriAdi, KategoriPath, SiraNo) Values (NULL, '" + txtKategoriAdi.Text + "', '/kategori/'+dbo.KodOlustur(dbo.KodOlustur('" + txtKategoriAdi.Text + "')), " + Convert.ToInt32(dr["SiraNo"].ToString()) + ")", cn._Baglan());
                        if (cm.ExecuteNonQuery() != 0)
                        {
                            txtKategoriAdi.Text = "";
                            gvKategori.DataBind();
                            txtKategoriAdi.Focus();
                        }
                    }
                    else
                    {
                        DataRow dr = cn.DataRowGetir("Select MAX(SiraNo) + 1 SiraNo From Kategoriler");
                        //ALT KATEGORİYE YENİ KATEGORİ EKLEME
                        string _UstKategoriAdi = Session["sUstKategoriAdis"].ToString();

                        SqlCommand cm = new SqlCommand("Insert Into Kategoriler (UstKategoriId, KategoriAdi, KategoriPath, SiraNo) Values ('" + lblUstKategoriIdYeni.Text + "', '" + txtKategoriAdi.Text + "', '/kategori/'+dbo.KodOlustur(dbo.KodOlustur('" + _UstKategoriAdi + "'))+'/'+dbo.KodOlustur(dbo.KodOlustur('" + txtKategoriAdi.Text + "')), " + Convert.ToInt32(dr["SiraNo"].ToString()) + ")", cn._Baglan());
                        if (cm.ExecuteNonQuery() != 0)
                        {
                            txtKategoriAdi.Text = "";
                            gvKategori.DataSource = dsAltKategori;
                            gvKategori.Settings.ShowTitlePanel = true;
                            gvKategori.DataBind();
                            txtKategoriAdi.Focus();
                        }
                    }
                    
                }

            }
            catch (Exception ex)
            {
                lblUyari.Text = ex.Message.ToString();
            }
        }

        protected void btnGeri_Click(object sender, EventArgs e)
        {
            SqlDataAdapter da = new SqlDataAdapter("Select * From Kategoriler Where KategoriId = '" + lblUstKategoriIdYeni.Text + "'", cn._Baglan());
            DataTable dt = new DataTable();
            da.Fill(dt);
            lblUstKategoriId.Text = dt.Rows[0]["UstKategoriId"].ToString();

            if (lblUstKategoriId.Text == "")
            {
                gvKategori.DataSourceID = null;
                gvKategori.DataSource = dsAnaKategori;
                gvKategori.DataBind();
            }
            else
            {
                gvKategori.DataSourceID = null;
                gvKategori.DataSource = dsAltKategori;
                gvKategori.DataBind();
            }
        }
    }
}