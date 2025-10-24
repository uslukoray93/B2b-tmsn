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
    public partial class duyuru_detay : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string _Metin = Request.Url.PathAndQuery.ToString();

                DataRow dr = cn.DataRowGetir("Select * From Duyurular Where DuyuruLink = '" + _Metin + "'");

                lblBaslik.InnerText = dr["DuyuruBaslik"].ToString();
                lblAciklama.Text = dr["Aciklama"].ToString();
            }
        }
    }
}