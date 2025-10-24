<%@ Page Title="Sevkiyat Türleri" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="sevkiyat-sekilleri.aspx.cs" Inherits="GedizMakina.Admin.sevkiyat_sekilleri" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-1">
            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Sevkiyat Şekli" Theme="MaterialCompact"></dx:ASPxLabel>
        </div>
        <div class="col-md-3">
            <dx:ASPxTextBox ID="txtSevkiyatSekli" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxTextBox>
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
                <dx:ASPxGridView ID="gvSevkiyatSekilleri" runat="server" Theme="MaterialCompact" Width="100%" AutoGenerateColumns="False" DataSourceID="dsSevkiyatSekilleri" EnableCallBacks="False" KeyFieldName="TurId">
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
                        <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="TurId" ReadOnly="True" Visible="False" VisibleIndex="1">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="TurAdi" VisibleIndex="2" Caption="Sevkiyat Türü">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="SN" VisibleIndex="3" Visible="False">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="dsSevkiyatSekilleri" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:gediz %>" DeleteCommand="DELETE FROM [SevkiyatTurleri] WHERE [TurId] = @original_TurId AND (([TurAdi] = @original_TurAdi) OR ([TurAdi] IS NULL AND @original_TurAdi IS NULL)) AND (([SN] = @original_SN) OR ([SN] IS NULL AND @original_SN IS NULL))" InsertCommand="INSERT INTO [SevkiyatTurleri] ([TurAdi], [SN]) VALUES (@TurAdi, @SN)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [SevkiyatTurleri] WHERE ([TurId] &lt;&gt; @TurId) ORDER BY [SN]" UpdateCommand="UPDATE [SevkiyatTurleri] SET [TurAdi] = @TurAdi, [SN] = @SN WHERE [TurId] = @original_TurId AND (([TurAdi] = @original_TurAdi) OR ([TurAdi] IS NULL AND @original_TurAdi IS NULL)) AND (([SN] = @original_SN) OR ([SN] IS NULL AND @original_SN IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_TurId" Type="Int32" />
                        <asp:Parameter Name="original_TurAdi" Type="String" />
                        <asp:Parameter Name="original_SN" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="TurAdi" Type="String" />
                        <asp:Parameter Name="SN" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1000000004" Name="TurId" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="TurAdi" Type="String" />
                        <asp:Parameter Name="SN" Type="Int32" />
                        <asp:Parameter Name="original_TurId" Type="Int32" />
                        <asp:Parameter Name="original_TurAdi" Type="String" />
                        <asp:Parameter Name="original_SN" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
