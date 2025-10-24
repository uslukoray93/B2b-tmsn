<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="ticket-enter.aspx.cs" Inherits="GedizMakina.Admin.ticket_enter" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-1">
            <dx:ASPxButton ID="btnGonder" runat="server" Text="GÖNDER" Theme="MaterialCompact" Width="100%" OnClick="btnGonder_Click" AutoPostBack="false"></dx:ASPxButton>
        </div>
        <div class="col-md-11">
            <dx:ASPxLabel ID="lblUyari" runat="server" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
        </div>
    </div>
    <hr />
    <div class="row">
        <div class="col-md-12">
            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Soru Kategorisi" Width="100%" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
            <br />
            <dx:ASPxComboBox ID="ddKategori" runat="server" ValueType="System.String" Theme="MaterialCompact" Width="100%"></dx:ASPxComboBox>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-12">
            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Soru Başlığı" Width="100%" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
            <br />
            <dx:ASPxTextBox ID="txtSoruBaslik" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxTextBox>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-12">
            <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Sorunuz" Width="100%" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
            <br />
            <dx:ASPxMemo ID="txtSoru" runat="server" Height="250px" Width="100%" Theme="MaterialCompact"></dx:ASPxMemo>
        </div>
    </div>
</asp:Content>
