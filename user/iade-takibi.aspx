<%@ Page Title="İade Takibi" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="iade-takibi.aspx.cs" Inherits="GedizMakina.user.iade_takibi" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="table-responsive">
                <dx:ASPxGridView ID="gvIadeTalepleri" runat="server" Theme="MaterialCompact" Width="100%" AutoGenerateColumns="False" DataSourceID="dsIadeTalepleri" KeyFieldName="TalepId" EnableCallBacks="False">
                    <SettingsPager PageSize="100">
                    </SettingsPager>
                    <SettingsPopup>
                        <FilterControl AutoUpdatePosition="False"></FilterControl>
                    </SettingsPopup>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="TalepId" ReadOnly="True" Visible="False" VisibleIndex="0">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CariId" Visible="False" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CariAdi" ReadOnly="True" VisibleIndex="2" Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="SiparisId" Visible="False" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Sipariş No" FieldName="SiparisNo" ReadOnly="True" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="UrunId" Visible="False" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Ürün Adı" FieldName="STA" VisibleIndex="7">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Miktar" FieldName="Miktar" VisibleIndex="8">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="IadeNedenId" Visible="False" VisibleIndex="9">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="İade Nedeni" FieldName="IadeNedeni" ReadOnly="True" VisibleIndex="10">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Notlar" VisibleIndex="11">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn Caption="Talep Tarihi" FieldName="Tarih" VisibleIndex="12">
                            <PropertiesDateEdit DisplayFormatString="dd.MM.yyyy HH:mm">
                            </PropertiesDateEdit>
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="DurumId" Visible="False" VisibleIndex="13">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Durum" FieldName="DurumAdi" ReadOnly="True" VisibleIndex="14">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Ürün Durum" FieldName="UrunDurum" VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="dsIadeTalepleri" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spCariIadeTalepleri" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="CariId" SessionField="sLoginId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
