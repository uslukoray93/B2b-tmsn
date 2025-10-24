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
    public partial class iade_ucret : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        App_Code.Tools tool = new App_Code.Tools();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //SqlCommand cm = new SqlCommand("Select CariId, CariKodu, CariAdi From Cariler Where YetkiId = 1000000002 Order By 3", cn._Baglan());
                //SqlDataReader dr = cm.ExecuteReader();

                //ddCariler.DataSource = dr;
                //ddCariler.ValueField = "CariId";
                //ddCariler.TextField = "CariAdi";
                //ddCariler.DataBind();

                //ddCariler.Items.Insert(0, new DevExpress.Web.ListEditItem("Seçiniz"));
                //ddCariler.SelectedIndex = 0;

            }
        }

        protected void ddHavaleSiparis_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataRow dr = cn.DataRowGetir("Select * From Siparisler Where SiparisId = " + ddHavaleSiparis.Value + "");

            txtSiparisTutari.Text = Convert.ToDecimal(dr["GenelTutar"].ToString()).ToString("N2");
        }

        protected void btnHavale_Click(object sender, EventArgs e)
        {
            if (ddCariler.SelectedIndex < 0)
            {
                lblUyariHavale.Text = "Cari seçmeniz gerekiyor";
            }
            else
            {
                if (ddHavaleSiparis.SelectedIndex < 0)
                {
                    lblUyariHavale.Text = "İade yapılacak siparişi seçmeniz gerekiyor";
                }
                else
                {
                    if (txtIadeTutariHavale.Text.Length < 1 || txtIadeTutariHavale.Text == "0")
                    {
                        lblUyariHavale.Text = "İade tutarı girmeniz gerekiyor";
                    }
                    else
                    {
                        if (Convert.ToDecimal(txtIadeTutariHavale.Text) > Convert.ToDecimal(txtSiparisTutari.Text))
                        {
                            lblUyariHavale.Text = "İade tutarı, sipariş tutarından yüksek olamaz";
                        }
                        else
                        {
                            if (ddBanka.SelectedIndex < 0)
                            {
                                lblUyariHavale.Text = "Havale gönderilen banka seçmeniz gerekiyor";
                            }
                            else
                            {
                                if (txtIbanNo.Text.Length < 26)
                                {
                                    lblUyariHavale.Text = "IBAN numarasını doğru girmelisiniz";
                                }
                                else
                                {
                                    tool.UcretIadesiBas(Convert.ToInt32(ddCariler.Value), Convert.ToInt32(ddHavaleSiparis.Value), 1000001026, Convert.ToInt32(ddBanka.Value), txtIbanNo.Text, Convert.ToDecimal(txtIadeTutariHavale.Text.ToString().Replace(",", ".")));

                                    tool.CariBakiyeBas(Convert.ToInt32(ddHavaleSiparis.Value), Convert.ToInt32(ddCariler.Value), Convert.ToDecimal(txtIadeTutariHavale.Text.ToString().Replace(",", ".")), 1000001026);
                                    tool.CariBakiyeBas(Convert.ToInt32(ddHavaleSiparis.Value), Convert.ToInt32(ddCariler.Value), - Convert.ToDecimal(txtIadeTutariHavale.Text.ToString().Replace(",", ".")), 1000001026);

                                    lblUyariHavale.Text = "İade işlemi tamamlandı";
                                }
                            }
                            
                        }
                    }
                }
            }
        }

        protected void btnKrediKarti_Click(object sender, EventArgs e)
        {
            if (ddCariler.SelectedIndex < 0)
            {
                lblUyariKk.Text = "Cari seçmeniz gerekiyor";
            }
            else
            {
                if (ddKartSiparis.SelectedIndex < 0)
                {
                    lblUyariKk.Text = "İade yapılacak siparişi seçmeniz gerekiyor";
                }
                else
                {
                    if (txtIadeTutariKK.Text.Length < 1 || txtIadeTutariKK.Text == "0")
                    {
                        lblUyariKk.Text = "İade tutarı girmeniz gerekiyor";
                    }
                    else
                    {
                        if (Convert.ToDecimal(txtIadeTutariKK.Text) > Convert.ToDecimal(txtSiparisTutariKK.Text))
                        {
                            lblUyariKk.Text = "İade tutarı, sipariş tutarından yüksek olamaz";
                        }
                        else
                        {
                            if (ddBankalarKK.SelectedIndex < 0)
                            {
                                lblUyariKk.Text = "Havale gönderilen banka seçmeniz gerekiyor";
                            }
                            else
                            {
                                if (txtKartNo.Text.Length < 26)
                                {
                                    lblUyariKk.Text = "IBAN numarasını doğru girmelisiniz";
                                }
                                else
                                {
                                    tool.UcretIadesiBas(Convert.ToInt32(ddCariler.Value), Convert.ToInt32(ddHavaleSiparis.Value), 1000001026, Convert.ToInt32(ddBankalarKK.Value), txtKartNo.Text, Convert.ToDecimal(txtIadeTutariKK.Text.ToString().Replace(",", ".")));

                                    lblUyariKk.Text = "İade işlemi tamamlandı";
                                }
                            }

                        }
                    }
                }
            }
        }
    }
}