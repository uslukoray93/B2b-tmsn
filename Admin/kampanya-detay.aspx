<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="kampanya-detay.aspx.cs" Inherits="GedizMakina.Admin.kampanya_detay" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-6">
            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Kampanya Adı" Theme="MaterialCompact"></dx:ASPxLabel>
            <br />
            <dx:ASPxTextBox ID="txtKampanyaAdi" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxTextBox>
        </div>
        <div class="col-md-4">
            <div class="row">
                <div class="col-md-6">
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Başlangıç" Theme="MaterialCompact"></dx:ASPxLabel>
                    <br />
                    <dx:ASPxDateEdit ID="dtBaslangic" runat="server" Theme="MaterialCompact" Width="100%"></dx:ASPxDateEdit>
                </div>
                <div class="col-md-6">
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Bitiş" Theme="MaterialCompact"></dx:ASPxLabel>
                    <br />
                    <dx:ASPxDateEdit ID="dtBitis" runat="server" Theme="MaterialCompact" Width="100%"></dx:ASPxDateEdit>
                </div>
            </div>
        </div>
        <div class="col-md-2">
            <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Kampanya Türü" Theme="MaterialCompact"></dx:ASPxLabel>
            <br />
            <dx:ASPxComboBox ID="ddKampanyaTur" runat="server" Theme="MaterialCompact" Width="100%" AutoPostBack="True" SelectedIndex="0" OnSelectedIndexChanged="ddKampanyaTur_SelectedIndexChanged">
                <Items>
                    <dx:ListEditItem Selected="True" Text="Seçiniz" Value="0" />
                    <dx:ListEditItem Text="Net Fiyat Kampanyası" Value="1" />
                    <dx:ListEditItem Text="Tüm Ürünlere İndirim" Value="2" />
                    <dx:ListEditItem Text="Kategoriye İndirim" Value="3" />
                    <dx:ListEditItem Text="Markaya İndirim" Value="4" />
                    <dx:ListEditItem Text="Belirli Ürüne Aynısından X Kadar Hediye" Value="5" />
                    <dx:ListEditItem Text="Belirli Ürüne, Farklı Üründen Hediye" Value="6" />
                </Items>
            </dx:ASPxComboBox>
        </div>
    </div>
    <hr />
    <div class="row">
        <div class="col-md-12">
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <div class="row">
                        <div class="col-md-3">
                            <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="Ürün Seçin" Theme="MaterialCompact"></dx:ASPxLabel>
                            <br />
                            <dx:ASPxComboBox ID="ddNetFiyat" runat="server" Theme="MaterialCompact" Width="100%" DataSourceID="dsUrunListesi1" TextFormatString="{0} | {1}" ValueField="UrunId">
                                <Columns>
                                    <dx:ListBoxColumn Caption="Ürün Kodu" FieldName="STK">
                                    </dx:ListBoxColumn>
                                    <dx:ListBoxColumn Caption="Ürün Adı" FieldName="STA">
                                    </dx:ListBoxColumn>
                                </Columns>
                            </dx:ASPxComboBox>
                        </div>
                        <div class="col-md-1">
                            <dx:ASPxLabel ID="ASPxLabel16" runat="server" Text="Fiyat" Theme="MaterialCompact"></dx:ASPxLabel>
                            <br />
                            <dx:ASPxTextBox ID="txtNetFiyat" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxTextBox>
                        </div>
                        <div class="col-md-1">
                            <dx:ASPxLabel ID="ASPxLabel17" runat="server" Text="Para Birimi" Theme="MaterialCompact"></dx:ASPxLabel>
                            <br />
                            <dx:ASPxComboBox ID="ddParaBirimi" runat="server" Theme="MaterialCompact" Width="100%" DataSourceID="dsParaBirimi" SelectedIndex="0" TextField="ParaBirimi" ValueField="BirimId"></dx:ASPxComboBox>
                            <asp:SqlDataSource ID="dsParaBirimi" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT * FROM [ParaBirimleri] ORDER BY [SN]"></asp:SqlDataSource>
                        </div>
                        <div class="col-md-1">
                            <br />
                            <dx:ASPxButton ID="btnKaydetNetFiyat" runat="server" Text="KAYDET" Theme="MaterialCompact" Width="100%" OnClick="btnKaydetNetFiyat_Click" AutoPostBack="False"></dx:ASPxButton>
                        </div>
                        <div class="col-md-6">
                            <dx:ASPxLabel ID="lblUyariNetFiyat" runat="server" Theme="MaterialCompact"></dx:ASPxLabel>
                        </div>
                    </div>
                    <br />
                    <dx:ASPxGridView ID="gvNetFiyat" runat="server" Theme="MaterialCompact" Width="100%" EnableCallBacks="False" AutoGenerateColumns="False" DataSourceID="dsNetFiyat" KeyFieldName="DetayId">
                        <SettingsPager PageSize="100">
                        </SettingsPager>
                        <SettingsPopup>
                            <FilterControl AutoUpdatePosition="False"></FilterControl>
                        </SettingsPopup>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="DetayId" ReadOnly="True" Visible="False" VisibleIndex="1">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="KampanyaId" Visible="False" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="UrunId" Visible="False" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Ürün Adı" FieldName="STA" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Fiyat" FieldName="Fiyat" VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ParaBirimId" Visible="False" VisibleIndex="6">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Para Birimi" FieldName="ParaBirimi" ReadOnly="True" VisibleIndex="7">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" Caption=" " VisibleIndex="0">
                                <CustomButtons>
                                    <dx:GridViewCommandColumnCustomButton ID="btnSilNetFiyat">
                                        <Image IconID="actions_trash_16x16" ToolTip="Kaydı Sil">
                                        </Image>
                                    </dx:GridViewCommandColumnCustomButton>
                                </CustomButtons>
                            </dx:GridViewCommandColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="dsNetFiyat" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT kd.DetayId,
       kd.KampanyaId,
       kd.UrunId,
       stk.STA,
       kd.Fiyat,
       kd.ParaBirimId,
       (Select pb.ParaBirimi From ParaBirimleri pb Where pb.BirimId = kd.ParaBirimId) ParaBirimi
FROM KampanyaDetay kd Inner Join Urunler ur
ON kd.UrunId = ur.UrunId
INNER JOIN [GEDIZLINK].DENEME_2024T.dbo.STOKGEN stk ON ur.RefId = stk.REF
WHERE kd.KampanyaId = @KampanyaId And kd.KampanyaAltTurId = @AltTur">
                        <SelectParameters>
                            <asp:SessionParameter Name="KampanyaId" SessionField="sKampanyaId" />
                            <asp:ControlParameter ControlID="ddKampanyaTur" Name="AltTur" PropertyName="Value" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <div class="row">
                        <div class="col-md-1">
                            <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Yüzde Girin"></dx:ASPxLabel>
                        </div>
                        <div class="col-md-2">
                            <dx:ASPxTextBox ID="txtTumUrunIndirim" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxTextBox>
                        </div>
                        <div class="col-md-1">
                            <dx:ASPxButton ID="btnKaydetTumUrunIndirim" runat="server" Text="KAYDET" Theme="MaterialCompact" Width="100%" OnClick="btnKaydetTumUrunIndirim_Click" AutoPostBack="False">
                                <ClientSideEvents Click="function(s, e) {
	lp.Show();
}" />
                            </dx:ASPxButton>
                        </div>
                        <div class="col-md-8">
                            <dx:ASPxLabel ID="lblUyariTumUrunIndirim" runat="server" Theme="MaterialCompact"></dx:ASPxLabel>
                        </div>
                    </div>
                </asp:View>
                <asp:View ID="View3" runat="server">
                    <div class="row">
                        <div class="col-md-1">
                            <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Kategori Seçin"></dx:ASPxLabel>
                        </div>
                        <div class="col-md-3">
                            <dx:ASPxComboBox ID="ddKategoriyeIndirim" runat="server" Theme="MaterialCompact" Width="100%" DataSourceID="dsKategori" TextFormatString="{0} &gt; {1}" ValueField="KategoriId">
                                <Columns>
                                    <dx:ListBoxColumn Caption="Üst Kategori" FieldName="UstKategori">
                                    </dx:ListBoxColumn>
                                    <dx:ListBoxColumn Caption="Kategori" FieldName="KategoriAdi">
                                    </dx:ListBoxColumn>
                                </Columns>
                            </dx:ASPxComboBox>
                            <asp:SqlDataSource ID="dsKategori" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="Select k.KategoriId, k.UstKategoriId, (Select k2.KategoriAdi From Kategoriler k2 Where k2.KategoriId = k.UstKategoriId) UstKategori, k.KategoriAdi From Kategoriler k Where k.KategoriId &lt;&gt; 1000000075 Order By KategoriId"></asp:SqlDataSource>
                        </div>
                        <div class="col-md-2">
                            <dx:ASPxTextBox ID="txtKategoriyeIndirim" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxTextBox>
                        </div>
                        <div class="col-md-1">
                            <dx:ASPxButton ID="btnKaydetKategoriyeIndirim" runat="server" Text="KAYDET" Theme="MaterialCompact" Width="100%" OnClick="btnKaydetKategoriyeIndirim_Click" AutoPostBack="False">
                                <ClientSideEvents Click="function(s, e) {
	lp.Show();
}" />
                            </dx:ASPxButton>
                        </div>
                        <div class="col-md-5">
                            <dx:ASPxLabel ID="lblUyariKaydetKategoriyeIndirim" runat="server" Theme="MaterialCompact"></dx:ASPxLabel>
                        </div>
                    </div>
                </asp:View>
                <asp:View ID="View4" runat="server">
                    <div class="row">
                        <div class="col-md-1">
                            <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Marka Seçin"></dx:ASPxLabel>
                        </div>
                        <div class="col-md-2">
                            <dx:ASPxComboBox ID="ddMarkayaIndirim" runat="server" Theme="MaterialCompact" Width="100%" DataSourceID="dsMarkalar" TextField="MarkaAdi" ValueField="MarkaId"></dx:ASPxComboBox>
                            <asp:SqlDataSource ID="dsMarkalar" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="Select * From Markalar Where MarkaId &lt;&gt; 1000000007 Order By MarkaAdi"></asp:SqlDataSource>
                        </div>
                        <div class="col-md-2">
                            <dx:ASPxTextBox ID="txtMarkayaIndirim" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxTextBox>
                        </div>
                        <div class="col-md-1">
                            <dx:ASPxButton ID="btnMarkayaIndirim" runat="server" Text="KAYDET" Theme="MaterialCompact" Width="100%" OnClick="btnMarkayaIndirim_Click" AutoPostBack="False">
                                <ClientSideEvents Click="function(s, e) {
	lp.Show();
}" />
                            </dx:ASPxButton>
                        </div>
                        <div class="col-md-6">
                            <dx:ASPxLabel ID="lblUyariMarkayaIndirim" runat="server" Theme="MaterialCompact"></dx:ASPxLabel>
                        </div>
                    </div>
                </asp:View>
                <asp:View ID="View5" runat="server">
                    <div class="row">
                        <div class="col-md-2">
                            <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Ürün Seçin" Theme="MaterialCompact"></dx:ASPxLabel>
                            <br />
                            <dx:ASPxComboBox ID="ddUrununAynisiHediye" runat="server" Theme="MaterialCompact" Width="100%" DataSourceID="dsUrunListesi1" TextFormatString="{0} | {1}" ValueField="UrunId">
                                <Columns>
                                    <dx:ListBoxColumn Caption="Ürün Kodu" FieldName="STK">
                                    </dx:ListBoxColumn>
                                    <dx:ListBoxColumn Caption="Ürün Adı" FieldName="STA">
                                    </dx:ListBoxColumn>
                                </Columns>
                            </dx:ASPxComboBox>
                            <asp:SqlDataSource ID="dsUrunListesi1" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spUrunListesiKampanyaIcin" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </div>
                        <div class="col-md-1">
                            <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Adet" Theme="MaterialCompact"></dx:ASPxLabel>
                            <br />
                            <dx:ASPxTextBox ID="txtUrununAynisiAnaUrun" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxTextBox>
                        </div>
                        <div class="col-md-1">
                            <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Hediye" Theme="MaterialCompact"></dx:ASPxLabel>
                            <br />
                            <dx:ASPxTextBox ID="txtUrununAynisiHediye" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxTextBox>
                        </div>
                        <div class="col-md-1">
                            <br />
                            <dx:ASPxButton ID="btnKaydetUrununAynisi" runat="server" Text="KAYDET" Theme="MaterialCompact" Width="100%" OnClick="btnKaydetUrununAynisi_Click" AutoPostBack="False"></dx:ASPxButton>
                        </div>
                        <div class="col-md-7">
                            <dx:ASPxLabel ID="lblUyariUrununAynisi" runat="server" Theme="MaterialCompact"></dx:ASPxLabel>
                        </div>
                    </div>
                </asp:View>
                <asp:View ID="View6" runat="server">
                    <div class="row">
                        <div class="col-md-2">
                            <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Ürün Seçin" Theme="MaterialCompact"></dx:ASPxLabel>
                            <br />
                            <dx:ASPxComboBox ID="ddUruneFarkliUrunAnaUrun" runat="server" Theme="MaterialCompact" Width="100%" DataSourceID="dsUrunListesi1" TextFormatString="{0} | {1}" ValueField="UrunId">
                                <Columns>
                                    <dx:ListBoxColumn Caption="Ürün Kodu" FieldName="STK">
                                    </dx:ListBoxColumn>
                                    <dx:ListBoxColumn Caption="Ürün Adı" FieldName="STA">
                                    </dx:ListBoxColumn>
                                </Columns>
                            </dx:ASPxComboBox>
                        </div>
                        <div class="col-md-1">
                            <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Adet" Theme="MaterialCompact"></dx:ASPxLabel>
                            <br />
                            <dx:ASPxTextBox ID="txtUruneFarkliUrunAnaUrun" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxTextBox>
                        </div>
                        <div class="col-md-2">
                            <dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="Ürün Seçin" Theme="MaterialCompact"></dx:ASPxLabel>
                            <br />
                            <dx:ASPxComboBox ID="ddUruneFarkliUrunHediye" runat="server" Theme="MaterialCompact" Width="100%" DataSourceID="dsUrunListesi1" TextFormatString="{0} | {1}" ValueField="UrunId">
                                <Columns>
                                    <dx:ListBoxColumn Caption="Ürün Kodu" FieldName="STK">
                                    </dx:ListBoxColumn>
                                    <dx:ListBoxColumn Caption="Ürün Adı" FieldName="STA">
                                    </dx:ListBoxColumn>
                                </Columns>
                            </dx:ASPxComboBox>
                        </div>
                        <div class="col-md-1">
                            <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="Hediye" Theme="MaterialCompact"></dx:ASPxLabel>
                            <br />
                            <dx:ASPxTextBox ID="txtFarkliUruneHediye" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxTextBox>
                        </div>
                        <div class="col-md-1">
                            <br />
                            <dx:ASPxButton ID="btnKaydetUruneFarkliUrun" runat="server" Text="KAYDET" Theme="MaterialCompact" Width="100%" OnClick="btnKaydetUruneFarkliUrun_Click" AutoPostBack="False"></dx:ASPxButton>
                        </div>
                        <div class="col-md-5">
                            <dx:ASPxLabel ID="lblUyariUruneFarkliUrun" runat="server" Theme="MaterialCompact"></dx:ASPxLabel>
                        </div>
                    </div>
                </asp:View>
            </asp:MultiView>

            <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" ClientInstanceName="lp" Modal="True" Text="İşleminiz yapılıyor&amp;hellip;" Theme="MaterialCompact">
            </dx:ASPxLoadingPanel>

        </div>
    </div>
</asp:Content>
