<%@ Page Title="İade Nedenleri" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="iade-nedenleri.aspx.cs" Inherits="GedizMakina.Admin.iade_nedenleri" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-1">
            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="İade Nedeni" Theme="MaterialCompact"></dx:ASPxLabel>
        </div>
        <div class="col-md-3">
            <dx:ASPxTextBox ID="txtIadeNedeni" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxTextBox>
        </div>
        <div class="col-md-8"></div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-1">
            <dx:ASPxButton ID="btnKaydet" runat="server" Text="KAYDET" Theme="MaterialCompact" Width="100%" AutoPostBack="False" OnClick="btnKaydet_Click"></dx:ASPxButton>
        </div>
        <div class="col-md-11">
            <dx:ASPxLabel ID="lblUyari" runat="server" Theme="MaterialCompact"></dx:ASPxLabel>
        </div>
    </div>
    <hr />
    <div class="row">
        <div class="col-md-12">
            <div class="table-responsive">
                <dx:ASPxGridView ID="gvSevkiyatSekilleri" runat="server" Theme="MaterialCompact" Width="100%" AutoGenerateColumns="False" DataSourceID="dsIadeNedenleri" EnableCallBacks="False" KeyFieldName="TurId">
                    <SettingsPager PageSize="100">
                    </SettingsPager>
                    <SettingsEditing Mode="Batch">
                    </SettingsEditing>
                    <SettingsCommandButton>
                        <UpdateButton ButtonType="Image" RenderMode="Image">
                            <Image IconID="save_save_16x16">
                            </Image>
                        </UpdateButton>
                        <CancelButton ButtonType="Image" RenderMode="Image">
                            <Image IconID="actions_cancel_16x16">
                            </Image>
                        </CancelButton>
                        <EditButton ButtonType="Image" RenderMode="Image">
                            <Image IconID="edit_edit_16x16">
                            </Image>
                        </EditButton>
                        <DeleteButton ButtonType="Image" RenderMode="Image">
                            <Image IconID="actions_trash_16x16">
                            </Image>
                        </DeleteButton>
                    </SettingsCommandButton>
                    <SettingsPopup>
                        <FilterControl AutoUpdatePosition="False"></FilterControl>
                    </SettingsPopup>
                    <Columns>
                        <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="TurId" ReadOnly="True" Visible="False" VisibleIndex="1">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="TurAdi" VisibleIndex="2" Caption="İade Nedeni">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="SN" VisibleIndex="3" Visible="False">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="dsIadeNedenleri" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [IadeNedenleri] ORDER BY [SN]"></asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>