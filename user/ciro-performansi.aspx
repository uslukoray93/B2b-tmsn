<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="ciro-performansi.aspx.cs" Inherits="GedizMakina.user.ciro_performansi" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.XtraCharts.v22.2.Web, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.XtraCharts.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-5">
            <div class="row">
                <div class="col-md-12" style="background-color: whitesmoke; font-weight: bold; text-align: center; height: 35px">
                    <span id="lblBuYil" runat="server" style="font-size: larger"></span>
                </div>
                <hr />
                <div class="col-md-12">
                    <dx:WebChartControl ID="WebChartControl3" runat="server" CrosshairEnabled="True" DataSourceID="dsBuYil" Height="200px" SeriesDataMember="KategoriAdi" Width="635px">
                        <DiagramSerializable>
                            <dx:XYDiagram>
                                <AxisX VisibleInPanesSerializable="-1">
                                </AxisX>
                                <AxisY VisibleInPanesSerializable="-1">
                                </AxisY>
                            </dx:XYDiagram>
                        </DiagramSerializable>
                        <SeriesSerializable>
                            <dx:Series CheckableInLegend="False" Name="Series 1" ToolTipPointPattern="{A}">
                                <ViewSerializable>
                                    <dx:PieSeriesView>
                                    </dx:PieSeriesView>
                                </ViewSerializable>
                                <LabelSerializable>
                                    <dx:PieSeriesLabel Position="Radial">
                                    </dx:PieSeriesLabel>
                                </LabelSerializable>
                            </dx:Series>
                        </SeriesSerializable>
                        <SeriesTemplate ArgumentDataMember="KategoriAdi" SeriesDataMember="KategoriAdi" ValueDataMembersSerializable="Ciro">
                        </SeriesTemplate>
                    </dx:WebChartControl>
                    <asp:SqlDataSource ID="dsBuYil" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="Select k.KategoriAdi, ISNULL(v.Ciro, 0) Ciro From Kategoriler k LEFT JOIN (SELECT SUM(sd.ToplamFiyat) Ciro, uk.KategoriId
FROM SiparisDetay sd INNER JOIN UrunKategori uk ON sd.UrunId = uk.UrunId
Inner Join Siparisler s ON s.SiparisId = sd.SiparisId
WHERE uk.UrunKategoriYol NOT LIKE '%/%' And year(s.SiparisTarihi) = year(getdate()) And s.CariId = @CariId
Group By uk.KategoriId)v
ON k.KategoriId = v.KategoriId
Where k.UstKategoriId IS NULL And k.KategoriId &lt;&gt; 1000000075 Order By k.SiraNo">
                        <SelectParameters>
                            <asp:SessionParameter Name="CariId" SessionField="sLoginId" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-12">
                    <dx:ASPxGridView ID="gvBuYil" runat="server" AutoGenerateColumns="False" DataSourceID="dsBuYil" EnableTheming="True" Theme="iOS" Width="100%">
                        <SettingsPager Visible="False">
                        </SettingsPager>
                        <Settings ShowFooter="True" />
                        <SettingsPopup>
                            <FilterControl AutoUpdatePosition="False"></FilterControl>
                        </SettingsPopup>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="KategoriAdi" VisibleIndex="0">
                                <HeaderStyle Font-Bold="True" Font-Names="Verdana" />
                                <FooterTemplate>
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Bold="True" Font-Names="Verdana" Text="Toplam Ciro:" Theme="iOS">
                                    </dx:ASPxLabel>
                                </FooterTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Ciro" VisibleIndex="1" ReadOnly="True">
                                <PropertiesTextEdit DisplayFormatString="{0:N2} ₺">
                                </PropertiesTextEdit>
                                <HeaderStyle Font-Bold="True" Font-Names="Verdana" HorizontalAlign="Right" />
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:N2} ₺" FieldName="Ciro" ShowInColumn="Ciro" ShowInGroupFooterColumn="Ciro" SummaryType="Sum" />
                        </TotalSummary>
                        <Styles>
                            <Header Font-Names="Verdana">
                                <Border BorderStyle="None" />
                            </Header>
                            <Cell Font-Names="Verdana">
                                <Border BorderStyle="None" />
                            </Cell>
                            <Footer Font-Bold="True" Font-Names="Verdana">
                            </Footer>
                        </Styles>
                    </dx:ASPxGridView>
                </div>
            </div>
        </div>
        <div class="col-md-2"></div>
        <div class="col-md-5">
            <div class="row">
                <div class="col-md-12" style="background-color: whitesmoke; font-weight: bold; text-align: center; height: 35px">
                    <span id="lblGecenYil" runat="server" style="font-size: larger"></span>
                </div>
                <hr />
                <div class="col-md-12">
                    <dx:WebChartControl ID="WebChartControl1" runat="server" CrosshairEnabled="True" DataSourceID="dsGecenYil" Height="200px" SeriesDataMember="KategoriAdi" Width="635px">
                        <DiagramSerializable>
                            <dx:XYDiagram>
                                <AxisX VisibleInPanesSerializable="-1">
                                </AxisX>
                                <AxisY VisibleInPanesSerializable="-1">
                                </AxisY>
                            </dx:XYDiagram>
                        </DiagramSerializable>
                        <SeriesSerializable>
                            <dx:Series CheckableInLegend="False" Name="Series 1" ToolTipPointPattern="{A}">
                                <ViewSerializable>
                                    <dx:PieSeriesView>
                                    </dx:PieSeriesView>
                                </ViewSerializable>
                                <LabelSerializable>
                                    <dx:PieSeriesLabel Position="Radial">
                                    </dx:PieSeriesLabel>
                                </LabelSerializable>
                            </dx:Series>
                        </SeriesSerializable>
                        <SeriesTemplate ArgumentDataMember="KategoriAdi" SeriesDataMember="KategoriAdi" ValueDataMembersSerializable="Ciro">
                        </SeriesTemplate>
                    </dx:WebChartControl>
                    <asp:SqlDataSource ID="dsGecenYil" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="Select k.KategoriAdi, ISNULL(v.Ciro, 0) Ciro From Kategoriler k LEFT JOIN (SELECT SUM(sd.ToplamFiyat) Ciro, uk.KategoriId
FROM SiparisDetay sd INNER JOIN UrunKategori uk ON sd.UrunId = uk.UrunId
Inner Join Siparisler s ON s.SiparisId = sd.SiparisId
WHERE uk.UrunKategoriYol NOT LIKE '%/%' And year(s.SiparisTarihi) = year(getdate())-1 And s.CariId = @CariId
Group By uk.KategoriId)v
ON k.KategoriId = v.KategoriId
Where k.UstKategoriId IS NULL And k.KategoriId &lt;&gt; 1000000075 Order By k.SiraNo">
                        <SelectParameters>
                            <asp:SessionParameter Name="CariId" SessionField="sLoginId" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-12">
                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsGecenYil" EnableTheming="True" Theme="iOS" Width="100%">
                        <SettingsPager Visible="False">
                        </SettingsPager>
                        <Settings ShowFooter="True" />
                        <SettingsPopup>
                            <FilterControl AutoUpdatePosition="False"></FilterControl>
                        </SettingsPopup>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="KategoriAdi" VisibleIndex="0" ShowInCustomizationForm="True">
                                <HeaderStyle Font-Bold="True" Font-Names="Verdana" />
                                <FooterTemplate>
                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Font-Bold="True" Font-Names="Verdana" Text="Toplam Ciro:" Theme="iOS">
                                    </dx:ASPxLabel>
                                </FooterTemplate>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Ciro" VisibleIndex="1" ReadOnly="True" ShowInCustomizationForm="True">
                                <PropertiesTextEdit DisplayFormatString="{0:N2} ₺">
                                </PropertiesTextEdit>
                                <HeaderStyle Font-Bold="True" Font-Names="Verdana" HorizontalAlign="Right" />
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:N2} ₺" FieldName="Ciro" ShowInColumn="Ciro" ShowInGroupFooterColumn="Ciro" SummaryType="Sum" />
                        </TotalSummary>
                        <Styles>
                            <Header Font-Names="Verdana">
                                <Border BorderStyle="None" />
                            </Header>
                            <Cell Font-Names="Verdana">
                                <Border BorderStyle="None" />
                            </Cell>
                            <Footer Font-Bold="True" Font-Names="Verdana">
                            </Footer>
                        </Styles>
                    </dx:ASPxGridView>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
