<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="duyuru-listesi.aspx.cs" Inherits="GedizMakina.Admin.duyuru_listesi" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="table-responsive">
                <dx:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" OnClick="ASPxButton1_Click" Text="YENİ DUYURU EKLE" Theme="MaterialCompact">
                </dx:ASPxButton>
                <br />
                <dx:ASPxGridView ID="gvDuyurular" runat="server" Theme="MaterialCompact" Width="100%" AutoGenerateColumns="False" DataSourceID="dsDuyurular" EnableCallBacks="False" KeyFieldName="DuyuruId" OnCustomButtonCallback="gvDuyurular_CustomButtonCallback">
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="DuyuruId" ReadOnly="True" Visible="False" VisibleIndex="0">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Başlık" FieldName="DuyuruBaslik" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Aciklama" Visible="False" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn Caption="Tarih" FieldName="Tarih" VisibleIndex="4">
                            <PropertiesDateEdit DisplayFormatString="dd.MM.yyyy">
                            </PropertiesDateEdit>
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="DuyuruLink" Visible="False" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" Caption=" " VisibleIndex="1">
                            <CustomButtons>
                                <dx:GridViewCommandColumnCustomButton ID="btnDetay">
                                    <Image IconID="actions_show_16x16" ToolTip="Kayda Git">
                                    </Image>
                                </dx:GridViewCommandColumnCustomButton>
                                <dx:GridViewCommandColumnCustomButton ID="btnSil">
                                    <Image IconID="actions_trash_16x16" ToolTip="Kaydı Sil">
                                    </Image>
                                </dx:GridViewCommandColumnCustomButton>
                            </CustomButtons>
                        </dx:GridViewCommandColumn>
                    </Columns>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="dsDuyurular" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT * FROM [Duyurular] ORDER BY [Tarih] DESC"></asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
