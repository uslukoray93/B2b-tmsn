<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="urun-detay.aspx.cs" Inherits="GedizMakina.user.urun_detay" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/vendor/owl.carousel/assets/owl.carousel.css" />
    <link rel="stylesheet" href="/vendor/owl.carousel/assets/owl.theme.default.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12 col-xl-12" style="background-color: #262B2A">
            <h3 class="mb-3 font-weight-semibold" style="color: #A2CF13" id="lblUrunAdi" runat="server">ÇAYIR BİÇME 6,5HP SEP-MFC160-GX200- 110CM</h3>
        </div>
    </div>
    <hr />
    <div class="row">
        <div class="col-lg-4 col-xl-3 mb-4 mb-xl-0">
            <section class="card">
                <div class="card-body">
                    <div class="owl-carousel owl-theme" data-plugin-carousel data-plugin-options='{ "dots": true, "autoplay": true, "autoplayTimeout": 3000, "loop": true, "margin": 10, "nav": false, "items": 1 }'>
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="dsUrunResimleri">
                            <ItemTemplate>
                                <div class="item">
                                    <img class="img-thumbnail" src="<%# Eval("ResimYolu") %>" alt="">
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <asp:SqlDataSource ID="dsUrunResimleri" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT * FROM [UrunResimleri] WHERE ([UrunId] = @UrunId) Order By AnaResim DESC">
                        <SelectParameters>
                            <asp:SessionParameter Name="UrunId" SessionField="sUrunId" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <hr class="dotted short">

                    <h4 class="mb-3 mt-0 font-weight-semibold text-dark">Ürün Bilgileri</h4>
                    <ul class="simple-card-list mb-3">
                        <li class="primary">
                            <h3><a id="lblMarka" runat="server" style="font-weight: bold; color: white"></a></h3>
                            <p class="text-light" style="font-weight: bold">Marka</p>
                        </li>
                        <li class="primary">
                            <h3 id="lblListeFiyati" runat="server">$ 189,000.00</h3>
                            <p class="text-light" style="font-weight: bold">Liste Fiyatı (KDV Hariç)</p>
                        </li>
                        <li class="primary">
                            <h3 id="lblUrunKodu" runat="server">16</h3>
                            <p class="text-light">Ürün Kodu</p>
                        </li>
                        <li class="primary" id="lblStokDurumRenk" runat="server">
                            <h3 id="lblStokDurum" runat="server">16</h3>
                            <p class="text-light">Stok Durumu</p>
                        </li>
                    </ul>


                </div>
            </section>
        </div>
        <div class="col-lg-8 col-xl-6">

            <div class="tabs">
                <ul class="nav nav-tabs tabs-primary">
                </ul>
                <div class="tab-content">
                    <div id="overview" class="tab-pane active">

                        <div class="p-3">
                            <h4 class="mb-3 font-weight-semibold text-dark">Detaylı Fiyat</h4>
                            <div class="table-responsive">
                                <table class="table table-responsive-md invoice-items">
                                    <thead>
                                        <tr class="text-dark">
                                            <th class="font-weight-semibold">Ödeme Şekli</th>
                                            <th class="font-weight-semibold">Fiyat</th>
                                            <th class="font-weight-semibold">İskonto</th>
                                            <th class="text-center font-weight-semibold">Net Fiyat</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="repDetayFiyat" runat="server" DataSourceID="dsDetayFiyat">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Eval("OdemeSekli") %></td>
                                                    <td><%# String.Format("{0:N2}", Eval("Fiyat")) %></td>
                                                    <td><%# Eval("Iskonto") %></td>
                                                    <td class="text-end"><%# String.Format("{0:N2}", Eval("TLTOPLAM")) %></td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                            </div>
                            <asp:SqlDataSource ID="dsDetayFiyat" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spDetayFiyat" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="CariId" SessionField="sLoginId" Type="Int32" />
                                    <asp:SessionParameter Name="UrunId" SessionField="sUrunId" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                            <h4 class="mb-3 font-weight-semibold text-dark">Taksitlendirme</h4>
                            <br />
                            <div class="table-responsive">
                                <dx:ASPxGridView ID="gvTaksitOran" runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="dsTaksitOran" EnableTheming="True" KeyFieldName="KayitId" Theme="Moderno">
                                    <SettingsBehavior AllowAutoFilter="False" AllowClientEventsOnLoad="False" AllowDragDrop="False" AllowGroup="False" AllowHeaderFilter="False" AllowSort="False" />
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="KayitId" ReadOnly="True" Visible="False" VisibleIndex="0">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="KartAdi" Visible="False" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Ay1" Visible="False" VisibleIndex="3">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="2" FieldName="Ay2" VisibleIndex="4" Width="7%">
                                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="3" FieldName="Ay3" VisibleIndex="5" Width="7%">
                                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="4" FieldName="Ay4" VisibleIndex="6" Width="7%">
                                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="5" FieldName="Ay5" VisibleIndex="7" Width="7%">
                                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="6" FieldName="Ay6" VisibleIndex="8" Width="7%">
                                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="7" FieldName="Ay7" VisibleIndex="9" Width="7%">
                                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="8" FieldName="Ay8" VisibleIndex="10" Width="7%">
                                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="9" FieldName="Ay9" VisibleIndex="11" Width="7%">
                                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="10" FieldName="Ay10" VisibleIndex="12" Width="7%">
                                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="11" FieldName="Ay11" VisibleIndex="13" Width="7%">
                                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="12" FieldName="Ay12" VisibleIndex="14" Width="7%">
                                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                                            <CellStyle HorizontalAlign="Center">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataImageColumn Caption=" " FieldName="Logo" VisibleIndex="2" Width="23%">
                                        </dx:GridViewDataImageColumn>
                                    </Columns>
                                </dx:ASPxGridView>
                                <asp:SqlDataSource ID="dsTaksitOran" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT * FROM [TaksitOran]"></asp:SqlDataSource>
                            </div>
                            <%-- <section class="simple-compose-box mb-3">
                                <asp:Label ID="lblFiyatTL" runat="server" Text="Label" Visible="false"></asp:Label>
                                <div class="card-body">
                                    <style>
                                        #paytr_taksit_tablosu {
                                            clear: both;
                                            font-size: 12px;
                                            max-width: 1200px;
                                            text-align: center;
                                            font-family: Arial, sans-serif;
                                        }

                                            #paytr_taksit_tablosu::before {
                                                display: table;
                                                content: " ";
                                            }

                                            #paytr_taksit_tablosu::after {
                                                content: "";
                                                clear: both;
                                                display: table;
                                            }

                                        .taksit-tablosu-wrapper {
                                            margin: 5px;
                                            width: 280px;
                                            padding: 12px;
                                            cursor: default;
                                            text-align: center;
                                            display: inline-block;
                                            border: 1px solid #e1e1e1;
                                        }

                                        .taksit-logo img {
                                            max-height: 28px;
                                            padding-bottom: 10px;
                                        }

                                        .taksit-tutari-text {
                                            float: left;
                                            width: 126px;
                                            color: #a2a2a2;
                                            margin-bottom: 5px;
                                        }

                                        .taksit-tutar-wrapper {
                                            display: inline-block;
                                            background-color: #f7f7f7;
                                        }

                                            .taksit-tutar-wrapper:hover {
                                                background-color: #e8e8e8;
                                            }

                                        .taksit-tutari {
                                            float: left;
                                            width: 126px;
                                            padding: 6px 0;
                                            color: #474747;
                                            border: 2px solid #ffffff;
                                        }

                                        .taksit-tutari-bold {
                                            font-weight: bold;
                                        }

                                        @media all and (max-width: 600px) {
                                            .taksit-tablosu-wrapper {
                                                margin: 5px 0;
                                            }
                                        }
                                    </style>
                                    <div id="paytr_taksit_tablosu"></div>
                                    <div id="divTaksit" runat="server">
                                        <script src="https://www.paytr.com/odeme/taksit-tablosu/v2?token=71c73f6303049ae3e7df650d6614bd16fe94fd5ba751c31e952f8d2f04cf40ee&merchant_id=496818&amount=113"></script>
                                    </div>

                                </div>

                            </section>--%>



                            <h4 class="mb-3 font-weight-semibold text-dark">Ürün Özellikleri</h4>

                            <section class="simple-compose-box mb-3">

                                <div class="card-body">
                                    <table class="table table-no-more table-bordered table-striped mb-0">

                                        <tbody>
                                            <asp:Repeater ID="repOzellikler" runat="server" DataSourceID="dsOzellikler">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td class="text-start"><%# Eval("OzellikAdi") %></td>
                                                        <td class="text-end"><%# Eval("Ozellik") %></td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>

                                            <asp:SqlDataSource ID="dsOzellikler" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT * FROM [UrunOzellikler] WHERE ([UrunId] = @UrunId)">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="UrunId" SessionField="sUrunId" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>

                                        </tbody>
                                    </table>
                                </div>
                            </section>

                            <h4 class="mb-3 pt-4 font-weight-semibold text-dark">Ürün Açıklaması</h4>

                            <div class="timeline timeline-simple mt-3 mb-3">
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:Literal ID="lblUrunAciklamasi" runat="server"></asp:Literal>
                                    </div>

                                </div>
                            </div>


                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="col-xl-3">


            <div class="row">
                <div class="col-md-12">
                    <p class="text-dark" style="font-weight: bold; color: black">Miktar</p>
                    <asp:TextBox ID="txtMiktar" runat="server" TextMode="Number" CssClass="form-control" AutoPostBack="True" MaxLength="1" OnTextChanged="txtMiktar_TextChanged">1</asp:TextBox>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-12">
                    <asp:Button ID="btnSepeteEkle" runat="server" CssClass="btn btn-primary" Text="Sepete Ekle" Width="100%" OnClick="btnSepeteEkle_Click" />
                </div>
            </div>
            <br />
            <ul class="simple-card-list mb-3" id="ulSepetKontrol" runat="server">
                <li class="success">
                    <h3><a id="lblSepetKontrol" runat="server" style="font-weight: bold; color: white"></a></h3>
                </li>
            </ul>
            <br />
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <table class="table table-responsive-md invoice-items" style="background-color: aquamarine; color: black">
                            <thead>
                                <tr class="text-dark">
                                    <th class="font-weight-semibold">Kampanya Adı</th>
                                    <th class="font-weight-semibold">Fiyat</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="repKampanya" runat="server" DataSourceID="dsKampanya">
                                    <ItemTemplate>
                                        <tr>
                                            <td><%# Eval("KampanyaAdi") %></td>
                                            <td><%# String.Format("{0:N2}", Eval("Fiyat")) %></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="dsKampanya" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="Select (Select k.KampanyaAdi From Kampanyalar k Where k.KampanyaId = kd.KampanyaId) KampanyaAdi, Fiyat From KampanyaDetay kd Where kd.UrunId = @UrunId">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="UrunId" SessionField="sUrunId" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <dx:ASPxPopupControl ID="poSepetUyari" runat="server" Width="400px" CloseAction="None" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ShowHeader="False" Theme="MaterialCompact">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <div class="row">
                    <div class="col-md-12">
                        <asp:Label ID="lblSepetUyari" runat="server"></asp:Label>
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="col-md-6"></div>
                    <div class="col-md-6">
                        <asp:Button ID="btnPoTamam" runat="server" Text="Tamam" CssClass="btn btn-primary" OnClick="btnPoTamam_Click" />
                    </div>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

    <br />

    <!-- Vendor -->
    <script src="/vendor/jquery/jquery.js"></script>
    <script src="/vendor/jquery-browser-mobile/jquery.browser.mobile.js"></script>
    <script src="/vendor/popper/umd/popper.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/vendor/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script src="/vendor/common/common.js"></script>
    <script src="/vendor/nanoscroller/nanoscroller.js"></script>
    <script src="/vendor/magnific-popup/jquery.magnific-popup.js"></script>
    <script src="/vendor/jquery-placeholder/jquery.placeholder.js"></script>

    <!-- Specific Page Vendor -->
    <script src="/vendor/owl.carousel/owl.carousel.js"></script>

    <!-- Theme Base, Components and Settings -->
    <script src="/js/theme.js"></script>

    <!-- Theme Custom -->
    <script src="/js/custom.js"></script>

    <!-- Theme Initialization Files -->
    <script src="/js/theme.init.js"></script>
</asp:Content>
