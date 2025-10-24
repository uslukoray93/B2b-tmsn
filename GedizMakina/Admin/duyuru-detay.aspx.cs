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
    public partial class duyuru_detay : System.Web.UI.Page
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
                SqlCommand cm = new SqlCommand("Update Duyurular SET DuyuruBaslik = '" + txtDuyuruBaslik.Text.Replace("'", "''") + "', Aciklama = '" + txtDuyuruAciklama.Html + "' Where DuyuruId = " + Session["sDuyuruId"].ToString() + "", cn._Baglan());

                if (cm.ExecuteNonQuery() != 0)
                {
                    Response.Redirect("/admin/duyurular");
                }
            }
            catch (Exception ex)
            {
                lblUyari.Text = ex.Message.ToString();
            }
        }
    }
}