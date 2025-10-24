<%@ Page Title="Garanti Talebi" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="garanti-talebi.aspx.cs" Inherits="GedizMakina.user.garanti_talebi" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-1"><asp:Label ID="Label14" runat="server" Text="Garanti Tipi"></asp:Label></div>
        <div class="col-md-11">
            <asp:RadioButtonList ID="rblGarantiTip" runat="server" RepeatDirection="Horizontal" Width="100%" AutoPostBack="true" OnSelectedIndexChanged="rblGarantiTip_SelectedIndexChanged">
                <asp:ListItem Value="1" Selected="True">Mamul</asp:ListItem>
                <asp:ListItem Value="2">Aksesuar ve Yedek Parça</asp:ListItem>
            </asp:RadioButtonList></div>
    </div>
    <div class="row">
        <div class="col-md-1">
            <asp:Label ID="Label1" runat="server" Text="Ürün Kodu"></asp:Label>
        </div>
        <div class="col-md-11">
            <dx:ASPxComboBox ID="ddUrunKodu" runat="server" Theme="MaterialCompact" Width="100%" DataSourceID="dsSiparisler" ValueField="DetayId" AutoPostBack="true" OnSelectedIndexChanged="ddUrunKodu_SelectedIndexChanged" TextFormatString="{2}">
                <Columns>
                    <dx:ListBoxColumn Caption="Sipariş Tarihi" FieldName="SiparisTarihi">
                    </dx:ListBoxColumn>
                    <dx:ListBoxColumn Caption="Sipariş No" FieldName="SiparisNo">
                    </dx:ListBoxColumn>
                    <dx:ListBoxColumn Caption="Ürün Kodu" FieldName="UrunKodu">
                    </dx:ListBoxColumn>
                    <dx:ListBoxColumn Caption="Ürün Adı" FieldName="UrunAdi">
                    </dx:ListBoxColumn>
                </Columns>
            </dx:ASPxComboBox>
            <asp:SqlDataSource ID="dsSiparisler" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT sd.DetayId,
       sd.SiparisId,
       sd.CariId,
       sd.UrunId,
       sd.Miktar,
       (SELECT s.SiparisNo
        FROM Siparisler s
        WHERE s.SiparisId = sd.SiparisId) SiparisNo,
        stk.STK UrunKodu,
        stk.STA UrunAdi,
        (Select format(s.SiparisTarihi, 'dd.MM.yyyy') From Siparisler s Where s.SiparisId = sd.SiparisId) SiparisTarihi
FROM SiparisDetay sd
Inner Join Urunler ur
ON ur.UrunId = sd.UrunId
INNER JOIN [GEDIZLINK].DENEME_2024T.dbo.STOKGEN stk
                  ON ur.RefId = stk.REF
WHERE sd.CariId = @CariId
Order By 9 ASC">
                <SelectParameters>
                    <asp:SessionParameter Name="CariId" SessionField="sLoginId" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    <div class="row">
        <div class="col-md-1">
            <asp:Label ID="Label2" runat="server" Text="Ürün Adı"></asp:Label>
            <asp:Label ID="lblUrunId" runat="server" Visible="false"></asp:Label>
        </div>
        <div class="col-md-11">
            <asp:TextBox ID="txtUrunAdi" runat="server" CssClass="form-control" Width="100%" Enabled="False"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-1">
            <asp:Label ID="Label3" runat="server" Text="Üretici"></asp:Label>
        </div>
        <div class="col-md-5">
            <asp:TextBox ID="txtUretici" runat="server" CssClass="form-control" Width="100%" Enabled="False"></asp:TextBox>
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
            <asp:TextBox ID="txtSatisTarihi" runat="server" CssClass="form-control" Width="100%" Enabled="False"></asp:TextBox>
        </div>
        <div class="col-md-1">
            <asp:Label ID="Label6" runat="server" Text="Fatura No"></asp:Label>
        </div>
        <div class="col-md-5">
            <asp:TextBox ID="txtFaturaNo" runat="server" CssClass="form-control" Width="100%"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-1">
            <asp:Label ID="Label10" runat="server" Text="Açıklama"></asp:Label>
        </div>
        <div class="col-md-11">
            <asp:TextBox ID="txtAciklama" runat="server" CssClass="form-control" Width="100%" TextMode="MultiLine"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-1">
            <asp:Label ID="lblParcalar" runat="server" Text="Parçalar"></asp:Label>
        </div>
        <div class="col-md-11">
            <asp:Button ID="btnParcaEkle" runat="server" CssClass="btn btn-success" Text="Parça Ekle" />
        </div>
    </div>
    <br />
    <div class="row" style=" background-color: #444444; height:28px; border-radius: 5px">
        <h4 style="color: whitesmoke">Mamul Sahibi Bilgileri</h4>
    </div>
    <br />
    <div class="row">
        <div class="col-md-1"><asp:Label ID="Label4" runat="server" Text="Adı Soyadı"></asp:Label></div>
        <div class="col-md-5"><asp:TextBox ID="txtMamulSahibi" runat="server" CssClass="form-control" Width="100%"></asp:TextBox></div>
        <div class="col-md-1"><asp:Label ID="Label7" runat="server" Text="Telefon"></asp:Label></div>
        <div class="col-md-5"><asp:TextBox ID="txtMamulSahibiTelefon" runat="server" CssClass="form-control" Width="100%"></asp:TextBox></div>
    </div>
    <br />
    <div class="row" style=" background-color: #444444; height:28px; border-radius: 5px">
        <h4 style="color: whitesmoke">Yetkili Bayi Bilgileri</h4>
    </div>
    <br />
    <div class="row">
        <div class="col-md-1"><asp:Label ID="Label8" runat="server" Text="Unvanı"></asp:Label></div>
        <div class="col-md-5"><asp:TextBox ID="txtCariAdi" runat="server" CssClass="form-control" Width="100%" Enabled="False"></asp:TextBox></div>
        <div class="col-md-1"><asp:Label ID="Label9" runat="server" Text="Adres"></asp:Label></div>
        <div class="col-md-5"><asp:TextBox ID="txtCariAdres" runat="server" CssClass="form-control" Width="100%" Enabled="False"></asp:TextBox></div>
    </div>
    <div class="row">
        <div class="col-md-1"><asp:Label ID="Label15" runat="server" Text="Şehir"></asp:Label></div>
        <div class="col-md-5"><asp:TextBox ID="txtCariSehir" runat="server" CssClass="form-control" Width="100%" Enabled="False"></asp:TextBox></div>
        <div class="col-md-1"><asp:Label ID="Label16" runat="server" Text="İlçe"></asp:Label></div>
        <div class="col-md-5"><asp:TextBox ID="txtCariIlce" runat="server" CssClass="form-control" Width="100%" Enabled="False"></asp:TextBox></div>
    </div>
    <div class="row">
        <div class="col-md-1"><asp:Label ID="Label17" runat="server" Text="Telefon"></asp:Label></div>
        <div class="col-md-5"><asp:TextBox ID="txtCariTelefon" runat="server" CssClass="form-control" Width="100%" Enabled="False"></asp:TextBox></div>
        <div class="col-md-1"><asp:Label ID="Label18" runat="server" Text="E-Posta"></asp:Label></div>
        <div class="col-md-5"><asp:TextBox ID="txtCariEposta" runat="server" CssClass="form-control" Width="100%" Enabled="False"></asp:TextBox></div>
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
            <asp:Button ID="btnGonder" runat="server" Text="Gönder" CssClass="btn btn-dark" Width="100%" OnClick="btnGonder_Click" />
            <br />
            <asp:Label ID="lblUyari" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>
