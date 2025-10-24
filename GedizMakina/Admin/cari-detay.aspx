<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="cari-detay.aspx.cs" Inherits="GedizMakina.Admin.cari_detay" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" Theme="MaterialCompact" Width="100%" ActiveTabIndex="0" EnableTabScrolling="True">
                <TabPages>
                    <dx:TabPage Text="CARİ BİLGİLERİ">
                        <ContentCollection>
                            <dx:ContentControl runat="server">
                                <div class="row">
                                    <div class="col-md-11">
                                        <dx:ASPxLabel ID="lblUyariCariBilgi" runat="server" Theme="MaterialCompact"></dx:ASPxLabel>
                                    </div>
                                    <div class="col-md-1">
                                        <dx:ASPxButton ID="btnKaydetCariBilgi" runat="server" Text="KAYDET" Theme="MaterialCompact" Width="100%" OnClick="btnKaydetCariBilgi_Click"></dx:ASPxButton>
                                    </div>
                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col-md-12">
                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Cari Adı" Theme="MaterialCompact"></dx:ASPxLabel>
                                        <br />
                                        <dx:ASPxTextBox ID="txtCariAdi" runat="server" Width="100%" Theme="MaterialCompact" Enabled="false"></dx:ASPxTextBox>
                                    </div>
                                    <div class="col-md-11">
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-md-2">
                                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Cari Kodu" Theme="MaterialCompact"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtCariKodu" runat="server" Width="100%" Theme="MaterialCompact" Enabled="false"></dx:ASPxTextBox>
                                    </div>
                                    <div class="col-md-3">
                                        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Yetkili" Theme="MaterialCompact"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtYetkili" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxTextBox>
                                    </div>
                                    <div class="col-md-2">
                                        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Görevi" Theme="MaterialCompact"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtGorev" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxTextBox>
                                    </div>
                                    <div class="col-md-2">
                                        <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Telefon" Theme="MaterialCompact"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtTelefon" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxTextBox>
                                    </div>
                                    <div class="col-md-3">
                                        <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="E-posta" Theme="MaterialCompact"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtEposta" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxTextBox>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-md-6">
                                        <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Adres 1" Theme="MaterialCompact"></dx:ASPxLabel>
                                        <br />
                                        <dx:ASPxTextBox ID="txtAdres1" runat="server" Width="100%" Theme="MaterialCompact" Enabled="false"></dx:ASPxTextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Adres 2" Theme="MaterialCompact"></dx:ASPxLabel>
                                        <br />
                                        <dx:ASPxTextBox ID="txtAdres2" runat="server" Width="100%" Theme="MaterialCompact" Enabled="false"></dx:ASPxTextBox>
                                    </div>
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-md-2">
                                        <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Şehir" Theme="MaterialCompact"></dx:ASPxLabel>
                                        <br />
                                        <dx:ASPxTextBox ID="txtSehir" runat="server" Width="100%" Theme="MaterialCompact" Enabled="false"></dx:ASPxTextBox>
                                    </div>
                                    <div class="col-md-2">
                                        <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="İlçe" Theme="MaterialCompact"></dx:ASPxLabel>
                                        <br />
                                        <dx:ASPxTextBox ID="txtIlce" runat="server" Width="100%" Theme="MaterialCompact" Enabled="false"></dx:ASPxTextBox>
                                    </div>
                                    <div class="col-md-2">
                                        <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Vergi Dairesi" Theme="MaterialCompact"></dx:ASPxLabel>
                                        <br />
                                        <dx:ASPxTextBox ID="txtVergiDairesi" runat="server" Width="100%" Theme="MaterialCompact" Enabled="false"></dx:ASPxTextBox>
                                    </div>
                                    <div class="col-md-2">
                                        <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Vergi No" Theme="MaterialCompact"></dx:ASPxLabel>
                                        <br />
                                        <dx:ASPxTextBox ID="txtVergiNo" runat="server" Width="100%" Theme="MaterialCompact" Enabled="false"></dx:ASPxTextBox>
                                    </div>
                                    <div class="col-md-2">
                                        <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="İskonto Oranı" Theme="MaterialCompact"></dx:ASPxLabel>
                                        <br />
                                        <dx:ASPxTextBox ID="txtIskontoOran" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxTextBox>
                                    </div>
                                    <div class="col-md-2">
                                        <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="Limit" Theme="MaterialCompact"></dx:ASPxLabel>
                                        <br />
                                        <div class="row">
                                            <div class="col-md-2">
                                                <dx:ASPxCheckBox ID="chkLimitAc" runat="server" Theme="MaterialCompact" AutoPostBack="True" OnCheckedChanged="chkLimitAc_CheckedChanged"></dx:ASPxCheckBox>
                                            </div>
                                            <div class="col-md-10">
                                                <dx:ASPxTextBox ID="txtLimit" runat="server" Theme="MaterialCompact" Enabled="False"></dx:ASPxTextBox>
                                            </div>
                                        </div>


                                    </div>
                                </div>
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                    <dx:TabPage Text="SİPARİŞLER">
                        <ContentCollection>
                            <dx:ContentControl runat="server">
                                <div class="row">
                                    <div class="col-md-2">
                                        <dx:ASPxDateEdit ID="dtSiparisBaslangic" runat="server" Theme="MaterialCompact" Width="100%"></dx:ASPxDateEdit>
                                    </div>
                                    <div class="col-md-2">
                                        <dx:ASPxDateEdit ID="dtSiparisBitis" runat="server" Theme="MaterialCompact" Width="100%"></dx:ASPxDateEdit>
                                    </div>
                                    <div class="col-md-2">
                                        <dx:ASPxButton ID="btnSiparisGetir" runat="server" Text="GETİR" Theme="MaterialCompact" Width="100%" AutoPostBack="False" OnClick="btnSiparisGetir_Click"></dx:ASPxButton>
                                    </div>
                                    <div class="col-md-6"></div>
                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="table-responsive">
                                            <dx:ASPxGridView ID="gvSiparisler" runat="server" Theme="Moderno" Width="100%" AutoGenerateColumns="False" DataSourceID="dsSiparisler" KeyFieldName="SiparisId">
                                                <Settings ShowFilterRow="True" ShowGroupPanel="True" />
                                                <SettingsPopup>
                                                    <FilterControl AutoUpdatePosition="False"></FilterControl>
                                                </SettingsPopup>
                                                <SettingsText GroupPanel="Gruplamak istediğiniz kolonu bu alana sürükleyin" />
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="SiparisId" ReadOnly="True" Visible="False" VisibleIndex="1">
                                                        <EditFormSettings Visible="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Sipariş No" FieldName="SiparisNo" VisibleIndex="2">
                                                        <DataItemTemplate>
                                                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Text='<%# Eval("SiparisNo") %>'></asp:LinkButton>
                                                        </DataItemTemplate>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="CariId" Visible="False" VisibleIndex="3">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Toplam" FieldName="Tutar" VisibleIndex="5">
                                                        <PropertiesTextEdit DisplayFormatString="N2">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="KDV" FieldName="Kdv" VisibleIndex="6">
                                                        <PropertiesTextEdit DisplayFormatString="N2">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Genel Tutar" FieldName="GenelTutar" VisibleIndex="7">
                                                        <PropertiesTextEdit DisplayFormatString="N2">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="TeslimatTurId" Visible="False" VisibleIndex="8">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="FaturaAdresId" Visible="False" VisibleIndex="9">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="SevkiyatAdresId" Visible="False" VisibleIndex="10">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataDateColumn Caption="Sip. Tarihi" FieldName="SiparisTarihi" VisibleIndex="11">
                                                        <PropertiesDateEdit DisplayFormatString="dd.MM.yyyy HH:mm">
                                                        </PropertiesDateEdit>
                                                    </dx:GridViewDataDateColumn>
                                                    <dx:GridViewDataTextColumn FieldName="DurumId" Visible="False" VisibleIndex="12">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="OdemeTurId" Visible="False" VisibleIndex="13">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="SiparisGuidNo" Visible="False" VisibleIndex="14">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Cari Adı" FieldName="CariAdi" ReadOnly="True" VisibleIndex="4">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Sipariş Durumu" FieldName="Durum" ReadOnly="True" VisibleIndex="15">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Teslimat Türü" FieldName="TeslimatTuru" ReadOnly="True" VisibleIndex="16">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Ödeme Türü" FieldName="OdemeTuru" ReadOnly="True" VisibleIndex="17">
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:ASPxGridView>
                                            <asp:SqlDataSource ID="dsSiparisler" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spAdminSiparisListesiCari" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="CariId" SessionField="sCariId" Type="Int32" />
                                                    <asp:ControlParameter ControlID="dtSiparisBaslangic" Name="Start" PropertyName="Value" Type="DateTime" />
                                                    <asp:ControlParameter ControlID="dtSiparisBitis" Name="End" PropertyName="Value" Type="DateTime" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                    <dx:TabPage Text="GARANTİLER">
                        <ContentCollection>
                            <dx:ContentControl runat="server">
                                GARANTİLER
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                    <dx:TabPage Text="İADELER">
                        <ContentCollection>
                            <dx:ContentControl runat="server">
                                <div class="row">
                                    <div class="col-md-1">
                                        <dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="Durum" Theme="MaterialCompact"></dx:ASPxLabel>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:DropDownList ID="ddDurum" runat="server" CssClass="form-control" Width="100%" AutoPostBack="True" DataSourceID="dsDurumlar" DataTextField="DurumAdi" DataValueField="DurumId"></asp:DropDownList>
                                        <asp:SqlDataSource ID="dsDurumlar" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT [DurumId], [DurumAdi] FROM [Durumlar] WHERE ([Kullanim] = @Kullanim) ORDER BY [DurumId]">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="Iade" Name="Kullanim" Type="String" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                    <div class="col-md-8"></div>
                                </div>
                                <br />

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="table-responsive">
                                            <dx:ASPxGridView ID="gvIadeTalepleri" runat="server" Theme="MaterialCompact" Width="100%" AutoGenerateColumns="False" DataSourceID="dsIadeTalepleri" KeyFieldName="TalepId" EnableCallBacks="False" OnCustomButtonCallback="gvIadeTalepleri_CustomButtonCallback">
                                                <SettingsPager PageSize="100">
                                                </SettingsPager>
                                                <SettingsPopup>
                                                    <FilterControl AutoUpdatePosition="False"></FilterControl>
                                                </SettingsPopup>
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="TalepId" ReadOnly="True" Visible="False" VisibleIndex="1">
                                                        <EditFormSettings Visible="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="CariId" Visible="False" VisibleIndex="2">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="CariAdi" ReadOnly="True" VisibleIndex="3" Visible="False">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="SiparisId" Visible="False" VisibleIndex="4">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Sipariş No" FieldName="SiparisNo" ReadOnly="True" VisibleIndex="5">
                                                        <DataItemTemplate>
                                                            <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" Text='<%# Eval("SiparisNo") %>'></asp:LinkButton>
                                                        </DataItemTemplate>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="UrunId" Visible="False" VisibleIndex="6">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Ürün Adı" FieldName="STA" VisibleIndex="8">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Miktar" FieldName="Miktar" VisibleIndex="9">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="IadeNedenId" Visible="False" VisibleIndex="10">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="İade Nedeni" FieldName="IadeNedeni" ReadOnly="True" VisibleIndex="11">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Notlar" VisibleIndex="12">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataDateColumn Caption="Talep Tarihi" FieldName="Tarih" VisibleIndex="13">
                                                        <PropertiesDateEdit DisplayFormatString="dd.MM.yyyy HH:mm">
                                                        </PropertiesDateEdit>
                                                    </dx:GridViewDataDateColumn>
                                                    <dx:GridViewDataTextColumn FieldName="DurumId" Visible="False" VisibleIndex="14">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Durum" FieldName="DurumAdi" ReadOnly="True" VisibleIndex="15">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" Caption=" " VisibleIndex="0">
                                                        <CustomButtons>
                                                            <dx:GridViewCommandColumnCustomButton ID="btnOnay">
                                                                <Image IconID="actions_apply_16x16" ToolTip="İade Talebini Onayla">
                                                                </Image>
                                                            </dx:GridViewCommandColumnCustomButton>
                                                            <dx:GridViewCommandColumnCustomButton ID="btnRet">
                                                                <Image IconID="actions_cancel_16x16" ToolTip="İade Talebini Reddet">
                                                                </Image>
                                                            </dx:GridViewCommandColumnCustomButton>
                                                        </CustomButtons>
                                                    </dx:GridViewCommandColumn>
                                                    <dx:GridViewDataTextColumn Caption="Ürün Durum" FieldName="UrunDurum" ShowInCustomizationForm="True" VisibleIndex="7">
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:ASPxGridView>
                                            <asp:SqlDataSource ID="dsIadeTalepleri" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spAdminCariIadeTalepleri" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="CariId" SessionField="sCariId" Type="Int32" />
                                                    <asp:ControlParameter ControlID="ddDurum" Name="DurumId" PropertyName="SelectedValue" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                    <dx:TabPage Text="SERVİS TALEPLERİ">
                        <ContentCollection>
                            <dx:ContentControl runat="server">
                                SERVİS TALEPLERİ
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                    <dx:TabPage Text="CARİ ADRESLERİ">
                        <ContentCollection>
                            <dx:ContentControl runat="server">
                                CARİ ADRESLERİ
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                    <dx:TabPage Text="ÖDEMELER">
                        <ContentCollection>
                            <dx:ContentControl runat="server">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="table-responsive">
                                            <dx:ASPxGridView ID="gvOdemeler" runat="server" Theme="MaterialCompact" Width="100%"></dx:ASPxGridView>
                                        </div>
                                    </div>
                                </div>
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                </TabPages>

            </dx:ASPxPageControl>
        </div>
    </div>
</asp:Content>
