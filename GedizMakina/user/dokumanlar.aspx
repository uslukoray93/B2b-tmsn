<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="dokumanlar.aspx.cs" Inherits="GedizMakina.user.dokumanlar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section role="main" class="content-body content-body-modern mt-0">
        <div class="row row-gutter-sm">
            <%--<div class="col-lg-2-5 col-xl-1-5 mb-4 mb-lg-0">
                
            </div>--%>
            
                <div class="row row-gutter-sm">
                    <asp:Repeater ID="repDokuman" runat="server" DataSourceID="dsDokuman">
                        <ItemTemplate>
                            <div class="col-sm-6 col-xl-2 mb-4">
                                <div class="card card-modern card-modern-alt-padding">
                                    <div class="card-body bg-light">
                                        <div class="image-frame mb-2">
                                            <div class="image-frame-wrapper">

                                                <a href="<%# Eval("DosyaYolu") %>" target="_blank">
                                                    <img src="<%# Eval("DosyaResim") %>" class="img-fluid" alt="<%# Eval("DosyaAdi") %>" /></a>
                                            </div>
                                        </div>
                                        <h4 class="text-4 line-height-2 mt-0 mb-2 text-center"><a href="<%# Eval("DosyaYolu") %>" class="ecommerce-sidebar-link text-color-danger text-color-hover-primary text-decoration-none text-center" style="font-weight: bold"><%# Eval("DosyaAdi") %></a></h4>

                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                    <asp:SqlDataSource ID="dsDokuman" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT * FROM [Dosyalar] ORDER BY [Tarih] DESC"></asp:SqlDataSource>

                </div>

            </div>
    </section>
</asp:Content>
