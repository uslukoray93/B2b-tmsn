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
    public partial class dashboard : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlDataAdapter da = new SqlDataAdapter("Select dbo.fncCariAnaSayfaBorc(" + Session["sLoginId"].ToString() + ") Borc", cn._Baglan());
                DataTable dt = new DataTable();
                da.Fill(dt);

                Session["sBorcTutar"] = Convert.ToDecimal(dt.Rows[0]["Borc"].ToString());

                if (Convert.ToDecimal(dt.Rows[0]["Borc"].ToString()) > 0)
                {
                    DataRow dr = cn.DataRowGetir("Select Count(*) Sayi From DashboardBildirim Where CariId = " + Session["sLoginId"].ToString() + " And Goruldu = 'True'");

                    if (Convert.ToInt32(dr["Sayi"].ToString()) > 0)
                    {
                        SqlDataAdapter da2 = new SqlDataAdapter("Select TOP(1) ISNULL(Tutar, 0) Tutar From DashboardBildirim Where CariId = " + Session["sLoginId"].ToString() + " And Goruldu = 'True' Order By Tarih DESC", cn._Baglan());
                        DataTable dt2 = new DataTable();
                        da2.Fill(dt2);

                        if (Convert.ToDecimal(dt2.Rows[0]["Tutar"].ToString()) != Convert.ToDecimal(dt.Rows[0]["Borc"].ToString()))
                        {
                            lblBorcUyari.Text = "Vadesi geçmiş " + Convert.ToDecimal(dt.Rows[0]["Borc"].ToString()).ToString("N2") + " TL borcunuz bulunmaktadır. Bu nedenle vadeli işlemleriniz kısıtlanmıştır";

                            poBorcUyari.ShowOnPageLoad = true;
                        }
                    }
                    else
                    {
                        lblBorcUyari.Text = "Vadesi geçmiş " + Convert.ToDecimal(dt.Rows[0]["Borc"].ToString()).ToString("N2") + " TL borcunuz bulunmaktadır. Bu nedenle vadeli işlemleriniz kısıtlanmıştır";

                        poBorcUyari.ShowOnPageLoad = true;
                    }

                    
                    
                }
            }
        }

        protected void btnOdemeyeGit_Click(object sender, EventArgs e)
        {
            SqlDataAdapter da = new SqlDataAdapter("Select dbo.fncCariAnaSayfaBorc(" + Session["sLoginId"].ToString() + ") Borc", cn._Baglan());
            DataTable dt = new DataTable();
            da.Fill(dt);

            decimal _Borc = Convert.ToDecimal(dt.Rows[0]["Borc"].ToString());

            cn.InsUpdDel("Insert Into DashboardBildirim (CariId, Tutar, Goruldu) Values (" + Session["sLoginId"].ToString() + ", '" + _Borc.ToString().Replace(",", ".") + "', 'True')");

            Response.Redirect("/kredi-karti-odeme");
        }

        protected void btnBilgimVar_Click(object sender, EventArgs e)
        {
            //poBorcUyari.ShowOnPageLoad = false;
            SqlDataAdapter da = new SqlDataAdapter("Select dbo.fncCariAnaSayfaBorc(" + Session["sLoginId"].ToString() + ") Borc", cn._Baglan());
            DataTable dt = new DataTable();
            da.Fill(dt);

            decimal _Borc = Convert.ToDecimal(dt.Rows[0]["Borc"].ToString());

            cn.InsUpdDel("Insert Into DashboardBildirim (CariId, Tutar, Goruldu) Values (" + Session["sLoginId"].ToString() + ", '" + _Borc.ToString().Replace(",", ".") + "', 'True')");

            Response.Redirect(Request.RawUrl);
        }
    }
}