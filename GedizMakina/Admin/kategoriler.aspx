<%@ Page Title="Kategoriler" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="kategoriler.aspx.cs" Inherits="GedizMakina.Admin.kategoriler" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-5">
            <div class="row" style="background-color: #434A54; padding-right: 10px; padding-left: 10px">
                <div class="col-md-12">
                    <dx:ASPxLabel ID="lblKategoriAdi" runat="server" Font-Bold="True" ForeColor="White" Theme="Moderno">
                    </dx:ASPxLabel>
                </div>
            </div>
            <br />
            <div class="row" style="padding-right: 10px; padding-left: 10px">
                <div class="col-md-12">
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Bold="True" ForeColor="#434A54" Text="Ana Kategori Ekle" Theme="Moderno">
                    </dx:ASPxLabel>
                </div>
            </div>
            <br />
            <div class="row" style="padding-right: 10px; padding-left: 10px">
                <div class="col-md-12">
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Font-Bold="True" ForeColor="#434A54" Text="Başlık" Theme="Moderno">
                    </dx:ASPxLabel>
                </div>
            </div>
            <br />
            <div class="row" style="padding-right: 10px; padding-left: 10px">
                <div class="col-md-12">
                    <dx:ASPxTextBox ID="txtKategoriAdi" runat="server" Theme="Moderno" Width="100%">
                    </dx:ASPxTextBox>
                </div>
            </div>
            <br />
            <%--<div class="row" style="padding-right: 10px; padding-left: 10px">
                <div class="col-md-12">
                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Font-Bold="True" ForeColor="#434A54" Text="Kalıcı Bağlantı" Theme="Moderno">
                    </dx:ASPxLabel>
                </div>
            </div>
            <br />--%>            <%--<div class="row" style="padding-right: 10px; padding-left: 10px">
                <div class="col-md-6">
                    <dx:ASPxTextBox ID="ASPxTextBox2" runat="server" Theme="Moderno" Width="100%" Enabled="False" Font-Bold="True" Text="http://b2b.demirtasbilgi.online/">
                        <DisabledStyle BackColor="#CCCCCC" Font-Bold="True">
                        </DisabledStyle>
                    </dx:ASPxTextBox>
                </div>
                <div class="col-md-6">
                    <dx:ASPxTextBox ID="ASPxTextBox3" runat="server" Theme="Moderno" Width="100%">
                    </dx:ASPxTextBox>
                </div>
            </div>
            <br />--%>
            <div class="row">
                <div class="col-md-2">
                    <dx:ASPxButton ID="btnKaydet" runat="server" AutoPostBack="False" Text="Kaydet" Theme="Moderno" OnClick="btnKaydet_Click">
                    </dx:ASPxButton>
                </div>
                <div class="col-md-10">
                    <dx:ASPxLabel ID="lblUyari" runat="server" Theme="Moderno">
                    </dx:ASPxLabel>
                </div>
            </div>
        </div>
        <div class="col-md-7">
            <div class="row">
                <div class="col-md-1">
                    <dx:ASPxButton ID="btnGeri" runat="server" AutoPostBack="False" Enabled="False" OnClick="btnGeri_Click" RenderMode="Link" Theme="Moderno" VerticalAlign="Middle" Width="16px">
                        <Image IconID="arrows_prev_16x16gray">
                        </Image>
                    </dx:ASPxButton>
                </div>
                <div class="col-md-11">
                    <dx:ASPxLabel ID="lblKategori" runat="server" Font-Bold="True" Theme="Moderno">
                    </dx:ASPxLabel>
                    <dx:ASPxLabel ID="lblUstKategoriId" runat="server" Theme="Moderno" Visible="False" Text="2">
                    </dx:ASPxLabel>
                    <dx:ASPxLabel ID="lblUstKategoriIdYeni" runat="server" Theme="Moderno" Visible="False" Text="999">
                    </dx:ASPxLabel>
                </div>
            </div>
            <br />
            <div class="row" style="background-color: transparent">
                <div class="col-md-12">
                    <dx:ASPxGridView ID="gvKategori" runat="server" AutoGenerateColumns="False" DataSourceID="dsAnaKategori" EnableCallBacks="False" EnableTheming="True" KeyFieldName="KategoriId" OnCustomButtonCallback="gvKategori_CustomButtonCallback" Theme="Moderno" Width="100%">
                        <SettingsPager PageSize="100">
                        </SettingsPager>
                        <Settings ShowTitlePanel="True" />
                        <SettingsBehavior AllowSort="False" />

                        <SettingsPopup>
                            <FilterControl AutoUpdatePosition="False"></FilterControl>
                        </SettingsPopup>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="KategoriId" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="UstKategoriId" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Kategori Adı" FieldName="KategoriAdi" ShowInCustomizationForm="True" VisibleIndex="4" Width="55%">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="S.N." FieldName="SN" ShowInCustomizationForm="True" VisibleIndex="3" Width="5%">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="KategoriPath" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="KategoriIcon" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="İçerik Sayısı" FieldName="IcerikSayi" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="8" Width="10%">
                                <HeaderStyle Wrap="True" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewCommandColumn ButtonRenderMode="Button" ButtonType="Button" Caption="Alt Kategoriler" ShowInCustomizationForm="True" VisibleIndex="7" Width="30%">
                                <CustomButtons>
                                    <dx:GridViewCommandColumnCustomButton ID="btnAltKategori" Text="Alt Kategoriler">
                                        <Image IconID="arrows_next_16x16office2013">
                                        </Image>
                                    </dx:GridViewCommandColumnCustomButton>
                                </CustomButtons>
                            </dx:GridViewCommandColumn>
                            <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" Caption=" " VisibleIndex="2">
                                <CustomButtons>
                                    <dx:GridViewCommandColumnCustomButton ID="btnDuzenle">
                                        <Image IconID="actions_show_16x16">
                                        </Image>
                                    </dx:GridViewCommandColumnCustomButton>
                                    <dx:GridViewCommandColumnCustomButton ID="btnSil">
                                        <Image IconID="actions_cancel_16x16">
                                        </Image>
                                    </dx:GridViewCommandColumnCustomButton>
                                </CustomButtons>
                            </dx:GridViewCommandColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="dsAnaKategori" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spKategoriler" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsAltKategori" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spAltKategori" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblUstKategoriIdYeni" Name="UstKategoriId" PropertyName="Text" Type="Int32" DefaultValue="1000000000" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
