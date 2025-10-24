<%@ Page Title="Kampanyalar" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="kampanyalar.aspx.cs" Inherits="GedizMakina.Admin.kampanyalar" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            flex: 0 0 auto;
            width: 100%;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-1">Kampanya Adı</div>
        <div class="col-md-4">
            <dx:ASPxTextBox ID="txtKampanyaAdi" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxTextBox>
        </div>
        <div class="col-md-1">
            <dx:ASPxDateEdit ID="dtBaslangic" runat="server" Theme="MaterialCompact" Width="100%"></dx:ASPxDateEdit>
        </div>
        <div class="col-md-1">
            <dx:ASPxDateEdit ID="dtBitis" runat="server" Theme="MaterialCompact" Width="100%"></dx:ASPxDateEdit>
        </div>
        <div class="col-md-1">
            <dx:ASPxButton ID="btnKaydet" runat="server" Text="KAYDET" Theme="MaterialCompact" Width="100%" AutoPostBack="false" OnClick="btnKaydet_Click"></dx:ASPxButton>
        </div>
        <div class="col-md-4"></div>
    </div>

    <hr />

    <div class="row">
        <div class="col-md-12">
            <div class="table-responsive">
                <dx:ASPxGridView ID="gvKampanyalar" runat="server" Theme="MaterialCompact" Width="100%" EnableCallBacks="False" AutoGenerateColumns="False" DataSourceID="dsKampanyalar" KeyFieldName="KampanyaId" OnCustomButtonCallback="gvKampanyalar_CustomButtonCallback">
                    <SettingsPager PageSize="100">
                    </SettingsPager>
                    <SettingsPopup>
                        <FilterControl AutoUpdatePosition="False"></FilterControl>
                    </SettingsPopup>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="KampanyaId" ReadOnly="True" Visible="False" VisibleIndex="1">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="KampanyaAdi" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="Baslangic" VisibleIndex="3">
                            <PropertiesDateEdit DisplayFormatString="dd.MM.yyyy HH:mm:ss">
                            </PropertiesDateEdit>
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataDateColumn FieldName="Bitis" VisibleIndex="4">
                            <PropertiesDateEdit DisplayFormatString="dd.MM.yyyy HH:mm:ss">
                            </PropertiesDateEdit>
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" Caption=" " VisibleIndex="0">
                            <CustomButtons>
                                <dx:GridViewCommandColumnCustomButton ID="btnDetay">
                                    <Image IconID="actions_show_16x16" ToolTip="Kampanya Detayı">
                                    </Image>
                                </dx:GridViewCommandColumnCustomButton>
                                <dx:GridViewCommandColumnCustomButton ID="btnBitir">
                                    <Image IconID="actions_cancel_16x16" ToolTip="Kampanyayı Bitir">
                                    </Image>
                                </dx:GridViewCommandColumnCustomButton>
                            </CustomButtons>
                        </dx:GridViewCommandColumn>
                    </Columns>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="dsKampanyalar" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:gediz %>" DeleteCommand="DELETE FROM [Kampanyalar] WHERE [KampanyaId] = @original_KampanyaId AND (([KampanyaAdi] = @original_KampanyaAdi) OR ([KampanyaAdi] IS NULL AND @original_KampanyaAdi IS NULL)) AND (([Baslangic] = @original_Baslangic) OR ([Baslangic] IS NULL AND @original_Baslangic IS NULL)) AND (([Bitis] = @original_Bitis) OR ([Bitis] IS NULL AND @original_Bitis IS NULL))" InsertCommand="INSERT INTO [Kampanyalar] ([KampanyaAdi], [Baslangic], [Bitis]) VALUES (@KampanyaAdi, @Baslangic, @Bitis)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Kampanyalar]" UpdateCommand="UPDATE [Kampanyalar] SET [KampanyaAdi] = @KampanyaAdi, [Baslangic] = @Baslangic, [Bitis] = @Bitis WHERE [KampanyaId] = @original_KampanyaId AND (([KampanyaAdi] = @original_KampanyaAdi) OR ([KampanyaAdi] IS NULL AND @original_KampanyaAdi IS NULL)) AND (([Baslangic] = @original_Baslangic) OR ([Baslangic] IS NULL AND @original_Baslangic IS NULL)) AND (([Bitis] = @original_Bitis) OR ([Bitis] IS NULL AND @original_Bitis IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_KampanyaId" Type="Int32" />
                        <asp:Parameter Name="original_KampanyaAdi" Type="String" />
                        <asp:Parameter Name="original_Baslangic" Type="DateTime" />
                        <asp:Parameter Name="original_Bitis" Type="DateTime" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="KampanyaAdi" Type="String" />
                        <asp:Parameter Name="Baslangic" Type="DateTime" />
                        <asp:Parameter Name="Bitis" Type="DateTime" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="KampanyaAdi" Type="String" />
                        <asp:Parameter Name="Baslangic" Type="DateTime" />
                        <asp:Parameter Name="Bitis" Type="DateTime" />
                        <asp:Parameter Name="original_KampanyaId" Type="Int32" />
                        <asp:Parameter Name="original_KampanyaAdi" Type="String" />
                        <asp:Parameter Name="original_Baslangic" Type="DateTime" />
                        <asp:Parameter Name="original_Bitis" Type="DateTime" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <dx:ASPxPopupControl ID="poKampanyaSil" runat="server" CloseAction="None" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowHeader="False" Theme="MaterialCompact" Width="400px">
                    <ContentCollection>
                        <dx:PopupControlContentControl runat="server">
                            <div class="row">
                                <div class="auto-style1">
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Kampanya sonlandırılacaktır. Onaylıyor musunuz?" Theme="MaterialCompact">
                                    </dx:ASPxLabel>
                                </div>
                            </div>
                            <hr />
                            <div class="row">
                                <div class="col-md-5">
                                    <dx:ASPxButton ID="btnEvet" runat="server" Text="EVET" Theme="MaterialCompact" Width="100%" OnClick="btnEvet_Click"></dx:ASPxButton>
                                </div>
                                <div class="col-md-2"></div>
                                <div class="col-md-5"><dx:ASPxButton ID="btnHayir" runat="server" Text="HAYIR" RenderMode="Danger" Theme="MaterialCompact" Width="100%" OnClick="btnHayir_Click"></dx:ASPxButton></div>
                            </div>
                        </dx:PopupControlContentControl>
                    </ContentCollection>
                </dx:ASPxPopupControl>
            </div>
        </div>
    </div>
</asp:Content>
