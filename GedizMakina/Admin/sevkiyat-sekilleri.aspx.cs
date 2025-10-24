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
    public partial class sevkiyat_sekilleri : System.Web.UI.Page
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
                DataRow dr = cn.DataRowGetir("Select MAX(SN) + 1 Sira From SevkiyatTurleri");

                SqlCommand cm = new SqlCommand("Insert Into SevkiyatTurleri (TurAdi, SN) Values ('" + txtSevkiyatSekli.Text + "', '" + dr["Sira"].ToString() + "')", cn._Baglan());

                if (cm.ExecuteNonQuery() != 0)
                {
                    txtSevkiyatSekli.Text = "";

                    gvSevkiyatSekilleri.DataBind();
                    lblUyari.Text = "Sevkiyat şekli kaydedildi";
                }
            }
            catch (Exception ex)
            {
                lblUyari.Text = ex.Message.ToString();
            }
        }
    }
}