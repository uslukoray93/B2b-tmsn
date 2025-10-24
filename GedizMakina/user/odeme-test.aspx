<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="odeme-test.aspx.cs" Inherits="GedizMakina.user.odeme_test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <script src="https://www.paytr.com/js/iframeResizer.min.js"></script>
            <iframe visible="false" runat="server" id="paytriframe" frameborder="0" scrolling="no" style="width: 100%;"></iframe>
            <script>iFrameResize({}, '#paytriframe');</script>

        </div>
    </form>
</body>
</html>
