<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="duyurular.aspx.cs" Inherits="GedizMakina.user.duyurular" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">

            <table class="table table-ecommerce-simple table-borderless table-striped mb-0" style="min-width: 640px;">
                <thead>
                    <tr>
                        <th width="80%">Duyuru Başlık</th>
                        <th width="20%">Tarih</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="repSiparisler" runat="server" DataSourceID="dsDuyurular">
                        <ItemTemplate>
                            <tr>
                                <td><strong>
                                    <a href="<%# Eval("DuyuruLink") %>"><%# Eval("DuyuruBaslik") %></a></strong></td>
                                <td><%# Eval("Tarih") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>

                    <asp:SqlDataSource ID="dsDuyurular" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT * FROM [Duyurular] ORDER BY [Tarih] DESC"></asp:SqlDataSource>

                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
