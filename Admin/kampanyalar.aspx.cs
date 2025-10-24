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
    public partial class kampanyalar : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            try
            {
                cn.InsUpdDel("Insert Into Kampanyalar (KampanyaAdi, Baslangic, Bitis) Values ('" + txtKampanyaAdi.Text + "', '" + dtBaslangic.Date.ToString("yyyy-MM-dd HH:mm:ss") + "', '" + dtBitis.Date.ToString("yyyy-MM-dd HH:mm:ss") + "')");

                gvKampanyalar.DataBind();
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
        }

        protected void gvKampanyalar_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "btnDetay")
            {
                Session["sKampanyaId"] = gvKampanyalar.GetRowValues(e.VisibleIndex, "KampanyaId");
                Response.Redirect("/admin/kampanya-detay");
            }
            if (e.ButtonID == "btnBitir")
            {
                Session["sKampanyaId"] = gvKampanyalar.GetRowValues(e.VisibleIndex, "KampanyaId");
                poKampanyaSil.ShowOnPageLoad = true;
            }
        }

        protected void btnEvet_Click(object sender, EventArgs e)
        {
            //BU ALAN KAMPANYAYI TAMAMEN SİLER
            cn.InsUpdDel("Delete From KampanyaDetay Where KampanyaId = " + Session["sKampanyaId"].ToString() + "");
            cn.InsUpdDel("Delete From Kampanyalar Where KampanyaId = " + Session["sKampanyaId"].ToString() + "");
            poKampanyaSil.ShowOnPageLoad = false;
        }

        protected void btnHayir_Click(object sender, EventArgs e)
        {
            //BU ALAN KAMPANYAYI SİLMEDEN POP-UP'I KAPATIR
            poKampanyaSil.ShowOnPageLoad = false;
        }
    }
}