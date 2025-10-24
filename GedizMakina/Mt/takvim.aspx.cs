using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GedizMakina.Mt
{
    public partial class takvim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ASPxScheduler1.Start = Convert.ToDateTime(DateTime.Now.ToString());
            }
        }
    }
}