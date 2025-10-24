<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="tamamlaniyor.aspx.cs" Inherits="GedizMakina.tamamlaniyor" %>

<%@ Register assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" Modal="True" Text="Siparişiniz Oluşturuluyor. Lütfen Bekleyin...&amp;hellip;" Theme="MaterialCompact">
            </dx:ASPxLoadingPanel>
        </div>
    </form>
</body>
</html>
