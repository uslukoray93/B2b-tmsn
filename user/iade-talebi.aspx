<%@ Page Title="İade Talebi" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="iade-talebi.aspx.cs" Inherits="GedizMakina.user.iade_talebi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-1">
            <asp:Label ID="Label1" runat="server" Text="Ürün Kodu"></asp:Label>
        </div>
        <div class="col-md-11">
            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-1">
            <asp:Label ID="Label2" runat="server" Text="Ürün Adı"></asp:Label></div>
        <div class="col-md-11">
            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Width="100%"></asp:TextBox></div>
    </div>
    <div class="row">
        <div class="col-md-1">
            <asp:Label ID="Label3" runat="server" Text="Üretici"></asp:Label></div>
        <div class="col-md-5">
            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Width="100%"></asp:TextBox></div>
        <div class="col-md-1">
            <asp:Label ID="Label4" runat="server" Text="Üretici Kodu"></asp:Label></div>
        <div class="col-md-5">
            <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" Width="100%"></asp:TextBox></div>
    </div>
    <div class="row">
        <div class="col-md-1">
            <asp:Label ID="Label5" runat="server" Text="Tarih"></asp:Label></div>
        <div class="col-md-5">
            <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" Width="100%"></asp:TextBox></div>
        <div class="col-md-1">
            <asp:Label ID="Label6" runat="server" Text="Fatura No"></asp:Label></div>
        <div class="col-md-5">
            <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" Width="100%"></asp:TextBox></div>
    </div>
    <div class="row">
        <div class="col-md-1">
            <asp:Label ID="Label7" runat="server" Text="Miktar"></asp:Label></div>
        <div class="col-md-5">
            <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" Width="100%"></asp:TextBox></div>
        <div class="col-md-1">
            <asp:Label ID="Label8" runat="server" Text="Birim Fiyat"></asp:Label></div>
        <div class="col-md-5">
            <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control" Width="100%"></asp:TextBox></div>
    </div>
    <div class="row">
        <div class="col-md-1">
            <asp:Label ID="Label9" runat="server" Text="İade Nedeni"></asp:Label></div>
        <div class="col-md-11">
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" Width="100%"></asp:DropDownList>
        </div>
    </div>
    <div class="row">
        <div class="col-md-1">
            <asp:Label ID="Label10" runat="server" Text="İade Notu"></asp:Label></div>
        <div class="col-md-11">
            <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control" Width="100%" TextMode="MultiLine"></asp:TextBox></div>
    </div>
    <hr />
    <div class="row">
        <div class="col-md-4">
            <asp:Label ID="Label11" runat="server" Text="Ürün Görseli"></asp:Label>
        </div>
        <div class="col-md-4">
            <asp:Label ID="Label12" runat="server" Text="Ürün Görseli"></asp:Label>
        </div>
        <div class="col-md-4">
            <asp:Label ID="Label13" runat="server" Text="Ürün Videosu"></asp:Label>
        </div>
    </div>
    <hr />
    <div class="row">
        <div class="col-md-10"></div>
        <div class="col-md-2"><asp:Button ID="btnGonder" runat="server" Text="Gönder" CssClass="btn btn-dark" Width="100%" /></div>
    </div>
</asp:Content>
