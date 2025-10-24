using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace GedizMakina
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            cn.InsUpdDel("Update Urunler SET UrunAciklamasi = '" + ASPxHtmlEditor1.Html + "' Where UrunId = 1000000000");
        }

        protected void ASPxButton2_Click(object sender, EventArgs e)
        {
            SqlDataAdapter daUrun = new SqlDataAdapter("Select * From Urunler", cn._Baglan());
            DataTable dtUrun = new DataTable();
            daUrun.Fill(dtUrun);

            for (int i = 0; i < dtUrun.Rows.Count; i++)
            {
                SqlDataAdapter da = new SqlDataAdapter("Select TOP(1) MarkaId From Markalar Order By NEWID()", cn._Baglan());
                DataTable dt = new DataTable();
                da.Fill(dt);

                cn.InsUpdDel("Update Urunler SET MarkaId = '" + dt.Rows[0]["MarkaId"].ToString() + "' Where UrunId = " + dtUrun.Rows[i]["UrunId"].ToString() + "");
            }

            ASPxLabel1.Text = "Oldu";
            
        }
    }
}