<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="mt-listesi.aspx.cs" Inherits="GedizMakina.Admin.mt_listesi" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-1">
            <dx:ASPxButton ID="btnYeniEkle" runat="server" Text="YENİ EKLE" Theme="MaterialCompact" Width="100%" OnClick="btnYeniEkle_Click"></dx:ASPxButton>
        </div>
        <div class="col-md-11"></div>
    </div>
    <hr />
    <div class="row">
        <div class="col-md-12">
            <div class="table-responsive">
                <dx:ASPxGridView ID="gvMtListesi" runat="server" Theme="MaterialCompact" Width="100%" AutoGenerateColumns="False" DataSourceID="dsMtListesi" KeyFieldName="CariId" EnableCallBacks="False" OnCustomButtonCallback="gvMtListesi_CustomButtonCallback">
                    <SettingsPager PageSize="50">
                    </SettingsPager>
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="CariId" ReadOnly="True" Visible="False" VisibleIndex="1">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Kullanıcı Adı" FieldName="CariKodu" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="İsim Soyisim" FieldName="CariAdi" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn Caption="Kayıt Tarihi" FieldName="KayitTarihi" ReadOnly="True" VisibleIndex="4">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" Caption=" " VisibleIndex="0">
                            <CustomButtons>
                                <dx:GridViewCommandColumnCustomButton ID="btnGit">
                                    <Image IconID="actions_show_16x16" ToolTip="Kayda Git">
                                    </Image>
                                </dx:GridViewCommandColumnCustomButton>
                                <dx:GridViewCommandColumnCustomButton ID="btnSil">
                                    <Image IconID="actions_trash_16x16" ToolTip="Kaydı Sil">
                                    </Image>
                                </dx:GridViewCommandColumnCustomButton>
                            </CustomButtons>
                        </dx:GridViewCommandColumn>
                    </Columns>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="dsMtListesi" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="Select CariId, CariKodu, CariAdi, convert(date, KayitTarihi, 104) KayitTarihi From Cariler Where YetkiId = 1000000001 Order By 4 DESC"></asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
