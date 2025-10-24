<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="kk-odeme.aspx.cs" Inherits="GedizMakina.user.kk_odeme" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>DatPayment example</title>
    <meta charset='utf-8'>
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/KK/dist/css/DatPayment.css">
    <link rel="stylesheet" type="text/css" href="/KK/example.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <%--<div class="col-md-12">
            KK ÖDEME SAYFASI

            ÖDENECEK TUTAR =
            <h4 id="lblOdemeTutari" runat="server" style="font-weight: bold"></h4>
        </div>--%>
    </div>
    <hr />
    <div class="row datpayment-form" id="payment-form">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <%--<div class="dpf-title">
                    Paiement par carte bancaire
               
            <div class="accepted-cards-logo"></div>
                </div>--%>
                <div class="dpf-card-placeholder"></div>
                <div class="dpf-input-container">
                    <div class="dpf-input-row">
                        <label class="dpf-input-label">KART NUMARASI</label>
                        <div class="dpf-input-container with-icon">
                            <span class="dpf-input-icon"><i class="fa fa-credit-card" aria-hidden="true"></i></span>
                            <input type="text" class="dpf-input" size="20" data-type="number">
                        </div>
                    </div>

                    <div class="dpf-input-row">
                        <div class="dpf-input-column">
                            <input type="hidden" size="2" data-type="exp_month" placeholder="MM">
                            <input type="hidden" size="2" data-type="exp_year" placeholder="YY">

                            <label class="dpf-input-label">SKT</label>
                            <div class="dpf-input-container">
                                <input type="text" class="dpf-input" data-type="expiry">
                            </div>
                        </div>
                        <div class="dpf-input-column">
                            <label class="dpf-input-label">CVC</label>
                            <div class="dpf-input-container">
                                <input type="text" class="dpf-input" size="4" data-type="cvc">
                            </div>
                        </div>
                    </div>

                    <div class="dpf-input-row">
                        <label class="dpf-input-label">KART ÜZERİNDEKİ İSİM</label>
                        <div class="dpf-input-container">
                            <input type="text" size="4" class="dpf-input" data-type="name">
                        </div>
                    </div>

                    <button type="button" class="dpf-submit" id="btnOdemeYap" runat="server" onserverclick="btnOdemeYap_ServerClick">
                        <span class="btn-active-state">Payer maintenant
                        </span>
                        <span class="btn-loading-state">
                            <i class="fa fa-refresh "></i>
                        </span>
                    </button>
                </div>

            </div>
            <div class="col-md-4"></div>
        </div>


        <%--<div class="col-md-6">
            <asp:Button ID="btnOde" runat="server" Text="ÖDEME YAP (BAŞARILI)" OnClick="btnOde_Click" />
        </div>
        <div class="col-md-6">
            <asp:Button ID="btnOdeBasarisiz" runat="server" Text="ÖDEME YAP (BAŞARISIZ)" OnClick="btnOdeBasarisiz_Click" />
        </div>--%>
    </div>

    <pre id="demo-log"></pre>

        <script type="text/javascript" src="https://js.stripe.com/v2/"></script>
        <script type="text/javascript" src="/KK/dist/js/DatPayment.js"></script>

        <script type="text/javascript">
            var payment_form = new DatPayment({
                form_selector: '#payment-form',
                card_container_selector: '.dpf-card-placeholder',

                number_selector: '.dpf-input[data-type="number"]',
                date_selector: '.dpf-input[data-type="expiry"]',
                cvc_selector: '.dpf-input[data-type="cvc"]',
                name_selector: '.dpf-input[data-type="name"]',

                submit_button_selector: '.dpf-submit',

                placeholders: {
                    number: '•••• •••• •••• ••••',
                    expiry: '••/••',
                    cvc: '•••',
                    name: 'KART ÜZERİNDEKİ İSİM'
                },

                validators: {
                    number: function (number) {
                        return Stripe.card.validateCardNumber(number);
                    },
                    expiry: function (expiry) {
                        var expiry = expiry.split(' / ');
                        return Stripe.card.validateExpiry(expiry[0] || 0, expiry[1] || 0);
                    },
                    cvc: function (cvc) {
                        return Stripe.card.validateCVC(cvc);
                    },
                    name: function (value) {
                        return value.length > 0;
                    }
                }
            });

            var demo_log_div = document.getElementById("demo-log");

            payment_form.form.addEventListener('payment_form:submit', function (e) {
                var form_data = e.detail;
                payment_form.unlockForm();
                demo_log_div.innerHTML += "<br>" + JSON.stringify(form_data);
            });

            payment_form.form.addEventListener('payment_form:field_validation_success', function (e) {
                var input = e.detail;

                demo_log_div.innerHTML += "<br>field_validation_success:" + input.getAttribute("data-type");

            });

            payment_form.form.addEventListener('payment_form:field_validation_failed', function (e) {
                var input = e.detail;

                demo_log_div.innerHTML += "<br>field_validation_failed:" + input.getAttribute("data-type");
            });
        </script>
</asp:Content>
