<%@ Page Title="Havale Bildirimi" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="havale-bildirimi.aspx.cs" Inherits="GedizMakina.user.havale_bildirimi" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-6">
            <div class="row">
                <div class="col-md-3">
                    <asp:Label ID="Label1" runat="server" Text="Tutar"></asp:Label>
                </div>
                <div class="col-md-9">
                    <asp:TextBox ID="txtTutar" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-3">
                    <asp:Label ID="Label2" runat="server" Text="Sipariş Numarası"></asp:Label></div>
                <div class="col-md-9">
                    <asp:DropDownList ID="ddSiparisNo" runat="server" CssClass="form-control" DataSourceID="dsSiparisler" DataTextField="SiparisNo" DataValueField="SiparisId"></asp:DropDownList>
                    <asp:SqlDataSource ID="dsSiparisler" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="Select SiparisId, SiparisNo + ' - ' + ' - ' + convert(varchar, convert(date, SiparisTarihi, 104)) + ' - ' + Format(GenelTutar, 'N2') SiparisNo From Siparisler Where CariId = @CariId Order By SiparisTarihi DESC">
                        <SelectParameters>
                            <asp:SessionParameter Name="CariId" SessionField="sLoginId" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-3">
                    <asp:Label ID="Label3" runat="server" Text="Banka"></asp:Label></div>
                <div class="col-md-9">
                    <asp:DropDownList ID="ddBanka" runat="server" CssClass="form-control" Width="100%" DataSourceID="dsBankalar" DataTextField="BankaAdi" DataValueField="BankaId"></asp:DropDownList>
                    <asp:SqlDataSource ID="dsBankalar" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT [BankaId], [BankaAdi] FROM [Bankalar] ORDER BY [BankaAdi]"></asp:SqlDataSource>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-3">
                    <asp:Label ID="Label4" runat="server" Text="Dosya Ekle"></asp:Label></div>
                <div class="col-md-9">
                    <dx:ASPxUploadControl ID="ucFile" runat="server" UploadMode="Auto" Width="100%" Theme="Moderno" AutoStartUpload="True" ShowClearFileSelectionButton="False" ShowProgressPanel="True" OnFileUploadComplete="ucFile_FileUploadComplete"></dx:ASPxUploadControl>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-3">
                    <asp:Label ID="Label5" runat="server" Text="Not"></asp:Label></div>
                <div class="col-md-9">
                    <asp:TextBox ID="txtNot" runat="server" Width="100%" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-10">
                    <asp:Label ID="lblUyari" runat="server"></asp:Label></div>
                <div class="col-md-2">
                    <asp:Button ID="btnKaydet" runat="server" Text="Gönder" CssClass="btn btn-dark" Width="100%" OnClick="btnKaydet_Click" /></div>
            </div>
        </div>
        <div class="col-md-6"></div>
    </div>
</asp:Content>
