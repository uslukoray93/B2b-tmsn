using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

namespace GedizMakina.user
{
    public partial class cari_ekstre : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DateTime _YilinIlkGunu = new DateTime(DateTime.Now.Year, 1, 1);
                dtBaslangic.Date = Convert.ToDateTime(_YilinIlkGunu.ToString());
                dtBitis.Date = Convert.ToDateTime(DateTime.Now.ToShortDateString());

                Hesapla();
            }
        }


        void Hesapla()
        {
            SqlCommand cm = new SqlCommand("spCariBakiyeAlt", cn._Baglan());
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@CariId", Session["sLoginId"].ToString());
            cm.Parameters.AddWithValue("@Baslangic", dtBaslangic.Date);
            cm.Parameters.AddWithValue("@Bitis", dtBitis.Date);

            SqlDataAdapter da = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            da.Fill(dt);

            DataRow dr = cn.DataRowGetir("Select * From Cariler Where CariId = " + Session["sLoginId"].ToString() + "");
            decimal _Limit = Convert.ToDecimal(dr["Limit"].ToString());
            decimal _Kalan = Convert.ToDecimal(dt.Rows[0]["Kalan"].ToString());

            decimal _Bakiye = Convert.ToDecimal(_Limit - _Kalan);

            lblToplamBorc.InnerText = "₺ " + Convert.ToDecimal(dr["Limit"].ToString()).ToString("N2", CultureInfo.GetCultureInfo("tr"));
            //lblToplamAlacak.InnerText = "₺ " + Convert.ToDecimal(dt.Rows[0]["Alacak"].ToString()).ToString("N2", CultureInfo.GetCultureInfo("tr"));
            lblToplamAlacak.InnerText = "₺ " + _Bakiye.ToString("N2", CultureInfo.GetCultureInfo("tr"));
            lblToplamBakiye.InnerText = "₺ " + Convert.ToDecimal(dt.Rows[0]["Kalan"].ToString()).ToString("N2", CultureInfo.GetCultureInfo("tr"));
        }

        protected void btnListele_Click(object sender, EventArgs e)
        {
            Hesapla();
        }

        protected void gvCariBakiye_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "btnSipariseGit")
            {
                Response.Redirect("/siparis/?sid=" + gvCariBakiye.GetRowValues(e.VisibleIndex, "SiparisId"));
            }
        }
    }
}