<%@ Page Title="Tüm Siparişler" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="tum-siparisler.aspx.cs" Inherits="GedizMakina.Admin.tum_siparisler" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-2">
            <dx:ASPxDateEdit ID="dtSiparisBaslangic" runat="server" Theme="MaterialCompact" Width="100%"></dx:ASPxDateEdit>
        </div>
        <div class="col-md-2">
            <dx:ASPxDateEdit ID="dtSiparisBitis" runat="server" Theme="MaterialCompact" Width="100%"></dx:ASPxDateEdit>
        </div>
        <div class="col-md-2">
            <dx:ASPxButton ID="btnSiparisGetir" runat="server" Text="GETİR" Theme="MaterialCompact" Width="100%" AutoPostBack="False" OnClick="btnSiparisGetir_Click"></dx:ASPxButton>
        </div>
        <div class="col-md-6"></div>
    </div>
    <hr />
    <div class="row">
        <div class="col-md-12">
            <div class="table-responsive">
                <dx:ASPxGridView ID="gvSiparisler" runat="server" Theme="Moderno" Width="100%" AutoGenerateColumns="False" DataSourceID="dsSiparisler" KeyFieldName="SiparisId">
                    <Settings ShowFilterRow="True" ShowGroupPanel="True" />
                    <SettingsPopup>
                        <FilterControl AutoUpdatePosition="False"></FilterControl>
                    </SettingsPopup>
                    <SettingsText GroupPanel="Gruplamak istediğiniz kolonu bu alana sürükleyin" />
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="SiparisId" ReadOnly="True" Visible="False" VisibleIndex="1">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Sipariş No" FieldName="SiparisNo" VisibleIndex="2">
                            <DataItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Text='<%# Eval("SiparisNo") %>'></asp:LinkButton>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CariId" Visible="False" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Toplam" FieldName="Tutar" VisibleIndex="6">
                            <PropertiesTextEdit DisplayFormatString="N2">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="KDV" FieldName="Kdv" VisibleIndex="7">
                            <PropertiesTextEdit DisplayFormatString="N2">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Genel Tutar" FieldName="GenelTutar" VisibleIndex="8">
                            <PropertiesTextEdit DisplayFormatString="N2">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="TeslimatTurId" Visible="False" VisibleIndex="9">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="FaturaAdresId" Visible="False" VisibleIndex="10">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="SevkiyatAdresId" Visible="False" VisibleIndex="11">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn Caption="Sip. Tarihi" FieldName="SiparisTarihi" VisibleIndex="3">
                            <PropertiesDateEdit DisplayFormatString="dd.MM.yyyy HH:mm">
                            </PropertiesDateEdit>
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="DurumId" Visible="False" VisibleIndex="12">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="OdemeTurId" Visible="False" VisibleIndex="13">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="SiparisGuidNo" Visible="False" VisibleIndex="14">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Cari Adı" FieldName="CariAdi" ReadOnly="True" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Sipariş Durumu" FieldName="Durum" ReadOnly="True" VisibleIndex="15">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Teslimat Türü" FieldName="TeslimatTuru" ReadOnly="True" VisibleIndex="16">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Ödeme Türü" FieldName="OdemeTuru" ReadOnly="True" VisibleIndex="17">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="dsSiparisler" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spAdminSiparisListesi" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="dtSiparisBaslangic" Name="Start" PropertyName="Value" Type="DateTime" />
                        <asp:ControlParameter ControlID="dtSiparisBitis" Name="End" PropertyName="Value" Type="DateTime" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>

</asp:Content>
