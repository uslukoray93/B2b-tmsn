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
    public partial class tamamlaniyor : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlCommand cm = new SqlCommand("spSepetGetirAktarim", cn._Baglan());
                cm.CommandType = CommandType.StoredProcedure;
                cm.Parameters.AddWithValue("@CariId", Session["sLoginId"].ToString());
                cm.Parameters.AddWithValue("@OdemeSekli", Session["sOdemeSekli"].ToString());

                SqlDataAdapter da = new SqlDataAdapter(cm);
                DataTable dt = new DataTable();
                da.Fill(dt);

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    SqlCommand cm2 = new SqlCommand("Insert Into SiparisDetay (CariId, UrunId, Miktar, BirimFiyat, Toplam, KDV, ToplamFiyat) Values " +
                        "(" +
                        "" + Session["sLoginId"].ToString() + ", " +
                        "" + dt.Rows[i]["UrunId"].ToString() + ", " +
                        "'" + dt.Rows[i]["Miktar"].ToString() + "', " +
                        "'" + dt.Rows[i]["BirimFiyat"].ToString().Replace(",", ".") + "', " +
                        "'" + dt.Rows[i]["UrunFiyatKDVsiz"].ToString().Replace(",", ".") + "', " +
                        "'" + dt.Rows[i]["KDVTutar"].ToString().Replace(",", ".") + "', " +
                        "'" + dt.Rows[i]["UrunFiyatKDVli"].ToString().Replace(",", ".") + "')", cn._Baglan());

                    cm2.ExecuteNonQuery();
                }

                string GuidKey = Guid.NewGuid().ToString();

                SqlCommand cmSiparisOlustur = new SqlCommand("Insert Into Siparisler (CariId, " +
                    "Tutar, " +
                    "Kdv, " +
                    "GenelTutar, " +
                    "TeslimatTurId, " +
                    "FaturaAdresId, " +
                    "SevkiyatAdresId, " +
                    "OdemeTurId, " +
                    "SiparisGuidNo, " +
                    "VadeTarihi, " +
                    "MerchantOid) " +
                    "Select " + Session["sLoginId"].ToString() + " CariId, " +
                    "SUM(Toplam) Tutar, " +
                    "SUM(KDV) Kdv, " +
                    "SUM(ToplamFiyat) GenelTutar, " +
                    "" + Session["sSevkiyatSekli"].ToString() + " TeslimatTurId, " +
                    "1000000000 FaturaAdresId, " +
                    "1000000000 SevkiyatAdresId, " +
                    "" + Session["sOdemeSekli"].ToString() + " OdemeTurId, " +
                    "'" + GuidKey + "' SiparisGuidNo, " +
                    "DATEADD(DAY, (Select ot.VadeGun From OdemeTurleri ot Where ot.[TurId] = " + Session["sOdemeSekli"].ToString() + "), getdate()) VadeTarihi" +
                    "'" + Session["sMerchantOid"].ToString() + "' MerchantOid" +
                    "From SiparisDetay " +
                    "Where CariId = " + Session["sLoginId"].ToString() + " And SiparisId IS NULL Group By CariId", cn._Baglan());

                if (cmSiparisOlustur.ExecuteNonQuery() != 0)
                {
                    string selectIdentity = "Select IDENT_CURRENT('Siparisler')";
                    SqlCommand commIdentity = new SqlCommand(selectIdentity, cn._Baglan());
                    object oVal = null;
                    int iVal = 0;

                    oVal = commIdentity.ExecuteScalar();
                    if (oVal != null & oVal != DBNull.Value)
                    {
                        iVal = Convert.ToInt32(oVal);
                        Session["sSiparisId"] = iVal;
                    }

                    cn.InsUpdDel("Update Sepet2 SET SiparisId = " + Session["sSiparisId"].ToString() + " Where CariId = " + Session["sLoginId"].ToString() + " And Secili = 'True' And SiparisId IS NULL");
                    cn.InsUpdDel("Update Siparisler SET SiparisNo = 'SIP-'+convert(varchar," + Session["sSiparisId"].ToString() + ") Where SiparisId = " + Session["sSiparisId"].ToString() + "");
                    cn.InsUpdDel("Update SiparisDetay SET SiparisId = " + Session["sSiparisId"].ToString() + " Where CariId = " + Session["sLoginId"].ToString() + " And SiparisId IS NULL");


                    cn.InsUpdDel("Delete From Sepet Where CariId = " + Session["sLoginId"].ToString() + " And Secili = 'True'");

                }

                Response.Redirect("/dashboard");
            }
        }
    }
}