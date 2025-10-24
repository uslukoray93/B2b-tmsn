<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="success-siparis.aspx.cs" Inherits="GedizMakina.user.success_siparis" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12" style="text-align: center">
            <h1 style="font-weight: bold">SİPARİŞİNİZ ALINMIŞTIR</h1>
            <asp:Timer ID="Timer1" runat="server" Interval="18000" OnTick="Timer1_Tick"></asp:Timer>
        </div>
    </div>
</asp:Content>
