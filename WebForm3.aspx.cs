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
    public partial class WebForm3 : System.Web.UI.Page
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
            SqlDataAdapter da = new SqlDataAdapter("Select * From Cariler Where CariId <> 1000000009", cn._Baglan());
            DataTable dt = new DataTable();
            da.Fill(dt);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                cn.InsUpdDel("Update Cariler SET KalanLimit = dbo.fnc_KalanLimit(" + dt.Rows[i]["CariId"].ToString() + ") Where CariId = " + dt.Rows[i]["CariId"].ToString() + "");
            }

            Label1.Text = "Oldu";
        }
    }
}