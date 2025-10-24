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
    public partial class ticket_enter : System.Web.UI.Page
    {
        App_Code.Ticket cn = new App_Code.Ticket();
        App_Code.Tools tool = new App_Code.Tools();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddKategori.DataSource = cn.DataTableGetir("Select * From Kategoriler");
                ddKategori.ValueField = "KategoriId";
                ddKategori.TextField = "Kategori";
                ddKategori.DataBind();
            }
        }

        protected void btnGonder_Click(object sender, EventArgs e)
        {
            tool.TicketGonder(Convert.ToInt32("1000000000"), Convert.ToInt32(ddKategori.Value), txtSoruBaslik.Text, txtSoru.Text.Replace("'", "''"));

            Response.Redirect("/admin/ticket-list");
        }
    }
}