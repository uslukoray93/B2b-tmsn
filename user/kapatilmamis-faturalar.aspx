<%@ Page Title="Kapatılmamış Faturalar" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="kapatilmamis-faturalar.aspx.cs" Inherits="GedizMakina.user.kapatilmamis_faturalar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-10"></div>
        <div class="col-md-2">
            <asp:Button ID="Button1" runat="server" Text="Excel'e Aktar" CssClass="btn btn-dark" Width="100%" /></div>
    </div>
    <hr />
    <div class="table-responsive">
        <table class="table table-responsive-md invoice-items">
            <thead>
                <tr class="text-dark">
                    <th class="font-weight-semibold">Tarih</th>
                    <th class="font-weight-semibold">Vade Tarihi</th>
                    <th class="font-weight-semibold">Evrak No</th>
                    <th class="text-center font-weight-semibold">İşlem Türü</th>
                    <th class="font-weight-semibold">Açıklama</th>
                    <th class="text-center font-weight-semibold">Borç</th>
                    <th class="text-center font-weight-semibold">Kapatılan</th>
                    <th class="text-center font-weight-semibold">Kalan</th>
                    <th class="text-center font-weight-semibold">Gün</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="font-weight-semibold text-dark">Mustang</td>
                    <td>Ford</td>
                    <td class="text-center">2</td>
                    <td class="text-center">$14.00</td>
                    <td class="text-center">$28.00</td>
                    <td class="text-center">$28.00</td>
                    <td class="text-center">$28.00</td>
                    <td class="text-center">$28.00</td>
                    <td class="text-center">$28.00</td>
                </tr>
                <tr>
                    <td class="font-weight-semibold text-dark">Tiguan</td>
                    <td>Volkswagen</td>
                    <td class="text-center">1</td>
                    <td class="text-center">$17.00</td>
                    <td class="text-center">$17.00</td>
                    <td class="text-center">$17.00</td>
                    <td class="text-center">$17.00</td>
                    <td class="text-center">$17.00</td>
                    <td class="text-center">$17.00</td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="invoice-summary">
        <div class="row justify-content-end">
            <div class="col-sm-4">
                <table class="table h6 text-dark">
                    <tbody>
                        <tr class="b-top-0">
                            <td colspan="2">ORTALAMA VADE</td>
                            <td class="text-left">01.01.2024</td>
                        </tr>
                        <tr>
                            <td colspan="2">TOPLAM BORÇ</td>
                            <td class="text-left">0,26 ₺</td>
                        </tr>
                        <tr>
                            <td colspan="2">VADESİ GEÇMİŞ BORÇ</td>
                            <td class="text-left" style="color: red">0,26 ₺</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
