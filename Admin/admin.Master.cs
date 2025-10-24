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
    public partial class admin : System.Web.UI.MasterPage
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["sAdminId"] == null || Session["sAdminId"].ToString() == string.Empty)
                {
                    Response.Redirect("/admgdz");
                }
                else
                {
                    if (Session["sYetki"].ToString() != "1000000000")
                    {
                        Response.Redirect("/admin/giris");
                    }
                    else
                    {
                        lblPageName.InnerText = Page.Title;
                        lblPageName2.InnerText = Page.Title;

                        DataRow dr = cn.DataRowGetir("Select * From Cariler Where CariId = " + Session["sAdminId"].ToString() + "");
                        lblKullaniciIsim.InnerText = dr["Yetkili"].ToString();
                        lblKullaniciFirma.InnerText = dr["CariAdi"].ToString();

                        DataRow drDoviz = cn.DataRowGetir("SELECT TOP (1) dg.EUR, dg.USD FROM DovizGunluk dg ORDER BY Tarih DESC");
                        lblEur.InnerText = drDoviz["EUR"].ToString();
                        lblUsd.InnerText = drDoviz["USD"].ToString();
                    }

                }
            }
        }
    }
}