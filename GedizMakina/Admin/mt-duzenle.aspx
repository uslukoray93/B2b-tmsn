<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="mt-duzenle.aspx.cs" Inherits="GedizMakina.Admin.mt_duzenle" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .myAlignment td.dxe {
            vertical-align: top !important;
        }
    </style>
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
        <div class="col-md-4"></div>
    </div>
    <hr />
    <div class="row">
        <div class="col-md-6">
            <dx:ASPxButton ID="btnAktar" runat="server" Text="SEÇİLENLERİ AKTAR" Theme="MaterialCompact" Width="100%" OnClick="btnAktar_Click"></dx:ASPxButton>
            <br />
            <br />
            <div class="row">
                <div class="col-md-12" style="overflow: auto; height: 400px">
                    <dx:ASPxCheckBoxList ID="chlTumCariler" runat="server" DataSourceID="dsCariler" EnableTheming="True" Height="300px" TextField="CariAdiTam" Theme="MaterialCompact" ValueField="CariId" Width="100%" CssClass="myAlignment"></dx:ASPxCheckBoxList>
                    <asp:SqlDataSource ID="dsCariler" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="Select CariId, CariAdi, CariKodu + ' | ' + CariAdi CariAdiTam From Cariler Where CariId IN
(
Select CariId From Cariler Where YetkiId = 1000000002
EXCEPT
Select CariId From MtCari
)
Order By 2"></asp:SqlDataSource>
                </div>
            </div>

        </div>
        <div class="col-md-6">
            <dx:ASPxButton ID="btnGeri" runat="server" Text="ÇIKART" Theme="MaterialCompact" Width="100%" OnClick="btnGeri_Click"></dx:ASPxButton>
            <br />
            <br />
            <div class="row">
                <div class="col-md-12" style="overflow: auto; height: 400px;">
                    <dx:ASPxCheckBoxList ID="chlSecilenCariler" runat="server" DataSourceID="dsSeciliCariler" Height="300px" TextField="CariAdi" Theme="MaterialCompact" ValueField="KayitId" Width="100%" CssClass="myAlignment"></dx:ASPxCheckBoxList>
                    <asp:SqlDataSource ID="dsSeciliCariler" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT mc.KayitId,
       mc.MtId,
       mc.CariId,
       (SELECT cr.CariKodu + ' | ' + cr.CariAdi
        FROM Cariler cr
        WHERE cr.CariId = mc.CariId) CariAdi
FROM MtCari mc
WHERE mc.MtId = @MtId
Order By 4">
                        <SelectParameters>
                            <asp:SessionParameter Name="MtId" SessionField="sMtId" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
