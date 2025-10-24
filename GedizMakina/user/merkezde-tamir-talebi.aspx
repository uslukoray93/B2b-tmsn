<%@ Page Title="Merkezde Tamir Talebi" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="merkezde-tamir-talebi.aspx.cs" Inherits="GedizMakina.user.merkezde_tamir_talebi" %>
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
            <asp:Label ID="Label2" runat="server" Text="Ürün Adı"></asp:Label>
        </div>
        <div class="col-md-11">
            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-1">
            <asp:Label ID="Label3" runat="server" Text="Üretici"></asp:Label>
        </div>
        <div class="col-md-5">
            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
        </div>
        <div class="col-md-1">
            <asp:Label ID="lblSeriNo" runat="server" Text="Seri No"></asp:Label>
        </div>
        <div class="col-md-5">
            <asp:TextBox ID="txtSeriNo" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-1">
            <asp:Label ID="Label5" runat="server" Text="Satış Tarihi"></asp:Label>
        </div>
        <div class="col-md-5">
            <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
        </div>
        <div class="col-md-1">
            <asp:Label ID="Label6" runat="server" Text="Fatura No"></asp:Label>
        </div>
        <div class="col-md-5">
            <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-1">
            <asp:Label ID="Label14" runat="server" Text="Arıza Nedeni"></asp:Label>
        </div>
        <div class="col-md-11">
            <asp:DropDownList ID="ddArizaNedeni" runat="server" CssClass="form-control" Width="100%" DataSourceID="dsArizaNeden" DataTextField="NedenAdi" DataValueField="NedenId"></asp:DropDownList>
            <asp:SqlDataSource ID="dsArizaNeden" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT * FROM [ArizaNedenleri] ORDER BY [NedenId]"></asp:SqlDataSource>
        </div>
    </div>
    <div class="row">
        <div class="col-md-1">
            <asp:Label ID="Label10" runat="server" Text="Açıklama"></asp:Label>
        </div>
        <div class="col-md-11">
            <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control" Width="100%" TextMode="MultiLine"></asp:TextBox>
        </div>
    </div>
    <br />
    <div class="row" style=" background-color: #444444; height:28px; border-radius: 5px">
        <h4 style="color: whitesmoke">Mamul Sahibi Bilgileri</h4>
    </div>
    <br />
    <div class="row">
        <div class="col-md-1"><asp:Label ID="Label4" runat="server" Text="Adı Soyadı"></asp:Label></div>
        <div class="col-md-5"><asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" Width="100%"></asp:TextBox></div>
        <div class="col-md-1"><asp:Label ID="Label7" runat="server" Text="Telefon"></asp:Label></div>
        <div class="col-md-5"><asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" Width="100%"></asp:TextBox></div>
    </div>
    <br />
    <div class="row" style=" background-color: #444444; height:28px; border-radius: 5px">
        <h4 style="color: whitesmoke">Yetkili Bayi Bilgileri</h4>
    </div>
    <br />
    <div class="row">
        <div class="col-md-1"><asp:Label ID="Label8" runat="server" Text="Unvanı"></asp:Label></div>
        <div class="col-md-5"><asp:TextBox ID="TextBox8" runat="server" CssClass="form-control" Width="100%"></asp:TextBox></div>
        <div class="col-md-1"><asp:Label ID="Label9" runat="server" Text="Adres"></asp:Label></div>
        <div class="col-md-5"><asp:TextBox ID="TextBox10" runat="server" CssClass="form-control" Width="100%"></asp:TextBox></div>
    </div>
    <div class="row">
        <div class="col-md-1"><asp:Label ID="Label15" runat="server" Text="Şehir"></asp:Label></div>
        <div class="col-md-5"><asp:TextBox ID="TextBox11" runat="server" CssClass="form-control" Width="100%"></asp:TextBox></div>
        <div class="col-md-1"><asp:Label ID="Label16" runat="server" Text="İlçe"></asp:Label></div>
        <div class="col-md-5"><asp:TextBox ID="TextBox12" runat="server" CssClass="form-control" Width="100%"></asp:TextBox></div>
    </div>
    <div class="row">
        <div class="col-md-1"><asp:Label ID="Label17" runat="server" Text="Telefon"></asp:Label></div>
        <div class="col-md-5"><asp:TextBox ID="TextBox13" runat="server" CssClass="form-control" Width="100%"></asp:TextBox></div>
        <div class="col-md-1"><asp:Label ID="Label18" runat="server" Text="E-Posta"></asp:Label></div>
        <div class="col-md-5"><asp:TextBox ID="TextBox14" runat="server" CssClass="form-control" Width="100%"></asp:TextBox></div>
    </div>
    <hr />
    <div class="row">
        <div class="col-md-4">
            <asp:Label ID="Label11" runat="server" Text="Fatura Ekleme"></asp:Label>
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
        <div class="col-md-2">
            <asp:Button ID="btnGonder" runat="server" Text="Gönder" CssClass="btn btn-dark" Width="100%" /></div>
    </div>
</asp:Content>
