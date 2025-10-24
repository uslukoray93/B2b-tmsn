using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;

namespace GedizMakina.user
{
    public partial class login : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        protected void btnGiris_ServerClick(object sender, EventArgs e)
        {
            string _parola = FormsAuthentication.HashPasswordForStoringInConfigFile(txtParola.Value, "MD5");

            SqlDataAdapter da = new SqlDataAdapter("Select * From Cariler Where CariKodu = '" + txtCariKodu.Value + "'", cn._Baglan());
            DataTable dt = new DataTable();
            da.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                if (dt.Rows[0]["Parola"].ToString() != _parola)
                {
                    lblUyari.InnerText = "Cari Kodu ya da Parolanız Hatalı";
                }
                else
                {
                    try
                    {
                        Session["sLoginId"] = dt.Rows[0]["CariId"].ToString();
                        Session["sYetki"] = dt.Rows[0]["YetkiId"].ToString();
                        
                        cn.InsUpdDel("Insert Into GirisBilgi(CariId) Values (" + Session["sLoginId"].ToString() + ")");

                        Response.Redirect("/dashboard");
                        //SqlCommand cm = new SqlCommand("spMuhB2BCariAktar", cn._Baglan());
                        //cm.CommandType = CommandType.StoredProcedure;
                        //if (cm.ExecuteNonQuery() != 0)
                        //{

                        //}
                        //else
                        //{
                        //    lblUyari.InnerText = "Aktarım sırasında hata oluştu";
                        //}
                    }
                    catch (Exception ex)
                    {
                        lblUyari.InnerText = ex.Message.ToString();
                    }
                    
                }
            }
            else
            {
                SqlDataAdapter daKontrol = new SqlDataAdapter("Select * From [GEDIZLINK].DENEME_2024T.dbo.CARIGEN Where CRK = '" + txtCariKodu.Value + "'", cn._Baglan());
                DataTable dtKontrol = new DataTable();
                daKontrol.Fill(dtKontrol);

                if (dtKontrol.Rows.Count > 0)
                {
                    SqlCommand cm = new SqlCommand("spMuhB2BCariAktarTek", cn._Baglan());
                    cm.CommandType = CommandType.StoredProcedure;
                    cm.Parameters.AddWithValue("@CariKod", txtCariKodu.Value);

                    if (cm.ExecuteNonQuery()!= 0)
                    {
                        DataRow dr = cn.DataRowGetir("Select * From Cariler Where CariKodu = '" + txtCariKodu.Value + "'");

                        SqlDataAdapter daBakiyedeKontrol = new SqlDataAdapter("Select * From CariBakiye Where CariId = " + dr["CariId"].ToString() + "", cn._Baglan());
                        DataTable dtBakiyedeKontrol = new DataTable();
                        daBakiyedeKontrol.Fill(dtBakiyedeKontrol);

                        if (dtBakiyedeKontrol.Rows.Count == 0)
                        {
                            cn.InsUpdDel("Insert Into CariBakiye (CariId, BorcTutar) Select CariId, Limit From Cariler Where CariId = " + dr["CariId"].ToString() + "");
                        }

                        SqlDataAdapter daGir = new SqlDataAdapter("Select * From Cariler Where CariKodu = '" + txtCariKodu.Value + "'", cn._Baglan());
                        DataTable dtGir = new DataTable();
                        daGir.Fill(dtGir);
                        if (dtGir.Rows.Count > 0)
                        {
                            cn.InsUpdDel("Insert Into GirisBilgi(CariId) Values (" + Session["sLoginId"].ToString() + ")");

                            Session["sLoginId"] = dt.Rows[0]["CariId"].ToString();
                            Response.Redirect("/dashboard");
                        }
                    }
                }
                else
                {
                    lblUyari.InnerText = "Böyle bir cari kodu bulunmuyor";
                }
            }
        }
    }
}