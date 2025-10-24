<%@ Page Title="Hesap Bakiyesi" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="hesap-bakiyesi.aspx.cs" Inherits="GedizMakina.user.hesap_bakiyesi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-6">
            <section class="card card-success mb-4">
                <header class="card-header">


                    <h2 class="card-title">MÜŞTERİ</h2>
                </header>
                <div class="card-body">
                    <h3><b>GEDİZ MAKİNA</b></h3>
                </div>
            </section>
        </div>
        <div class="col-md-6">
            <section class="card card-danger mb-4">
                <header class="card-header">


                    <h2 class="card-title">TOPLAM BAKİYE</h2>
                </header>
                <div class="card-body">
                    <h3><b id="lblToplamBorc" runat="server">0.26 ₺</b></h3>
                    <br />
                    <a href="/online-odeme" runat="server" class="btn btn-danger">Ödeme Yap</a>
                </div>
            </section>
        </div>
    </div>
</asp:Content>
