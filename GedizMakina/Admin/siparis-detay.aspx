<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="siparis-detay.aspx.cs" Inherits="GedizMakina.Admin.siparis_detay" %>

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section role="main" class="content-body content-body-modern mt-0">
        <header class="page-header page-header-left-inline-breadcrumb">
            <h2 class="font-weight-bold text-6" id="lblSiparisNo" runat="server">Order #6927 Details</h2>
            <div class="right-wrapper">
                <ol class="breadcrumbs">
                    <li><span>Dashboard</span></li>

                    <li><span>Siparişler</span></li>

                </ol>
                <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fas fa-chevron-left"></i></a>
            </div>
        </header>
        <!-- start: page -->
        <div class="order-details action-buttons-fixed">
            <div class="row">
                <div class="col-xl-4 mb-4 mb-xl-0">
                    <div class="card card-modern">
                        <div class="card-header">
                            <h2 class="card-title">SİPARİŞ BİLGİLERİ</h2>
                        </div>
                        <div class="card-body">
                            <div class="form-row">
                                <div class="form-group col mb-3">
                                    <label>Siparis Durumu</label>
                                    <asp:DropDownList ID="ddDurumlar" runat="server" CssClass="form-control form-control-modern" DataSourceID="dsSparisDurumlari" DataTextField="DurumAdi" DataValueField="DurumId" AutoPostBack="true" OnSelectedIndexChanged="ddDurumlar_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSparisDurumlari" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT * FROM [Durumlar] WHERE ([Kullanim] = @Kullanim) ORDER BY [DurumAdi]">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="Siparis" Name="Kullanim" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <div class="row" id="divKargo" runat="server" visible="false">
                                        <div class="col-md-12">
                                            <br />
                                            <label>Sipariş Tarihi</label>
                                            <asp:TextBox ID="txtKargoBilgisi" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col mb-3">
                                    <label>Sipariş Tarihi</label>
                                    <div class="date-time-field">
                                        <div class="date">
                                            <label id="lblSiparisTarihi" runat="server"></label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col mb-3">
                                    <label>Sipariş Veren Cari</label>
                                    <label id="lblSiparisVerenCari" runat="server" style="font-weight: bold"></label>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col mb-3">
                                    <label>Ödeme Türü</label>
                                    <asp:DropDownList ID="ddOdemeTuru" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="dsOdemeTuru" DataTextField="TurAdi" DataValueField="TurId" OnSelectedIndexChanged="ddOdemeTuru_SelectedIndexChanged"></asp:DropDownList>
                                    <asp:SqlDataSource ID="dsOdemeTuru" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT * FROM [OdemeTurleri] ORDER BY [SN]"></asp:SqlDataSource>
                                    <br />
                                    <label>Sevkiyat Türü</label>
                                    <asp:DropDownList ID="ddSevkiyatTuru" runat="server" CssClass="form-control" DataSourceID="dsSevkiyatTurleri" DataTextField="TurAdi" DataValueField="TurId"></asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSevkiyatTurleri" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT * FROM [SevkiyatTurleri] ORDER BY [SN]"></asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-8">
                    <div class="card card-modern">
                        <div class="card-header">
                            <h2 class="card-title">ADRESLER</h2>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-xl-auto me-xl-5 pe-xl-5 mb-4 mb-xl-0">
                                    <h3 class="text-color-dark font-weight-bold text-4 line-height-1 mt-0 mb-3">FATURA ADRESİ</h3>
                                    <ul class="list list-unstyled list-item-bottom-space-0">
                                        <li id="lblFaturaAdresi" runat="server">Street Name Example</li>
                                        <li></li>
                                        <li id="lblFaturaSehir" runat="server">Detroit</li>
                                        <li id="lblFaturaIlce" runat="server">Michigan</li>

                                    </ul>
                                </div>
                                <div class="col-xl-auto ps-xl-5">
                                    <h3 class="font-weight-bold text-color-dark text-4 line-height-1 mt-0 mb-3">SEVKİYAT ADRESİ</h3>
                                    <ul class="list list-unstyled list-item-bottom-space-0">
                                        <li id="lblSevkiyatAdresi" runat="server">Street Name Example</li>
                                        <li></li>
                                        <li id="lblSevkiyatSehir" runat="server">Detroit</li>
                                        <li id="lblSevkiyatIlce" runat="server">Michigan</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" ClientInstanceName="cb" OnCallback="ASPxCallbackPanel1_Callback" Theme="MaterialCompact" Width="100%">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <div class="row">
                            <div class="col">
                                <div class="card card-modern">
                                    <div class="card-header">
                                        <h2 class="card-title">SİPARİŞ VERİLEN ÜRÜNLER</h2>
                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive">

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
                                                        <dx:GridViewDataTextColumn Caption="Ürün Kodu" FieldName="UrunKodu" ReadOnly="True" VisibleIndex="4">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Marka" FieldName="MarkaAdi" ReadOnly="True" VisibleIndex="6">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Miktar" FieldName="Miktar" VisibleIndex="7">
                                                            <DataItemTemplate>
                                                                <dx:ASPxSpinEdit ID="ASPxSpinEdit1" runat="server" AutoPostBack="True" EnableTheming="True" MaxValue="1000" MinValue="1" Number="0" OnInit="ASPxSpinEdit1_Init" Theme="MaterialCompact" Value='<%# Eval("Miktar") %>' Width="70px">
                                                                    <ClientSideEvents NumberChanged="function(s, e) {
	lp.Show();
}" />
                                                                </dx:ASPxSpinEdit>
                                                            </DataItemTemplate>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <CellStyle HorizontalAlign="Center">
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Birim Fiyat" FieldName="UrunBirim" ReadOnly="True" VisibleIndex="8">
                                                            <PropertiesTextEdit DisplayFormatString="N2">
                                                            </PropertiesTextEdit>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <CellStyle HorizontalAlign="Center">
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Toplam Fiyat" FieldName="BirimFiyat" ReadOnly="True" VisibleIndex="9">
                                                            <PropertiesTextEdit DisplayFormatString="N2">
                                                            </PropertiesTextEdit>
                                                            <HeaderStyle HorizontalAlign="Right" />
                                                            <CellStyle HorizontalAlign="Right">
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Net Fiyat" FieldName="UrunFiyatKDVsiz" ReadOnly="True" VisibleIndex="11">
                                                            <PropertiesTextEdit DisplayFormatString="N2">
                                                            </PropertiesTextEdit>
                                                            <HeaderStyle HorizontalAlign="Right" />
                                                            <CellStyle HorizontalAlign="Right">
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="KDV Dahil" FieldName="UrunFiyatKDVli" ReadOnly="True" VisibleIndex="12">
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
                                                        <dx:GridViewDataTextColumn Caption="İskonto" FieldName="Indirim2" VisibleIndex="10">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataHyperLinkColumn Caption="Ürün Adı" FieldName="UrunLink" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5">
                                                            <PropertiesHyperLinkEdit TextField="UrunAdi">
                                                            </PropertiesHyperLinkEdit>
                                                            <DataItemTemplate>
                                                                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Text='<%# Eval("UrunAdi") %>'></asp:LinkButton>
                                                            </DataItemTemplate>
                                                        </dx:GridViewDataHyperLinkColumn>
                                                        <dx:GridViewDataCheckColumn FieldName="Secili" ShowInCustomizationForm="True" VisibleIndex="1">
                                                            <DataItemTemplate>
                                                                <dx:ASPxCheckBox ID="chkSecili" runat="server" AutoPostBack="True" CheckState="Unchecked" EnableTheming="True" OnCheckedChanged="chkSecili_CheckedChanged" Theme="MaterialCompact" Value='<%# Eval("Secili") %>'>
                                                                </dx:ASPxCheckBox>
                                                            </DataItemTemplate>
                                                        </dx:GridViewDataCheckColumn>
                                                        <dx:GridViewDataTextColumn Caption="Stok" FieldName="StokDurumRenk" ShowInCustomizationForm="True" VisibleIndex="3">
                                                            <DataItemTemplate>
                                                                <dx:ASPxImage ID="ASPxImage1" runat="server" Height="16px" ImageAlign="Middle" ImageUrl='<%# Eval("StokDurumRenk") %>' ShowLoadingImage="True" Width="16px">
                                                                </dx:ASPxImage>
                                                                <br />
                                                                <%# Eval("StokDurum") %>
                                                            </DataItemTemplate>
                                                            <CellStyle Font-Size="Small" HorizontalAlign="Center">
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="UrunId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="13">
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:ASPxGridView>
                                                <asp:SqlDataSource ID="dsSepet" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spSepetGetirAdmin" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="CariId" SessionField="sCariId" Type="Int32" />
                                                        <asp:ControlParameter ControlID="ddOdemeTuru" Name="OdemeSekli" PropertyName="SelectedValue" Type="Int32" />
                                                        <asp:QueryStringParameter Name="SiparisId" QueryStringField="sid" Type="Int32" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </div>


                                        </div>
                                        <div class="row justify-content-end flex-column flex-lg-row my-3">
                                            <div class="col-auto me-5">
                                                <h3 class="font-weight-bold text-color-dark text-4 mb-3">Ürünler Toplamı</h3>
                                                <span class="d-flex align-items-center"><span id="lblUrunMiktari" runat="server"></span>
                                                    <i class="fas fa-chevron-right text-color-primary px-3"></i>
                                                    <b class="text-color-dark text-xxs" id="lblToplam" runat="server">$298.00</b>
                                                </span>
                                            </div>
                                            <div class="col-auto me-5">
                                                <h3 class="font-weight-bold text-color-dark text-4 mb-3">KDV Tutarı</h3>
                                                <span class="d-flex align-items-center">%10
													<i class="fas fa-chevron-right text-color-primary px-3"></i>
                                                    <b class="text-color-dark text-xxs" id="lblKdvTutari" runat="server">$20.00</b>
                                                </span>
                                            </div>
                                            <div class="col-auto">
                                                <h3 class="font-weight-bold text-color-dark text-4 mb-3">Genel Toplam</h3>
                                                <span class="d-flex align-items-center justify-content-lg-end">
                                                    <strong class="text-color-dark text-5" id="lblGenelToplam" runat="server">$318.00</strong>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
            <div class="row">
                <div class="col">
                    <div class="card card-modern">
                        <div class="card-header">
                            <h2 class="card-title">Sipariş Notları</h2>
                        </div>
                        <div class="card-body">
                            <div class="ecommerce-timeline mb-3">
                                <div class="ecommerce-timeline-items-wrapper">
                                    <asp:Repeater ID="repSiparisNotlari" runat="server" DataSourceID="dsSiparisNotlari">
                                        <ItemTemplate>
                                            <div class="ecommerce-timeline-item">
                                                <small><%# Eval("EklemeTarihi") %></small>
                                                <p><%# Eval("NotAciklama") %></p>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    <asp:SqlDataSource ID="dsSiparisNotlari" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spSiparisNotlari" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="SiparisId" QueryStringField="sid" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col pb-1 mb-3">
                                    <label>Not Ekleyin</label>
                                    <textarea class="form-control form-control-modern" name="orderAddNote" rows="6" id="txtNotAciklama" runat="server"></textarea>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col">
                                    <asp:Button ID="btnNotEkle" runat="server" CssClass="cancel-button btn btn-light btn-px-4 py-3 border font-weight-semibold text-color-dark text-3" Text="Not Ekle" OnClick="btnNotEkle_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row action-buttons">
                <div class="col-12 col-md-auto">
                    <button type="button" id="btnGuncelle" runat="server" onserverclick="btnGuncelle_ServerClick" class="submit-button btn btn-primary btn-px-4 py-3 d-flex align-items-center font-weight-semibold line-height-1" data-loading-text="Loading...">
                        <i class="bx bx-save text-4 me-2"></i>Siparişi Güncelle
                    </button>
                </div>
                <div class="col-12 col-md-auto px-md-0 mt-3 mt-md-0">
                    <button type="button" id="btnKapat" runat="server" onserverclick="btnKapat_ServerClick" class="cancel-button btn btn-light btn-px-4 py-3 border font-weight-semibold text-color-dark text-3" data-loading-text="Loading...">
                        Kapat
                    </button>
                </div>
                <div class="col-12 col-md-auto ms-md-auto mt-3 mt-md-0 ms-auto">
                    <a href="#" class="delete-button btn btn-danger btn-px-4 py-3 d-flex align-items-center font-weight-semibold line-height-1">
                        <i class="bx bx-trash text-4 me-2"></i>Delete Order
                    </a>
                </div>
            </div>
        </div>
        <!-- end: page -->
    </section>
</asp:Content>
