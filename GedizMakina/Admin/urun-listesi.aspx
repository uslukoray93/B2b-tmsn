<%@ Page Title="Ürün Listesi" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="urun-listesi.aspx.cs" Inherits="GedizMakina.Admin.urun_listesi" meta:resourcekey="PageResource1" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="table-responsive">
                <dx:ASPxGridView ID="gvUrunListesi" runat="server" Theme="MaterialCompact" Width="100%" AutoGenerateColumns="False" DataSourceID="dsUrunListesi" EnableCallBacks="False" KeyFieldName="UrunId" OnCustomButtonCallback="gvUrunListesi_CustomButtonCallback" meta:resourcekey="gvUrunListesiResource1">
                    <SettingsPager PageSize="100">
                    </SettingsPager>
                    <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowFilterRowMenu="True" ShowFilterBar="Visible" />
                    <SettingsPopup>
                        <FilterControl AutoUpdatePosition="False"></FilterControl>
                    </SettingsPopup>
                    <SettingsSearchPanel Visible="True" />
                    <SettingsText SearchPanelEditorNullText="Arama yapmak istediğiniz kelimeyi bu alana yazın" GroupPanel="Gruplamak istediğiniz kolonu bu alana sürükleyin" />
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="UrunId" ReadOnly="True" Visible="False" VisibleIndex="1" meta:resourcekey="GridViewDataTextColumnResource1">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="KDV" VisibleIndex="15" Caption="KDV" meta:resourcekey="GridViewDataTextColumnResource2">
                            <PropertiesTextEdit DisplayFormatString="N2">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Stok Kodu" FieldName="STK" VisibleIndex="9" meta:resourcekey="GridViewDataTextColumnResource3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Ürün Adı" FieldName="STA" VisibleIndex="11" meta:resourcekey="GridViewDataTextColumnResource4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Birim" FieldName="STB" VisibleIndex="12" meta:resourcekey="GridViewDataTextColumnResource5">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Satış Fiyatı" FieldName="SAT1_1" VisibleIndex="14" meta:resourcekey="GridViewDataTextColumnResource6">
                            <PropertiesTextEdit DisplayFormatString="N2">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Alış Fiyatı" FieldName="ALIS1_1" VisibleIndex="13" meta:resourcekey="GridViewDataTextColumnResource7">
                            <PropertiesTextEdit DisplayFormatString="N2">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Marka" FieldName="UrunMarka" ReadOnly="True" VisibleIndex="10" meta:resourcekey="GridViewDataTextColumnResource8">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" Caption=" " VisibleIndex="0" ShowClearFilterButton="True" meta:resourcekey="GridViewCommandColumnResource1">
                            <CustomButtons>
                                <dx:GridViewCommandColumnCustomButton ID="btnGit" meta:resourcekey="GridViewCommandColumnCustomButtonResource1">
                                    <Image IconID="actions_show_16x16" ToolTip="Ürün Kaydına Git">
                                    </Image>
                                </dx:GridViewCommandColumnCustomButton>
                            </CustomButtons>
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataImageColumn Caption=" " FieldName="ResimYolu" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="8" meta:resourcekey="GridViewDataImageColumnResource1">
                            <PropertiesImage ImageAlign="Middle" ImageHeight="50px" ImageWidth="50px">
                            </PropertiesImage>
                        </dx:GridViewDataImageColumn>
                        <dx:GridViewDataTextColumn Caption="Stok" FieldName="STOKMIK" VisibleIndex="16" meta:resourcekey="GridViewDataTextColumnResource9">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="dsUrunListesi" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spUrunListesiAdmin" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
