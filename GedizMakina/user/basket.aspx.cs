using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using DevExpress.Web;
using System.Globalization;
using System.IO;

namespace GedizMakina.user
{
    public partial class basket : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        string uzanti = null;
        string resimadi = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddOdemeSekli.DataSource = cn.DataTableGetir("Select * From OdemeTurleri Order By SN");
                ddOdemeSekli.DataValueField = "TurId";
                ddOdemeSekli.DataTextField = "TurAdi";
                ddOdemeSekli.DataBind();
                dsSepet.DataBind();
                gvSepet.DataBind();
                SepetToplamAlt();
            }
        }

        protected void gvSepet_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
        {
            if (e.ButtonID == "btnSil")
            {
                cn.InsUpdDel("Delete From Sepet Where SepetId = " + gvSepet.GetRowValues(e.VisibleIndex, "SepetId") + "");
                cn.InsUpdDel("Delete From Sepet2 Where SepetId = " + gvSepet.GetRowValues(e.VisibleIndex, "SepetId") + "");
                gvSepet.DataBind();
                SepetToplamAlt();
            }
        }

        void SepetToplamAlt()
        {
            DataRow drKont = cn.DataRowGetir("Select count(*) Sayi From Sepet Where CariId = " + Session["sLoginId"].ToString() + " And Secili = 'True'");

            if (Convert.ToInt32(drKont["Sayi"].ToString()) == 0)
            {
                btnGonder.Enabled = false;
                ddGonderimSekli.Enabled = false;
                ddOdemeSekli.Enabled = false;
            }
            else
            {
                //btnGonder.Enabled = true;
                //ddGonderimSekli.Enabled = true;
                //ddOdemeSekli.Enabled = true;
                SqlCommand cm = new SqlCommand("spSepetGetirAlt", cn._Baglan());
                cm.CommandType = CommandType.StoredProcedure;
                cm.Parameters.AddWithValue("@CariId", Session["sLoginId"].ToString());
                cm.Parameters.AddWithValue("@OdemeSekli", ddOdemeSekli.SelectedValue);

                SqlDataAdapter da = new SqlDataAdapter(cm);
                DataTable dt = new DataTable();
                da.Fill(dt);

                lblToplamTutarKdvHaric.InnerText = "₺ " + Convert.ToDecimal(dt.Rows[0]["ToplamTutarKDVsiz"].ToString()).ToString("N2", CultureInfo.GetCultureInfo("tr"));
                lblIskonto.InnerText = "₺ " + Convert.ToDecimal(dt.Rows[0]["Iskonto"].ToString()).ToString("N2", CultureInfo.GetCultureInfo("tr"));
                lblNetTutar.InnerText = "₺ " + Convert.ToDecimal(dt.Rows[0]["NetTutar"].ToString()).ToString("N2", CultureInfo.GetCultureInfo("tr"));
                lblKdv.InnerText = "₺ " + Convert.ToDecimal(dt.Rows[0]["KdvTutar"].ToString()).ToString("N2", CultureInfo.GetCultureInfo("tr"));
                lblGenelToplam.InnerText = "₺ " + Convert.ToDecimal(dt.Rows[0]["GenelToplam"].ToString()).ToString("N2", CultureInfo.GetCultureInfo("tr"));
                Session["sOdenecekTutar"] = Convert.ToDecimal(dt.Rows[0]["GenelToplam"].ToString()).ToString("N2", CultureInfo.GetCultureInfo("tr"));
                float _GenelToplam = Convert.ToInt32(dt.Rows[0]["GenelToplam2"]) * 100;
                int _GenelToplamYeni = (int)Math.Round(_GenelToplam);



                //Session["sOdenecekTutarKK"] = _GenelToplamYeni;

                DataRow dr = cn.DataRowGetir("Select cr.LimitAc, cr.Limit, (Select SUM(cb.BorcTutar) From CariBakiye cb Where cb.CariId = cr.CariId)KalanLimit From Cariler cr Where cr.CariId = " + Session["sLoginId"].ToString() + "");
                //lblKrediLimiti.InnerText = "₺ " + Convert.ToDecimal(dr["Limit"].ToString()).ToString("N2", CultureInfo.GetCultureInfo("tr"));

                if (ddOdemeSekli.SelectedValue == "1000000001" || ddOdemeSekli.SelectedValue == "1000000005" || ddOdemeSekli.SelectedValue == "1000000007" || ddOdemeSekli.SelectedValue == "1000000006")
                {
                    btnGonder.Text = "Gönder";
                    btnGonder.Enabled = true;
                    decimal _GenelTop = Convert.ToDecimal(dt.Rows[0]["GenelToplam"].ToString());
                    Session["sOdenecekTutarKK"] = _GenelTop;
                    Session["sOdenecekTutarKK2"] = _GenelToplam;
                }
                else
                {
                    if (ddOdemeSekli.SelectedValue == "1000000013")
                    {
                        if (Convert.ToDecimal(dr["KalanLimit"].ToString()) <= Convert.ToDecimal(dt.Rows[0]["GenelToplam"].ToString()))
                        {
                            lblBakiyeUyari.InnerText = "Siparişinizin; " + Convert.ToDecimal(dt.Rows[0]["GenelToplam"].ToString()) + " TL'lik kısmı artı bakiyenizden karşılanacaktır";

                            poBakiyeUyari.ShowOnPageLoad = true;
                        }
                        else
                        {
                            lblBakiyeUyari.InnerText = "Siparişinizin; " + Convert.ToDecimal(dr["KalanLimit"].ToString()) + " TL'lik kısmı artı bakiyenizden karşılanacaktır. Kalan kısmını kredi kartınız ile ya da vadeli olarak ödeyebilirsiniz.";

                            poBakiyeUyari.ShowOnPageLoad = true;
                        }
                    }
                    else
                    {
                        SqlDataAdapter da2 = new SqlDataAdapter("Select dbo.fncCariAnaSayfaBorc(" + Session["sLoginId"].ToString() + ") Borc", cn._Baglan());
                        DataTable dt2 = new DataTable();
                        da2.Fill(dt2);

                        if (Convert.ToDecimal(dt2.Rows[0]["Borc"].ToString()) > 0)
                        {
                            btnGonder.Text = "Vadesi geçmiş " + Convert.ToDecimal(dt2.Rows[0]["Borc"].ToString()).ToString("N2") + " TL borcunuz bulunmaktadır. Bu nedenle vadeli işlemleriniz kısıtlanmıştır";
                            btnGonder.Enabled = false;
                        }
                        else
                        {
                            if (Convert.ToBoolean(dr["LimitAc"].ToString()) == true)
                            {
                                decimal _KalanLimit = Convert.ToDecimal(dr["KalanLimit"].ToString());
                                decimal _GenelTop = Convert.ToDecimal(dt.Rows[0]["GenelToplam"].ToString());
                                Session["sOdenecekTutarKK"] = _GenelTop;

                                if (_KalanLimit < _GenelTop)
                                {
                                    lblKrediLimiti2.InnerText = "₺ " + Convert.ToDecimal(dr["KalanLimit"].ToString()).ToString("N2", CultureInfo.GetCultureInfo("tr"));
                                    btnGonder.Text = "Kredi limitiniz yetersizdir";
                                    btnGonder.Enabled = false;
                                }
                                else
                                {
                                    lblKrediLimiti2.InnerText = "₺ " + Convert.ToDecimal(dr["KalanLimit"].ToString()).ToString("N2", CultureInfo.GetCultureInfo("tr"));
                                    btnGonder.Text = "Devam";
                                    btnGonder.Enabled = true;
                                }
                            }
                            else
                            {
                                lblKrediLimiti2.InnerText = "₺ 0,00";
                                btnGonder.Text = "Kredi limitiniz bulunmamaktadır";
                                btnGonder.Enabled = false;
                            }
                        }
                        //if (Convert.ToBoolean(dr["LimitAc"].ToString())== true)
                        //{
                        //    decimal _KalanLimit = Convert.ToDecimal(dr["KalanLimit"].ToString());
                        //    decimal _GenelTop = Convert.ToDecimal(dt.Rows[0]["GenelToplam"].ToString());
                        //    Session["sOdenecekTutarKK"] = _GenelTop;

                        //    if (_KalanLimit < _GenelTop)
                        //    {
                        //        lblKrediLimiti2.InnerText = "₺ " + Convert.ToDecimal(dr["KalanLimit"].ToString()).ToString("N2", CultureInfo.GetCultureInfo("tr"));
                        //        btnGonder.Text = "Kredi limitiniz yetersizdir";
                        //        btnGonder.Enabled = false;
                        //    }
                        //    else
                        //    {
                        //        lblKrediLimiti2.InnerText = "₺ " + Convert.ToDecimal(dr["KalanLimit"].ToString()).ToString("N2", CultureInfo.GetCultureInfo("tr"));
                        //        btnGonder.Text = "Devam";
                        //        btnGonder.Enabled = true;
                        //    }
                        //}
                        //else
                        //{
                        //    lblKrediLimiti2.InnerText = "₺ 0,00";
                        //    btnGonder.Text = "Kredi limitiniz bulunmamaktadır";
                        //    btnGonder.Enabled = false;
                        //}
                    }
                }
            }

            

            
        }

        protected void ddOdemeSekli_SelectedIndexChanged(object sender, EventArgs e)
        {
            SepetToplamAlt();
        }
        protected void ASPxSpinEdit1_Init(object sender, EventArgs e)
        {
            ASPxSpinEdit spinEdit = (ASPxSpinEdit)sender;
            GridViewDataItemTemplateContainer container = (GridViewDataItemTemplateContainer)spinEdit.NamingContainer;
            spinEdit.ClientSideEvents.NumberChanged = string.Format("function(s, e) {{ OnNumberChanged(s, e, {0}); }}", container.VisibleIndex);
            gvSepet.DataBind();
            SepetToplamAlt();
        }

        protected void ASPxCallbackPanel1_Callback(object sender, CallbackEventArgsBase e)
        {
            var rowID = e.Parameter;
            Session["sRowId"] = rowID;
            string[] callbackParam = e.Parameter.Split('|');
            string RowId = callbackParam[0];
            string spinEditValue = callbackParam[1];

            Session["sSatirId"] = gvSepet.GetRowValues(Convert.ToInt32(RowId.ToString()), "SepetId");

            SqlCommand cm = new SqlCommand("Update Sepet Set Miktar = " + spinEditValue + " Where SepetId = '" + Session["sSatirId"].ToString() + "'", cn._Baglan());
            if (cm.ExecuteNonQuery()!=0)
            {
                SqlCommand cm2 = new SqlCommand("Update Sepet2 Set Miktar = " + spinEditValue + " Where SepetId = '" + Session["sSatirId"].ToString() + "'", cn._Baglan());

                if (cm2.ExecuteNonQuery()!=0)
                {
                    gvSepet.DataBind();
                    SepetToplamAlt();
                }
            }
            
        }

        protected void chkSecili_CheckedChanged(object sender, EventArgs e)
        {
            ASPxCheckBox chkSecili = (ASPxCheckBox)sender;
            GridViewDataItemTemplateContainer container = (GridViewDataItemTemplateContainer)chkSecili.NamingContainer;

            int ID = Convert.ToInt32(gvSepet.GetRowValues(container.VisibleIndex, gvSepet.KeyFieldName));
            //Session["id"] = ID;

            if (chkSecili.Checked == true)
            {
                cn.InsUpdDel("Update Sepet SET Secili = 'True' Where SepetId = " + ID.ToString() + "");
                cn.InsUpdDel("Update Sepet2 SET Secili = 'True' Where SepetId = " + ID.ToString() + "");
                gvSepet.DataBind();

                SepetToplamAlt();
            }
            if (chkSecili.Checked == false)
            {
                cn.InsUpdDel("Update Sepet SET Secili = 'False' Where SepetId = " + ID.ToString() + "");
                cn.InsUpdDel("Update Sepet2 SET Secili = 'False' Where SepetId = " + ID.ToString() + "");
                gvSepet.DataBind();

                SepetToplamAlt();
            }
        }

        protected void btnGonder_Click(object sender, EventArgs e)
        {
            if (ddOdemeSekli.SelectedValue == "1000000007")
            {
                lblPopUpUyari.Text = "Ödeme şekli seçmelisiniz";
                poUyari.ShowOnPageLoad = true;
            }
            else
            {
                if (ddGonderimSekli.SelectedValue == "1000000004")
                {
                    lblPopUpUyari.Text = "Gönderim şekli seçmelisiniz";
                    poUyari.ShowOnPageLoad = true;
                }
                else
                {
                    if (ddOdemeSekli.SelectedValue == "1000000005" || ddOdemeSekli.SelectedValue == "1000000001")
                    {
                        Response.Redirect("/kredi-karti-odeme");
                    }
                    else
                    {
                        SqlCommand cm = new SqlCommand("spSepetGetirAktarim", cn._Baglan());
                        cm.CommandType = CommandType.StoredProcedure;
                        cm.Parameters.AddWithValue("@CariId", Session["sLoginId"].ToString());
                        cm.Parameters.AddWithValue("@OdemeSekli", ddOdemeSekli.SelectedValue);

                        Session["sOdemeSekli"] = ddOdemeSekli.SelectedValue;
                        Session["sSevkiyatSekli"] = ddGonderimSekli.SelectedValue;

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

                        SqlCommand cmSiparisOlustur = new SqlCommand("Insert Into Siparisler (CariId, Tutar, Kdv, GenelTutar, TeslimatTurId, FaturaAdresId, SevkiyatAdresId, OdemeTurId, SiparisGuidNo, VadeTarihi) Select " + Session["sLoginId"].ToString() + ", SUM(Toplam) Tutar, SUM(KDV)Kdv, SUM(ToplamFiyat) GenelTutar, " + ddGonderimSekli.SelectedValue + ", 1000000000, 1000000000, " + ddOdemeSekli.SelectedValue + ", '" + GuidKey + "', DATEADD(DAY, (Select ot.VadeGun From OdemeTurleri ot Where ot.[TurId] = " + ddOdemeSekli.SelectedValue + "), getdate()) From SiparisDetay Where CariId = " + Session["sLoginId"].ToString() + " And SiparisId IS NULL Group By CariId", cn._Baglan());

                        if (cmSiparisOlustur.ExecuteNonQuery()!=0)
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

                        //cn.InsUpdDel("Delete From Sepet Where CariId = " + Session["sLoginId"].ToString() + " And Secili = 'True'");

                        //SqlDataAdapter da2 = new SqlDataAdapter("Select * From CariBakiye Where CariId = " + Session["sLoginId"].ToString() + "", cn._Baglan());
                        //DataTable dt2 = new DataTable();
                        //da2.Fill(dt2);

                        //DataRow dr = cn.DataRowGetir("Select * From Cariler Where CariId = " + Session["sLoginId"].ToString() + "");

                        //if (dt2.Rows.Count < 1)
                        //{
                        //    cn.InsUpdDel("Insert Into CariBakiye (CariId, BorcTutar, AlacakTutar, Bakiye, OdemeTurId, HareketTurId, Aciklama) Values (" + Session["sCariId"].ToString() + ", '" + dr["Limit"].ToString() + "', 0, '" + dr["Limit"].ToString() + "', NULL, 1000000000, NULL)");
                        //}
                        //else
                        //{
                        //    DataRow drGetir = cn.DataRowGetir("Select TOP(1) * From CariBakiye Where CariId = " + Session["sLoginId"].ToString() + " Order By OdemeId DESC");
                        //    DataRow drSiparisGetir = cn.DataRowGetir("Select * From Siparisler Where SiparisId = " + Session["sSiparisId"].ToString() + "");

                        //    cn.InsUpdDel("Insert Into CariBakiye (CariId, BorcTutar, AlacakTutar, Bakiye, OdemeTurId, HareketTurId, Aciklama) Values (" + Session["sCariId"].ToString() + ", 0, '" + drGetir["Bakiye"].ToString() + "', '" + drGetir["Bakiye"].ToString() + "'- '" + drSiparisGetir["GenelTutar"].ToString() + "', NULL, 1000000000, NULL)");
                        //}

                        cn.InsUpdDel("Update Cariler SET KalanLimit = dbo.fnc_KalanLimit(" + Session["sLoginId"].ToString() + ") Where CariId = " + Session["sLoginId"].ToString() + "");

                        Response.Redirect("/siparis-basarili");
                    }
                }
            }
            
        }


        void BakiyeKontrol()
        {
            
        }

        protected void btnPopUpTamam_Click(object sender, EventArgs e)
        {
            gvSepet.DataBind();
            poUyari.ShowOnPageLoad = false;
        }

        protected void ucFarkliAdres_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            HttpFileCollection files = Request.Files;
            for (int i = 0; i < files.Count; i++)
            {
                string file = e.UploadedFile.FileName.ToString();
                Int64 ContentLength = e.UploadedFile.FileBytes.Length;
                if (ContentLength > 0)
                {
                    //resmin adı
                    string filename = Path.GetFileName(e.UploadedFile.FileName);

                    //resim uzantısı
                    uzanti = Path.GetExtension(e.UploadedFile.FileName);

                    //resime atanacak yeni ad
                    resimadi = DateTime.Now.Day.ToString() + DateTime.Now.Month +
                        DateTime.Now.Year + DateTime.Now.Hour + DateTime.Now.Second +
                        DateTime.Now.Minute + DateTime.Now.Millisecond + uzanti;

                    Session["sResimAdi"] = resimadi;

                    Session["sResimAdiTam"] = "/Resimler/SiparisResim/" + Session["sResimAdi"].ToString();
                    #region ResimBoyutlandir

                    ////////////////////BUYUK RESİM BAŞLA////////////////////
                    //Orijinal Resmi Kaydet
                    e.UploadedFile.SaveAs(Server.MapPath("/Resimler/SiparisResim/" + Session["sResimAdi"].ToString()));

                    //cn.InsUpdDel("Update Durumlar SET DurumResim = '" + Session["sResimAdiTam"].ToString() + "' Where DurumId = " + Session["sDurumId"].ToString() + "");


                    ////////////////////BUYUK RESİM BİTİR////////////////////
                    ///
                    #endregion
                }
            }
        }

        protected void btnBakiyeKK_ServerClick(object sender, EventArgs e)
        {

        }

        protected void btnBakiyeVade_ServerClick(object sender, EventArgs e)
        {

        }
    }
}