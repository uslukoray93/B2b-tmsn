<%@ Page Title="Geçmiş Ödemeler" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="gecmis-odemelerim.aspx.cs" Inherits="GedizMakina.user.gecmis_odemelerim" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.XtraReports.v22.2.Web.WebForms, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-right: 0px;
        }
    </style>
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
        <dx:ASPxGridView ID="gvOdemelerim" runat="server" Theme="MaterialCompact" Width="100%" AutoGenerateColumns="False" CssClass="auto-style1" DataSourceID="dsOdemelerim" EnableCallBacks="False" KeyFieldName="OdemeId" EnableTheming="True" OnCustomButtonCallback="gvOdemelerim_CustomButtonCallback" OnCustomButtonInitialize="gvOdemelerim_CustomButtonInitialize">
            <SettingsPager PageSize="100">
            </SettingsPager>
            <Settings ShowFilterRow="True" ShowGroupPanel="True" />
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
            <SettingsText GroupPanel="Gruplamak istediğiniz kolonu bu alana sürükleyin" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="OdemeId" ReadOnly="True" VisibleIndex="1" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CariId" Visible="False" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Tutar" FieldName="Tutar" VisibleIndex="7">
                    <PropertiesTextEdit DisplayFormatString="N2">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="OdemeSekliId" Visible="False" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Ödeme Şekli" FieldName="OdemeSekli" ReadOnly="True" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="İşlem Tarihi" FieldName="Tarih" VisibleIndex="6">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="KartNo" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Adı Soyadı" FieldName="IsimSoyisim" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Taksit" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Sonuç" FieldName="Sonuc" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Provizyon No" FieldName="ProvizyonNo" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Kullanılan Pos" FieldName="PosAdi" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="BankaId" Visible="False" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="BankaAdi" ReadOnly="True" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewCommandColumn ButtonRenderMode="Image" ButtonType="Image" Caption=" " ShowClearFilterButton="True" VisibleIndex="0">
                    <CustomButtons>
                        <dx:GridViewCommandColumnCustomButton ID="btnOdemeRapor">
                            <Image IconID="export_exporttopdf_16x16" ToolTip="İşlem Evrakı">
                            </Image>
                        </dx:GridViewCommandColumnCustomButton>
                    </CustomButtons>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Durum" FieldName="OdemeDurum" ShowInCustomizationForm="True" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="OdemeDurumu" Visible="False" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="dsOdemelerim" runat="server" ConnectionString="<%$ ConnectionStrings:gediz %>" SelectCommand="spOdemelerCari" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="CariId" SessionField="sLoginId" Type="Int32" />
                <asp:ControlParameter ControlID="dtBaslangic" Name="Start" PropertyName="Value" Type="DateTime" />
                <asp:ControlParameter ControlID="dtBitis" Name="End" PropertyName="Value" Type="DateTime" />
            </SelectParameters>
        </asp:SqlDataSource>
        <dx:ASPxPopupControl ID="poBelge" runat="server" CloseOnEscape="True" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Theme="MaterialCompact" Width="400px">
            <SettingsAdaptivity Mode="OnWindowInnerWidth" VerticalAlign="WindowCenter" />
            <ContentCollection>
<dx:PopupControlContentControl runat="server">
    <dx:ASPxWebDocumentViewer ID="ASPxWebDocumentViewer1" runat="server" DisableHttpHandlerValidation="False">
    </dx:ASPxWebDocumentViewer>
                </dx:PopupControlContentControl>
</ContentCollection>
        </dx:ASPxPopupControl>
    </div>
</asp:Content>
