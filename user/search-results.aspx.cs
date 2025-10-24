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
    public partial class search_results : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        int _First = 1;
        int _Last = 40;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                SayfaNogetir();
            }
        }

        void GetRepeater()
        {
            SqlCommand cm = new SqlCommand("spSearchResultsCount", cn._Baglan());
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@SearchText", Session["sSearchText"].ToString());
            cm.Parameters.AddWithValue("@First", Session["sFirst"].ToString());
            cm.Parameters.AddWithValue("@Last", Session["sLast"].ToString());
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