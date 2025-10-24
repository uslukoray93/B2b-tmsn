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
    public partial class kampanya_detay : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        int _First = 1;
        int _Last = 40;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string _Metin = Request.Url.PathAndQuery.ToString();
                DataRow dr = cn.DataRowGetir("Select * From Kampanyalar Where KampanyaLink = '" + _Metin + "'");
                Session["sKampanyaId"] = dr["KampanyaId"].ToString();

                SqlCommand cm = new SqlCommand("spKampanyaliUrunlerCount", cn._Baglan());
                cm.CommandType = CommandType.StoredProcedure;
                cm.Parameters.AddWithValue("@KampanyaId", Session["sKampanyaId"].ToString());

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

    }
}