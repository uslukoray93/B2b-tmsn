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
    public partial class hesap_bakiyesi : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Hesapla();
            }
        }

        void Hesapla()
        {
            SqlCommand cm = new SqlCommand("spCariHesapBakiyesi", cn._Baglan());
            cm.CommandType = CommandType.StoredProcedure;
            cm.Parameters.AddWithValue("@CariId", Session["sLoginId"].ToString());

            SqlDataAdapter da = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            da.Fill(dt);

            DataRow dr = cn.DataRowGetir("Select * From Cariler Where CariId = " + Session["sLoginId"].ToString() + "");
            decimal _Limit = Convert.ToDecimal(dr["Limit"].ToString());
            decimal _Kalan = Convert.ToDecimal(dt.Rows[0]["Kalan"].ToString());

            decimal _Bakiye = Convert.ToDecimal(_Limit - _Kalan);

            lblToplamBorc.InnerText = "₺ " + _Bakiye.ToString("N2", CultureInfo.GetCultureInfo("tr"));
        }
    }
}