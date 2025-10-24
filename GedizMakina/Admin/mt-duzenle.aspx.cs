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
    public partial class mt_duzenle : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataRow dr = cn.DataRowGetir("Select * From Cariler Where CariId = " + Session["sMtId"].ToString() + "");

                txtKullaniciAdi.Text = dr["CariKodu"].ToString();
                txtIsimSoyisim.Text = dr["CariAdi"].ToString();
            }
        }

        protected void btnAktar_Click(object sender, EventArgs e)
        {
            foreach (DevExpress.Web.ListEditItem itemCari in chlTumCariler.Items)
            {
                if (itemCari.Selected)
                {
                    SqlDataAdapter da = new SqlDataAdapter("Select * From MtCari Where MtId = " + Session["sMtId"].ToString() + " And CariId = " + itemCari.Value + "", cn._Baglan());
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (dt.Rows.Count == 0)
                    {
                        cn.InsUpdDel("Insert Into MtCari (MtId, CariId) Values (" + Session["sMtId"].ToString() + ", " + itemCari.Value + ")");
                    }
                    
                }
            }

            Response.Redirect(Request.RawUrl);
        }

        protected void btnGeri_Click(object sender, EventArgs e)
        {
            foreach (DevExpress.Web.ListEditItem itemSecili in chlSecilenCariler.Items)
            {
                if (itemSecili.Selected)
                {
                    cn.InsUpdDel("Delete From MtCari Where KayitId = " + itemSecili.Value + "");
                }
            }

            Response.Redirect(Request.RawUrl);
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {

        }
    }
}