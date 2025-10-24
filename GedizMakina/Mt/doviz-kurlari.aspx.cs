using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace GedizMakina.Mt
{
    public partial class doviz_kurlari : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
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
                cn.InsUpdDel("Insert Into DovizGunluk (Tarih, EUR, USD) Values ('" + Convert.ToDateTime(dtTarih.Date).ToString("yyyy-MM-dd") + "', '" + txtEur.Text.Replace(",", ".") + "', '" + txtUsd.Text.Replace(",", ".") + "')");

                lblUyari.Text = "Günlük döviz kuru kaydedildi";
            }
            catch (Exception ex)
            {
                lblUyari.Text = ex.Message.ToString();
            }
        }
    }
}