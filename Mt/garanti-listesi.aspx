<%@ Page Title="Garanti Listesi" Language="C#" MasterPageFile="~/Mt/mt.Master" AutoEventWireup="true" CodeBehind="garanti-listesi.aspx.cs" Inherits="GedizMakina.Mt.garanti_listesi" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-1">
            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Durum" Width="100%" Theme="MaterialCompact"></dx:ASPxLabel>
        </div>
        <div class="col-md-3">
            <dx:ASPxComboBox ID="ddDurum" runat="server" Theme="MaterialCompact" Width="100%" AutoPostBack="True" DataSourceID="dsDurumlar" SelectedIndex="0" TextField="DurumAdi" ValueField="DurumId"></dx:ASPxComboBox>
            <asp:SqlDataSource ID="dsDurumlar" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT * FROM [Durumlar] WHERE ([Kullanim] = @Kullanim) ORDER BY [DurumId]">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Garanti" Name="Kullanim" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="col-md-8"></div>
    </div>
    <hr />
    <div class="row">
        <div class="col-md-12">
            <div class="table-responsive">
                <dx:ASPxGridView ID="gvGarantiListesi" runat="server" Theme="MaterialCompact" Width="100%" AutoGenerateColumns="False" DataSourceID="dsGarantiTalepleri" KeyFieldName="TalepId" EnableCallBacks="False" OnCustomButtonCallback="gvGarantiListesi_CustomButtonCallback">
                    <SettingsPopup>
                        <FilterControl AutoUpdatePosition="False"></FilterControl>
                    </SettingsPopup>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="TalepId" ReadOnly="True" Visible="False" VisibleIndex="2">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="TalepTipi" ReadOnly="True" Visible="False" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="SiparisDetayId" Visible="False" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="UrunId" Visible="False" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Ürün Kodu" FieldName="UrunKodu" VisibleIndex="8">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Ürün Adı" FieldName="UrunAdi" VisibleIndex="9">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Seri No" FieldName="SeriNo" VisibleIndex="10">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Aciklama" Visible="False" VisibleIndex="11">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Fatura No" FieldName="FaturaNo" VisibleIndex="7">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Mamul Sahibi" FieldName="MamulSahibi" VisibleIndex="12">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="MamulSahibiTelefon" Visible="False" VisibleIndex="13">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn Caption="Talep Tarihi" FieldName="TalepTarihi" VisibleIndex="1">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="DurumId" Visible="False" VisibleIndex="14">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Durum" FieldName="Durum" ReadOnly="True" VisibleIndex="15">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="FaturaResim" Visible="False" VisibleIndex="16">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="UrunResim" Visible="False" VisibleIndex="17">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="UrunVideo" Visible="False" VisibleIndex="18">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="GarantiBelgesiYolu" Visible="False" VisibleIndex="19">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" Caption=" " VisibleIndex="20">
                            <CustomButtons>
                                <dx:GridViewCommandColumnCustomButton ID="btnFatura">
                                    <Image IconID="businessobjects_bofileattachment_16x16" ToolTip="Fatura">
                                    </Image>
                                </dx:GridViewCommandColumnCustomButton>
                                <dx:GridViewCommandColumnCustomButton ID="btnResim">
                                    <Image IconID="content_image_16x16" ToolTip="Ürün Resim">
                                    </Image>
                                </dx:GridViewCommandColumnCustomButton>
                                <dx:GridViewCommandColumnCustomButton ID="btnVideo">
                                    <Image IconID="miscellaneous_video_16x16" ToolTip="Ürün Video">
                                    </Image>
                                </dx:GridViewCommandColumnCustomButton>
                            </CustomButtons>
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn FieldName="CariAdi" VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" Caption=" " VisibleIndex="0">
                            <CustomButtons>
                                <dx:GridViewCommandColumnCustomButton ID="btnGit">
                                    <Image IconID="actions_show_16x16" ToolTip="Kayda Git">
                                    </Image>
                                </dx:GridViewCommandColumnCustomButton>
                            </CustomButtons>
                        </dx:GridViewCommandColumn>
                    </Columns>
                </dx:ASPxGridView>
                <asp:SqlDataSource ID="dsGarantiTalepleri" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spGarantiTalepleri" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddDurum" Name="DurumId" PropertyName="Value" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
