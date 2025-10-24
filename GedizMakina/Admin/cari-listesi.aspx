<%@ Page Title="Cari Listesi" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="cari-listesi.aspx.cs" Inherits="GedizMakina.Admin.cari_listesi" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="table-responsive">
                <dx:ASPxGridView ID="gvCariListesi" runat="server" Theme="MaterialCompact" Width="100%" AutoGenerateColumns="False" DataSourceID="dsCariListesi" KeyFieldName="CariId" EnableCallBacks="False" OnCustomButtonCallback="gvCariListesi_CustomButtonCallback">
                    <SettingsPager PageSize="50">
                    </SettingsPager>
                    <Settings ShowGroupPanel="True" />
                    <SettingsPopup>
                        <FilterControl AutoUpdatePosition="False"></FilterControl>
                    </SettingsPopup>
                    <SettingsSearchPanel Visible="True" />
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="CariId" ReadOnly="True" Visible="False" VisibleIndex="1">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Cari Kodu" FieldName="CariKodu" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Cari Adı" FieldName="CariAdi" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Yetkili" FieldName="Yetkili" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Adres1" Visible="False" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Adres2" Visible="False" VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Telefon" Visible="False" VisibleIndex="7">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="VergiNo" Visible="False" VisibleIndex="8">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="VergiDairesi" Visible="False" VisibleIndex="9">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Eposta" Visible="False" VisibleIndex="10">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Görevi" FieldName="Gorev" VisibleIndex="11">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Şehir" FieldName="Sehir" VisibleIndex="12">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="İlçe" FieldName="Ilce" VisibleIndex="13">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Parola" Visible="False" VisibleIndex="14">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="KayitTarihi" Visible="False" VisibleIndex="15">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="SorumluId" Visible="False" VisibleIndex="16">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="YetkiId" Visible="False" VisibleIndex="17">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" Caption=" " VisibleIndex="0">
                            <CustomButtons>
                                <dx:GridViewCommandColumnCustomButton ID="btnGit">
                                    <Image IconID="actions_show_16x16" ToolTip="Kayda Git">
                                    </Image>
                                </dx:GridViewCommandColumnCustomButton>
                            </CustomButtons>
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn Caption="İskonto" FieldName="IskontoOran" VisibleIndex="18">
                            <PropertiesTextEdit DisplayFormatString="N2">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Limit" FieldName="Limit" VisibleIndex="19">
                            <PropertiesTextEdit DisplayFormatString="N2">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="dsCariListesi" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spAdminCariListesi" SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
