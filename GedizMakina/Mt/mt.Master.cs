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
    public partial class mt : System.Web.UI.MasterPage
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["sMtId"] == null || Session["sMtId"].ToString() == string.Empty)
                {
                    Response.Redirect("/giris");
                }
                else
                {
                    if (Session["sYetki"].ToString() != "1000000001")
                    {
                        Response.Redirect("/mt/giris");
                    }
                    else
                    {
                        lblPageName.InnerText = Page.Title;
                        //lblPageName2.InnerText = Page.Title;

                        DataRow dr = cn.DataRowGetir("Select * From Cariler Where CariId = " + Session["sMtId"].ToString() + "");
                        lblKullaniciIsim.InnerText = dr["Yetkili"].ToString();
                        lblKullaniciFirma.InnerText = dr["CariAdi"].ToString();

                        //DataRow drDoviz = cn.DataRowGetir("SELECT TOP (1) dg.EUR, dg.USD FROM DovizGunluk dg ORDER BY Tarih DESC");
                        //lblEur.InnerText = drDoviz["EUR"].ToString();
                        //lblUsd.InnerText = drDoviz["USD"].ToString();
                    }
                }
            }
        }
    }
}