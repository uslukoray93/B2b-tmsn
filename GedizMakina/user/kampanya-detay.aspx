<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="kampanya-detay.aspx.cs" Inherits="GedizMakina.user.kampanya_detay" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section role="main" class="content-body content-body-modern mt-0">
        <div class="row row-gutter-sm">
            <%--<div class="col-lg-2-5 col-xl-1-5 mb-4 mb-lg-0">
                
            </div>--%>
            <div class="row row-gutter-sm">
                <asp:Repeater ID="repUrunler" runat="server" DataSourceID="dsUrunGetir">
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
                                        <div class="sale-price"><%#String.Format("{0:N2}", Eval("Fiyat")) %> ₺</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:SqlDataSource ID="dsUrunGetir" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spKampanyaliUrunler" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="First" SessionField="sFirst" Type="Int32" />
                        <asp:SessionParameter Name="Last" SessionField="sLast" Type="Int32" />
                        <asp:SessionParameter Name="KampanyaId" SessionField="sKampanyaId" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            <div class="row row-gutter-sm justify-content-between">

                <div class="col-lg-auto order-1 order-lg-2 mb-3 mb-lg-0">
                    <dx:ASPxPager ID="ASPxPager1" runat="server" ItemCount="100" ItemsPerPage="1" Theme="MaterialCompact" OnPageIndexChanged="ASPxPager1_PageIndexChanged" SeoFriendly="Disabled"></dx:ASPxPager>
                    <dx:ASPxLabel ID="lblSayfaNo" runat="server" Text="ASPxLabel" Visible="false"></dx:ASPxLabel>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
