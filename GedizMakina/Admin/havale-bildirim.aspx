<%@ Page Title="Havale Bildirim" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="havale-bildirim.aspx.cs" Inherits="GedizMakina.Admin.havale_bildirim" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-2">
            <dx:ASPxComboBox ID="ddurumId" runat="server" AutoPostBack="True" EnableTheming="True" SelectedIndex="0" Theme="MaterialCompact" Width="100%">
                <Items>
                    <dx:ListEditItem Selected="True" Text="Beklemede" Value="False" />
                    <dx:ListEditItem Text="Onaylandı" Value="True" />
                </Items>
            </dx:ASPxComboBox>
        </div>
        <div class="col-md-10"></div>
    </div>
    <hr />
    <div class="row">
        <div class="col-md-12">
            <div class="table-responsive">
                <dx:ASPxGridView ID="gvHavaleBildirimleri" runat="server" Theme="MaterialCompact" Width="100%" AutoGenerateColumns="False" DataSourceID="dsHavaleBildirimleri" EnableCallBacks="False" KeyFieldName="BildirimId" OnCustomButtonCallback="gvHavaleBildirimleri_CustomButtonCallback">
                    <SettingsPager PageSize="100">
                    </SettingsPager>
                    <Settings ShowFilterRow="True" ShowGroupPanel="True" />
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
                    <SettingsText GroupPanel="Gruplamak istediğiniz kolonu bu alana sürükleyin" />
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="BildirimId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CariId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Havale Tutar" FieldName="Tutar" ShowInCustomizationForm="True" VisibleIndex="7">
                            <PropertiesTextEdit DisplayFormatString="N2">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="SiparisNo" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="BankaId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Nots" ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn Caption="Tarih" FieldName="Tarih" ShowInCustomizationForm="True" VisibleIndex="11">
                            <PropertiesDateEdit DisplayFormatString="dd.MM.yyyy">
                            </PropertiesDateEdit>
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn Caption="Cari Adı" FieldName="CariAdi" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Sipariş No" FieldName="SiparisNo1" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Banka" FieldName="BankaAdi" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="DosyaYolu" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" Caption="Dosya" ShowClearFilterButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                            <CustomButtons>
                                <dx:GridViewCommandColumnCustomButton ID="btnDosya">
                                    <Image IconID="actions_importimage_16x16" ToolTip="Havale Dosyası">
                                    </Image>
                                </dx:GridViewCommandColumnCustomButton>
                                <dx:GridViewCommandColumnCustomButton ID="btnOdemeOk">
                                    <Image IconID="conditionalformatting_iconsetsymbols3_16x16" ToolTip="Ödemeyi Onayla">
                                    </Image>
                                </dx:GridViewCommandColumnCustomButton>
                            </CustomButtons>
                        </dx:GridViewCommandColumn>
                    </Columns>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="dsHavaleBildirimleri" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spAdminHavaleBildirimleri" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddurumId" Name="Onay" PropertyName="Value" Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
