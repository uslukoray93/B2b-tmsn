<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="siparis-detay.aspx.cs" Inherits="GedizMakina.user.siparis_detay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                                    <label id="lblSiparisDurum" runat="server" style="font-weight: bold"></label>
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
                                    <label id="lblOdemeTuru" runat="server" style="font-weight: bold"></label>
                                    <br />
                                    <label>Sevkiyat Türü</label>
                                    <label id="lblSevkiyatTuru" runat="server" style="font-weight: bold"></label>
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
            <div class="row">
                <div class="col">
                    <div class="card card-modern">
                        <div class="card-header">
                            <h2 class="card-title">SİPARİŞ VERİLEN ÜRÜNLER</h2>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-ecommerce-simple table-ecommerce-simple-border-bottom table-borderless table-striped mb-0" style="min-width: 380px;">
                                    <thead>
                                        <tr>
                                            <th width="3%" class="ps-4">SN</th>
                                            <th width="60%">Ürün Adı</th>
                                            <th width="5%" class="text-end">Miktar</th>
                                            <th width="8%" class="text-end">Birim Fiyat</th>
                                            <th width="8%" class="text-end">Toplam</th>
                                            <th width="8%" class="text-end">KDV</th>
                                            <th width="8%" class="text-end">Genel Toplam</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="repSiparisDetay" runat="server" DataSourceID="dsSiparisKalemleri">
                                            <ItemTemplate>
                                                <tr>
                                                    <td class="ps-4"><a href="ecommerce-products-form.html"><strong><%# Eval("SN") %></strong></a></td>
                                                    <td><a><strong><%# Eval("UrunAdi") %></strong></a></td>
                                                    <td class="text-end"><%# Eval("Miktar") %></td>
                                                    <td class="text-end"><%# String.Format("{0:N2}", Eval("BirimFiyat")) %> ₺</td>
                                                    <td class="text-end"><%# String.Format("{0:N2}", Eval("UrunFiyatKDVsiz")) %> ₺</td>
                                                    <td class="text-end"><%# String.Format("{0:N2}", Eval("KDVTutar")) %> ₺</td>
                                                    <td class="text-end"><%# String.Format("{0:N2}", Eval("UrunFiyatKDVli")) %> ₺</td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:SqlDataSource ID="dsSiparisKalemleri" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spSepetGetirAdmin" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="CariId" SessionField="sLoginId" Type="Int32" />
                                                <asp:SessionParameter Name="OdemeSekli" SessionField="sOdemeTurId" Type="Int32" />
                                                <asp:QueryStringParameter Name="SiparisId" QueryStringField="sid" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </tbody>
                                </table>
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
                                    <span class="d-flex align-items-center">Flat Rate
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
            <div class="row">
                <div class="col">
                    <div class="card card-modern">
                        <div class="card-header">
                            <h2 class="card-title">Order Notes</h2>
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
                    <button type="submit" class="submit-button btn btn-primary btn-px-4 py-3 d-flex align-items-center font-weight-semibold line-height-1" data-loading-text="Loading...">
                        <i class="bx bx-save text-4 me-2"></i>Save Order
                    </button>
                </div>
                <div class="col-12 col-md-auto px-md-0 mt-3 mt-md-0">
                    <a href="ecommerce-orders-list.html" class="cancel-button btn btn-light btn-px-4 py-3 border font-weight-semibold text-color-dark text-3">Cancel</a>
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
