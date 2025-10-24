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
    public partial class iade_nedenleri : System.Web.UI.Page
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

                SqlCommand cm = new SqlCommand("Insert Into IadeNedenleri (TurAdi, SN) Values ('" + txtIadeNedeni.Text + "', '" + dr["Sira"].ToString() + "')", cn._Baglan());

                if (cm.ExecuteNonQuery() != 0)
                {
                    txtIadeNedeni.Text = "";

                    gvSevkiyatSekilleri.DataBind();
                    lblUyari.Text = "İade Nedeni kaydedildi";
                }
            }
            catch (Exception ex)
            {
                lblUyari.Text = ex.Message.ToString();
            }
        }
    }
}