<%@ Page Title="Döviz Kurları" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="doviz-kurlari.aspx.cs" Inherits="GedizMakina.Admin.doviz_kurlari" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-1">
            <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Tarih" Theme="MaterialCompact"></dx:ASPxLabel>
            <dx:ASPxDateEdit ID="dtTarih" runat="server" Theme="MaterialCompact" Width="100%"></dx:ASPxDateEdit>
        </div>
        <div class="col-md-1">
            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="USD" Theme="MaterialCompact"></dx:ASPxLabel>
            <dx:ASPxTextBox ID="txtUsd" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxTextBox>
        </div>
        <div class="col-md-1">
            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="EUR" Theme="MaterialCompact"></dx:ASPxLabel>
            <dx:ASPxTextBox ID="txtEur" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxTextBox>
        </div>
        <div class="col-md-1">
            <br />
            <dx:ASPxButton ID="btnKaydet" runat="server" Text="KAYDET" Theme="MaterialCompact" Width="100%" OnClick="btnKaydet_Click"></dx:ASPxButton>
        </div>
        <div class="col-md-8">
            <dx:ASPxLabel ID="lblUyari" runat="server" Theme="MaterialCompact"></dx:ASPxLabel>
        </div>
    </div>
</asp:Content>
