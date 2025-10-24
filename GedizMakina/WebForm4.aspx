<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="GedizMakina.WebForm4" %>

<%@ Register assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="375px">
            </dx:ASPxTextBox>
        </div>
        <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" OnClick="ASPxButton1_Click" Text="ASPxButton">
        </dx:ASPxButton>
        <dx:ASPxLabel ID="ASPxLabel1" runat="server">
        </dx:ASPxLabel>
    </form>
</body>
</html>
