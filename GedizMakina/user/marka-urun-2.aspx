<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="marka-urun-2.aspx.cs" Inherits="GedizMakina.user.marka_urun_2" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section role="main" class="content-body content-body-modern mt-0">
        <div class="row">
            <div class="col-md-12">
                <div class="search nav-form">
                    <div class="input-group">
                        <input type="text" class="form-control" name="q" id="txtSearch" runat="server" placeholder="Ne aramıştınız?">
                        <button class="btn btn-default" type="button" id="btnSearch" runat="server" onserverclick="btnSearch_ServerClick"><i class="bx bx-search"></i></button>
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
                            <h4 class="card-title">KATEGORİ</h4>
                        </div>
                        <div class="card-body">
                            <asp:DropDownList ID="ddKategori" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="dsAnaKategori" DataTextField="KategoriAdi" DataValueField="KategoriPath" OnSelectedIndexChanged="ddKategori_SelectedIndexChanged"></asp:DropDownList>
                            <asp:SqlDataSource ID="dsAnaKategori" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT [KategoriId], [KategoriAdi], KategoriPath FROM [Kategoriler] WHERE ([UstKategoriId] IS NULL) ORDER BY [SiraNo]"></asp:SqlDataSource>
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
                            <asp:DropDownList ID="ddMarka" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="dsMarkalar" DataTextField="MarkaAdi" DataValueField="MarkaId"></asp:DropDownList>
                            <asp:SqlDataSource ID="dsMarkalar" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT [MarkaId], [MarkaAdi] FROM [Markalar] ORDER BY [SN]"></asp:SqlDataSource>
                            <%--<ul class="list list-unstyled mb-0">
                                <li><a href="#">Adidas <span class="float-end">18</span></a></li>
                                <li><a href="#">Camel <span class="float-end">22</span></a></li>
                                <li><a href="#">Samsung Galaxy <span class="float-end">05</span></a></li>
                                <li><a href="#">Seiko <span class="float-end">68</span></a></li>
                                <li><a href="#">Sony <span class="float-end">03</span></a></li>
                            </ul>--%>
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
                                        <div class="product-price">
                                            <%--<div class="regular-price on-sale"><%# Eval("SAT1_1") %></div>--%>
                                            <div class="sale-price"><%#String.Format("{0:N2}", Eval("SAT1_1")) %> ₺</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="dsUrunGetir" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spMarkaUrunListesi" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="First" SessionField="sFirst" Type="Int32" />
                            <asp:SessionParameter Name="Last" SessionField="sLast" Type="Int32" />
                            <asp:SessionParameter Name="MarkaId" SessionField="sMarkaId" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="row row-gutter-sm justify-content-between">

                    <div class="col-lg-auto order-1 order-lg-2 mb-3 mb-lg-0">
                        <dx:ASPxPager ID="ASPxPager1" runat="server" ItemCount="100" ItemsPerPage="1" Theme="MaterialCompact" OnPageIndexChanged="ASPxPager1_PageIndexChanged" SeoFriendly="Enabled"></dx:ASPxPager>
                        <dx:ASPxLabel ID="lblSayfaNo" runat="server" Text="ASPxLabel" Visible="false"></dx:ASPxLabel>
                    </div>
                </div>
            </div>
        </div>
        <!-- end: page -->
    </section>
</asp:Content>

