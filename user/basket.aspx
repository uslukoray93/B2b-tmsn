<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="basket.aspx.cs" Inherits="GedizMakina.user.basket" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function OnEditorInit(s, e) {
            var errorTextElement = document.getElementsByClassName("editSpinCell")[0].getElementsByClassName("dxeOutOfRWarn")[0];
            errorTextElement.innerText = "Period should be between " + s.GetMinValue() + " and " + s.GetMaxValue();
        }
        function OnNumberChanged(s, e, index) {
            cb.PerformCallback(index + '|' + s.GetValue());
            cb2.PerformCallback(index + '|' + s.GetValue());
        }
        function OnCallbackComplete(s, e) {
            var dataFromTheServer = e.result;
            /*alert(dataFromTheServer);*/
        }
    </script>
    <style type="text/css">
        .auto-style1 {
            margin-right: 2px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="card">
        <div class="card-body">
            <div class="invoice">
                <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" ClientInstanceName="cb" OnCallback="ASPxCallbackPanel1_Callback" Theme="MaterialCompact" Width="100%">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="col-md-1">Kredi Limitiniz</div>
                                    <div class="col-md-3" id="lblKrediLimiti2" runat="server">0.00 ₺</div>
                                    <div class="col-md-8"></div>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <dx:ASPxGridView ID="gvSepet" runat="server" Theme="MaterialCompact" AutoGenerateColumns="False" DataSourceID="dsSepet" EnableCallBacks="False" KeyFieldName="SepetId" OnCustomButtonCallback="gvSepet_CustomButtonCallback" Width="100%" CssClass="auto-style1">
                                    <Templates>
                                        <EmptyDataRow>
                                            <div class="text-center">
                                                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Size="Medium" Text="Sepetinizde ürün bulunmamaktadır. Sipariş vermeye başlamak için " Theme="MaterialCompact">
                                                </dx:ASPxLabel>
                                                <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Blue" NavigateUrl="/urunler" Text="tıklayın" Theme="MaterialCompact" />
                                            </div>
                                        </EmptyDataRow>
                                    </Templates>
                                    <SettingsPager PageSize="100">
                                    </SettingsPager>
                                    <SettingsPopup>
                                        <FilterControl AutoUpdatePosition="False"></FilterControl>
                                    </SettingsPopup>
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="SepetId" ReadOnly="True" Visible="False" VisibleIndex="2">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Ürün Kodu" FieldName="UrunKodu" ReadOnly="True" VisibleIndex="5">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Marka" FieldName="MarkaAdi" ReadOnly="True" VisibleIndex="7">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Miktar" FieldName="Miktar" VisibleIndex="8">
                                            <DataItemTemplate>
                                                <dx:ASPxSpinEdit ID="ASPxSpinEdit1" runat="server" AutoPostBack="True" EnableTheming="True" MaxValue="1000" MinValue="1" Number="0" OnInit="ASPxSpinEdit1_Init" Theme="MaterialCompact" Value='<%# Eval("Miktar") %>' Width="100px">
                                                    <ClientSideEvents NumberChanged="function(s, e) {
	lp.Show();
}" />
                                                </dx:ASPxSpinEdit>
                                            </DataItemTemplate>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Birim Fiyat" FieldName="UrunBirim" ReadOnly="True" VisibleIndex="9">
                                            <PropertiesTextEdit DisplayFormatString="N2">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Toplam Fiyat" FieldName="BirimFiyat" ReadOnly="True" VisibleIndex="10">
                                            <PropertiesTextEdit DisplayFormatString="N2">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <CellStyle HorizontalAlign="Right">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Net Fiyat" FieldName="UrunFiyatKDVsiz" ReadOnly="True" VisibleIndex="12">
                                            <PropertiesTextEdit DisplayFormatString="N2">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <CellStyle HorizontalAlign="Right">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="KDV Dahil" FieldName="UrunFiyatKDVli" ReadOnly="True" VisibleIndex="13">
                                            <PropertiesTextEdit DisplayFormatString="N2">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Right" />
                                            <CellStyle HorizontalAlign="Right">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" Caption=" " VisibleIndex="0">
                                            <CustomButtons>
                                                <dx:GridViewCommandColumnCustomButton ID="btnSil">
                                                    <Image IconID="actions_cancel_16x16" ToolTip="Ürünü sepetten sil">
                                                    </Image>
                                                </dx:GridViewCommandColumnCustomButton>
                                            </CustomButtons>
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn Caption="İskonto" FieldName="Indirim2" VisibleIndex="11">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataHyperLinkColumn Caption="Ürün Adı" FieldName="UrunAdi" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="6">
                                            <PropertiesHyperLinkEdit TextField="UrunLink">
                                            </PropertiesHyperLinkEdit>
                                        </dx:GridViewDataHyperLinkColumn>
                                        <dx:GridViewDataCheckColumn FieldName="Secili" ShowInCustomizationForm="True" VisibleIndex="1">
                                            <DataItemTemplate>
                                                <dx:ASPxCheckBox ID="chkSecili" runat="server" AutoPostBack="True" CheckState="Unchecked" EnableTheming="True" OnCheckedChanged="chkSecili_CheckedChanged" Theme="MaterialCompact" Value='<%# Eval("Secili") %>'>
                                                </dx:ASPxCheckBox>
                                            </DataItemTemplate>
                                        </dx:GridViewDataCheckColumn>
                                        <dx:GridViewDataTextColumn Caption="Stok" FieldName="StokDurumRenk" ShowInCustomizationForm="True" VisibleIndex="4">
                                            <DataItemTemplate>
                                                <dx:ASPxImage ID="ASPxImage1" runat="server" Height="16px" ImageAlign="Middle" ImageUrl='<%# Eval("StokDurumRenk") %>' ShowLoadingImage="True" Width="16px">
                                                </dx:ASPxImage>
                                                <br />
                                                <%# Eval("StokDurum") %>
                                            </DataItemTemplate>
                                            <CellStyle Font-Size="Small" HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:ASPxGridView>
                                <asp:SqlDataSource ID="dsSepet" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spSepetGetir" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="CariId" SessionField="sLoginId" Type="Int32" />
                                        <asp:ControlParameter ControlID="ddOdemeSekli" Name="OdemeSekli" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </div>

                            <div class="invoice-summary">
                                <div class="row justify-content-end">
                                    <div class="col-sm-8">
                                        <table class="table h6 text-dark">
                                            <tbody>
                                                <tr class="b-top-0">
                                                    <td class="col-md-2">Ödeme Şekli</td>
                                                    <td class="text-left">
                                                        <asp:DropDownList ID="ddOdemeSekli" CssClass="form-control" runat="server" Width="100%" AutoPostBack="True" OnSelectedIndexChanged="ddOdemeSekli_SelectedIndexChanged"></asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr class="b-top-0">
                                                    <td class="col-md-2">Gönderme Şekli</td>
                                                    <td class="text-left">
                                                        <asp:DropDownList ID="ddGonderimSekli" CssClass="form-control" runat="server" DataSourceID="dsGonderimSekli" DataTextField="TurAdi" DataValueField="TurId" Width="100%"></asp:DropDownList>
                                                        <asp:SqlDataSource ID="dsGonderimSekli" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT * FROM [SevkiyatTurleri] ORDER BY [SN]"></asp:SqlDataSource>
                                                    </td>
                                                </tr>
                                                <tr class="b-top-0" id="trFarkliAdres" runat="server" visible="false">
                                                    <td class="col-md-2">Evrak Yükle
                                                    </td>
                                                    <td class="text-left">
                                                        <dx:ASPxUploadControl ID="ucFarkliAdres" runat="server" UploadMode="Auto" Width="100%" Theme="Moderno" AutoStartUpload="True" ShowClearFileSelectionButton="False" ShowProgressPanel="True" OnFileUploadComplete="ucFarkliAdres_FileUploadComplete"></dx:ASPxUploadControl>
                                                    </td>
                                                </tr>
                                                <tr class="b-top-0">
                                                    <td class="col-md-2">Sepet Notu</td>
                                                    <td class="text-left">
                                                        <input id="txtSepetNotu" runat="server" class="form-control" />
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="col-sm-4">
                                        <table class="table h6 text-dark">
                                            <tbody>
                                                <tr class="b-top-0">
                                                    <td colspan="2" style="font-size: small">Toplam Tutar (KDV Hariç)</td>
                                                    <td class="text-left" style="text-align: right; font-size: small" id="lblToplamTutarKdvHaric" runat="server">0.00 ₺</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="font-size: small">İskonto</td>
                                                    <td class="text-left" style="text-align: right; font-size: small" id="lblIskonto" runat="server">0.00 ₺</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="font-size: small">Net Tutar</td>
                                                    <td class="text-left" style="text-align: right; font-size: small" id="lblNetTutar" runat="server">0.00 ₺</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="font-size: small">KDV</td>
                                                    <td class="text-left" style="text-align: right; font-size: small" id="lblKdv" runat="server">0.00 ₺</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" style="font-size: small">Genel Toplam (KDV Dahil)</td>
                                                    <td class="text-left" style="color: red; text-align: right; font-weight: bold; font-size: small" id="lblGenelToplam" runat="server">0.00 ₺</td>
                                                </tr>
                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                            </div>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxCallbackPanel>
            </div>
            <div class="d-grid gap-3 d-md-flex justify-content-md-end me-4">
                <asp:Button ID="btnGonder" runat="server" Text="Devam" CssClass="btn btn-dark" OnClick="btnGonder_Click" />
                <%--<a href="pages-invoice-print.html" target="_blank" class="btn btn-primary ms-3"><i class="fas fa-print"></i>Print</a>--%>
            </div>
            <dx:ASPxPopupControl ID="poUyari" runat="server" Width="400px" Theme="MaterialCompact" CloseAction="None" HeaderText="UYARI" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowCloseButton="False">
                <HeaderImage IconID="status_warning_32x32">
                </HeaderImage>
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                        <div class="row">
                            <div class="col-md-12">
                                <dx:ASPxLabel ID="lblPopUpUyari" runat="server" Theme="MaterialCompact"></dx:ASPxLabel>
                            </div>
                        </div>
                        <hr />
                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-8">
                                <dx:ASPxButton ID="btnPopUpTamam" runat="server" Text="TAMAM" Theme="MaterialCompact" OnClick="btnPopUpTamam_Click"></dx:ASPxButton>
                            </div>
                            <div class="col-md-2"></div>
                        </div>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
            <br />
            <dx:ASPxPopupControl ID="poBakiyeUyari" runat="server" CloseAction="None" HeaderText="Bakiye Uyarısı" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Theme="MaterialCompact" Width="400px">
                <ContentCollection>
                    <dx:PopupControlContentControl runat="server">
                        <div class="row">
                            <div class="col-md-12">
                                <label id="lblBakiyeUyari" runat="server"></label>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-6">
                                <button id="btnBakiyeKK" runat="server" class="btn btn-primary" onserverclick="btnBakiyeKK_ServerClick">KK ile Öde</button>
                            </div>
                            <div class="col-md-6">
                                <button id="btnBakiyeVade" runat="server" class="btn btn-primary" onserverclick="btnBakiyeVade_ServerClick">Kalanı Vadelendir</button>
                            </div>
                        </div>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
        </div>
    </section>
</asp:Content>
