<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="GedizMakina.Admin.dashboard" %>

<%@ Register Assembly="DevExpress.XtraCharts.v22.2.Web, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.XtraCharts.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 24px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-lg-12 col-xl-4">
            <div class="row">
                <div class="col-12">
                    <div class="card card-modern">
                        <div class="card-body p-0">
                            <div class="widget-user-info">
                                <div class="widget-user-info-header">
                                    <h2 class="font-weight-bold text-color-dark text-5">Merhaba, Bora Şenyiğit</h2>
                                    <p class="mb-0">Administrator</p>
                                    <div class="widget-user-acrostic bg-primary">
                                        <span class="font-weight-bold">BŞ</span>
                                    </div>
                                </div>
                                <div class="widget-user-info-body">
                                    <div class="row">
                                        <div class="col-auto">
                                            <strong class="text-color-dark text-5" id="lblCariBakiye" runat="server">$19.876,02</strong>
                                            <h3 class="text-4-1">Cari Bakiyesi</h3>
                                        </div>
                                        <div class="col-auto">
                                            <strong class="text-color-dark text-5" id="lblUrunSayisi" runat="server">637</strong>
                                            <h3 class="text-4-1">Toplam Ürün</h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6 col-xl-12 pb-2 pb-lg-0 mb-4 mb-lg-0">
                    <div class="card card-modern">
                        <div class="card-body py-4">
                            <div class="row align-items-center">
                                <div class="col-6 col-md-4">
                                    <h3 class="text-4-1 my-0">Toplam Sipariş</h3>
                                    <strong class="text-6 text-color-dark" id="lblToplamSiparis" runat="server">4825</strong>
                                </div>
                                <div class="col-6 col-md-4 border border-top-0 border-end-0 border-bottom-0 border-color-light-grey py-3">
                                    <h3 class="text-4-1 text-color-success line-height-2 my-0">Orders <strong>UP &uarr;</strong></h3>
                                    <span>30 days</span>
                                </div>
                                <div class="col-md-4 text-left text-md-right pe-md-4 mt-4 mt-md-0">
                                    <i class="bx bx-cart-alt icon icon-inline icon-xl bg-primary rounded-circle text-color-light"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-xl-12 pt-xl-2 mt-xl-4">
                    <div class="card card-modern">
                        <div class="card-body py-4">
                            <div class="row align-items-center">
                                <div class="col-6 col-md-4">
                                    <h3 class="text-4-1 my-0">Ortalama Tutar</h3>
                                    <strong class="text-6 text-color-dark" id="lblSiparisBasiOrtalama" runat="server">$39,03</strong>
                                </div>
                                <div class="col-6 col-md-4 border border-top-0 border-end-0 border-bottom-0 border-color-light-grey py-3">
                                    <h3 class="text-4-1 text-color-danger line-height-2 my-0">Price <strong>DOWN &darr;</strong></h3>
                                    <span>30 days</span>
                                </div>
                                <div class="col-md-4 text-left text-md-right pe-md-4 mt-4 mt-md-0">
                                    <i class="bx bx-purchase-tag-alt icon icon-inline icon-xl bg-primary rounded-circle text-color-light pe-0"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-12 col-xl-8 pt-2 pt-xl-0 mt-4 mt-xl-0">
            <div class="row">
                <div class="col">
                    <div class="card card-modern">
                        <div class="card-header">
                            <div class="card-actions">
                                <%--<a href="#" class="card-action card-action-toggle" data-card-toggle></a>--%>
                            </div>
                            <h2 class="card-title">Hasılat</h2>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-auto">
                                    <strong class="text-color-dark text-6" id="lblBuAy" runat="server">$19.876,02</strong>
                                    <h3 class="text-4 mt-0 mb-2">Bu Ay</h3>
                                </div>
                                <div class="col-auto">
                                    <strong class="text-color-dark text-6" id="lblGecenAy" runat="server">$14.345,26</strong>
                                    <h3 class="text-4 mt-0 mb-2">Geçen Ay</h3>
                                </div>
                                <div class="col-auto">
                                    <strong class="text-color-dark text-6" id="lblBuYil" runat="server">$119.876,02</strong>
                                    <h3 class="text-4 mt-0 mb-2">Bu Yıl</h3>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <!-- Morris: Area -->
                                    <div class="row"></div>
                                    <div class="table-responsive">
                                        <dx:WebChartControl ID="WebChartControl1" runat="server" CrosshairEnabled="True" DataSourceID="dsCiroGrafik" Height="370px" Width="950px" Theme="MaterialCompact">
                                            <DiagramSerializable>
                                                <dx:XYDiagram>
                                                    <AxisX VisibleInPanesSerializable="-1">
                                                    </AxisX>
                                                    <AxisY VisibleInPanesSerializable="-1">
                                                    </AxisY>
                                                </dx:XYDiagram>
                                            </DiagramSerializable>
                                            <Legend Visibility="False"></Legend>
                                            <SeriesSerializable>
                                                <dx:Series ArgumentDataMember="Ay" Name="Series 1" ValueDataMembersSerializable="GenelTutar">
                                                </dx:Series>
                                            </SeriesSerializable>
                                        </dx:WebChartControl>
                                    </div>
                                    <asp:SqlDataSource ID="dsCiroGrafik" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spCiroGrafik" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-6 col-xl-4">
            <div class="card card-modern">
                <div class="card-body py-4">
                    <div class="row align-items-center">
                        <div class="col-6 col-md-4">
                            <h3 class="text-4-1 my-0">Toplam Cari</h3>
                            <strong class="text-6 text-color-dark" id="lblToplamCari" runat="server">3872</strong>
                        </div>
                        <div class="col-6 col-md-4 border border-top-0 border-end-0 border-bottom-0 border-color-light-grey py-3">
                            <h3 class="text-4-1 text-color-success line-height-2 my-0">Customers <strong>UP &uarr;</strong></h3>
                            <span>30 days</span>
                        </div>
                        <div class="col-md-4 text-left text-md-right pe-md-4 mt-4 mt-md-0">
                            <i class="bx bx-user icon icon-inline icon-xl bg-primary rounded-circle text-color-light"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card card-modern">
                <div class="card-header">
                    <div class="card-actions">
                        <%--<a href="#" class="card-action card-action-toggle" data-card-toggle></a>--%>
                    </div>
                    <h2 class="card-title">Recent Activity</h2>
                </div>
                <div class="card-body">
                    <ul class="list list-unstyled mb-0">
                        <li class="activity-item">
                            <span class="activity-time">1 MIN AGO</span> <i class="fas fa-chevron-right text-color-primary"></i>
                            <span class="activity-description">
                                <a href="#" class="text-color-dark"><strong>John Doe</strong></a> Added <a href="#" class="text-color-dark"><strong>Black Watch</strong></a> to Cart.
                            </span>
                        </li>
                        <li class="activity-item">
                            <span class="activity-time">2 MIN AGO</span> <i class="fas fa-chevron-right text-color-primary"></i>
                            <span class="activity-description">
                                <a href="#" class="text-color-dark"><strong>Order #123</strong></a> had payment refused.
                            </span>
                        </li>
                        <li class="activity-item">
                            <span class="activity-time">3 MIN AGO</span> <i class="fas fa-chevron-right text-color-primary"></i>
                            <span class="activity-description">
                                <a href="#" class="text-color-dark"><strong>Greg Doe</strong></a> added <a href="#" class="text-color-dark"><strong>Porto SmartWatch</strong></a> to Cart.
                            </span>
                        </li>
                        <li class="activity-item">
                            <span class="activity-time">4 MIN AGO</span> <i class="fas fa-chevron-right text-color-primary"></i>
                            <span class="activity-description">
                                <a href="#" class="text-color-dark"><strong>Order #231</strong></a> had payment refused.
                            </span>
                        </li>
                        <li class="activity-item">
                            <span class="activity-time">5 MIN AGO</span> <i class="fas fa-chevron-right text-color-primary"></i>
                            <span class="activity-description">
                                <a href="#" class="text-color-dark"><strong>Monica Doe</strong></a> added <a href="#" class="text-color-dark"><strong>Porto Bag</strong></a> to Cart.
                            </span>
                        </li>
                    </ul>
                    <a href="#" class="btn btn-light btn-xl border font-weight-semibold text-color-dark text-3 mt-3">View More</a>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-xl-4 pt-2 pt-lg-0 mt-4 mt-lg-0">
            <div class="card card-modern">
                <div class="card-header">
                    <div class="card-actions">
                        <%--<a href="#" class="card-action card-action-toggle" data-card-toggle></a>--%>
                    </div>
                    <h2 class="card-title">En çok satılan 5 ürün</h2>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-ecommerce-simple table-borderless table-striped mb-1">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>Ürün Adı</th>
                                    <th>Tutar</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="repEnCokSatilan5" runat="server" DataSourceID="dsEnCokSatilan5" OnItemCommand="repEnCokSatilan5_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td width="72">
                                                <img src="<%# Eval("ResimYolu") %>" class="img-fluid" width="45" alt="<%# Eval("UrunAdi") %>" /></td>
                                            <td><asp:Button ID="btnUrun" runat="server" CommandName="urun" CommandArgument='<%# Eval("UrunId") %>' CssClass="font-weight-semibold" Text='<%# Eval("UrunAdi") %>' Style="text-decoration: none; color: black; border: none; background-color: transparent;" /></td>
                                            <%--<td><a href="<%# Eval("UrunLink") %>" class="font-weight-semibold"><%# Eval("UrunAdi") %></a></td>--%>
                                            <td width="90"><%# string.Format("{0:N2}", Eval("Hasilat")) %> ₺</td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="dsEnCokSatilan5" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT TOP (5)
       sd.UrunId,
       (SELECT stk.STA
        FROM Urunler ur
             INNER JOIN [GEDIZLINK].DENEME_2024T.dbo.STOKGEN stk
                ON stk.REF = ur.RefId
        WHERE ur.UrunId = sd.UrunId) UrunAdi,
       SUM (sd.Miktar) UrunSatisMiktar,
       SUM (sd.ToplamFiyat) * SUM (sd.Miktar) Hasilat,
       (SELECT ur.ResimYolu
        FROM UrunResimleri ur
        WHERE ur.UrunId = sd.UrunId AND ur.AnaResim = 'True') ResimYolu,
       (SELECT   '/urun/'
               + CONVERT (VARCHAR, ur.UrunId)
               + '-'
               + dbo.KodOlustur (dbo.KodOlustur (RTRIM (STA)))
        FROM Urunler ur
             INNER JOIN [GEDIZLINK].DENEME_2024T.dbo.STOKGEN stk
                ON stk.REF = ur.RefId
        WHERE ur.UrunId = sd.UrunId) UrunLink
FROM SiparisDetay sd
GROUP BY sd.UrunId
ORDER BY 3 DESC"></asp:SqlDataSource>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-12 col-xl-4 pt-2 pt-xl-0 mt-4 mt-xl-0">
            <div class="card card-modern">
                <div class="card-header">
                    <div class="card-actions">
                        <%--<a href="#" class="card-action card-action-toggle" data-card-toggle></a>--%>
                    </div>
                    <h2 class="card-title">Şehirlere Göre Cariler</h2>
                    <p>Toplam <b><span id="lblToplamCari2" runat="server"></span></b>Cari</p>
                </div>
                <div class="card-body">
                    <asp:Repeater ID="repSehirlereGore" runat="server" DataSourceID="dsSehirlereGore">
                        <ItemTemplate>
                            <label><%# Eval("Sehir") %> (<%# Eval("Sayi") %>)</label>
                            <div class="progress progress-xs mb-4 light rounded-0">
                                <div class="progress-bar progress-bar-primary rounded-0" role="progressbar" aria-valuenow="<%# Eval("Yuzde") %>" aria-valuemin="0" aria-valuemax="100" style="<%# Eval("YuzdeRakam")%>">
                                    <span class="sr-only">50%</span>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="dsSehirlereGore" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT TOP (6)
       COUNT (Sehir) Sayi,
       (CASE WHEN len (Sehir) &lt; 1 THEN 'Diğer' ELSE Sehir END) Sehir,
       'width: ' + convert(varchar, (COUNT(Sehir) * 100)/(Select COUNT(*) From Cariler)) + '%;' YuzdeRakam,
       (COUNT(Sehir) * 100)/(Select COUNT(*) From Cariler)Yuzde
FROM Cariler
WHERE (CASE WHEN len (Sehir) &lt; 1 THEN 'Diğer' ELSE Sehir END) &lt;&gt; 'Diğer'
GROUP BY Sehir
ORDER BY 1 DESC"></asp:SqlDataSource>

                    <%--<a href="#" class="btn btn-light btn-xl border font-weight-semibold text-color-dark text-3 mb-4">View More</a>--%>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <div class="card card-modern card-modern-table-over-header">
                <div class="card-header">
                    <div class="card-actions">
                        <%--<a href="#" class="card-action card-action-toggle" data-card-toggle></a>--%>
                    </div>
                    <h2 class="card-title">Recent Orders</h2>
                </div>
                <div class="card-body">
                    <div class="datatables-header-footer-wrapper">
                        <div class="datatable-header">
                            <div class="row align-items-center mb-3">
                                <div class="col-8 col-lg-auto ms-auto ml-auto mb-3 mb-lg-0">
                                    <div class="d-flex align-items-lg-center flex-column flex-lg-row">
                                        <label class="ws-nowrap me-3 mb-0">Filter By:</label>
                                        <select class="form-control select-style-1 filter-by" name="filter-by">
                                            <option value="all" selected>All</option>
                                            <option value="1">ID</option>
                                            <option value="2">Customer Name</option>
                                            <option value="3">Date</option>
                                            <option value="4">Total</option>
                                            <option value="5">Status</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-4 col-lg-auto ps-lg-1 mb-3 mb-lg-0">
                                    <div class="d-flex align-items-lg-center flex-column flex-lg-row">
                                        <label class="ws-nowrap me-3 mb-0">Show:</label>
                                        <select class="form-control select-style-1 results-per-page" name="results-per-page">
                                            <option value="12" selected>12</option>
                                            <option value="24">24</option>
                                            <option value="36">36</option>
                                            <option value="100">100</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 col-lg-auto ps-lg-1">
                                    <div class="search search-style-1 search-style-1-lg mx-lg-auto">
                                        <div class="input-group">
                                            <input type="text" class="search-term form-control" name="search-term" id="search-term" placeholder="Search Order">
                                            <button class="btn btn-default" type="submit"><i class="bx bx-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <table class="table table-ecommerce-simple table-borderless table-striped mb-0" id="datatable-ecommerce-list" style="min-width: 640px;">
                            <thead>
                                <tr>
                                    <th width="8%">Sipariş No</th>
                                    <th width="28%">Cari Adı</th>
                                    <th width="18%">Sipariş Tarihi</th>
                                    <th width="18%">Tutar</th>
                                    <th width="15%">Durum</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:Repeater ID="repSiparisler" runat="server" DataSourceID="dsSiparisler" OnItemCommand="repSiparisler_ItemCommand">
                                    <ItemTemplate>
                                        <tr>
                                            <td><strong>
                                                <asp:Button ID="btnSiparisNo" runat="server" Style="text-decoration: none; color: black; border: none; background-color: transparent;" CommandArgument='<%# Eval("SiparisId") %>' CommandName="SiparisNo" Text='<%# Eval("SiparisNo") %>' /></strong></td>
                                            <td><strong>
                                                <asp:Button ID="Button1" runat="server" Style="text-decoration: none; color: black; border: none; background-color: transparent;" CommandArgument='<%# Eval("SiparisId") %>' CommandName="CariAdi" Text='<%# Eval("CariAdi") %>' /></strong></td>
                                            <td><%# Eval("SiparisTarihi") %></td>
                                            <td><%# string.Format("{0:N2}", Eval("GenelTutar")) %></td>
                                            <td><span class="<%# Eval("DurumClass") %>"><%# Eval("DurumAdi") %></span></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="dsSiparisler" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spAdminDashboardSiparisler" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                            </tbody>
                        </table>
                        <hr class="solid mt-5 opacity-4">
                        <div class="datatable-footer">
                            <div class="row align-items-center justify-content-between mt-3">
                                <div class="col-md-auto order-1 mb-3 mb-lg-0">
                                    <div class="d-flex align-items-stretch">
                                        <div class="d-grid gap-3 d-md-flex justify-content-md-end me-4">
                                            <select class="form-control select-style-1 bulk-action" name="bulk-action" style="min-width: 170px;">
                                                <option value="" selected>Bulk Actions</option>
                                                <option value="delete">Delete</option>
                                            </select>
                                            <a href="ecommerce-orders-detail.html" class="bulk-action-apply btn btn-light btn-px-4 py-3 border font-weight-semibold text-color-dark text-3">Apply</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-auto text-center order-3 order-lg-2">
                                    <div class="results-info-wrapper"></div>
                                </div>
                                <div class="col-lg-auto order-2 order-lg-3 mb-3 mb-lg-0">
                                    <div class="pagination-wrapper"></div>
                                </div>
                            </div>
                        </div>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end: page -->
</asp:Content>
