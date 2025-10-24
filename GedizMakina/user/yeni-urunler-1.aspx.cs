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
    public partial class yeni_urunler_1 : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        int _First = 1;
        int _Last = 40;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddMarka.DataBind();
                ddKategori.DataBind();
                ddAltKategori.DataBind();

                SayfaNogetir();
            }
        }

        void SayfaNogetir()
        {

            lblSayfaNo.Text = Convert.ToInt32(ASPxPager1.PageIndex + 1).ToString();

            if (lblSayfaNo.Text == "1")
            {
                Session["sFirst"] = _First;
                Session["sLast"] = _Last;
            }
            else
            {
                Session["sFirst"] = ((_Last * Convert.ToInt32(lblSayfaNo.Text)) - _Last) + 1;
                Session["sLast"] = _Last * Convert.ToInt32(lblSayfaNo.Text);
            }
            GetRepeater();
        }
        protected void ASPxPager1_PageIndexChanged(object sender, EventArgs e)
        {
            SayfaNogetir();
        }
        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            Session["sSearchText"] = txtSearch.Value;
            Response.Redirect("/arama-sonuclari");
        }
        void GetRepeater()
        {
            if (ddMarka.SelectedValue == "1000000007" && ddKategori.SelectedValue == "1000000075" && ddAltKategori.SelectedValue == "1000000075" && chkKampanya.Checked == false && chkYeniUrun.Checked == false)
            {
                //HİÇBİR ŞEY SEÇİLİ DEĞİLSE
                //spUrunListesi (@First INT, @Last INT)
                SqlCommand cm = new SqlCommand("spUrunListesiCount", cn._Baglan());
                cm.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(cm);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (Convert.ToInt32(dt.Rows[0]["Sayi"].ToString()) > _Last)
                {
                    ASPxPager1.ItemCount = Convert.ToInt32(dt.Rows[0]["Sayi"].ToString());
                    ASPxPager1.ItemsPerPage = _Last;
                    ASPxPager1.Visible = true;
                }
                else
                {
                    ASPxPager1.Visible = false;
                }

                repUrunler.DataSourceID = null;
                repUrunler.DataSource = dsUrunGetir;
                repUrunler.DataBind();
            }
            if (ddMarka.SelectedValue != "1000000007" && ddKategori.SelectedValue == "1000000075" && ddAltKategori.SelectedValue == "1000000075" && chkKampanya.Checked == false && chkYeniUrun.Checked == false)
            {
                //TEK BAŞINA MARKA SEÇİLİYSE
                //spUL01 (@First INT, @Last INT, @MarkaId int)

                SqlCommand cm = new SqlCommand("spUL01Count", cn._Baglan());
                cm.CommandType = CommandType.StoredProcedure;
                cm.Parameters.AddWithValue("@MarkaId", ddMarka.SelectedValue);

                SqlDataAdapter da = new SqlDataAdapter(cm);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (Convert.ToInt32(dt.Rows[0]["Sayi"].ToString()) > _Last)
                {
                    ASPxPager1.ItemCount = Convert.ToInt32(dt.Rows[0]["Sayi"].ToString());
                    ASPxPager1.ItemsPerPage = _Last;
                    ASPxPager1.Visible = true;
                }
                else
                {
                    ASPxPager1.Visible = false;
                }

                repUrunler.DataSourceID = null;
                repUrunler.DataSource = dsUL01;
                repUrunler.DataBind();
            }
            if (ddMarka.SelectedValue == "1000000007" && ddKategori.SelectedValue != "1000000075" && ddAltKategori.SelectedValue == "1000000075" && chkKampanya.Checked == false && chkYeniUrun.Checked == false)
            {
                //TEK BAŞINA KATEGORİ SEÇİLİYSE
                //spUL02 (@First INT, @Last INT, @KategoriId int)

                SqlCommand cm = new SqlCommand("spUL02Count", cn._Baglan());
                cm.CommandType = CommandType.StoredProcedure;
                cm.Parameters.AddWithValue("@KategoriId", ddKategori.SelectedValue);

                SqlDataAdapter da = new SqlDataAdapter(cm);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (Convert.ToInt32(dt.Rows[0]["Sayi"].ToString()) > _Last)
                {
                    ASPxPager1.ItemCount = Convert.ToInt32(dt.Rows[0]["Sayi"].ToString());
                    ASPxPager1.ItemsPerPage = _Last;
                    ASPxPager1.Visible = true;
                }
                else
                {
                    ASPxPager1.Visible = false;
                }


                repUrunler.DataSourceID = null;
                repUrunler.DataSource = dsUL02;
                repUrunler.DataBind();
            }
            if (ddMarka.SelectedValue == "1000000007" && ddKategori.SelectedValue != "1000000075" && ddAltKategori.SelectedValue != "1000000075" && chkKampanya.Checked == false && chkYeniUrun.Checked == false)
            {
                //TEK BAŞINA KATEGORİ VE ALT KATEGORİ SEÇİLİYSE
                //spUL02 (@First INT, @Last INT, @KategoriId int)

                SqlCommand cm = new SqlCommand("spUL02Count", cn._Baglan());
                cm.CommandType = CommandType.StoredProcedure;
                cm.Parameters.AddWithValue("@KategoriId", ddAltKategori.SelectedValue);

                SqlDataAdapter da = new SqlDataAdapter(cm);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (Convert.ToInt32(dt.Rows[0]["Sayi"].ToString()) > _Last)
                {
                    ASPxPager1.ItemCount = Convert.ToInt32(dt.Rows[0]["Sayi"].ToString());
                    ASPxPager1.ItemsPerPage = _Last;
                    ASPxPager1.Visible = true;
                }
                else
                {
                    ASPxPager1.Visible = false;
                }


                repUrunler.DataSourceID = null;
                repUrunler.DataSource = dsUL02;
                repUrunler.DataBind();
            }
            if (ddMarka.SelectedValue == "1000000007" && ddKategori.SelectedValue == "1000000075" && ddAltKategori.SelectedValue == "1000000075" && chkKampanya.Checked == true && chkYeniUrun.Checked == false)
            {
                //TEK BAŞINA KAMPANYA SEÇİLİYSE
                //spUL03 (@First INT, @Last INT)

                SqlCommand cm = new SqlCommand("spUL03Count", cn._Baglan());
                cm.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(cm);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (Convert.ToInt32(dt.Rows[0]["Sayi"].ToString()) > _Last)
                {
                    ASPxPager1.ItemCount = Convert.ToInt32(dt.Rows[0]["Sayi"].ToString());
                    ASPxPager1.ItemsPerPage = _Last;
                    ASPxPager1.Visible = true;
                }
                else
                {
                    ASPxPager1.Visible = false;
                }


                repUrunler.DataSourceID = null;
                repUrunler.DataSource = dsUL03;
                repUrunler.DataBind();
            }
            if (ddMarka.SelectedValue == "1000000007" && ddKategori.SelectedValue == "1000000075" && ddAltKategori.SelectedValue == "1000000075" && chkKampanya.Checked == false && chkYeniUrun.Checked == true)
            {
                //TEK BAŞINA YENİ ÜRÜN SEÇİLİYSE
                //spUL04 (@First INT, @Last INT)

                SqlCommand cm = new SqlCommand("spUL04Count", cn._Baglan());
                cm.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(cm);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (Convert.ToInt32(dt.Rows[0]["Sayi"].ToString()) > _Last)
                {
                    ASPxPager1.ItemCount = Convert.ToInt32(dt.Rows[0]["Sayi"].ToString());
                    ASPxPager1.ItemsPerPage = _Last;
                    ASPxPager1.Visible = true;
                }
                else
                {
                    ASPxPager1.Visible = false;
                }

                repUrunler.DataSourceID = null;
                repUrunler.DataSource = dsUL04;
                repUrunler.DataBind();
            }
            if (ddMarka.SelectedValue != "1000000007" && ddKategori.SelectedValue != "1000000075" && ddAltKategori.SelectedValue == "1000000075" && chkKampanya.Checked == false && chkYeniUrun.Checked == false)
            {
                //TEK BAŞINA MARKA VE KATEGORİ SEÇİLİYSE
                //spUL05 (@First INT, @Last INT, @KategoriId INT, @MarkaId INT)

                SqlCommand cm = new SqlCommand("spUL05Count", cn._Baglan());
                cm.CommandType = CommandType.StoredProcedure;
                cm.Parameters.AddWithValue("@KategoriId", ddKategori.SelectedValue);
                cm.Parameters.AddWithValue("@MarkaId", ddMarka.SelectedValue);

                SqlDataAdapter da = new SqlDataAdapter(cm);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (Convert.ToInt32(dt.Rows[0]["Sayi"].ToString()) > _Last)
                {
                    ASPxPager1.ItemCount = Convert.ToInt32(dt.Rows[0]["Sayi"].ToString());
                    ASPxPager1.ItemsPerPage = _Last;
                    ASPxPager1.Visible = true;
                }
                else
                {
                    ASPxPager1.Visible = false;
                }

                repUrunler.DataSourceID = null;
                repUrunler.DataSource = dsUL05;
                repUrunler.DataBind();
            }
            if (ddMarka.SelectedValue != "1000000007" && ddKategori.SelectedValue != "1000000075" && ddAltKategori.SelectedValue != "1000000075" && chkKampanya.Checked == false && chkYeniUrun.Checked == false)
            {
                //TEK BAŞINA MARKA VE KATEGORİ VE ALT KATEGORİ SEÇİLİYSE
                //spUL05 (@First INT, @Last INT, @KategoriId INT, @MarkaId INT)

                SqlCommand cm = new SqlCommand("spUL05Count", cn._Baglan());
                cm.CommandType = CommandType.StoredProcedure;
                cm.Parameters.AddWithValue("@KategoriId", ddAltKategori.SelectedValue);
                cm.Parameters.AddWithValue("@MarkaId", ddMarka.SelectedValue);

                SqlDataAdapter da = new SqlDataAdapter(cm);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (Convert.ToInt32(dt.Rows[0]["Sayi"].ToString()) > _Last)
                {
                    ASPxPager1.ItemCount = Convert.ToInt32(dt.Rows[0]["Sayi"].ToString());
                    ASPxPager1.ItemsPerPage = _Last;
                    ASPxPager1.Visible = true;
                }
                else
                {
                    ASPxPager1.Visible = false;
                }

                repUrunler.DataSourceID = null;
                repUrunler.DataSource = dsUL05;
                repUrunler.DataBind();
            }
            if (ddMarka.SelectedValue != "1000000007" && ddKategori.SelectedValue == "1000000075" && ddAltKategori.SelectedValue == "1000000075" && chkKampanya.Checked == true && chkYeniUrun.Checked == false)
            {
                //TEK BAŞINA MARKA VE KAMPANYA SEÇİLİYSE
                //spUL06 (@First INT, @Last INT, @MarkaId int)

                SqlCommand cm = new SqlCommand("spUL06Count", cn._Baglan());
                cm.CommandType = CommandType.StoredProcedure;
                cm.Parameters.AddWithValue("@MarkaId", ddMarka.SelectedValue);

                SqlDataAdapter da = new SqlDataAdapter(cm);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (Convert.ToInt32(dt.Rows[0]["Sayi"].ToString()) > _Last)
                {
                    ASPxPager1.ItemCount = Convert.ToInt32(dt.Rows[0]["Sayi"].ToString());
                    ASPxPager1.ItemsPerPage = _Last;
                    ASPxPager1.Visible = true;
                }
                else
                {
                    ASPxPager1.Visible = false;
                }

                repUrunler.DataSourceID = null;
                repUrunler.DataSource = dsUL06;
                repUrunler.DataBind();
            }
            if (ddMarka.SelectedValue != "1000000007" && ddKategori.SelectedValue == "1000000075" && ddAltKategori.SelectedValue == "1000000075" && chkKampanya.Checked == false && chkYeniUrun.Checked == true)
            {
                //TEK BAŞINA MARKA VE YENİ ÜRÜN SEÇİLİYSE
                //spUL07 (@First INT, @Last INT, @MarkaId int)

                SqlCommand cm = new SqlCommand("spUL07Count", cn._Baglan());
                cm.CommandType = CommandType.StoredProcedure;
                cm.Parameters.AddWithValue("@MarkaId", ddMarka.SelectedValue);

                SqlDataAdapter da = new SqlDataAdapter(cm);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (Convert.ToInt32(dt.Rows[0]["Sayi"].ToString()) > _Last)
                {
                    ASPxPager1.ItemCount = Convert.ToInt32(dt.Rows[0]["Sayi"].ToString());
                    ASPxPager1.ItemsPerPage = _Last;
                    ASPxPager1.Visible = true;
                }
                else
                {
                    ASPxPager1.Visible = false;
                }

                repUrunler.DataSourceID = null;
                repUrunler.DataSource = dsUL07;
                repUrunler.DataBind();
            }
            if (ddMarka.SelectedValue != "1000000007" && ddKategori.SelectedValue != "1000000075" && ddAltKategori.SelectedValue == "1000000075" && chkKampanya.Checked == true && chkYeniUrun.Checked == false)
            {
                //TEK BAŞINA MARKA VE KATEGORİ VE KAMPANYA SEÇİLİYSE
                //spUL08 (@First INT, @Last INT, @MarkaId int, @KategoriId int)

                SqlCommand cm = new SqlCommand("spUL08Count", cn._Baglan());
                cm.CommandType = CommandType.StoredProcedure;
                cm.Parameters.AddWithValue("@KategoriId", ddKategori.SelectedValue);
                cm.Parameters.AddWithValue("@MarkaId", ddMarka.SelectedValue);

                SqlDataAdapter da = new SqlDataAdapter(cm);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (Convert.ToInt32(dt.Rows[0]["Sayi"].ToString()) > _Last)
                {
                    ASPxPager1.ItemCount = Convert.ToInt32(dt.Rows[0]["Sayi"].ToString());
                    ASPxPager1.ItemsPerPage = _Last;
                    ASPxPager1.Visible = true;
                }
                else
                {
                    ASPxPager1.Visible = false;
                }

                repUrunler.DataSourceID = null;
                repUrunler.DataSource = dsUL08;
                repUrunler.DataBind();
            }
            if (ddMarka.SelectedValue != "1000000007" && ddKategori.SelectedValue != "1000000075" && ddAltKategori.SelectedValue == "1000000075" && chkKampanya.Checked == false && chkYeniUrun.Checked == true)
            {
                //TEK BAŞINA MARKA VE KATEGORİ VE YENİ ÜRÜN SEÇİLİYSE
                //spUL09 (@First INT, @Last INT, @MarkaId int, @KategoriId int)

                SqlCommand cm = new SqlCommand("spUL09Count", cn._Baglan());
                cm.CommandType = CommandType.StoredProcedure;
                cm.Parameters.AddWithValue("@KategoriId", ddKategori.SelectedValue);
                cm.Parameters.AddWithValue("@MarkaId", ddMarka.SelectedValue);

                SqlDataAdapter da = new SqlDataAdapter(cm);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (Convert.ToInt32(dt.Rows[0]["Sayi"].ToString()) > _Last)
                {
                    ASPxPager1.ItemCount = Convert.ToInt32(dt.Rows[0]["Sayi"].ToString());
                    ASPxPager1.ItemsPerPage = _Last;
                    ASPxPager1.Visible = true;
                }
                else
                {
                    ASPxPager1.Visible = false;
                }

                repUrunler.DataSourceID = null;
                repUrunler.DataSource = dsUL09;
                repUrunler.DataBind();
            }
            if (ddMarka.SelectedValue != "1000000007" && ddKategori.SelectedValue != "1000000075" && ddAltKategori.SelectedValue == "1000000075" && chkKampanya.Checked == true && chkYeniUrun.Checked == true)
            {
                //TEK BAŞINA MARKA VE KATEGORİ VE KAMPANYA VE YENİ ÜRÜN SEÇİLİYSE
                //spUL10 (@First INT, @Last INT, @MarkaId int, @KategoriId int)

                SqlCommand cm = new SqlCommand("spUL10Count", cn._Baglan());
                cm.CommandType = CommandType.StoredProcedure;
                cm.Parameters.AddWithValue("@KategoriId", ddKategori.SelectedValue);
                cm.Parameters.AddWithValue("@MarkaId", ddMarka.SelectedValue);

                SqlDataAdapter da = new SqlDataAdapter(cm);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (Convert.ToInt32(dt.Rows[0]["Sayi"].ToString()) > _Last)
                {
                    ASPxPager1.ItemCount = Convert.ToInt32(dt.Rows[0]["Sayi"].ToString());
                    ASPxPager1.ItemsPerPage = _Last;
                    ASPxPager1.Visible = true;
                }
                else
                {
                    ASPxPager1.Visible = false;
                }

                repUrunler.DataSourceID = null;
                repUrunler.DataSource = dsUL10;
                repUrunler.DataBind();
            }
            if (ddMarka.SelectedValue != "1000000007" && ddKategori.SelectedValue != "1000000075" && ddAltKategori.SelectedValue != "1000000075" && chkKampanya.Checked == true && chkYeniUrun.Checked == false)
            {
                //TEK BAŞINA MARKA VE KATEGORİ VE ALT KATEGORİ VE KAMPANYA SEÇİLİYSE
                //spUL11 (@First INT, @Last INT, @MarkaId int, @KategoriId int)

                SqlCommand cm = new SqlCommand("spUL11Count", cn._Baglan());
                cm.CommandType = CommandType.StoredProcedure;
                cm.Parameters.AddWithValue("@KategoriId", ddAltKategori.SelectedValue);
                cm.Parameters.AddWithValue("@MarkaId", ddMarka.SelectedValue);

                SqlDataAdapter da = new SqlDataAdapter(cm);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (Convert.ToInt32(dt.Rows[0]["Sayi"].ToString()) > _Last)
                {
                    ASPxPager1.ItemCount = Convert.ToInt32(dt.Rows[0]["Sayi"].ToString());
                    ASPxPager1.ItemsPerPage = _Last;
                    ASPxPager1.Visible = true;
                }
                else
                {
                    ASPxPager1.Visible = false;
                }

                repUrunler.DataSourceID = null;
                repUrunler.DataSource = dsUL11;
                repUrunler.DataBind();
            }
            if (ddMarka.SelectedValue != "1000000007" && ddKategori.SelectedValue != "1000000075" && ddAltKategori.SelectedValue != "1000000075" && chkKampanya.Checked == false && chkYeniUrun.Checked == true)
            {
                //TEK BAŞINA MARKA VE KATEGORİ VE ALT KATEGORİ VE YENİ ÜRÜN SEÇİLİYSE
                //spUL12 (@First INT, @Last INT, @MarkaId int, @KategoriId int)

                SqlCommand cm = new SqlCommand("spUL12Count", cn._Baglan());
                cm.CommandType = CommandType.StoredProcedure;
                cm.Parameters.AddWithValue("@KategoriId", ddAltKategori.SelectedValue);
                cm.Parameters.AddWithValue("@MarkaId", ddMarka.SelectedValue);

                SqlDataAdapter da = new SqlDataAdapter(cm);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (Convert.ToInt32(dt.Rows[0]["Sayi"].ToString()) > _Last)
                {
                    ASPxPager1.ItemCount = Convert.ToInt32(dt.Rows[0]["Sayi"].ToString());
                    ASPxPager1.ItemsPerPage = _Last;
                    ASPxPager1.Visible = true;
                }
                else
                {
                    ASPxPager1.Visible = false;
                }

                repUrunler.DataSourceID = null;
                repUrunler.DataSource = dsUL12;
                repUrunler.DataBind();
            }
            if (ddMarka.SelectedValue != "1000000007" && ddKategori.SelectedValue != "1000000075" && ddAltKategori.SelectedValue != "1000000075" && chkKampanya.Checked == true && chkYeniUrun.Checked == true)
            {
                //TEK BAŞINA MARKA VE KATEGORİ VE ALT KATEGORİ VE KAMPANYA VE YENİ ÜRÜN SEÇİLİYSE
                //spUL13 (@First INT, @Last INT, @MarkaId int, @KategoriId int)

                SqlCommand cm = new SqlCommand("spUL13Count", cn._Baglan());
                cm.CommandType = CommandType.StoredProcedure;
                cm.Parameters.AddWithValue("@KategoriId", ddAltKategori.SelectedValue);
                cm.Parameters.AddWithValue("@MarkaId", ddMarka.SelectedValue);

                SqlDataAdapter da = new SqlDataAdapter(cm);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (Convert.ToInt32(dt.Rows[0]["Sayi"].ToString()) > _Last)
                {
                    ASPxPager1.ItemCount = Convert.ToInt32(dt.Rows[0]["Sayi"].ToString());
                    ASPxPager1.ItemsPerPage = _Last;
                    ASPxPager1.Visible = true;
                }
                else
                {
                    ASPxPager1.Visible = false;
                }

                repUrunler.DataSourceID = null;
                repUrunler.DataSource = dsUL13;
                repUrunler.DataBind();
            }
            if (ddMarka.SelectedValue == "1000000007" && ddKategori.SelectedValue != "1000000075" && ddAltKategori.SelectedValue != "1000000075" && chkKampanya.Checked == true && chkYeniUrun.Checked == false)
            {
                //TEK BAŞINA KATEGORİ VE ALT KATEGORİ VE KAMPANYA SEÇİLİYSE
                //spUL14 (@First INT, @Last INT, @KategoriId int)

                SqlCommand cm = new SqlCommand("spUL14Count", cn._Baglan());
                cm.CommandType = CommandType.StoredProcedure;
                cm.Parameters.AddWithValue("@KategoriId", ddAltKategori.SelectedValue);

                SqlDataAdapter da = new SqlDataAdapter(cm);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (Convert.ToInt32(dt.Rows[0]["Sayi"].ToString()) > _Last)
                {
                    ASPxPager1.ItemCount = Convert.ToInt32(dt.Rows[0]["Sayi"].ToString());
                    ASPxPager1.ItemsPerPage = _Last;
                    ASPxPager1.Visible = true;
                }
                else
                {
                    ASPxPager1.Visible = false;
                }

                repUrunler.DataSourceID = null;
                repUrunler.DataSource = dsUL14;
                repUrunler.DataBind();
            }
            if (ddMarka.SelectedValue == "1000000007" && ddKategori.SelectedValue != "1000000075" && ddAltKategori.SelectedValue != "1000000075" && chkKampanya.Checked == false && chkYeniUrun.Checked == true)
            {
                //TEK BAŞINA KATEGORİ VE ALT KATEGORİ VE YENİ ÜRÜN SEÇİLİYSE
                //spUL15 (@First INT, @Last INT, @KategoriId int)

                SqlCommand cm = new SqlCommand("spUL15Count", cn._Baglan());
                cm.CommandType = CommandType.StoredProcedure;
                cm.Parameters.AddWithValue("@KategoriId", ddAltKategori.SelectedValue);

                SqlDataAdapter da = new SqlDataAdapter(cm);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (Convert.ToInt32(dt.Rows[0]["Sayi"].ToString()) > _Last)
                {
                    ASPxPager1.ItemCount = Convert.ToInt32(dt.Rows[0]["Sayi"].ToString());
                    ASPxPager1.ItemsPerPage = _Last;
                    ASPxPager1.Visible = true;
                }
                else
                {
                    ASPxPager1.Visible = false;
                }

                repUrunler.DataSourceID = null;
                repUrunler.DataSource = dsUL15;
                repUrunler.DataBind();
            }
            if (ddMarka.SelectedValue == "1000000007" && ddKategori.SelectedValue != "1000000075" && ddAltKategori.SelectedValue != "1000000075" && chkKampanya.Checked == true && chkYeniUrun.Checked == true)
            {
                //TEK BAŞINA KATEGORİ VE ALT KATEGORİ VE KAMPANYA VE YENİ ÜRÜN SEÇİLİYSE
                //spUL16 (@First INT, @Last INT, @KategoriId int)

                SqlCommand cm = new SqlCommand("spUL16Count", cn._Baglan());
                cm.CommandType = CommandType.StoredProcedure;
                cm.Parameters.AddWithValue("@KategoriId", ddAltKategori.SelectedValue);

                SqlDataAdapter da = new SqlDataAdapter(cm);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (Convert.ToInt32(dt.Rows[0]["Sayi"].ToString()) > _Last)
                {
                    ASPxPager1.ItemCount = Convert.ToInt32(dt.Rows[0]["Sayi"].ToString());
                    ASPxPager1.ItemsPerPage = _Last;
                    ASPxPager1.Visible = true;
                }
                else
                {
                    ASPxPager1.Visible = false;
                }

                repUrunler.DataSourceID = null;
                repUrunler.DataSource = dsUL16;
                repUrunler.DataBind();
            }
            if (ddMarka.SelectedValue == "1000000007" && ddKategori.SelectedValue == "1000000075" && ddAltKategori.SelectedValue == "1000000075" && chkKampanya.Checked == true && chkYeniUrun.Checked == true)
            {
                //TEK BAŞINA KAMPANYA VE YENİ ÜRÜN SEÇİLİYSE
                //spUL17 (@First INT, @Last INT)

                SqlCommand cm = new SqlCommand("spUL17Count", cn._Baglan());
                cm.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(cm);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (Convert.ToInt32(dt.Rows[0]["Sayi"].ToString()) > _Last)
                {
                    ASPxPager1.ItemCount = Convert.ToInt32(dt.Rows[0]["Sayi"].ToString());
                    ASPxPager1.ItemsPerPage = _Last;
                    ASPxPager1.Visible = true;
                }
                else
                {
                    ASPxPager1.Visible = false;
                }

                repUrunler.DataSourceID = null;
                repUrunler.DataSource = dsUL17;
                repUrunler.DataBind();
            }
        }

        protected void btnArat_Click(object sender, EventArgs e)
        {
            ASPxPager1.PageIndex = 0;
            lblSayfaNo.Text = "1";
            SayfaNogetir();
        }
    }
}