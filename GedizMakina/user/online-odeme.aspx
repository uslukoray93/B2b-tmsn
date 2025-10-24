<%@ Page Title="Online Ödeme" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="online-odeme.aspx.cs" Inherits="GedizMakina.user.online_odeme" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-2">Ödeme Tutarı</div>
        <div class="col-md-2"><input id="txtOdemeTutariTL" runat="server" class="form-control" /></div>
        <div class="col-md-1"><input id="txtOdemeTutariKrs" runat="server" class="form-control" /></div>
        <div class="col-md-2"><button id="btnGonder" runat="server" class="btn btn-primary">Gönder</button></div>
        <div class="col-md-5"></div>
    </div>
    <hr />
    <div class="row">
        <div class="col-md-12">
            <iframe src="/kart.aspx" width="100%" height="800"></iframe>
        </div>
    </div>
</asp:Content>
