using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;

namespace GedizMakina.Admin
{
    public partial class login : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        App_Code.Ticket ticket = new App_Code.Ticket();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnGiris_ServerClick(object sender, EventArgs e)
        {
            string _SiteAdi = Request.Url.Authority.ToString();
            string _parola = FormsAuthentication.HashPasswordForStoringInConfigFile(txtParola.Value, "MD5");

            SqlDataAdapter da = new SqlDataAdapter("Select * From Musteriler Where MusteriKodu = '" + txtKullaniciAdi.Value + "' And Parola = '" + _parola + "' And SiteAdi Like '%" + _SiteAdi + "%'", ticket._Baglan());
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                Session["sAdminId"] = dt.Rows[0]["MusteriId"].ToString();
                Session["sYetki"] = "1000000000";

                Response.Redirect("/admin/dashboard");
            }
            else
            {
                lblUyari.InnerText = "Kullanıcı kodu ya da parolanız hatalıdır";
            }
            //SqlDataAdapter da = new SqlDataAdapter("Select * From Cariler Where CariKodu = '" + txtKullaniciAdi.Value + "' And Parola = '" + _parola + "' And YetkiId = 1000000000", cn._Baglan());
            //DataTable dt = new DataTable();
            //da.Fill(dt);

            //if (dt.Rows.Count > 0)
            //{
            //    Session["sAdminId"] = dt.Rows[0]["CariId"].ToString();
            //    Session["sYetki"] = dt.Rows[0]["YetkiId"].ToString();

            //    Response.Redirect("/admin/dashboard");
            //}
            //else
            //{
            //    lblUyari.InnerText = "Kullanıcı adı ya da parolanız hatalı";
            //}
        }
    }
}