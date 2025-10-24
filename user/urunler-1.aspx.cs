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
    public partial class urunler_1 : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        int _First = 1;
        int _Last = 40;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlCommand cm = new SqlCommand("spUrunListesiCount", cn._Baglan());
                cm.CommandType = CommandType.StoredProcedure;

                SqlDataAdapter da = new SqlDataAdapter(cm);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (Convert.ToInt32(dt.Rows[0]["Sayi"].ToString()) > _Last)
                {
                    ASPxPager1.ItemCount = (Convert.ToInt32(dt.Rows[0]["Sayi"].ToString()) / _Last) + 1;
                    ASPxPager1.Visible = true;
                    SayfaNogetir();
                }
                else
                {
                    ASPxPager1.Visible = false;
                    SayfaNogetir();
                }
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

            repUrunler.DataBind();
        }
        protected void ASPxPager1_PageIndexChanged(object sender, EventArgs e)
        {
            SayfaNogetir();
        }

        protected void ddKategori_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect(ddKategori.SelectedValue);
        }

        protected void ddMarka_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect(ddMarka.SelectedValue);
        }

        protected void btnSearch_ServerClick(object sender, EventArgs e)
        {
            Session["sSearchText"] = txtSearch.Value;
            Response.Redirect("/arama-sonuclari");
        }
    }
}