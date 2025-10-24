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
    public partial class product_list : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                KategoriGetir();
            }
        }

        void KategoriGetir()
        {
            string _Metin = Request.Url.PathAndQuery.ToString();
            DataRow dr = cn.DataRowGetir("Select * From Kategoriler k Where k.KategoriPath = '" + _Metin + "'");
            Session["sKategoriId"] = dr["KategoriId"].ToString();
            //lblKategoriAdi.InnerText = dr["KategoriAdi"].ToString() + " için sonuçlar";

            //SqlCommand cm = new SqlCommand("spResimListKategori", cn._Baglan());
            //cm.CommandType = CommandType.StoredProcedure;
            //cm.Parameters.AddWithValue("@KategoriId", Session["sKategoriId"].ToString());
            //SqlDataAdapter da = new SqlDataAdapter(cm);
            //DataTable dt = new DataTable();
            //da.Fill(dt);

            //repKategori.DataSource = dt;
            //repKategori.DataBind();
        }
    }
}