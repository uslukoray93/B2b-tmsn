<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="iade-talebi-yeni.aspx.cs" Inherits="GedizMakina.user.iade_talebi_yeni" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-5">
            <div class="table-responsive">
                <dx:ASPxGridView ID="gvAlinanUrunler" runat="server" Theme="MaterialCompact" Width="100%" AutoGenerateColumns="False" DataSourceID="dsAlinanUrunler" EnableCallBacks="False" KeyFieldName="DetayId" OnCustomButtonCallback="gvAlinanUrunler_CustomButtonCallback">
                    <SettingsPager PageSize="100">
                    </SettingsPager>
                    <SettingsPopup>
                        <FilterControl AutoUpdatePosition="False"></FilterControl>
                    </SettingsPopup>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="DetayId" ReadOnly="True" Visible="False" VisibleIndex="1">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="SiparisId" Visible="False" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CariId" Visible="False" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="UrunId" Visible="False" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Ürün Adı" FieldName="STA" VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Miktar" FieldName="Miktar" VisibleIndex="7">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Birim Fiyat" FieldName="BirimFiyat" VisibleIndex="8">
                            <PropertiesTextEdit DisplayFormatString="N2">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Toplam" Visible="False" VisibleIndex="9">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="KDV" Visible="False" VisibleIndex="10">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ToplamFiyat" Visible="False" VisibleIndex="11">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Sipariş Tarihi" FieldName="Tarih" VisibleIndex="5">
                            <PropertiesTextEdit DisplayFormatString="dd.MM.yyyy">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" Caption=" " VisibleIndex="0">
                            <CustomButtons>
                                <dx:GridViewCommandColumnCustomButton ID="btnSec">
                                    <Image IconID="actions_add_16x16" ToolTip="Ürünü Seç">
                                    </Image>
                                </dx:GridViewCommandColumnCustomButton>
                            </CustomButtons>
                        </dx:GridViewCommandColumn>
                    </Columns>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="dsAlinanUrunler" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spCariIadeTalebiUrunler" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="CariId" SessionField="sLoginId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
        <div class="col-md-7">
            <div class="row">
                <div class="col-md-12">
                    <dx:ASPxRadioButtonList ID="rblDurum" runat="server" RepeatDirection="Horizontal" SelectedIndex="0" Theme="MaterialCompact" Width="100%">
                        <Items>
                            <dx:ListEditItem Selected="True" Text="Sağlam" Value="Sağlam" />
                            <dx:ListEditItem Text="Hasarlı" Value="Hasarlı" />
                            <dx:ListEditItem Text="Arızalı" Value="Arızalı" />
                        </Items>
                        <Border BorderStyle="None" />
                    </dx:ASPxRadioButtonList>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-12">
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Ürün Adı" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                </div>
                <div class="col-md-12">
                    <asp:TextBox ID="txtUrunAdi" runat="server" CssClass="form-control" Width="100%" Enabled="false" Font-Bold="true"></asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-5">
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="İade Miktarı" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                    <br />
                    <asp:TextBox ID="txtMiktar" runat="server" TextMode="Number" CssClass="form-control" AutoPostBack="True" MaxLength="1" OnTextChanged="txtMiktar_TextChanged">1</asp:TextBox>
                </div>
                <div class="col-md-2"></div>
                <div class="col-md-5">
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Birim Fiyat" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                    <br />
                    <dx:ASPxTextBox ID="txtBirimFiyat" runat="server" Width="100%" Theme="MaterialCompact" Enabled="false"></dx:ASPxTextBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-12">
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="İade Nedeni" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                    <br />
                    <asp:DropDownList ID="ddIadeNedenleri" runat="server" CssClass="form-control" Width="100%" DataSourceID="dsIadeNedenleri" DataTextField="TurAdi" DataValueField="TurId"></asp:DropDownList>
                    <asp:SqlDataSource ID="dsIadeNedenleri" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT * FROM [IadeNedenleri] ORDER BY [SN]"></asp:SqlDataSource>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-12">
                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="İade Notu" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                    <br />
                    <asp:TextBox ID="txtIadeNotu" runat="server" CssClass="form-control" TextMode="MultiLine" Width="100%" Rows="6"></asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-4">
                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Ürün Görseli" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                    <br />
                    <dx:ASPxUploadControl ID="ucUrunGorsel1" runat="server" UploadMode="Auto" Width="100%" AutoStartUpload="True" OnFileUploadComplete="ucUrunGorsel1_FileUploadComplete" ShowProgressPanel="True" Theme="MaterialCompact">
                        <AdvancedModeSettings EnableDragAndDrop="false" EnableMultiSelect="false">
                        </AdvancedModeSettings>
                    </dx:ASPxUploadControl>
                </div>
                <div class="col-md-4">
                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Ürün Görseli" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                    <br />
                    <dx:ASPxUploadControl ID="ucUrunGorsel2" runat="server" UploadMode="Auto" Width="100%" AutoStartUpload="True" OnFileUploadComplete="ucUrunGorsel2_FileUploadComplete" ShowProgressPanel="True" Theme="MaterialCompact">
                        <AdvancedModeSettings EnableDragAndDrop="false" EnableMultiSelect="false">
                        </AdvancedModeSettings>
                    </dx:ASPxUploadControl>
                </div>
                <div class="col-md-4">
                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Ürün Videosu" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                    <br />
                    <dx:ASPxUploadControl ID="ucUrunVideo" runat="server" UploadMode="Auto" Width="100%" AutoStartUpload="True" OnFileUploadComplete="ucUrunVideo_FileUploadComplete" ShowProgressPanel="True" Theme="MaterialCompact">
                        <AdvancedModeSettings EnableDragAndDrop="false" EnableMultiSelect="false">
                        </AdvancedModeSettings>
                    </dx:ASPxUploadControl>
                </div>
            </div>
            <div class="row">
                <div class="col-md-10">
                    <asp:Label ID="lblUyari" runat="server"></asp:Label>
                </div>
                <div class="col-md-2">
                    <asp:Button ID="btnGonder" runat="server" Text="Gönder" CssClass="btn btn-dark" Width="100%" OnClick="btnGonder_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
