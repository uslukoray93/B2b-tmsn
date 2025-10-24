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
    public partial class zzzRandomMarkaBas : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlDataAdapter da = new SqlDataAdapter("Select * From Urunler", cn._Baglan());
            DataTable dt = new DataTable();
            da.Fill(dt);


            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataRow dr = cn.DataRowGetir("Select TOP(1) MarkaId From Markalar Order By NEWID()");

                cn.InsUpdDel("Update Urunler SET MarkaId = " + dr["MarkaId"].ToString() + " Where UrunId = " + dt.Rows[i]["UrunId"].ToString() + "");
            }

            Label1.Text = "Oldu";

        }
    }
}