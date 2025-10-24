<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="duyuru-detay.aspx.cs" Inherits="GedizMakina.user.duyuru_detay" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12" style="text-align: center">
            <h1 id="lblBaslik" runat="server"></h1>
        </div>
    </div>
    <hr />
    <div class="row">
        <div class="col-md-12">
            <asp:Literal ID="lblAciklama" runat="server"></asp:Literal>
        </div>
    </div>
</asp:Content>
