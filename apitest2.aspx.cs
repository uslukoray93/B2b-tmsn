using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GedizMakina
{
    public partial class apitest2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var client = new RestClient("http://178.157.14.228:8061/api/v1/zirve/genel/firmalist?refresh=false");
            var request = new RestRequest(Method.Get.ToString());
            request.AddHeader("X-API-KEY", "4fbd35a3ab7c4f969291fd9885c06e90");
            RestResponse response = client.Execute(request);
            

            GridView1.DataSource = response;
            GridView1.DataBind();
        }
    }
}