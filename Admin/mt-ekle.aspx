<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="mt-ekle.aspx.cs" Inherits="GedizMakina.Admin.mt_ekle" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-1">
            <dx:ASPxButton ID="btnKaydet" runat="server" Text="KAYDET" Theme="MaterialCompact" Width="100%" AutoPostBack="false" OnClick="btnKaydet_Click"></dx:ASPxButton>
        </div>
        <div class="col-md-11">
            <dx:ASPxLabel ID="lblUyari" runat="server" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
        </div>
    </div>
    <hr />
    <div class="row">
        <div class="col-md-1">
            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Kullanıcı Adı" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
        </div>
        <div class="col-md-3">
            <dx:ASPxTextBox ID="txtKullaniciAdi" runat="server" Width="100%" Theme="MaterialCompact" MaxLength="10"></dx:ASPxTextBox>
        </div>
        <div class="col-md-1">
            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Isim Soyisim" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
        </div>
        <div class="col-md-3">
            <dx:ASPxTextBox ID="txtIsimSoyisim" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxTextBox>
        </div>
        <div class="col-md-1">
            <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Renk" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
        </div>
        <div class="col-md-3">
            <dx:ASPxColorEdit ID="ceRenk" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxColorEdit>
        </div>
    </div>
</asp:Content>
