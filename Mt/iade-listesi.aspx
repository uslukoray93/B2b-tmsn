<%@ Page Title="İade Listesi" Language="C#" MasterPageFile="~/Mt/mt.Master" AutoEventWireup="true" CodeBehind="iade-listesi.aspx.cs" Inherits="GedizMakina.Mt.iade_listesi" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-1">
            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Durum" Theme="MaterialCompact"></dx:ASPxLabel>
        </div>
        <div class="col-md-3">
            <asp:DropDownList ID="ddDurum" runat="server" CssClass="form-control" Width="100%" AutoPostBack="True" DataSourceID="dsDurumlar" DataTextField="DurumAdi" DataValueField="DurumId"></asp:DropDownList>
            <asp:SqlDataSource ID="dsDurumlar" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT [DurumId], [DurumAdi] FROM [Durumlar] WHERE ([Kullanim] = @Kullanim) ORDER BY [DurumId]">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Iade" Name="Kullanim" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="col-md-8"></div>
    </div>
    <br />

    <div class="row">
        <div class="col-md-12">
            <div class="table-responsive">
                <dx:ASPxGridView ID="gvIadeTalepleri" runat="server" Theme="MaterialCompact" Width="100%" AutoGenerateColumns="False" DataSourceID="dsIadeTalepleri" KeyFieldName="TalepId" EnableCallBacks="False" OnCustomButtonCallback="gvIadeTalepleri_CustomButtonCallback">
                    <SettingsPager PageSize="100">
                    </SettingsPager>
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="TalepId" ReadOnly="True" Visible="False" VisibleIndex="1">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CariId" Visible="False" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CariAdi" ReadOnly="True" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="SiparisId" Visible="False" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Sipariş No" FieldName="SiparisNo" ReadOnly="True" VisibleIndex="5">
                            <DataItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Text='<%# Eval("SiparisNo") %>'></asp:LinkButton>
                            </DataItemTemplate>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="UrunId" Visible="False" VisibleIndex="7">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Ürün Adı" FieldName="STA" VisibleIndex="8">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Miktar" FieldName="Miktar" VisibleIndex="9">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="IadeNedenId" Visible="False" VisibleIndex="10">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="İade Nedeni" FieldName="IadeNedeni" ReadOnly="True" VisibleIndex="11">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Notlar" VisibleIndex="13">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn Caption="Talep Tarihi" FieldName="Tarih" VisibleIndex="14">
                            <PropertiesDateEdit DisplayFormatString="dd.MM.yyyy HH:mm">
                            </PropertiesDateEdit>
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="DurumId" Visible="False" VisibleIndex="15">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Durum" FieldName="DurumAdi" ReadOnly="True" VisibleIndex="16">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" Caption=" " VisibleIndex="0">
                            <CustomButtons>
                                <dx:GridViewCommandColumnCustomButton ID="btnOnay">
                                    <Image IconID="actions_apply_16x16" ToolTip="İade Talebini Onayla">
                                    </Image>
                                </dx:GridViewCommandColumnCustomButton>
                                <dx:GridViewCommandColumnCustomButton ID="btnRet">
                                    <Image IconID="actions_cancel_16x16" ToolTip="İade Talebini Reddet">
                                    </Image>
                                </dx:GridViewCommandColumnCustomButton>
                            </CustomButtons>
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn Caption="Ürün Durum" FieldName="UrunDurum" VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" Caption=" " VisibleIndex="12">
                            <CustomButtons>
                                <dx:GridViewCommandColumnCustomButton ID="btnResim1">
                                    <Image IconID="richedit_insertfloatingobjectimage_16x16" ToolTip="Resim Görüntüle">
                                    </Image>
                                </dx:GridViewCommandColumnCustomButton>
                                <dx:GridViewCommandColumnCustomButton ID="btnResim2">
                                    <Image IconID="richedit_insertfloatingobjectimage_16x16" ToolTip="Resim Görüntüle">
                                    </Image>
                                </dx:GridViewCommandColumnCustomButton>
                                <dx:GridViewCommandColumnCustomButton ID="btnVideo">
                                    <Image IconID="miscellaneous_video_16x16" ToolTip="Video Görüntüle">
                                    </Image>
                                </dx:GridViewCommandColumnCustomButton>
                            </CustomButtons>
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="IadeTutari" Visible="False" VisibleIndex="17">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="dsIadeTalepleri" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spAdminIadeTalepleri" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddDurum" Name="DurumId" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
