<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="yeni-urunler-1.aspx.cs" Inherits="GedizMakina.user.yeni_urunler_1" %>

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
        <div class="row row-gutter-sm mb-5">
            <div class="col-lg-2-5 col-xl-1-5 mb-4 mb-lg-0">
                <div class="filters-sidebar-wrapper bg-light rounded">

                    <div class="card card-modern">
                        <div class="card-header">
                            <div class="card-actions">
                                <a href="#" class="card-action" data-card-toggle></a>
                            </div>
                            <h4 class="card-title">MARKA</h4>
                        </div>
                        <div class="card-body">
                            <asp:DropDownList ID="ddMarka" runat="server" CssClass="form-control" DataSourceID="dsMarkalar" DataTextField="MarkaAdi" DataValueField="MarkaId"></asp:DropDownList>
                            <asp:SqlDataSource ID="dsMarkalar" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT * FROM [Markalar] ORDER BY [SN]"></asp:SqlDataSource>
                        </div>
                    </div>

                    <div class="card card-modern">
                        <div class="card-header">
                            <div class="card-actions">
                                <a href="#" class="card-action" data-card-toggle></a>
                            </div>
                            <h4 class="card-title">KATEGORİ</h4>
                        </div>
                        <div class="card-body">
                            <asp:DropDownList ID="ddKategori" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="dsAnaKategori" DataTextField="KategoriAdi" DataValueField="KategoriId"></asp:DropDownList>
                            <asp:SqlDataSource ID="dsAnaKategori" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT * FROM [Kategoriler] WHERE ([UstKategoriId] IS NULL) ORDER BY [SiraNo]"></asp:SqlDataSource>
                        </div>
                    </div>

                    <div class="card card-modern">
                        <div class="card-header">
                            <div class="card-actions">
                                <a href="#" class="card-action" data-card-toggle></a>
                            </div>
                            <h4 class="card-title">ALT KATEGORİ</h4>
                        </div>
                        <div class="card-body">
                            <asp:DropDownList ID="ddAltKategori" runat="server" CssClass="form-control" DataSourceID="dsAltKategori" DataTextField="KategoriAdi" DataValueField="KategoriId"></asp:DropDownList>
                            <asp:SqlDataSource ID="dsAltKategori" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="Select * From Kategoriler WHERE UstKategoriId = @UstKategoriId
UNION
Select * From Kategoriler Where KategoriId = 1000000075
ORDER BY [SiraNo]">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddKategori" Name="UstKategoriId" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <br />

                    <div class="row" style="padding-left: 25px">
                        <div class="col-md-12">
                            <dx:ASPxCheckBox ID="chkKampanya" runat="server" Theme="MaterialCompact" ToggleSwitchDisplayMode="Always" Text="Kampanya"></dx:ASPxCheckBox>
                            <br />
                            <dx:ASPxCheckBox ID="chkYeniUrun" runat="server" Theme="MaterialCompact" ToggleSwitchDisplayMode="Always" Text="Yeni Ürün"></dx:ASPxCheckBox>
                        </div>
                    </div>


                    <hr class="solid opacity-7">

                    <div class="row">
                        <div class="col-md-12">
                            <asp:Button ID="btnArat" runat="server" CssClass="btn btn-dark" OnClick="btnArat_Click" Text="Getir" />
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
                                                    <%--BU ALAN KAMPANYA ADININ YAZILACAĞI ALAN BAŞLANGICI--%>
                                                    <span class="badge badge-ecommerce badge-danger"></span>
                                                    <%--BU ALAN KAMPANYA ADININ YAZILACAĞI ALAN BİTİŞİ--%>
                                                </div>
                                                <a href="<%# Eval("UrunLink") %>">
                                                    <img src="<%# Eval("ResimYolu") %>" class="img-fluid" alt="Product Short Name" /></a>
                                            </div>
                                        </div>
                                        <small><a href="<%# Eval("UrunMarkaLink") %>" class="ecommerce-sidebar-link text-color-grey text-color-hover-primary text-decoration-none"><%# Eval("UrunMarka") %></a></small>
                                        <h4 class="text-4 line-height-2 mt-0 mb-2"><a href="<%# Eval("UrunLink") %>" class="ecommerce-sidebar-link text-color-dark text-color-hover-primary text-decoration-none"><%# Eval("STA") %></a></h4>
                                        <div class="product-price">
                                            <%--BU ALAN ESKİ FİYATIN BAŞLANGICI--%>
                                            <%--<div class="regular-price on-sale"><%# Eval("SAT1_1") %></div>--%>
                                            <%--BU ALAN ESKİ FİYATIN BİTİŞİ--%>
                                            <div class="sale-price">₺<%#String.Format("{0:N2}", Eval("SAT1_1")) %></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <asp:SqlDataSource ID="dsUrunGetir" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spUrunListesi" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="First" SessionField="sFirst" Type="Int32" />
                            <asp:SessionParameter Name="Last" SessionField="sLast" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsUL01" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spUL01" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="First" SessionField="sFirst" Type="Int32" />
                            <asp:SessionParameter Name="Last" SessionField="sLast" Type="Int32" />
                            <asp:ControlParameter ControlID="ddMarka" Name="MarkaId" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsUL02" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spUL02" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="First" SessionField="sFirst" Type="Int32" />
                            <asp:SessionParameter Name="Last" SessionField="sLast" Type="Int32" />
                            <asp:ControlParameter ControlID="ddKategori" Name="KategoriId" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsUL03" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spUL03" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="First" SessionField="sFirst" Type="Int32" />
                            <asp:SessionParameter Name="Last" SessionField="sLast" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsUL04" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spUL04" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="First" SessionField="sFirst" Type="Int32" />
                            <asp:SessionParameter Name="Last" SessionField="sLast" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsUL05" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spUL05" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="First" SessionField="sFirst" Type="Int32" />
                            <asp:SessionParameter Name="Last" SessionField="sLast" Type="Int32" />
                            <asp:ControlParameter ControlID="ddKategori" Name="KategoriId" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="ddMarka" Name="MarkaId" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsUL06" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spUL06" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="First" SessionField="sFirst" Type="Int32" />
                            <asp:SessionParameter Name="Last" SessionField="sLast" Type="Int32" />
                            <asp:ControlParameter ControlID="ddMarka" Name="MarkaId" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsUL07" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spUL07" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="First" SessionField="sFirst" Type="Int32" />
                            <asp:SessionParameter Name="Last" SessionField="sLast" Type="Int32" />
                            <asp:ControlParameter ControlID="ddMarka" Name="MarkaId" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsUL08" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spUL08" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="First" SessionField="sFirst" Type="Int32" />
                            <asp:SessionParameter Name="Last" SessionField="sLast" Type="Int32" />
                            <asp:ControlParameter ControlID="ddMarka" Name="MarkaId" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="ddKategori" Name="KategoriId" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsUL09" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spUL09" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="First" SessionField="sFirst" Type="Int32" />
                            <asp:SessionParameter Name="Last" SessionField="sLast" Type="Int32" />
                            <asp:ControlParameter ControlID="ddMarka" Name="MarkaId" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="ddKategori" Name="KategoriId" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsUL10" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spUL10" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="First" SessionField="sFirst" Type="Int32" />
                            <asp:SessionParameter Name="Last" SessionField="sLast" Type="Int32" />
                            <asp:ControlParameter ControlID="ddMarka" Name="MarkaId" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="ddKategori" Name="KategoriId" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsUL11" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spUL11" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="First" SessionField="sFirst" Type="Int32" />
                            <asp:SessionParameter Name="Last" SessionField="sLast" Type="Int32" />
                            <asp:ControlParameter ControlID="ddMarka" Name="MarkaId" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="ddAltKategori" Name="KategoriId" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsUL12" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spUL12" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="First" SessionField="sFirst" Type="Int32" />
                            <asp:SessionParameter Name="Last" SessionField="sLast" Type="Int32" />
                            <asp:ControlParameter ControlID="ddMarka" Name="MarkaId" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="ddAltKategori" Name="KategoriId" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsUL13" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spUL13" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="First" SessionField="sFirst" Type="Int32" />
                            <asp:SessionParameter Name="Last" SessionField="sLast" Type="Int32" />
                            <asp:ControlParameter ControlID="ddMarka" Name="MarkaId" PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="ddAltKategori" Name="KategoriId" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsUL14" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spUL14" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="First" SessionField="sFirst" Type="Int32" />
                            <asp:SessionParameter Name="Last" SessionField="sLast" Type="Int32" />
                            <asp:ControlParameter ControlID="ddAltKategori" Name="KategoriId" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsUL15" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spUL15" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="First" SessionField="sFirst" Type="Int32" />
                            <asp:SessionParameter Name="Last" SessionField="sLast" Type="Int32" />
                            <asp:ControlParameter ControlID="ddAltKategori" Name="KategoriId" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsUL16" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spUL16" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="First" SessionField="sFirst" Type="Int32" />
                            <asp:SessionParameter Name="Last" SessionField="sLast" Type="Int32" />
                            <asp:ControlParameter ControlID="ddAltKategori" Name="KategoriId" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsUL17" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spUL17" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="First" SessionField="sFirst" Type="Int32" />
                            <asp:SessionParameter Name="Last" SessionField="sLast" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="row row-gutter-sm justify-content-between">

                    <div class="col-lg-auto order-1 order-lg-2 mb-3 mb-lg-0">
                        <dx:ASPxPager ID="ASPxPager1" runat="server" ItemCount="10" Theme="MaterialCompact" OnPageIndexChanged="ASPxPager1_PageIndexChanged"></dx:ASPxPager>
                        <dx:ASPxLabel ID="lblSayfaNo" runat="server" Text="ASPxLabel" Visible="false"></dx:ASPxLabel>
                    </div>
                </div>
            </div>
        </div>
        <!-- end: page -->
    </section>
</asp:Content>
