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
    public partial class ticket_list : System.Web.UI.Page
    {
        App_Code.Ticket ticket = new App_Code.Ticket();
        App_Code.Tools tool = new App_Code.Tools();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridDoldur();
            }
        }

        void GridDoldur()
        {
            gvTicketList.DataSource = ticket.DataTableGetir("SELECT t.TicketId, t.MusteriId, t.KategoriId, (SELECT k.Kategori FROM Kategoriler k WHERE k.KategoriId = t.KategoriId) KategoriAdi, t.SoruBaslik, t.Soru, t.TicketTarihi, (CASE WHEN len(t.Cevap) < 1 or t.Cevap IS NULL THEN 'Cevaplanmadı' ELSE 'Cevaplandı' END) CevapDurum, t.Cevap FROM Ticket t WHERE t.MusteriId = " + Session["sAdminId"].ToString() + "");
            gvTicketList.DataBind();
        }
        protected void btnYeni_Click(object sender, EventArgs e)
        {
            Response.Redirect("/admin/ticket-enter");
        }

        protected void gvTicketList_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "btnCevapOku")
            {
                ASPxPopupControl1.HeaderText = gvTicketList.GetRowValues(e.VisibleIndex, "SoruBaslik").ToString();
                txtCevap.Text = gvTicketList.GetRowValues(e.VisibleIndex, "Cevap").ToString();
                ASPxPopupControl1.ShowOnPageLoad = true;
            }
        }
    }
}