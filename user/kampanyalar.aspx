<%@ Page Title="Kampanyalar" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="kampanyalar.aspx.cs" Inherits="GedizMakina.user.kampanyalar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section role="main" class="content-body content-body-modern mt-0">
        <div class="row row-gutter-sm mb-5">
            <%--<div class="col-lg-2-5 col-xl-1-5 mb-4 mb-lg-0">
                
            </div>--%>
            <div class="col-lg-2-5 col-xl-4-5">
                <div class="row row-gutter-sm">
                    <asp:Repeater ID="repKampanya" runat="server" DataSourceID="dsDokuman">
                        <ItemTemplate>
                            <div class="col-sm-6 col-xl-3 mb-4">
                                <div class="card card-modern card-modern-alt-padding">
                                    <div class="card-body bg-light">
                                        <div class="image-frame mb-2">
                                            <div class="image-frame-wrapper">

                                                <a href="<%# Eval("KampanyaLink") %>">
                                                    <img src="<%# Eval("ResimYolu") %>" class="img-fluid" alt="<%# Eval("KampanyaAdi") %>" /></a>
                                            </div>
                                        </div>
                                        <h4 class="text-4 line-height-2 mt-0 mb-2"><a href="<%# Eval("KampanyaLink") %>" class="ecommerce-sidebar-link text-color-dark text-color-hover-primary text-decoration-none"><%# Eval("KampanyaAdi") %></a></h4>

                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                    <asp:SqlDataSource ID="dsDokuman" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT * FROM [Kampanyalar] ORDER BY [Bitis] DESC"></asp:SqlDataSource>

                </div>

            </div>
        </div>
    </section>
</asp:Content>
