<%@ Page Title="Bekleyen Siparişler" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="bekleyen-siparisler.aspx.cs" Inherits="GedizMakina.user.bekleyen_siparisler" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="table-responsive">
        <dx:ASPxGridView ID="gvSiparisler" runat="server" Width="100%" Theme="Moderno" AutoGenerateColumns="False" DataSourceID="dsSiparisler" KeyFieldName="SiparisId" EnableTheming="True">
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="SiparisNo" ReadOnly="True" Visible="False" VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Sipariş No" FieldName="SiparisNo" VisibleIndex="1">
                    <DataItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("SiparisNo") %>' OnClick="LinkButton1_Click"></asp:LinkButton>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CariId" Visible="False" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Sipariş Tarihi" FieldName="SiparisTarihi" VisibleIndex="2">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="İrsaliye Tutar" FieldName="GenelTutar" VisibleIndex="8">
                    <PropertiesTextEdit DisplayFormatString="N2">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="İrsaliye No" VisibleIndex="3">
                    <DataItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" Text='<%# Eval("IrsaliyeNo") %>'></asp:LinkButton>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Sevk Adresi" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="İrsaliye Tarihi" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Çıkış İstasyonu" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" Caption="Kargo" VisibleIndex="5" Visible="False">
                    <CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="btnKargo">
                            <Image IconID="businessobjects_boproductgroup_16x16">
                            </Image>
                        </dx:GridViewCommandColumnCustomButton>
                    </CustomButtons>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Durum" FieldName="SiparisDurum" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="dsSiparisler" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spCariSiparisler" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="CariId" SessionField="sLoginId" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
