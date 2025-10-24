<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="raporlar.aspx.cs" Inherits="GedizMakina.Admin.raporlar" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-6">
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Theme="MaterialCompact">
                <SettingsPager PageSize="20">
                </SettingsPager>
                <Settings ShowTitlePanel="True" />
                <SettingsPopup>
                    <FilterControl AutoUpdatePosition="False"></FilterControl>
                </SettingsPopup>
                <SettingsText Title="EN ÇOK SATILAN ÜRÜNLER" />
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="UrunId" Visible="False" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Ürün Adı" FieldName="UrunAdi" ReadOnly="True" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Satış Miktarı" FieldName="UrunSatisMiktar" ReadOnly="True" VisibleIndex="2">
                        <HeaderStyle HorizontalAlign="Right" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Hasilat" ReadOnly="True" Visible="False" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <Styles>
                    <TitlePanel BackColor="Black" Font-Bold="True" ForeColor="White">
                    </TitlePanel>
                </Styles>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT sd.UrunId,
       (SELECT stk.STA
        FROM Urunler ur
             INNER JOIN [GEDIZLINK].DENEME_2024T.dbo.STOKGEN stk
                ON stk.REF = ur.RefId
        WHERE ur.UrunId = sd.UrunId) UrunAdi,
       SUM (sd.Miktar) UrunSatisMiktar,
       SUM(sd.ToplamFiyat) * SUM(sd.Miktar) Hasilat
FROM SiparisDetay sd
GROUP BY sd.UrunId
ORDER BY 3 DESC"></asp:SqlDataSource>
        </div>
        <div class="col-md-6">
            <dx:ASPxGridView ID="ASPxGridView2" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Theme="MaterialCompact">
                <SettingsPager PageSize="20">
                </SettingsPager>
                <Settings ShowTitlePanel="True" />
                <SettingsPopup>
                    <FilterControl AutoUpdatePosition="False"></FilterControl>
                </SettingsPopup>
                <SettingsText Title="EN ÇOK CİRO GETİREN ÜRÜNLER" />
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="UrunId" Visible="False" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Ürün Adı" FieldName="UrunAdi" ReadOnly="True" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UrunSatisMiktar" ReadOnly="True" Visible="False" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Toplam Ciro" FieldName="Hasilat" ReadOnly="True" VisibleIndex="3">
                        <PropertiesTextEdit DisplayFormatString="N2">
                        </PropertiesTextEdit>
                        <HeaderStyle HorizontalAlign="Right" />
                    </dx:GridViewDataTextColumn>
                </Columns>
                <Styles>
                    <TitlePanel BackColor="Black" Font-Bold="True" ForeColor="White">
                    </TitlePanel>
                </Styles>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT sd.UrunId,
       (SELECT stk.STA
        FROM Urunler ur
             INNER JOIN [GEDIZLINK].DENEME_2024T.dbo.STOKGEN stk
                ON stk.REF = ur.RefId
        WHERE ur.UrunId = sd.UrunId) UrunAdi,
       SUM (sd.Miktar) UrunSatisMiktar,
       SUM(sd.ToplamFiyat) * SUM(sd.Miktar) Hasilat
FROM SiparisDetay sd
GROUP BY sd.UrunId
ORDER BY 4 DESC"></asp:SqlDataSource>
        </div>
        <div class="col-md-6">
            <dx:ASPxGridView ID="ASPxGridView3" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Theme="MaterialCompact">
                <Settings ShowTitlePanel="True" />
                <SettingsPopup>
                    <FilterControl AutoUpdatePosition="False"></FilterControl>
                </SettingsPopup>
                <SettingsText Title="EN ÇOK CİRO GETİREN KATEGORİLER" />
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Kategori" FieldName="KategoriAdi" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Toplam Ciro" FieldName="Ciro" ReadOnly="True" VisibleIndex="1">
                        <PropertiesTextEdit DisplayFormatString="N2">
                        </PropertiesTextEdit>
                        <HeaderStyle HorizontalAlign="Right" />
                    </dx:GridViewDataTextColumn>
                </Columns>
                <Styles>
                    <TitlePanel BackColor="Black" Font-Bold="True" ForeColor="White">
                    </TitlePanel>
                </Styles>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="Select k.KategoriAdi, ISNULL(v.Ciro, 0) Ciro From Kategoriler k LEFT JOIN (SELECT SUM(sd.ToplamFiyat) Ciro, uk.KategoriId
FROM SiparisDetay sd INNER JOIN UrunKategori uk ON sd.UrunId = uk.UrunId
Inner Join Siparisler s ON s.SiparisId = sd.SiparisId
WHERE uk.UrunKategoriYol NOT LIKE '%/%' And year(s.SiparisTarihi) = year(getdate())
Group By uk.KategoriId)v
ON k.KategoriId = v.KategoriId
Where k.UstKategoriId IS NULL And k.KategoriId &lt;&gt; 1000000075 Order By 2 DESC"></asp:SqlDataSource>
        </div>
        <div class="col-md-6">
            <dx:ASPxGridView ID="ASPxGridView4" runat="server" Width="100%" Theme="MaterialCompact" AutoGenerateColumns="False" DataSourceID="SqlDataSource4">
                <Settings ShowTitlePanel="True" />
                <SettingsPopup>
                    <FilterControl AutoUpdatePosition="False"></FilterControl>
                </SettingsPopup>
                <SettingsText Title="EN ÇOK CİRO GETİREN BAYİLER" />
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="CariId" Visible="False" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Cari" FieldName="CariAdi" ReadOnly="True" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Toplam Ciro" FieldName="Ciro" ReadOnly="True" VisibleIndex="2">
                        <PropertiesTextEdit DisplayFormatString="{0:N2}">
                        </PropertiesTextEdit>
                        <HeaderStyle HorizontalAlign="Right" />
                    </dx:GridViewDataTextColumn>
                </Columns>
                <Styles>
                    <TitlePanel BackColor="Black" Font-Bold="True" ForeColor="White">
                    </TitlePanel>
                </Styles>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="Select sd.CariId, (Select cr.CariAdi From Cariler cr Where cr.CariId = sd.CariId) CariAdi, SUM(sd.ToplamFiyat) Ciro From SiparisDetay sd Group By sd.CariId"></asp:SqlDataSource>
        </div>
        <div class="col-md-6">
            <dx:ASPxGridView ID="ASPxGridView5" runat="server" Width="100%" Theme="MaterialCompact" AutoGenerateColumns="False" DataSourceID="SqlDataSource5">
                <SettingsPager Visible="False">
                </SettingsPager>
                <Settings ShowTitlePanel="True" />
                <SettingsPopup>
                    <FilterControl AutoUpdatePosition="False"></FilterControl>
                </SettingsPopup>
                <SettingsText Title="STOKTA EN ÇOK BULUNAN ÜRÜNLER" />
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="STA" VisibleIndex="0" Caption="Ürün Adı">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Stok Miktarı" FieldName="STOKMIK" ReadOnly="True" VisibleIndex="1">
                        <PropertiesTextEdit DisplayFormatString="{0:N0}">
                        </PropertiesTextEdit>
                        <HeaderStyle HorizontalAlign="Right" />
                    </dx:GridViewDataTextColumn>
                </Columns>
                <Styles>
                    <TitlePanel BackColor="Black" Font-Bold="True" ForeColor="White">
                    </TitlePanel>
                </Styles>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT stk.STA,
          (SELECT SUM (GRMIK - CKMIK)
           FROM [GEDIZLINK].DENEME_2024T.dbo.STOK_ALT
           WHERE STK = stk.STK) STOKMIK
   FROM Urunler ur
        INNER JOIN [GEDIZLINK].DENEME_2024T.dbo.STOKGEN stk
           ON ur.RefId = stk.REF
           Order By 2 DESC"></asp:SqlDataSource>
        </div>
        <div class="col-md-6">
            <dx:ASPxGridView ID="ASPxGridView6" runat="server" Width="100%" Theme="MaterialCompact" AutoGenerateColumns="False" DataSourceID="SqlDataSource6">
                <SettingsPager Visible="False">
                </SettingsPager>
                <Settings ShowTitlePanel="True" />
                <SettingsPopup>
                    <FilterControl AutoUpdatePosition="False"></FilterControl>
                </SettingsPopup>
                <SettingsText Title="KATEGORİ ÜRÜN SAYISI" />
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="KategoriAdi" VisibleIndex="0" Caption="Kategori Adı">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Ürün Sayısı" FieldName="Sayi" ReadOnly="True" VisibleIndex="1">
                        <PropertiesTextEdit DisplayFormatString="{0:N0}">
                        </PropertiesTextEdit>
                        <HeaderStyle HorizontalAlign="Right" />
                    </dx:GridViewDataTextColumn>
                </Columns>
                <Styles>
                    <TitlePanel BackColor="Black" Font-Bold="True" ForeColor="White">
                    </TitlePanel>
                </Styles>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="Select k.KategoriAdi, (Select COUNT(*) From UrunKategori uk Where uk.KategoriId = k.KategoriId) Sayi From Kategoriler k Where k.UstKategoriId IS NULL And k.KategoriId &lt;&gt; 1000000075"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
