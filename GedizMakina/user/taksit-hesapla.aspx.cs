using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GedizMakina.user
{
    public partial class taksit_hesapla : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnHesapla_ServerClick(object sender, EventArgs e)
        {
            Hesapla();
        }

        void Hesapla()
        {
            lblFiyatTL.Text = Convert.ToDecimal(txtTutar.Value.ToString()).ToString("N");

            string _Src = "<script src='https://www.paytr.com/odeme/taksit-tablosu/v2?token=71c73f6303049ae3e7df650d6614bd16fe94fd5ba751c31e952f8d2f04cf40ee&merchant_id=496818&amount=" + lblFiyatTL.Text + "'></script>";

            divTaksit.InnerHtml = _Src;
            divTaksit.Visible = true;
        }
    }
}