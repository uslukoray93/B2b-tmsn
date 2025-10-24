<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="GedizMakina.WebForm2" %>

<%@ Register assembly="DevExpress.Web.ASPxHtmlEditor.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHtmlEditor" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxHtmlEditor ID="ASPxHtmlEditor1" runat="server">
            </dx:ASPxHtmlEditor>
            <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" OnClick="ASPxButton1_Click" Text="ASPxButton">
            </dx:ASPxButton>

            <dx:ASPxButton ID="ASPxButton2" runat="server" Text="ASPxButton" AutoPostBack="false" OnClick="ASPxButton2_Click"></dx:ASPxButton>

            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="ASPxLabel"></dx:ASPxLabel>
        </div>
    </form>
</body>
</html>
