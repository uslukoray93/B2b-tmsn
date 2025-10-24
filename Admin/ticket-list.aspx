<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="ticket-list.aspx.cs" Inherits="GedizMakina.Admin.ticket_list" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-1">
            <dx:ASPxButton ID="btnYeni" runat="server" Text="YENİ SORU" Theme="MaterialCompact" Width="100%" OnClick="btnYeni_Click"></dx:ASPxButton>
        </div>
        <div class="col-md-11"></div>
    </div>
    <hr />
    <div class="row">
        <div class="col-md-12">
            <div class="table-responsive">
                <dx:ASPxGridView ID="gvTicketList" runat="server" Theme="MaterialCompact" Width="100%" AutoGenerateColumns="False" EnableCallBacks="False" OnCustomButtonCallback="gvTicketList_CustomButtonCallback">
                    <SettingsPopup>
                        <FilterControl AutoUpdatePosition="False"></FilterControl>
                    </SettingsPopup>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="TicketId" Visible="False" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="MusteriId" Visible="False" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="KategoriId" Visible="False" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Kategori" FieldName="KategoriAdi" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Soru Başlık" FieldName="SoruBaslik" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Soru" VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Tarih" FieldName="TicketTarihi" VisibleIndex="7">
                            <PropertiesTextEdit DisplayFormatString="dd.MM.yyyy">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" Caption=" " ShowInCustomizationForm="True" VisibleIndex="0">
                            <CustomButtons>
                                <dx:GridViewCommandColumnCustomButton ID="btnCevapOku">
                                    <Image IconID="comments_showhidecomment_16x16" ToolTip="Cevabı Oku">
                                    </Image>
                                </dx:GridViewCommandColumnCustomButton>
                            </CustomButtons>
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn Caption="Durum" FieldName="CevapDurum" ShowInCustomizationForm="True" VisibleIndex="8">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Cevap" Visible="False" VisibleIndex="9">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:ASPxGridView>
                <br />
                <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" CloseAction="CloseButton" CloseOnEscape="True" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Theme="MaterialCompact" Width="400px">
                    <SettingsAdaptivity Mode="OnWindowInnerWidth" />
                    <ContentCollection>
                        <dx:PopupControlContentControl runat="server">
                            <div class="row">
                                <div class="col-md-12">
                                    <dx:ASPxMemo ID="txtCevap" runat="server" Height="150px" Width="100%" Enabled="false"></dx:ASPxMemo>
                                </div>
                            </div>
                        </dx:PopupControlContentControl>
                    </ContentCollection>
                </dx:ASPxPopupControl>
            </div>
        </div>
    </div>
</asp:Content>
