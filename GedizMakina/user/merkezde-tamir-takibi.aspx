<%@ Page Title="Merkezde Tamir Takibi" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="merkezde-tamir-takibi.aspx.cs" Inherits="GedizMakina.user.merkezde_tamir_takibi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="table-responsive">
        <table class="table table-responsive-md invoice-items">
            <thead>
                <tr class="text-dark">
                    <th class="font-weight-semibold">Tarih</th>
                    <th class="font-weight-semibold">Fatura No</th>
                    <th class="font-weight-semibold">Fatura Tarihi</th>
                    <th class="text-center font-weight-semibold">Ürün Kodu</th>
                    <th class="text-center font-weight-semibold">Ürün Adı</th>
                    <th class="text-center font-weight-semibold">Miktar</th>
                    <th class="text-center font-weight-semibold">Fiyat</th>
                    <th class="text-center font-weight-semibold">Durumu</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>552879******6181	</td>
                    <td class="font-weight-semibold text-dark">Halil Koç</td>
                    <td>HALK BANKASI</td>
                    <td class="text-center">19.03.2024</td>
                    <td class="text-center">6.316,00 ₺</td>
                    <td class="text-center">5</td>
                    <td class="text-center">İşlem Başarılı</td>
                    <td class="text-center">624801</td>
                </tr>
                <tr>
                    <td>654321</td>
                    <td class="font-weight-semibold text-dark">Tiguan</td>
                    <td>Volkswagen</td>
                    <td class="text-center">1</td>
                    <td class="text-center">$17.00</td>
                    <td class="text-center">$17.00</td>
                    <td class="text-center">$17.00</td>
                    <td class="text-center">$17.00</td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>
