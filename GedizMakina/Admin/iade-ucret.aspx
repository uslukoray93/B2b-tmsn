<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="iade-ucret.aspx.cs" Inherits="GedizMakina.Admin.iade_ucret" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-1">
            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Cari Seçin" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
        </div>
        <div class="col-md-11">
            <dx:ASPxComboBox ID="ddCariler" runat="server" Theme="MaterialCompact" Width="100%" AutoPostBack="True" DataSourceID="dsCariler" TextFormatString="{0} | {1}" ValueField="CariId">
                <Columns>
                    <dx:ListBoxColumn Caption="Cari Kodu" FieldName="CariKodu">
                    </dx:ListBoxColumn>
                    <dx:ListBoxColumn Caption="Cari Adı" FieldName="CariAdi">
                    </dx:ListBoxColumn>
                </Columns>
            </dx:ASPxComboBox>
            <asp:SqlDataSource ID="dsCariler" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT [CariId], [CariKodu], [CariAdi] FROM [Cariler] WHERE ([YetkiId] = @YetkiId) ORDER BY [CariAdi]">
                <SelectParameters>
                    <asp:Parameter DefaultValue="1000000002" Name="YetkiId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    <hr />
    <div class="row">
        <div class="col-md-6">
            <div class="row">
                <div class="col-md-12">
                    <h3>Havaleden İade</h3>
                    <hr />
                    <div class="col-md-12">
                        <dx:ASPxComboBox ID="ddHavaleSiparis" runat="server" Theme="MaterialCompact" Width="100%" AutoPostBack="True" DataSourceID="dsSiparislerHavale" OnSelectedIndexChanged="ddHavaleSiparis_SelectedIndexChanged" TextFormatString="{0} | {1} | {2}" ValueField="SiparisId" NullValueItemDisplayText="{0} | {1}">
                            <Columns>
                                <dx:ListBoxColumn Caption="Sipariş Tarihi" FieldName="SiparisTarihi">
                                </dx:ListBoxColumn>
                                <dx:ListBoxColumn Caption="Sipariş No" FieldName="SiparisNo">
                                </dx:ListBoxColumn>
                                <dx:ListBoxColumn Caption="Tutar" FieldName="Tutar">
                                </dx:ListBoxColumn>
                            </Columns>
                        </dx:ASPxComboBox>
                        <asp:SqlDataSource ID="dsSiparislerHavale" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="Select gd.OdemeId, gd.CariId, FORMAT(gd.Tutar, 'N2', 'TR-tr') Tutar, gd.BankaId, gd.SiparisId,
(Select b.BankaAdi From Bankalar b Where b.BankaId = gd.BankaId) Banka,
(Select s.SiparisNo From Siparisler s Where s.SiparisId = gd.SiparisId) SiparisNo,
(Select format(s.SiparisTarihi, 'dd.MM.yyyy') From Siparisler s Where s.SiparisId = gd.SiparisId) SiparisTarihi
From GelenOdemeler gd Where gd.OdemeSekliId = 1000000020 And gd.CariId = @CariId">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddCariler" Name="CariId" PropertyName="Value" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6">
                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Sipariş Tutarı" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                        <br />
                        <dx:ASPxTextBox ID="txtSiparisTutari" runat="server" Width="100%" Theme="MaterialCompact" NullText="Sipariş Tutarı" Enabled="False">
                            <DisabledStyle BackColor="#262B2A" Font-Bold="True" ForeColor="#A2CF13">
                            </DisabledStyle>
                        </dx:ASPxTextBox>
                    </div>
                    <div class="col-md-6">
                        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="İade Tutarı" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                        <br />
                        <dx:ASPxTextBox ID="txtIadeTutariHavale" runat="server" Width="100%" Theme="MaterialCompact" NullText="İade Tutarı"></dx:ASPxTextBox>
                    </div>

                </div>
                <br />
                <br />
                <div class="row">
                    <div class="col-md-6">
                        <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Banka Seçin" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                        <br />
                        <dx:ASPxComboBox ID="ddBanka" runat="server" Theme="MaterialCompact" Width="100%" DataSourceID="dsBankalar" TextField="BankaAdi" ValueField="BankaId"></dx:ASPxComboBox>
                        <asp:SqlDataSource ID="dsBankalar" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="SELECT [BankaId], [BankaAdi] FROM [Bankalar2] ORDER BY [BankaAdi]"></asp:SqlDataSource>
                    </div>
                    <div class="col-md-6">
                        <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="IBAN No" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                        <br />
                        <dx:ASPxTextBox ID="txtIbanNo" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxTextBox>
                    </div>
                </div>
                <br />
                <br />
                <br />
                <hr />
                <div class="row">
                    <div class="col-md-3">
                        <dx:ASPxButton ID="btnHavale" runat="server" Text="İADE TAMAMLA" Theme="MaterialCompact" Width="100%" OnClick="btnHavale_Click"></dx:ASPxButton>
                    </div>
                    <div class="col-md-9">
                        <dx:ASPxLabel ID="lblUyariHavale" runat="server" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="row">
                <div class="col-md-12">
                    <h3>Kredi Kartından İade</h3>
                    <hr />
                    <div class="col-md-12">
                        <dx:ASPxComboBox ID="ddKartSiparis" runat="server" Theme="MaterialCompact" Width="100%" AutoPostBack="True" DataSourceID="dsSiparislerKk" OnSelectedIndexChanged="ddHavaleSiparis_SelectedIndexChanged" TextFormatString="{0} | {1} | {2}" ValueField="SiparisId" NullValueItemDisplayText="{0} | {1}">
                            <Columns>
                                <dx:ListBoxColumn Caption="Sipariş Tarihi" FieldName="SiparisTarihi">
                                </dx:ListBoxColumn>
                                <dx:ListBoxColumn Caption="Sipariş No" FieldName="SiparisNo">
                                </dx:ListBoxColumn>
                                <dx:ListBoxColumn Caption="Tutar" FieldName="Tutar">
                                </dx:ListBoxColumn>
                            </Columns>
                        </dx:ASPxComboBox>
                        <asp:SqlDataSource ID="dsSiparislerKk" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="Select gd.OdemeId, gd.CariId, FORMAT(gd.Tutar, 'N2', 'TR-tr') Tutar, gd.BankaId, gd.SiparisId,
(Select b.BankaAdi From Bankalar b Where b.BankaId = gd.BankaId) Banka,
(Select s.SiparisNo From Siparisler s Where s.SiparisId = gd.SiparisId) SiparisNo,
(Select format(s.SiparisTarihi, 'dd.MM.yyyy') From Siparisler s Where s.SiparisId = gd.SiparisId) SiparisTarihi
From GelenOdemeler gd Where gd.OdemeSekliId = 1000000021 And gd.CariId = @CariId">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddCariler" Name="CariId" PropertyName="Value" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6">
                        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Sipariş Tutarı" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                        <br />
                        <dx:ASPxTextBox ID="txtSiparisTutariKK" runat="server" Width="100%" Theme="MaterialCompact" NullText="Sipariş Tutarı" Enabled="False">
                            <DisabledStyle BackColor="#262B2A" Font-Bold="True" ForeColor="#A2CF13">
                            </DisabledStyle>
                        </dx:ASPxTextBox>
                    </div>
                    <div class="col-md-6">
                        <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="İade Tutarı" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                        <br />
                        <dx:ASPxTextBox ID="txtIadeTutariKK" runat="server" Width="100%" Theme="MaterialCompact" NullText="İade Tutarı"></dx:ASPxTextBox>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6">
                        <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Banka Seçin" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                        <br />
                        <dx:ASPxComboBox ID="ddBankalarKK" runat="server" Theme="MaterialCompact" Width="100%" DataSourceID="dsBankalar" TextField="BankaAdi" ValueField="BankaId"></dx:ASPxComboBox>
                    </div>
                    <div class="col-md-6">
                        <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Kart No" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                        <br />
                        <dx:ASPxTextBox ID="txtKartNo" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxTextBox>
                    </div>
                </div>
                <br />
                <br />
                <br />
                <hr />
                <div class="row">
                    <div class="col-md-3">
                        <dx:ASPxButton ID="btnKrediKarti" runat="server" Text="İADE TAMAMLA" Theme="MaterialCompact" Width="100%" OnClick="btnKrediKarti_Click"></dx:ASPxButton>
                    </div>
                    <div class="col-md-9">
                        <dx:ASPxLabel ID="lblUyariKk" runat="server" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
