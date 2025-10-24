<%@ Page Title="Cari Ekstre" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="cari-ekstre.aspx.cs" Inherits="GedizMakina.user.cari_ekstre" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-2">
            <asp:Label ID="Label1" runat="server" Text="Başlangıç Tarihi"></asp:Label>
            <br />
            <dx:ASPxDateEdit ID="dtBaslangic" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxDateEdit>
        </div>
        <div class="col-md-2">
            <asp:Label ID="Label2" runat="server" Text="Bitiş Tarihi"></asp:Label>
            <br />
            <dx:ASPxDateEdit ID="dtBitis" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxDateEdit>
        </div>
        <div class="col-md-5"></div>

        <div class="col-md-1">
            <br />
            <asp:Button ID="btnListele" runat="server" Text="Listele" CssClass="btn btn-dark" Width="100%" OnClick="btnListele_Click" />
        </div>
        <div class="col-md-2">
            <br />
            <asp:Button ID="btnExceleAktar" runat="server" Text="Excel'e Aktar" CssClass="btn btn-dark" Width="100%" />
        </div>
    </div>
    <hr />
    <div class="table-responsive">
        <dx:ASPxGridView ID="gvCariBakiye" runat="server" Theme="MaterialCompact" Width="100%" AutoGenerateColumns="False" DataSourceID="dsCariBakiye" EnableTheming="True" EnableCallBacks="False" OnCustomButtonCallback="gvCariBakiye_CustomButtonCallback">
            <SettingsPager PageSize="1000">
            </SettingsPager>
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <Columns>
                <dx:GridViewDataDateColumn FieldName="Tarih" VisibleIndex="2" Caption="Tarih">
                    <PropertiesDateEdit DisplayFormatString="dd.MM.yyyy">
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Borc" ReadOnly="True" VisibleIndex="5" Caption="Borç">
                    <PropertiesTextEdit DisplayFormatString="N2">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Alacak" ReadOnly="True" VisibleIndex="6" Caption="Alacak">
                    <PropertiesTextEdit DisplayFormatString="N2">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Hareket" ReadOnly="True" VisibleIndex="4" Caption="İşlem Türü">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="VadeTarihi" ReadOnly="True" VisibleIndex="3" Caption="Vade Tarihi">
                    <PropertiesDateEdit DisplayFormatString="dd.MM.yyyy">
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="KalanBakiye" ReadOnly="True" VisibleIndex="7" Caption="Bakiye">
                    <PropertiesTextEdit DisplayFormatString="N2">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewCommandColumn VisibleIndex="0" ButtonRenderMode="Image" ButtonType="Image" Caption=" ">
                    <CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="btnSipariseGit">
                            <Image IconID="arrows_play_32x32" ToolTip="Siparişe Git">
                            </Image>
                        </dx:GridViewCommandColumnCustomButton>
                    </CustomButtons>
                </dx:GridViewCommandColumn>
                <dx:GridViewCommandColumn VisibleIndex="1" ButtonRenderMode="Image" ButtonType="Image" Caption=" ">
                    <CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="btnFatura">
                            <Image IconID="print_print_32x32">
                            </Image>
                        </dx:GridViewCommandColumnCustomButton>
                    </CustomButtons>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="SiparisId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="dsCariBakiye" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spCariBakiye" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="CariId" SessionField="sLoginId" Type="Int32" />
                <asp:ControlParameter ControlID="dtBaslangic" Name="Baslangic" PropertyName="Text" Type="DateTime" />
                <asp:ControlParameter ControlID="dtBitis" Name="Bitis" PropertyName="Text" Type="DateTime" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div class="invoice-summary">
        <div class="row justify-content-end">
            <div class="col-sm-4">
                <table class="table h6 text-dark">
                    <tbody>
                        <tr class="b-top-0">
                            <td colspan="2">TOPLAM LİMİT</td>
                            <td class="text-left" id="lblToplamBorc" runat="server">21.316,26 ₺</td>
                        </tr>
                        <tr>
                            <td colspan="2">TOPLAM BORÇ</td>
                            <td class="text-left" id="lblToplamAlacak" runat="server">21.316,00 ₺</td>
                        </tr>
                        <tr>
                            <td colspan="2">KALAN CARİ LİMİT</td>
                            <td class="text-left" style="color: red" id="lblToplamBakiye" runat="server">0,26 ₺</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</asp:Content>
