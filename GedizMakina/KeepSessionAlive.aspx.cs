using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GedizMakina
{
    public partial class KeepSessionAlive : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.ExpiresAbsolute = DateTime.Now.AddDays(-1.0);
            Response.Expires = -1;
            Response.CacheControl = "no-cache";
            Header.Controls.Add(new System.Web.UI.HtmlControls.HtmlMeta { Name = "Cache-Control", Content = "no-cache, private, no-store, must-revalidate, max-stale=0, post-check=0, pre-check=0, timeout=0, max=993" });
            Header.Controls.Add(new System.Web.UI.HtmlControls.HtmlMeta { Name = "Pragma", Content = "no-cache" });
            Header.Controls.Add(new System.Web.UI.HtmlControls.HtmlMeta { Name = "Expires", Content = DateTime.Now.AddMonths(-1).ToString("R") });
            Response.Cache.SetAllowResponseInBrowserHistory(false);
            Response.Cache.SetExpires(DateTime.Now.AddDays(-1.0));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
        }
    }
}