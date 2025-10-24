<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="kknew.aspx.cs" Inherits="GedizMakina.user.kknew" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Example 06 - Change Form Field Names | CardJs</title>

    <script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

    <link href="/pos2/card-js.min.css" rel="stylesheet" type="text/css" />
    <script src="/pos2/card-js.min.js"></script>

    <style type="text/css">
        form button {
            display: block;
            margin-top: 15px;
            width: 100%;
            font-size: 12px;
            padding: 8px 12px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <%--<div class="row">
                <div class="col-md-12">
                    <dx:ASPxLabel ID="lblOdemeTutari" runat="server" Theme="MaterialCompact"></dx:ASPxLabel>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-12">
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Kart Üzerindeki İsim" Theme="MaterialCompact"></dx:ASPxLabel>
                    <br />
                    <dx:ASPxTextBox ID="txtKartIsim" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxTextBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-12">
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Kart Numarası" Theme="MaterialCompact"></dx:ASPxLabel>
                    <br />
                    <dx:ASPxTextBox ID="txtKartNo" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxTextBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-6">
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="AY" Theme="MaterialCompact"></dx:ASPxLabel>
                    <br />
                    <dx:ASPxComboBox ID="ddAy" runat="server" ValueType="System.String" Theme="MaterialCompact" Width="100%"></dx:ASPxComboBox>
                </div>
                <div class="col-md-6">
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="YIL" Theme="MaterialCompact"></dx:ASPxLabel>
                    <br />
                    <dx:ASPxComboBox ID="ddYil" runat="server" ValueType="System.String" Theme="MaterialCompact" Width="100%"></dx:ASPxComboBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-12">
                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="CVC" Theme="MaterialCompact"></dx:ASPxLabel>
                    <br />
                    <dx:ASPxTextBox ID="txtCvc" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxTextBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-12">
                    <dx:ASPxButton ID="btnGonder" runat="server" Text="GÖNDER" Theme="MaterialCompact" Width="100%" OnClick="btnGonder_Click"></dx:ASPxButton>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-md-6">
                    <dx:ASPxButton ID="btnOnay" runat="server" Text="ONAY" Theme="MaterialCompact" Width="100%" OnClick="btnOnay_Click"></dx:ASPxButton>
                </div>
                <div class="col-md-6">
                    <dx:ASPxButton ID="btnRet" runat="server" Text="RET" Theme="MaterialCompact" Width="100%" OnClick="btnRet_Click"></dx:ASPxButton>
                </div>
            </div>--%>
            <div class="form-horizontal" id="example-form" style="width: 300px">
                <fieldset>
                    <legend>Your Card Details</legend>

                    <!--
      -- Card JS Input Group
      -->
                    <div class="card-js form-group">

                        <!-- Card number -->
                        <input class="card-number form-control"
                            name="my-custom-form-field__card-number"
                            placeholder="Enter your card number"
                            autocomplete="off"
                            required>

                        <!-- Name on card -->
                        <input class="name form-control"
                            id="the-card-name-id"
                            name="my-custom-form-field__card-name"
                            placeholder="Enter the name on your card"
                            autocomplete="off"
                            required>


                        <!-- Card expiry (element that is displayed) -->
                        <input class="expiry form-control"
                            autocomplete="off"
                            required>

                        <!-- Card expiry - Month (hidden) -->
                        <input class="expiry-month" name="my-custom-form-field__card-expiry-month">

                        <!-- Card expiry - Year (hidden) -->
                        <input class="expiry-year" name="my-custom-form-field__card-expiry-year">


                        <!-- Card CVC -->
                        <input class="cvc form-control"
                            name="my-custom-form-field__card-cvc"
                            autocomplete="off"
                            required>
                    </div>
                    <!-- END .card-js wrapper -->


                    <!--
      -- Submit button
      --
      -- (Must be outside of the div with class 'card-js')
      -->
                    <button type="submit">Submit</button>

                </fieldset>
            </div>
            <hr />
            <%--<div class="row">
                <div class="col-md-12">
                    <dx:ASPxLabel ID="lblUyari" runat="server" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                </div>
            </div>--%>
        </div>
        <div class="col-md-4"></div>
    </div>
    <script>
        $(function () {

            // Only for example - catch form data when the form is submitted
            $("#example-form").submit(function (e) {

                // Stop form submission
                e.preventDefault();

                // Read form data
                var data = $("#example-form :input").serializeArray();

                var displayText = "";

                // For each input field...
                for (var i = 0; i < data.length; i++) {
                    var fieldData = data[i];
                    var name = fieldData["name"];
                    var value = fieldData["value"];

                    displayText += name + " : " + value + "\n";
                }

                alert(displayText);
            });

        });
</script>
</asp:Content>
