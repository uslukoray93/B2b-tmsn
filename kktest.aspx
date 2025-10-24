<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="kktest.aspx.cs" Inherits="GedizMakina.kktest" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxPopupControl ID="poKart" runat="server" Theme="Moderno" Width="500px" ShowOnPageLoad="true" CloseAction="None" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                        <dx:ASPxTextBox ID="txtIsimSoyisim" runat="server" Text="PAYTR TEST" Theme="Moderno" Width="100%">
                        </dx:ASPxTextBox>
                        <br />
                        <dx:ASPxTextBox ID="txtKartNo" runat="server" Text="4355 0843 5508 4358" Theme="Moderno" Width="100%">
                        </dx:ASPxTextBox>
                        <br />
                        <dx:ASPxTextBox ID="txtAy" runat="server" Text="12" Theme="Moderno" Width="170px">
                        </dx:ASPxTextBox>
                        <dx:ASPxTextBox ID="txtYil" runat="server" Text="30" Theme="Moderno" Width="170px">
                        </dx:ASPxTextBox>
                        <br />
                        <dx:ASPxTextBox ID="txtCvc" runat="server" Text="000" Theme="Moderno" Width="170px">
                        </dx:ASPxTextBox>
                        <br />
                        <dx:ASPxButton ID="btnGonder" runat="server" AutoPostBack="False" Text="GÖNDER GELSİN" Theme="Moderno" OnClick="btnGonder_Click">
                        </dx:ASPxButton>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
            <input type="hidden" name="merchant_id" value="MerchantId">
            <input type="hidden" name="user_ip" value="UserIp">
            <input type="hidden" name="merchant_oid" value="MerchantOid">
            <input type="hidden" name="email" value="Email">
            <input type="hidden" name="payment_type" value="PaymentType">
            <input type="hidden" name="payment_amount" value="PaymentAmount">
            <input type="hidden" name="currency" value="Currency">
            <input type="hidden" name="test_mode" value="TestMode">
            <input type="hidden" name="non_3d" value="Non3d">
            <input type="hidden" name="merchant_ok_url" value="MerchantOkUrl">
            <input type="hidden" name="merchant_fail_url" value="MerchantFailUrl">
            <input type="hidden" name="user_name" value="Paytr Test">
            <input type="hidden" name="user_address" value="UserAddress">
            <input type="hidden" name="user_phone" value="UserPhone">
            <input type="hidden" name="user_basket" value="UserBasket">
            <input type="hidden" name="debug_on" value="DebugOn">
            <input type="hidden" name="paytr_token" value="PaytrToken">
            <input type="hidden" name="non3d_test_failed" value="Non3dTestFailed">
            <input type="hidden" name="installment_count" value="InstallmentCount">
            <input type="hidden" name="card_type" value="CardType">
        </div>
    </form>
</body>
</html>
