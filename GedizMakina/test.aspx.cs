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
    public partial class test : System.Web.UI.Page
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
            SqlCommand cm = new SqlCommand("spMuhB2BCariFark", cn._Baglan());
            cm.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cm);
            DataTable dt = new DataTable();
            da.Fill(dt);

            Label1.Text = dt.Rows.Count + " adet Cari bulundu";


        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            SqlCommand cm = new SqlCommand("spMuhB2BCariAktar", cn._Baglan());
            cm.CommandType = CommandType.StoredProcedure;

            if (cm.ExecuteNonQuery()!= 0)
            {
                Label1.Text = "Aktarım Başarılı";
            }
        }
    }
}