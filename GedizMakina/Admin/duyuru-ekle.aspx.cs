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
    public partial class duyuru_ekle : System.Web.UI.Page
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
                SqlCommand cm = new SqlCommand("Insert Into Duyurular (DuyuruBaslik, Aciklama) Values ('" + txtDuyuruBaslik.Text.Replace("'", "''") + "', '" + txtDuyuruAciklama.Html + "')", cn._Baglan());
                if (cm.ExecuteNonQuery()!=0)
                {
                    string selectIdentity = "Select IDENT_CURRENT('Duyurular')";
                    SqlCommand commIdentity = new SqlCommand(selectIdentity, cn._Baglan());
                    object oVal = null;
                    int iVal = 0;

                    oVal = commIdentity.ExecuteScalar();
                    if (oVal != null & oVal != DBNull.Value)
                    {
                        iVal = Convert.ToInt32(oVal);
                        Session["sDuyuruId"] = iVal;
                    }

                    cn.InsUpdDel("Update Duyurular SET DuyuruLink = '/duyuru/'+convert(varchar, DuyuruId) + '-'+dbo.KodOlustur(dbo.KodOlustur('" + txtDuyuruBaslik.Text + "')) Where DuyuruId = " + Session["sDuyuruId"].ToString() + "");

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