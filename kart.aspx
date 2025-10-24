<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kart.aspx.cs" Inherits="GedizMakina.kart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ÖDEME SAYFASI</title>
</head>
<body>
    <script src="https://www.paytr.com/js/iframeResizer.min.js"></script>
    <iframe visible="false" runat="server" id="paytriframe" frameborder="0" scrolling="no" style="width: 100%;"></iframe>
    <script>iFrameResize({}, '#paytriframe');</script>

</body>
</html>
