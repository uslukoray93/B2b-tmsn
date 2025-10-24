<%@ Page Title="Markalar" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="markalar.aspx.cs" Inherits="GedizMakina.Admin.markalar" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-1">
            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Marka Adı" Theme="MaterialCompact"></dx:ASPxLabel>
        </div>
        <div class="col-md-3">
            <dx:ASPxTextBox ID="txtMarka" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxTextBox>
        </div>
        <div class="col-md-8"></div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-1">
            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Marka Logo" Theme="MaterialCompact"></dx:ASPxLabel>
        </div>
        <div class="col-md-3">
            <dx:ASPxUploadControl ID="ucIkon" runat="server" UploadMode="Auto" Width="100%" Theme="MaterialCompact" AutoStartUpload="True" ShowClearFileSelectionButton="False" ShowProgressPanel="True" OnFileUploadComplete="ucIkon_FileUploadComplete"></dx:ASPxUploadControl>
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
                <dx:ASPxGridView ID="gvMarkalar" runat="server" Theme="MaterialCompact" Width="100%" AutoGenerateColumns="False" DataSourceID="dsMarkalar" EnableCallBacks="False" KeyFieldName="MarkaId">
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
                    <SettingsSearchPanel Visible="True" />
                    <SettingsText SearchPanelEditorNullText="Arama yapmak istediğiniz kelimeyi bu alana yazın" />
                    <Columns>
                        <dx:GridViewCommandColumn Caption=" " ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="MarkaId" ReadOnly="True" Visible="False" VisibleIndex="1">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="MarkaAdi" VisibleIndex="3" Caption="Marka">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="MarkaPath" VisibleIndex="4" Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataImageColumn FieldName="MarkaLogo" VisibleIndex="2">
                            <PropertiesImage ImageAlign="Middle" ImageHeight="50px" ImageWidth="50px">
                            </PropertiesImage>
                        </dx:GridViewDataImageColumn>
                    </Columns>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="dsMarkalar" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:gediz %>" DeleteCommand="DELETE FROM [Markalar] WHERE [MarkaId] = @original_MarkaId AND (([MarkaAdi] = @original_MarkaAdi) OR ([MarkaAdi] IS NULL AND @original_MarkaAdi IS NULL)) AND (([MarkaLogo] = @original_MarkaLogo) OR ([MarkaLogo] IS NULL AND @original_MarkaLogo IS NULL)) AND (([MarkaPath] = @original_MarkaPath) OR ([MarkaPath] IS NULL AND @original_MarkaPath IS NULL))" InsertCommand="INSERT INTO [Markalar] ([MarkaAdi], [MarkaLogo], [MarkaPath]) VALUES (@MarkaAdi, @MarkaLogo, @MarkaPath)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Markalar] WHERE ([MarkaId] &lt;&gt; @MarkaId) ORDER BY [SN]" UpdateCommand="UPDATE [Markalar] SET [MarkaAdi] = @MarkaAdi, [MarkaLogo] = @MarkaLogo, [MarkaPath] = @MarkaPath WHERE [MarkaId] = @original_MarkaId AND (([MarkaAdi] = @original_MarkaAdi) OR ([MarkaAdi] IS NULL AND @original_MarkaAdi IS NULL)) AND (([MarkaLogo] = @original_MarkaLogo) OR ([MarkaLogo] IS NULL AND @original_MarkaLogo IS NULL)) AND (([MarkaPath] = @original_MarkaPath) OR ([MarkaPath] IS NULL AND @original_MarkaPath IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_MarkaId" Type="Int32" />
                        <asp:Parameter Name="original_MarkaAdi" Type="String" />
                        <asp:Parameter Name="original_MarkaLogo" Type="String" />
                        <asp:Parameter Name="original_MarkaPath" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="MarkaAdi" Type="String" />
                        <asp:Parameter Name="MarkaLogo" Type="String" />
                        <asp:Parameter Name="MarkaPath" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1000000007" Name="MarkaId" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="MarkaAdi" Type="String" />
                        <asp:Parameter Name="MarkaLogo" Type="String" />
                        <asp:Parameter Name="MarkaPath" Type="String" />
                        <asp:Parameter Name="original_MarkaId" Type="Int32" />
                        <asp:Parameter Name="original_MarkaAdi" Type="String" />
                        <asp:Parameter Name="original_MarkaLogo" Type="String" />
                        <asp:Parameter Name="original_MarkaPath" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
