<%@ Page Title="Dosyalar" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="dosyalar.aspx.cs" Inherits="GedizMakina.Admin.dosyalar" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-2">
            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Dosya Adı"></dx:ASPxLabel>
            <br />
            <dx:ASPxTextBox ID="txtDosyaAdi" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxTextBox>
        </div>
        <div class="col-md-3">
            <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" ClientInstanceName="cp" runat="server" Width="100%" OnCallback="ASPxCallbackPanel1_Callback">
                <PanelCollection>
                    <dx:PanelContent>
                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Dosya"></dx:ASPxLabel>
                        <br />
                        <dx:ASPxUploadControl ID="ucFile" runat="server" UploadMode="Auto" Width="100%" Theme="Moderno" AutoStartUpload="True" ShowClearFileSelectionButton="False" ShowProgressPanel="True" OnFileUploadComplete="ucFile_FileUploadComplete">
                            <ClientSideEvents FileUploadComplete="function(s, e) {
	cp.PerformCallback(e.callbackData);
}" />
                        </dx:ASPxUploadControl>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>
        <div class="col-md-3">
            <dx:ASPxCallbackPanel ID="ASPxCallbackPanel2" ClientInstanceName="cp2" runat="server" Width="100%" OnCallback="ASPxCallbackPanel2_Callback">
                <PanelCollection>
                    <dx:PanelContent>
                        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Kapak Resmi"></dx:ASPxLabel>
                        <br />
                        <dx:ASPxUploadControl ID="ucKapakResim" runat="server" UploadMode="Auto" Width="100%" Theme="Moderno" AutoStartUpload="True" ShowClearFileSelectionButton="False" ShowProgressPanel="True" OnFileUploadComplete="ucKapakResim_FileUploadComplete">
                            <ClientSideEvents FileUploadComplete="function(s, e) {
	cp2.PerformCallback(e.callbackData);
}" />
                        </dx:ASPxUploadControl>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>
        <div class="col-md-1">
            <br />
            <dx:ASPxButton ID="btnKaydet" runat="server" Text="KAYDET" Theme="MaterialCompact" Width="100%" AutoPostBack="False" OnClick="btnKaydet_Click"></dx:ASPxButton>
        </div>
        <div class="col-md-3"></div>
    </div>
    <hr />
    <div class="row">
        <div class="col-md-12">
            <div class="table-responsive">
                <dx:ASPxGridView ID="gvDosyalar" runat="server" Theme="MaterialCompact" Width="100%" AutoGenerateColumns="False" DataSourceID="dsDosyalar" EnableCallBacks="False" KeyFieldName="DosyaId" OnCustomButtonCallback="gvDosyalar_CustomButtonCallback">
                    <SettingsPager PageSize="100">
                    </SettingsPager>
                    <SettingsCommandButton>
                        <DeleteButton ButtonType="Image" RenderMode="Image">
                            <Image IconID="actions_trash_16x16" ToolTip="Kaydı Sil">
                            </Image>
                        </DeleteButton>
                    </SettingsCommandButton>
                    <SettingsPopup>
                        <FilterControl AutoUpdatePosition="False"></FilterControl>
                    </SettingsPopup>
                    <Columns>
                        <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" Caption=" " VisibleIndex="0">
                            <CustomButtons>
                                <dx:GridViewCommandColumnCustomButton ID="btnSil">
                                    <Image IconID="actions_trash_16x16" ToolTip="Dosyayı Sil">
                                    </Image>
                                </dx:GridViewCommandColumnCustomButton>
                            </CustomButtons>
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="DosyaId" ReadOnly="True" Visible="False" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="DosyaYolu" Visible="False" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="Tarih" VisibleIndex="5">
                            <PropertiesDateEdit DisplayFormatString="dd.MM.yyyy">
                            </PropertiesDateEdit>
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataHyperLinkColumn Caption="Dosya Adı" FieldName="DosyaYolu" VisibleIndex="3">
                            <PropertiesHyperLinkEdit TextField="DosyaAdi" Target="_blank">
                            </PropertiesHyperLinkEdit>
                        </dx:GridViewDataHyperLinkColumn>
                        <dx:GridViewDataImageColumn FieldName="DosyaResim" VisibleIndex="1">
                            <PropertiesImage ImageAlign="Middle" ImageHeight="100px" ImageWidth="100px">
                            </PropertiesImage>
                        </dx:GridViewDataImageColumn>
                    </Columns>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="dsDosyalar" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:gediz %>" DeleteCommand="DELETE FROM [Dosyalar] WHERE [DosyaId] = @original_DosyaId AND (([DosyaAdi] = @original_DosyaAdi) OR ([DosyaAdi] IS NULL AND @original_DosyaAdi IS NULL)) AND (([DosyaYolu] = @original_DosyaYolu) OR ([DosyaYolu] IS NULL AND @original_DosyaYolu IS NULL)) AND (([Tarih] = @original_Tarih) OR ([Tarih] IS NULL AND @original_Tarih IS NULL)) AND (([DosyaResim] = @original_DosyaResim) OR ([DosyaResim] IS NULL AND @original_DosyaResim IS NULL))" InsertCommand="INSERT INTO [Dosyalar] ([DosyaId], [DosyaAdi], [DosyaYolu], [Tarih], [DosyaResim]) VALUES (@DosyaId, @DosyaAdi, @DosyaYolu, @Tarih, @DosyaResim)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Dosyalar] ORDER BY [Tarih] DESC" UpdateCommand="UPDATE [Dosyalar] SET [DosyaAdi] = @DosyaAdi, [DosyaYolu] = @DosyaYolu, [Tarih] = @Tarih, [DosyaResim] = @DosyaResim WHERE [DosyaId] = @original_DosyaId AND (([DosyaAdi] = @original_DosyaAdi) OR ([DosyaAdi] IS NULL AND @original_DosyaAdi IS NULL)) AND (([DosyaYolu] = @original_DosyaYolu) OR ([DosyaYolu] IS NULL AND @original_DosyaYolu IS NULL)) AND (([Tarih] = @original_Tarih) OR ([Tarih] IS NULL AND @original_Tarih IS NULL)) AND (([DosyaResim] = @original_DosyaResim) OR ([DosyaResim] IS NULL AND @original_DosyaResim IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_DosyaId" Type="Object" />
                        <asp:Parameter Name="original_DosyaAdi" Type="String" />
                        <asp:Parameter Name="original_DosyaYolu" Type="String" />
                        <asp:Parameter Name="original_Tarih" Type="DateTime" />
                        <asp:Parameter Name="original_DosyaResim" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="DosyaId" Type="Object" />
                        <asp:Parameter Name="DosyaAdi" Type="String" />
                        <asp:Parameter Name="DosyaYolu" Type="String" />
                        <asp:Parameter Name="Tarih" Type="DateTime" />
                        <asp:Parameter Name="DosyaResim" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="DosyaAdi" Type="String" />
                        <asp:Parameter Name="DosyaYolu" Type="String" />
                        <asp:Parameter Name="Tarih" Type="DateTime" />
                        <asp:Parameter Name="DosyaResim" Type="String" />
                        <asp:Parameter Name="original_DosyaId" Type="Object" />
                        <asp:Parameter Name="original_DosyaAdi" Type="String" />
                        <asp:Parameter Name="original_DosyaYolu" Type="String" />
                        <asp:Parameter Name="original_Tarih" Type="DateTime" />
                        <asp:Parameter Name="original_DosyaResim" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
