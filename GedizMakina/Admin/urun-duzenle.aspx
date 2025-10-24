<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="urun-duzenle.aspx.cs" Inherits="GedizMakina.Admin.urun_duzenle" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            &nbsp;&nbsp;&nbsp;
            <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" EnableTabScrolling="True" EnableTheming="True" Theme="MaterialCompact" Width="100%">
                <TabPages>
                    <dx:TabPage Text="ÜRÜN BİLGİLERİ">
                        <ContentCollection>
                            <dx:ContentControl runat="server">
                                <div class="row">
                                    <div class="col-md-11">
                                        <dx:ASPxLabel ID="lblUyariUrunBilgi" runat="server" Theme="MaterialCompact"></dx:ASPxLabel>
                                    </div>
                                    <div class="col-md-1">
                                        <dx:ASPxButton ID="btnKaydetUrunBilgi" runat="server" Text="KAYDET" Theme="MaterialCompact" Width="100%" AutoPostBack="False" OnClick="btnKaydetUrunBilgi_Click"></dx:ASPxButton>
                                    </div>
                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col-md-12">
                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Ürün Adı" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                                    </div>
                                    <div class="col-md-12">
                                        <dx:ASPxTextBox ID="txtUrunAdi" runat="server" Width="100%" Theme="MaterialCompact" Enabled="False">
                                            <DisabledStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="White">
                                            </DisabledStyle>
                                        </dx:ASPxTextBox>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-md-1">
                                        <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Ürün Kodu" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                                    </div>
                                    <div class="col-md-1">
                                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Birim" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                                    </div>
                                    <div class="col-md-1">
                                        <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Alış Fiyatı" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                                    </div>
                                    <div class="col-md-1">
                                        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Satış Fiyatı" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                                    </div>
                                    <div class="col-md-1">
                                        <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Kdv Oranı" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                                    </div>
                                    <div class="col-md-2">
                                        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Marka" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                                    </div>
                                    <div class="col-md-2">
                                        <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Stok" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                                    </div>
                                    <div class="col-md-1">
                                        <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Az Seviye" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                                    </div>
                                    <div class="col-md-1">
                                        <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Aktif" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                                    </div>
                                    <div class="col-md-1">
                                        <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Seri Sonu" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-1">
                                        <dx:ASPxTextBox ID="txtUrunKodu" runat="server" Width="100%" Theme="MaterialCompact" Enabled="False">
                                            <DisabledStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="White">
                                            </DisabledStyle>
                                        </dx:ASPxTextBox>
                                    </div>
                                    <div class="col-md-1">
                                        <dx:ASPxTextBox ID="txtBirim" runat="server" Width="100%" Theme="MaterialCompact" Enabled="False">
                                            <DisabledStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="White">
                                            </DisabledStyle>
                                        </dx:ASPxTextBox>
                                    </div>
                                    <div class="col-md-1">
                                        <dx:ASPxTextBox ID="txtAlisFiyati" runat="server" Width="100%" Theme="MaterialCompact" Enabled="False">
                                            <DisabledStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="White">
                                            </DisabledStyle>
                                        </dx:ASPxTextBox>
                                    </div>
                                    <div class="col-md-1">
                                        <dx:ASPxTextBox ID="txtSatisFiyati" runat="server" Width="100%" Theme="MaterialCompact" Enabled="False">
                                            <DisabledStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="White">
                                            </DisabledStyle>
                                        </dx:ASPxTextBox>
                                    </div>
                                    <div class="col-md-1">
                                        <dx:ASPxTextBox ID="txtKdvOrani" runat="server" Width="100%" Theme="MaterialCompact" Enabled="False">
                                            <DisabledStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="White">
                                            </DisabledStyle>
                                        </dx:ASPxTextBox>
                                    </div>
                                    <div class="col-md-2">
                                        <dx:ASPxComboBox ID="ddMarka" runat="server" ValueType="System.String" Theme="MaterialCompact" Width="100%" DataSourceID="dsMarkalar" SelectedIndex="0" TextField="MarkaAdi" ValueField="MarkaId"></dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="dsMarkalar" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT * FROM [Markalar] ORDER BY [SN]"></asp:SqlDataSource>
                                    </div>
                                    <div class="col-md-2">
                                        <dx:ASPxTextBox ID="txtStok" runat="server" Width="100%" Theme="MaterialCompact" Enabled="False">
                                            <DisabledStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="White">
                                            </DisabledStyle>
                                        </dx:ASPxTextBox>
                                    </div>
                                    <div class="col-md-1">
                                        <dx:ASPxTextBox ID="txtKritik" runat="server" Width="100%" Theme="MaterialCompact">
                                        </dx:ASPxTextBox>
                                    </div>
                                    <div class="col-md-1">
                                        <dx:ASPxCheckBox ID="chkAktif" runat="server" Theme="MaterialCompact" Width="100%" ToggleSwitchDisplayMode="Always"></dx:ASPxCheckBox>
                                    </div>
                                    <div class="col-md-1">
                                        <dx:ASPxCheckBox ID="chkSeriSonu" runat="server" Theme="MaterialCompact" Width="100%" ToggleSwitchDisplayMode="Always"></dx:ASPxCheckBox>
                                    </div>
                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col-md-12">
                                        <dx:ASPxHtmlEditor runat="server" ID="txtUrunAciklamasi" Width="100%" Height="750px">
                                            <Toolbars>
                                                <dx:HtmlEditorToolbar>
                                                    <Items>
                                                        <dx:ToolbarCutButton>
                                                        </dx:ToolbarCutButton>
                                                        <dx:ToolbarCopyButton>
                                                        </dx:ToolbarCopyButton>
                                                        <dx:ToolbarPasteButton>
                                                        </dx:ToolbarPasteButton>
                                                        <dx:ToolbarPasteFromWordButton>
                                                        </dx:ToolbarPasteFromWordButton>
                                                        <dx:ToolbarUndoButton BeginGroup="True">
                                                        </dx:ToolbarUndoButton>
                                                        <dx:ToolbarRedoButton>
                                                        </dx:ToolbarRedoButton>
                                                        <dx:ToolbarRemoveFormatButton BeginGroup="True">
                                                        </dx:ToolbarRemoveFormatButton>
                                                        <dx:ToolbarSuperscriptButton BeginGroup="True">
                                                        </dx:ToolbarSuperscriptButton>
                                                        <dx:ToolbarSubscriptButton>
                                                        </dx:ToolbarSubscriptButton>
                                                        <dx:ToolbarInsertOrderedListButton BeginGroup="True">
                                                        </dx:ToolbarInsertOrderedListButton>
                                                        <dx:ToolbarInsertUnorderedListButton>
                                                        </dx:ToolbarInsertUnorderedListButton>
                                                        <dx:ToolbarIndentButton BeginGroup="True">
                                                        </dx:ToolbarIndentButton>
                                                        <dx:ToolbarOutdentButton>
                                                        </dx:ToolbarOutdentButton>
                                                        <dx:ToolbarInsertLinkDialogButton BeginGroup="True">
                                                        </dx:ToolbarInsertLinkDialogButton>
                                                        <dx:ToolbarUnlinkButton BeginGroup="True">
                                                        </dx:ToolbarUnlinkButton>
                                                        <dx:ToolbarTableOperationsDropDownButton BeginGroup="True">
                                                            <Items>
                                                                <dx:ToolbarInsertTableDialogButton BeginGroup="True" Text="Insert Table..." ToolTip="Insert Table...">
                                                                </dx:ToolbarInsertTableDialogButton>
                                                                <dx:ToolbarTablePropertiesDialogButton BeginGroup="True">
                                                                </dx:ToolbarTablePropertiesDialogButton>
                                                                <dx:ToolbarTableRowPropertiesDialogButton>
                                                                </dx:ToolbarTableRowPropertiesDialogButton>
                                                                <dx:ToolbarTableColumnPropertiesDialogButton>
                                                                </dx:ToolbarTableColumnPropertiesDialogButton>
                                                                <dx:ToolbarTableCellPropertiesDialogButton>
                                                                </dx:ToolbarTableCellPropertiesDialogButton>
                                                                <dx:ToolbarInsertTableRowAboveButton BeginGroup="True">
                                                                </dx:ToolbarInsertTableRowAboveButton>
                                                                <dx:ToolbarInsertTableRowBelowButton>
                                                                </dx:ToolbarInsertTableRowBelowButton>
                                                                <dx:ToolbarInsertTableColumnToLeftButton>
                                                                </dx:ToolbarInsertTableColumnToLeftButton>
                                                                <dx:ToolbarInsertTableColumnToRightButton>
                                                                </dx:ToolbarInsertTableColumnToRightButton>
                                                                <dx:ToolbarSplitTableCellHorizontallyButton BeginGroup="True">
                                                                </dx:ToolbarSplitTableCellHorizontallyButton>
                                                                <dx:ToolbarSplitTableCellVerticallyButton>
                                                                </dx:ToolbarSplitTableCellVerticallyButton>
                                                                <dx:ToolbarMergeTableCellRightButton>
                                                                </dx:ToolbarMergeTableCellRightButton>
                                                                <dx:ToolbarMergeTableCellDownButton>
                                                                </dx:ToolbarMergeTableCellDownButton>
                                                                <dx:ToolbarDeleteTableButton BeginGroup="True">
                                                                </dx:ToolbarDeleteTableButton>
                                                                <dx:ToolbarDeleteTableRowButton>
                                                                </dx:ToolbarDeleteTableRowButton>
                                                                <dx:ToolbarDeleteTableColumnButton>
                                                                </dx:ToolbarDeleteTableColumnButton>
                                                            </Items>
                                                        </dx:ToolbarTableOperationsDropDownButton>
                                                        <dx:ToolbarExportDropDownButton BeginGroup="True">
                                                            <Items>
                                                                <dx:ToolbarExportDropDownItem>
                                                                </dx:ToolbarExportDropDownItem>
                                                                <dx:ToolbarExportDropDownItem Format="Pdf">
                                                                </dx:ToolbarExportDropDownItem>
                                                                <dx:ToolbarExportDropDownItem Format="Txt">
                                                                </dx:ToolbarExportDropDownItem>
                                                                <dx:ToolbarExportDropDownItem Format="Docx">
                                                                </dx:ToolbarExportDropDownItem>
                                                                <dx:ToolbarExportDropDownItem Format="Odt">
                                                                </dx:ToolbarExportDropDownItem>
                                                                <dx:ToolbarExportDropDownItem Format="Mht">
                                                                </dx:ToolbarExportDropDownItem>
                                                            </Items>
                                                        </dx:ToolbarExportDropDownButton>
                                                        <dx:ToolbarPrintButton ToolTip="">
                                                        </dx:ToolbarPrintButton>
                                                        <dx:ToolbarFullscreenButton BeginGroup="True">
                                                        </dx:ToolbarFullscreenButton>
                                                        <dx:ToolbarFindAndReplaceDialogButton BeginGroup="True">
                                                        </dx:ToolbarFindAndReplaceDialogButton>
                                                    </Items>
                                                </dx:HtmlEditorToolbar>
                                                <dx:HtmlEditorToolbar>
                                                    <Items>
                                                        <dx:ToolbarParagraphFormattingEdit Width="120px">
                                                            <Items>
                                                                <dx:ToolbarListEditItem Text="Normal" Value="p" />
                                                                <dx:ToolbarListEditItem Text="Heading  1" Value="h1" />
                                                                <dx:ToolbarListEditItem Text="Heading  2" Value="h2" />
                                                                <dx:ToolbarListEditItem Text="Heading  3" Value="h3" />
                                                                <dx:ToolbarListEditItem Text="Heading  4" Value="h4" />
                                                                <dx:ToolbarListEditItem Text="Heading  5" Value="h5" />
                                                                <dx:ToolbarListEditItem Text="Heading  6" Value="h6" />
                                                                <dx:ToolbarListEditItem Text="Address" Value="address" />
                                                                <dx:ToolbarListEditItem Text="Normal (DIV)" Value="div" />
                                                            </Items>
                                                        </dx:ToolbarParagraphFormattingEdit>
                                                        <dx:ToolbarFontNameEdit>
                                                            <Items>
                                                                <dx:ToolbarListEditItem Text="Times New Roman" Value="Times New Roman" />
                                                                <dx:ToolbarListEditItem Text="Tahoma" Value="Tahoma" />
                                                                <dx:ToolbarListEditItem Text="Verdana" Value="Verdana" />
                                                                <dx:ToolbarListEditItem Text="Arial" Value="Arial" />
                                                                <dx:ToolbarListEditItem Text="MS Sans Serif" Value="MS Sans Serif" />
                                                                <dx:ToolbarListEditItem Text="Courier" Value="Courier" />
                                                                <dx:ToolbarListEditItem Text="Segoe UI" Value="Segoe UI" />
                                                            </Items>
                                                        </dx:ToolbarFontNameEdit>
                                                        <dx:ToolbarFontSizeEdit>
                                                            <Items>
                                                                <dx:ToolbarListEditItem Text="1 (8pt)" Value="1" />
                                                                <dx:ToolbarListEditItem Text="2 (10pt)" Value="2" />
                                                                <dx:ToolbarListEditItem Text="3 (12pt)" Value="3" />
                                                                <dx:ToolbarListEditItem Text="4 (14pt)" Value="4" />
                                                                <dx:ToolbarListEditItem Text="5 (18pt)" Value="5" />
                                                                <dx:ToolbarListEditItem Text="6 (24pt)" Value="6" />
                                                                <dx:ToolbarListEditItem Text="7 (36pt)" Value="7" />
                                                            </Items>
                                                        </dx:ToolbarFontSizeEdit>
                                                        <dx:ToolbarBoldButton BeginGroup="True">
                                                        </dx:ToolbarBoldButton>
                                                        <dx:ToolbarItalicButton>
                                                        </dx:ToolbarItalicButton>
                                                        <dx:ToolbarUnderlineButton>
                                                        </dx:ToolbarUnderlineButton>
                                                        <dx:ToolbarStrikethroughButton>
                                                        </dx:ToolbarStrikethroughButton>
                                                        <dx:ToolbarJustifyLeftButton BeginGroup="True">
                                                        </dx:ToolbarJustifyLeftButton>
                                                        <dx:ToolbarJustifyCenterButton>
                                                        </dx:ToolbarJustifyCenterButton>
                                                        <dx:ToolbarJustifyRightButton>
                                                        </dx:ToolbarJustifyRightButton>
                                                        <dx:ToolbarJustifyFullButton>
                                                        </dx:ToolbarJustifyFullButton>
                                                        <dx:ToolbarBackColorButton BeginGroup="True">
                                                        </dx:ToolbarBackColorButton>
                                                        <dx:ToolbarFontColorButton>
                                                        </dx:ToolbarFontColorButton>
                                                    </Items>
                                                </dx:HtmlEditorToolbar>
                                                <dx:HtmlEditorToolbar>
                                                    <Items>
                                                        <dx:ToolbarInsertImageDialogButton>
                                                        </dx:ToolbarInsertImageDialogButton>
                                                        <dx:ToolbarInsertFlashDialogButton>
                                                        </dx:ToolbarInsertFlashDialogButton>
                                                        <dx:ToolbarInsertAudioDialogButton>
                                                        </dx:ToolbarInsertAudioDialogButton>
                                                        <dx:ToolbarInsertVideoDialogButton>
                                                        </dx:ToolbarInsertVideoDialogButton>
                                                        <dx:ToolbarInsertYouTubeVideoDialogButton>
                                                        </dx:ToolbarInsertYouTubeVideoDialogButton>
                                                        <dx:ToolbarInsertPlaceholderDialogButton BeginGroup="True">
                                                        </dx:ToolbarInsertPlaceholderDialogButton>
                                                    </Items>
                                                </dx:HtmlEditorToolbar>
                                            </Toolbars>
                                            <Placeholders>
                                                <dx:HtmlEditorPlaceholderItem Value="Placeholder1" />
                                                <dx:HtmlEditorPlaceholderItem Value="Placeholder2" />
                                                <dx:HtmlEditorPlaceholderItem Value="Placeholder3" />
                                            </Placeholders>
                                            <Settings AllowCustomColorsInColorPickers="True" AllowScriptExecutionInPreview="True" ShowTagInspector="True">
                                                <SettingsHtmlView EnableAutoCompletion="True" HighlightActiveLine="True" HighlightMatchingTags="True" ShowCollapseTagButtons="True" ShowLineNumbers="True" />
                                            </Settings>
                                            <SettingsHtmlEditing AllowEditFullDocument="True" AllowFormElements="True" AllowHTML5MediaElements="True" AllowIFrames="True" AllowObjectAndEmbedElements="True" AllowScripts="True" AllowYouTubeVideoIFrames="True" EnablePasteOptions="True" EnterMode="BR" PasteMode="MergeFormatting">
                                                <PasteFiltering Attributes="class" />
                                            </SettingsHtmlEditing>
                                            <SettingsResize AllowResize="True" />
                                            <SettingsDialogs>
                                                <InsertImageDialog>
                                                    <SettingsImageSelector>
                                                        <SettingsAdaptivity CollapseFolderContainerAtWindowInnerWidth="650" />
                                                    </SettingsImageSelector>
                                                </InsertImageDialog>
                                                <InsertFlashDialog>
                                                    <SettingsFlashSelector>
                                                        <SettingsAdaptivity CollapseFolderContainerAtWindowInnerWidth="650" />
                                                    </SettingsFlashSelector>
                                                </InsertFlashDialog>
                                                <InsertAudioDialog>
                                                    <SettingsAudioSelector>
                                                        <SettingsAdaptivity CollapseFolderContainerAtWindowInnerWidth="650" />
                                                    </SettingsAudioSelector>
                                                </InsertAudioDialog>
                                                <InsertVideoDialog>
                                                    <SettingsVideoSelector>
                                                        <SettingsAdaptivity CollapseFolderContainerAtWindowInnerWidth="650" />
                                                    </SettingsVideoSelector>
                                                </InsertVideoDialog>
                                                <InsertLinkDialog>
                                                    <SettingsDocumentSelector>
                                                        <SettingsAdaptivity CollapseFolderContainerAtWindowInnerWidth="650" />
                                                    </SettingsDocumentSelector>
                                                </InsertLinkDialog>
                                            </SettingsDialogs>
                                        </dx:ASPxHtmlEditor>
                                    </div>
                                </div>
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                    <dx:TabPage Text="KAMPANYA">
                        <ContentCollection>
                            <dx:ContentControl runat="server">
                                <div class="row">
                                    <div class="col-md-12">
                                        <dx:ASPxGridView ID="gvUrunKampanya" runat="server" Theme="MaterialCompact" Width="100%" AutoGenerateColumns="False" DataSourceID="dsUrunKampanya" KeyFieldName="DetayId">
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="DetayId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="KampanyaId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Kampanya" FieldName="KampanyaAdi" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="KampanyaAltTurId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Kampanya Türü" FieldName="AltTur" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Gereken" FieldName="AlmasiGerereken" ShowInCustomizationForm="True" VisibleIndex="5">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Hediye" FieldName="Hediye" ShowInCustomizationForm="True" VisibleIndex="6">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Hediye Urun" FieldName="HediyeUrunId" ShowInCustomizationForm="True" VisibleIndex="7">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Fiyat" FieldName="Fiyat" ShowInCustomizationForm="True" VisibleIndex="8">
                                                    <PropertiesTextEdit DisplayFormatString="{0:N2}">
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="ParaBirimId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Para Birimi" FieldName="ParaBirimi" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="10">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Eski Fiyat" FieldName="EskiFiyat" ShowInCustomizationForm="True" VisibleIndex="11">
                                                    <PropertiesTextEdit DisplayFormatString="{0:N2}">
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Yüzde" FieldName="Yuzde" ShowInCustomizationForm="True" VisibleIndex="12">
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="dsUrunKampanya" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT kd.DetayId,
       kd.KampanyaId,
       (SELECT k.KampanyaAdi
        FROM Kampanyalar k
        WHERE k.KampanyaId = kd.KampanyaId) KampanyaAdi,
       kd.KampanyaAltTurId,
       (CASE
       WHEN kd.KampanyaAltTurId = 1 THEN 'Net Fiyat Kampanyası'
       WHEN kd.KampanyaAltTurId = 2 THEN 'Tüm Ürünlere İndirim'
       WHEN kd.KampanyaAltTurId = 3 THEN 'Kategoriye İndirim'
       WHEN kd.KampanyaAltTurId = 4 THEN 'Markaya İndirim'
       WHEN kd.KampanyaAltTurId = 5 THEN 'Belirli Ürüne Aynısından X Kadar Hediye'
       WHEN kd.KampanyaAltTurId = 6 THEN 'Belirli Ürüne, Farklı Üründen Hediye'
       END) AltTur,
       kd.AlmasiGerereken,
       kd.Hediye,
       kd.HediyeUrunId,
       kd.Fiyat,
       kd.ParaBirimId,
       (Select pb.ParaBirimi From ParaBirimleri pb Where pb.BirimId = kd.ParaBirimId) ParaBirimi,
       kd.EskiFiyat,
       kd.Yuzde
FROM KampanyaDetay kd
WHERE kd.UrunId =  @UrunId">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="UrunId" SessionField="sUrunId" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                    <dx:TabPage Text="RESİMLER">
                        <ContentCollection>
                            <dx:ContentControl runat="server">
                                <div class="row">
                                    <div class="col-md-1">
                                        <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Resim Ekle" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                                    </div>
                                    <div class="col-md-3">
                                        <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" UploadMode="Auto" Width="280px" AutoStartUpload="True" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete" ShowProgressPanel="True" Theme="MaterialCompact">
                                            <AdvancedModeSettings EnableDragAndDrop="True" EnableMultiSelect="True">
                                            </AdvancedModeSettings>
                                        </dx:ASPxUploadControl>
                                    </div>
                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col-md-12">
                                        <dx:ASPxDataView ID="dvResimler" runat="server" DataSourceID="dsUrunResimleri" Layout="Breakpoints" Theme="MaterialCompact" Width="100%">
                                            <SettingsTableLayout ColumnCount="4" />
                                            <SettingsBreakpointsLayout ItemsPerPage="20" ItemsPerRow="4">
                                            </SettingsBreakpointsLayout>
                                            <PagerSettings ShowNumericButtons="False">
                                            </PagerSettings>
                                            <ItemTemplate>
                                                <div class="row">
                                                    <div class="col-md-12" style="text-align: center">
                                                        <dx:ASPxImage ID="ASPxImage1" runat="server" Height="200px" ImageUrl='<%# Eval("ResimYolu") %>' ShowLoadingImage="True" Theme="Mulberry">
                                                        </dx:ASPxImage>
                                                    </div>
                                                </div>
                                                <br />
                                                <div class="row">
                                                    <div class="col-md-3">
                                                    </div>
                                                    <div class="col-md-3">
                                                        <dx:ASPxButton ID="btnDefault" runat="server" AutoPostBack="False" OnClick="btnDefault_Click" OnInit="btnDefault_Init" Theme="Mulberry">
                                                            <Image IconID="actions_apply_16x16">
                                                            </Image>
                                                            <Border BorderStyle="None" />
                                                        </dx:ASPxButton>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <dx:ASPxButton ID="btnSil" runat="server" AutoPostBack="False" OnClick="btnSil_Click" OnInit="btnSil_Init" Theme="Mulberry">
                                                            <Image IconID="actions_trash_16x16">
                                                            </Image>
                                                            <Border BorderStyle="None" />
                                                        </dx:ASPxButton>
                                                    </div>
                                                    <div class="col-md-3">
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                            <ItemStyle Height="250px" />
                                        </dx:ASPxDataView>
                                        <asp:SqlDataSource ID="dsUrunResimleri" runat="server" ConnectionString="<%$ ConnectionStrings:Gediz %>" SelectCommand="SELECT
ResimId,
UrunId, ResimYolu,
AnaResim FROM UrunResimleri WHERE ([UrunId] = @UrunId) ORDER BY [ResimId]">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="UrunId" SessionField="sUrunId" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                    <dx:TabPage Text="KATEGORİLENDİRME">
                        <ContentCollection>
                            <dx:ContentControl runat="server">
                                <div class="row">
                                    <div class="col-md-2">
                                        <dx:ASPxListBox ID="lbKategori1" runat="server" ValueType="System.String" Theme="MaterialCompact" Width="100%" Height="250px" AutoPostBack="True" DataSourceID="dsKategori1" OnSelectedIndexChanged="lbKategori1_SelectedIndexChanged" TextField="KategoriAdi" ValueField="KategoriId"></dx:ASPxListBox>
                                        <asp:SqlDataSource ID="dsKategori1" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT * FROM [Kategoriler] WHERE ([UstKategoriId] IS NULL) ORDER BY [KategoriAdi]"></asp:SqlDataSource>
                                    </div>
                                    <div class="col-md-2" id="divKategori2" runat="server" visible="false">
                                        <dx:ASPxListBox ID="lbKategori2" runat="server" ValueType="System.String" Theme="MaterialCompact" Width="100%" Height="250px" AutoPostBack="True" OnSelectedIndexChanged="lbKategori2_SelectedIndexChanged"></dx:ASPxListBox>
                                    </div>
                                    <div class="col-md-2" id="divKategori3" runat="server" visible="false">
                                        <dx:ASPxListBox ID="lbKategori3" runat="server" ValueType="System.String" Theme="MaterialCompact" Width="100%" Height="250px" AutoPostBack="True" OnSelectedIndexChanged="lbKategori3_SelectedIndexChanged"></dx:ASPxListBox>
                                    </div>
                                    <div class="col-md-2" id="divKategori4" runat="server" visible="false">
                                        <dx:ASPxListBox ID="lbKategori4" runat="server" ValueType="System.String" Theme="MaterialCompact" Width="100%" Height="250px" AutoPostBack="True" OnSelectedIndexChanged="lbKategori4_SelectedIndexChanged"></dx:ASPxListBox>
                                    </div>
                                    <div class="col-md-2" id="divKategori5" runat="server" visible="false">
                                        <dx:ASPxListBox ID="lbKategori5" runat="server" ValueType="System.String" Theme="MaterialCompact" Width="100%" Height="250px" AutoPostBack="True" OnSelectedIndexChanged="lbKategori5_SelectedIndexChanged"></dx:ASPxListBox>
                                    </div>
                                    <div class="col-md-2" id="divKaydetKategori" runat="server" visible="false">
                                        <dx:ASPxButton ID="btnKaydetKategori" runat="server" Text="KAYDET" Theme="MaterialCompact" Width="100%" Height="250px" OnClick="btnKaydetKategori_Click"></dx:ASPxButton>
                                        <dx:ASPxLabel ID="lblHangisi" runat="server" Theme="MaterialCompact" Visible="False"></dx:ASPxLabel>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <dx:ASPxLabel ID="lblUyariKategori" runat="server" Theme="MaterialCompact"></dx:ASPxLabel>
                                    </div>
                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col-md-12">
                                        <dx:ASPxGridView ID="gvKategoriler" runat="server" Theme="MaterialCompact" Width="100%" AutoGenerateColumns="False" DataSourceID="dsKatgegoriler" KeyFieldName="KayitId" EnableCallBacks="False" OnCustomButtonCallback="gvKategoriler_CustomButtonCallback">
                                            <SettingsPager PageSize="100">
                                            </SettingsPager>
                                            <SettingsPopup>
                                                <FilterControl AutoUpdatePosition="False"></FilterControl>
                                            </SettingsPopup>
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="KayitId" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
                                                    <EditFormSettings Visible="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="UrunId" ShowInCustomizationForm="True" VisibleIndex="2" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="KategoriId" ShowInCustomizationForm="True" VisibleIndex="3" Visible="False">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="UrunKategoriYol" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Ürün Kategorisi">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" Caption=" " ShowInCustomizationForm="True" VisibleIndex="0">
                                                    <CustomButtons>
                                                        <dx:GridViewCommandColumnCustomButton ID="btnKategoriSil">
                                                            <Image IconID="actions_trash_16x16">
                                                            </Image>
                                                        </dx:GridViewCommandColumnCustomButton>
                                                    </CustomButtons>
                                                </dx:GridViewCommandColumn>
                                            </Columns>
                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="dsKatgegoriler" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT * FROM [UrunKategori] WHERE ([UrunId] = @UrunId)">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="UrunId" SessionField="sUrunId" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                    <dx:TabPage Text="SATIŞLAR">
                        <ContentCollection>
                            <dx:ContentControl runat="server">
                                <div class="row">
                                    <div class="col-md-12">
                                        <dx:ASPxGridView ID="gvUrunSatislari" runat="server" Theme="MaterialCompact" Width="100%" AutoGenerateColumns="False" DataSourceID="dsUrunSatislar" KeyFieldName="SiparisId">
                                            <SettingsPopup>
                                                <FilterControl AutoUpdatePosition="False"></FilterControl>
                                            </SettingsPopup>
                                            <Columns>
                                                <dx:GridViewDataTextColumn FieldName="SiparisId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Sipariş No" FieldName="SiparisNo" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                                    <DataItemTemplate>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Text='<%# Eval("SiparisNo") %>'></asp:LinkButton>
                                                    </DataItemTemplate>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataDateColumn Caption="Sipariş Tarihi" FieldName="SiparisTarihi" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn Caption="Cari Adı" FieldName="CariAdi" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Miktar" FieldName="Miktar" ShowInCustomizationForm="True" VisibleIndex="4">
                                                    <PropertiesTextEdit DisplayFormatString="{0:N0}">
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:ASPxGridView>
                                        <asp:SqlDataSource ID="dsUrunSatislar" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT sd.SiparisId,
       (SELECT s.SiparisNo
        FROM Siparisler s
        WHERE s.SiparisId = sd.SiparisId) SiparisNo,
        (SELECT s.SiparisTarihi
        FROM Siparisler s
        WHERE s.SiparisId = sd.SiparisId) SiparisTarihi,
        (Select cr.CariAdi From Cariler cr Where cr.CariId = sd.CariId) CariAdi,
        sd.Miktar
FROM SiparisDetay sd
WHERE sd.UrunId = @UrunId
Order By 3 DESC">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="UrunId" SessionField="sUrunId" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                </TabPages>
            </dx:ASPxPageControl>
        </div>
    </div>
</asp:Content>
