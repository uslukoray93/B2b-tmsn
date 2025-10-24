<%@ Page Title="Ürün Listesi" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="product-list.aspx.cs" Inherits="GedizMakina.user.product_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section role="main" class="content-body content-body-modern mt-0">
        <header class="page-header page-header-left-inline-breadcrumb">
            <h2 class="font-weight-bold text-6">Products</h2>
            <div class="right-wrapper">
                <ol class="breadcrumbs">
                    <li><span>Home</span></li>

                    <li><span>eCommerce</span></li>

                    <li><span>Products</span></li>
                </ol>
            </div>
        </header>
        <!-- start: page -->
        <div class="ecommerce-form-sidebar-overlay-wrapper">
            <div class="ecommerce-form-sidebar-overlay-body">
                <a href="#" class="ecommerce-form-sidebar-overlay-close"><i class="bx bx-x"></i></a>
                <div class="scrollable h-100 loading-overlay-showing" data-plugin-scrollable>
                    <div class="loading-overlay">
                        <div class="bounce-loader">
                            <div class="bounce1"></div>
                            <div class="bounce2"></div>
                            <div class="bounce3"></div>
                        </div>
                    </div>
                    <div class="ecommerce-form-sidebar-overlay-content scrollable-content px-3 pb-3 pt-1"></div>
                </div>
            </div>
        </div>
        <div class="row justify-content-center justify-content-sm-between pt-2">

            <div class="col-sm-auto">
                <div class="search search-style-1 search-style-1-light mx-auto">
                    <div class="input-group">
                        <input type="text" class="form-control" name="product-term" id="product-term" placeholder="Search Product">
                        <button class="btn btn-default" type="submit"><i class="bx bx-search"></i></button>
                    </div>
                </div>
            </div>
        </div>
        <div class="row row-gutter-sm mb-5">
            <div class="col-lg-2-5 col-xl-1-5 mb-4 mb-lg-0">
                <div class="filters-sidebar-wrapper bg-light rounded">
                    <div class="card card-modern">
                        <div class="card-header">
                            <div class="card-actions">
                                <a href="#" class="card-action" data-card-toggle></a>
                            </div>
                            <h4 class="card-title">ÜRÜN TÜRÜ</h4>
                        </div>
                        <div class="card-body">
                            <ul class="list list-unstyled mb-0">
                                <li><a href="#">Smart TVs</a></li>
                                <li><a href="#">Cameras</a></li>
                                <li><a href="#">Headphones</a></li>
                                <li><a href="#">Games</a></li>
                            </ul>
                        </div>
                    </div>
                    <hr class="solid opacity-7">


                    <div class="card card-modern">
                        <div class="card-header">
                            <div class="card-actions">
                                <a href="#" class="card-action" data-card-toggle></a>
                            </div>
                            <h4 class="card-title">MARKA</h4>
                        </div>
                        <div class="card-body">
                            <ul class="list list-unstyled mb-0">
                                <li><a href="#">Adidas <span class="float-end">18</span></a></li>
                                <li><a href="#">Camel <span class="float-end">22</span></a></li>
                                <li><a href="#">Samsung Galaxy <span class="float-end">05</span></a></li>
                                <li><a href="#">Seiko <span class="float-end">68</span></a></li>
                                <li><a href="#">Sony <span class="float-end">03</span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3-5 col-xl-4-5">
                <div class="row row-gutter-sm">
                    <asp:Repeater ID="repUrunler" runat="server" DataSourceID="dsUrunGetir">
                        <ItemTemplate>
                            <div class="col-sm-6 col-xl-3 mb-4">
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
                                        <%--<div class="stars-wrapper">
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                            <i class="fas fa-star"></i>
                                        </div>--%>
                                        <div class="product-price">
                                            <%--<div class="regular-price on-sale"><%# Eval("SAT1_1") %></div>--%>
                                            <div class="sale-price"><%#String.Format("{0:N2}", Eval("SAT1_1")) %> ₺</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="dsUrunGetir" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spKategoriUrunTest" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="KategoriId" SessionField="sKategoriId" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="row row-gutter-sm justify-content-between">
                    <div class="col-lg-auto order-2 order-lg-1">
                        <p class="text-center text-lg-left mb-0">Showing 1-8 of 60 results</p>
                    </div>
                    <div class="col-lg-auto order-1 order-lg-2 mb-3 mb-lg-0">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination pagination-modern pagination-modern-spacing justify-content-center justify-content-lg-start mb-0">
                                <li class="page-item">
                                    <a class="page-link prev" href="#" aria-label="Previous">
                                        <span><i class="fas fa-chevron-left" aria-label="Previous"></i></span>
                                    </a>
                                </li>
                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#" disabled="true">...</a></li>
                                <li class="page-item"><a class="page-link" href="#">15</a></li>
                                <li class="page-item">
                                    <a class="page-link next" href="#" aria-label="Next">
                                        <span><i class="fas fa-chevron-right" aria-label="Next"></i></span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- end: page -->
    </section>
</asp:Content>
