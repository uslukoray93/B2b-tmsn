<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="sanal-pos-bilgi.aspx.cs" Inherits="GedizMakina.Admin.sanal_pos_bilgi" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-1">
            <dx:ASPxButton ID="btnKaydet" runat="server" Text="KAYDET" Theme="MaterialCompact" OnClick="btnKaydet_Click"></dx:ASPxButton>
        </div>
        <div class="col-md-11">
            <dx:ASPxLabel ID="lblUyari" runat="server" Theme="MaterialCompact"></dx:ASPxLabel>
        </div>
    </div>
    <hr />
    <div class="row">
        <div class="col-md-3">
            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Mağaza No (merchant_id)" Theme="MaterialCompact"></dx:ASPxLabel>
        </div>
        <div class="col-md-4"></div>
        <div class="col-md-5"></div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-3">
            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Mağaza Parola (merchant_key)" Theme="MaterialCompact"></dx:ASPxLabel>
        </div>
        <div class="col-md-4"></div>
        <div class="col-md-5"></div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-3">
            <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Mağaza Gizli Anahtar (merchant_salt)" Theme="MaterialCompact"></dx:ASPxLabel>
        </div>
        <div class="col-md-4"></div>
        <div class="col-md-5"></div>
    </div>
</asp:Content>
