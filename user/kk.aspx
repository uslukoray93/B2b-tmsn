<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="kk.aspx.cs" Inherits="GedizMakina.user.kk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        Kart Sahibi Adı:
        <input type="text" name="cc_owner" value="TEST KARTI"><br>
        Kart Numarası:
        <input type="text" name="card_number" value="9792030394440796"><br>
        Kart Son Kullanma Ay:
        <input type="text" name="expiry_month" value="12"><br>
        Kart Son Kullanma Yıl:
        <input type="text" name="expiry_year" value="99"><br>
        Kart Güvenlik Kodu:
        <input type="text" name="cvv" value="000"><br>

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
        <input type="hidden" name="user_address" value="test test test">
        <input type="hidden" name="user_phone" value="05555555555">
        <input type="hidden" name="user_basket" value="UserBasket">
        <input type="hidden" name="debug_on" value="DebugOn">
        <input type="hidden" name="paytr_token" value="PaytrToken">
        <input type="hidden" name="non3d_test_failed" value="Non3dTestFailed">
        <input type="hidden" name="installment_count" value="InstallmentCount">
        <input type="hidden" name="card_type" value="CardType">
        <input type="submit" value="Submit">
        <asp:Button ID="btnGonder" runat="server" OnClick="btnGonder_Click" />
    </div>
</asp:Content>
