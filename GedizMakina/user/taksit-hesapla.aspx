<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="taksit-hesapla.aspx.cs" Inherits="GedizMakina.user.taksit_hesapla" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-1"><label>Tutar Girin</label></div>
        <div class="col-md-3">
            <input id="txtTutar" runat="server" class="form-control" /></div>
        <div class="col-md-1"><button id="btnHesapla" runat="server" class="btn btn-primary" onserverclick="btnHesapla_ServerClick">Hesapla</button></div>
    </div>
    <hr />
    <section class="simple-compose-box mb-3">

        <asp:Label ID="lblFiyatTL" runat="server" Text="Label" Visible="false"></asp:Label>
        <div class="card-body">
            <style>
                #paytr_taksit_tablosu {
                    clear: both;
                    font-size: 12px;
                    max-width: 1200px;
                    text-align: center;
                    font-family: Arial, sans-serif;
                }

                    #paytr_taksit_tablosu::before {
                        display: table;
                        content: " ";
                    }

                    #paytr_taksit_tablosu::after {
                        content: "";
                        clear: both;
                        display: table;
                    }

                .taksit-tablosu-wrapper {
                    margin: 5px;
                    width: 280px;
                    padding: 12px;
                    cursor: default;
                    text-align: center;
                    display: inline-block;
                    border: 1px solid #e1e1e1;
                }

                .taksit-logo img {
                    max-height: 28px;
                    padding-bottom: 10px;
                }

                .taksit-tutari-text {
                    float: left;
                    width: 126px;
                    color: #a2a2a2;
                    margin-bottom: 5px;
                }

                .taksit-tutar-wrapper {
                    display: inline-block;
                    background-color: #f7f7f7;
                }

                    .taksit-tutar-wrapper:hover {
                        background-color: #e8e8e8;
                    }

                .taksit-tutari {
                    float: left;
                    width: 126px;
                    padding: 6px 0;
                    color: #474747;
                    border: 2px solid #ffffff;
                }

                .taksit-tutari-bold {
                    font-weight: bold;
                }

                @media all and (max-width: 600px) {
                    .taksit-tablosu-wrapper {
                        margin: 5px 0;
                    }
                }
            </style>
            <div id="paytr_taksit_tablosu"></div>
            <div id="divTaksit" runat="server" visible="false">
                <script src="https://www.paytr.com/odeme/taksit-tablosu/v2?token=71c73f6303049ae3e7df650d6614bd16fe94fd5ba751c31e952f8d2f04cf40ee&merchant_id=496818&amount=113"></script>
            </div>

        </div>

    </section>
</asp:Content>
