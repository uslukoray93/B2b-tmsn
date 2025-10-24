<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="GedizMakina.user.dashboard" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="/vendor/owl.carousel/assets/owl.carousel.css" />
    <link rel="stylesheet" href="/vendor/owl.carousel/assets/owl.theme.default.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="card">
        <div class="row">
            <div class="col-md-6">
                <div class="card-body">
                    <div class="owl-carousel owl-theme" data-plugin-carousel data-plugin-options='{ "dots": true, "autoplay": true, "autoplayTimeout": 5000, "loop": true, "margin": 10, "nav": false, "items": 1 }'>
                        <div class="item">
                            <img class="img-thumbnail" src="/img/projects/1.jpg" alt="">
                        </div>
                        <div class="item">
                            <img class="img-thumbnail" src="/img/projects/2.jpg" alt="">
                        </div>
                        <div class="item">
                            <img class="img-thumbnail" src="/img/projects/3.jpg" alt="">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <section class="card mb-3">
                    <header class="card-header">

                        <h2 class="card-title">

                            <span class="va-middle">Duyurular</span>
                        </h2>
                    </header>
                    <div class="card-body">
                        <div class="content">
                            <ul class="simple-user-list">
                                <asp:Repeater ID="repDuyurular" runat="server" DataSourceID="dsDuyurular">
                                    <ItemTemplate>
                                        <li>
                                            <span class="title"><a href="<%# Eval("DuyuruLink") %>"><%# Eval("DuyuruBaslik") %></a></span>
                                            <span class="message truncate"><%# Eval("Tarih", "{0:dd.MM.yyyy HH:mm}") %></span>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:SqlDataSource ID="dsDuyurular" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="Select TOP(4) * From Duyurular Order By Tarih DESC"></asp:SqlDataSource>
                            </ul>
                            <hr class="dotted short">
                            <div class="text-end">
                                <a class="text-uppercase text-muted" href="/duyurular">Tümünü Gör</a>
                            </div>
                        </div>
                    </div>

                </section>
            </div>
        </div>

    </section>

    <section class="card">
        <div class="row">
            <div class="col-md-12">
                <div class="tabs">
                    <ul class="nav nav-tabs nav-justified">
                        <li class="nav-item active">
                            <a class="nav-link" data-bs-target="#popular10" href="#popular10" data-bs-toggle="tab" class="text-center">Kampanyalar</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-target="#recent10" href="#recent10" data-bs-toggle="tab" class="text-center">Yeni Ürünler</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div id="popular10" class="tab-pane active">
                            <p>Kampanyalar</p>
                            <div class="row row-gutter-sm">
                                <asp:Repeater ID="repKampanya" runat="server" DataSourceID="dsUL03Dash">
                                    <ItemTemplate>
                                        <div class="col-sm-6 col-xl-2 mb-4">
                                            <div class="card card-modern card-modern-alt-padding">
                                                <div class="card-body bg-light">
                                                    <div class="image-frame mb-2">
                                                        <div class="image-frame-wrapper">
                                                            <div class="image-frame-badges-wrapper">
                                                                <span class="badge badge-ecommerce badge-danger"></span>
                                                            </div>
                                                            <a href="<%# Eval("UrunLink") %>">
                                                                <img src="<%# Eval("ResimYolu") %>" class="img-fluid" alt="Product Short Name" /></a>
                                                        </div>
                                                    </div>
                                                    <small><a href="<%# Eval("UrunMarkaLink") %>" class="ecommerce-sidebar-link text-color-grey text-color-hover-primary text-decoration-none"><%# Eval("UrunMarka") %></a></small>
                                                    <h4 class="text-4 line-height-2 mt-0 mb-2"><a href="<%# Eval("UrunLink") %>" class="ecommerce-sidebar-link text-color-dark text-color-hover-primary text-decoration-none"><%# Eval("STA") %></a></h4>
                                                    <div class="product-price">
                                                        <%--<div class="regular-price on-sale"><%# Eval("SAT1_1") %></div>--%>
                                                        <div class="sale-price"><%#String.Format("{0:N2}", Eval("SAT1_1")) %> ₺</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <asp:SqlDataSource ID="dsUL03Dash" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spUL03Dash" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </div>
                        <div id="recent10" class="tab-pane">
                            <p>Yeni Ürünler</p>
                            <div class="row row-gutter-sm">
                                <asp:Repeater ID="repYeniUrunler" runat="server" DataSourceID="dsUL04Dash">
                                    <ItemTemplate>
                                        <div class="col-sm-6 col-xl-2 mb-4">
                                            <div class="card card-modern card-modern-alt-padding">
                                                <div class="card-body bg-light">
                                                    <div class="image-frame mb-2">
                                                        <div class="image-frame-wrapper">
                                                            <div class="image-frame-badges-wrapper">
                                                                <span class="badge badge-ecommerce badge-danger"></span>
                                                            </div>
                                                            <a href="<%# Eval("UrunLink") %>">
                                                                <img src="<%# Eval("ResimYolu") %>" class="img-fluid" alt="Product Short Name" /></a>
                                                        </div>
                                                    </div>
                                                    <small><a href="<%# Eval("UrunMarkaLink") %>" class="ecommerce-sidebar-link text-color-grey text-color-hover-primary text-decoration-none"><%# Eval("UrunMarka") %></a></small>
                                                    <h4 class="text-4 line-height-2 mt-0 mb-2"><a href="<%# Eval("UrunLink") %>" class="ecommerce-sidebar-link text-color-dark text-color-hover-primary text-decoration-none"><%# Eval("STA") %></a></h4>
                                                    <div class="product-price">
                                                        <%--<div class="regular-price on-sale"><%# Eval("SAT1_1") %></div>--%>
                                                        <div class="sale-price"><%#String.Format("{0:N2}", Eval("SAT1_1")) %> ₺</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                            <asp:SqlDataSource ID="dsUL04Dash" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spUL04Dash" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <div class="row">
        <div class="col-md-12">
            <header class="card-header">
                <h2 class="card-title">Markalar</h2>
            </header>
            <div class="owl-carousel owl-theme" data-plugin-carousel data-plugin-options='{ "dots": true, "autoplay": true, "autoplayTimeout": 3000, "loop": true, "margin": 10, "nav": false, "responsive": {"0":{"items":1 }, "600":{"items":3 }, "1000":{"items":6 } }  }'>
                <asp:Repeater ID="repMarkalar" runat="server" DataSourceID="dsMarkalar">
                    <ItemTemplate>
                        <div class="item">
                            <a href="<%# Eval("MarkaPath") %>">
                                <img class="img-thumbnail" src="<%# Eval("MarkaLogo") %>" alt="<%# Eval("MarkaAdi") %>"></a>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="dsMarkalar" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT [MarkaAdi], [MarkaPath], [MarkaLogo] FROM [Markalar] WHERE ([MarkaId] &lt;&gt; @MarkaId)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1000000007" Name="MarkaId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>

    <dx:ASPxPopupControl ID="poBorcUyari" runat="server" CloseAction="None" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Theme="MaterialCompact" Width="400px" HeaderText="BORÇ BİLDİRİMİ">
        <SettingsAdaptivity Mode="OnWindowInnerWidth" />
        <HeaderImage IconID="status_warning_32x32">
        </HeaderImage>
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <div class="row">
                    <div class="col-md-12">
                        <dx:ASPxLabel ID="lblBorcUyari" runat="server" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                    </div>
                </div>
                <hr />
                <div class="row">
                    <div class="col-md-6">
                        <dx:ASPxButton ID="btnOdemeyeGit" runat="server" Text="ÖDEME YAP" Theme="MaterialCompact" Width="100%" OnClick="btnOdemeyeGit_Click"></dx:ASPxButton>
                    </div>
                    <div class="col-md-6">
                        <dx:ASPxButton ID="btnBilgimVar" runat="server" Text="BİLGİM VAR" Theme="MaterialCompact" Width="100%" OnClick="btnBilgimVar_Click"></dx:ASPxButton>
                    </div>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
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
