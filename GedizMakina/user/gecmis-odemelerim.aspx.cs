using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using DevExpress.Web;
using DevExpress.XtraReports.UI;

namespace GedizMakina.user
{
    public partial class gecmis_odemelerim : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DateTime _YilinIlkGunu = new DateTime(DateTime.Now.Year, 1, 1);
                dtBaslangic.Date = Convert.ToDateTime(_YilinIlkGunu.ToString());
                dtBitis.Date = Convert.ToDateTime(DateTime.Now.ToShortDateString());
            }
        }
        protected void btnListele_Click(object sender, EventArgs e)
        {
            gvOdemelerim.DataBind();
        }

        protected void gvOdemelerim_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "btnOdemeRapor")
            {
                raporlar.OdemeBelge odm = new raporlar.OdemeBelge();
                odm.Parameters["pOdemeId"].Value = gvOdemelerim.GetRowValues(e.VisibleIndex, "OdemeId").ToString();
                odm.CreateDocument();
                ASPxWebDocumentViewer1.Visible = true;
                ASPxWebDocumentViewer1.OpenReport(odm);
                poBelge.ShowOnPageLoad = true;
            }
        }

        protected void gvOdemelerim_CustomButtonInitialize(object sender, ASPxGridViewCustomButtonEventArgs e)
        {
            if (e.CellType == DevExpress.Web.GridViewTableCommandCellType.Data)
            {
                ASPxGridView gvOdemelerim = sender as ASPxGridView;
                bool Onaylanan = Convert.ToBoolean(gvOdemelerim.GetRowValues(e.VisibleIndex, new string[] { "OdemeDurumu" }));
                //bool KesinKayitKesin = Convert.ToBoolean(gvKursiyerler.GetRowValues(e.VisibleIndex, new string[] { "KesinKayitVar" }));
                //string Kargo = Convert.ToString(gvOdemelerim.GetRowValues(e.VisibleIndex, new string[] { "Kargo" }));

                if (e.ButtonID == "btnOdemeRapor")
                {
                    if (Onaylanan == true)
                    {
                        e.Visible = DevExpress.Utils.DefaultBoolean.True;
                    }
                    else
                    {
                        e.Visible = DevExpress.Utils.DefaultBoolean.False;
                    }
                }
            }
        }
    }
}