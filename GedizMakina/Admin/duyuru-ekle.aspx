<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.Master" AutoEventWireup="true" CodeBehind="duyuru-ekle.aspx.cs" Inherits="GedizMakina.Admin.duyuru_ekle" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v22.2, Version=22.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-1">
            <dx:ASPxButton ID="btnKaydet" runat="server" Text="KAYDET" Theme="MaterialCompact" Width="100%" OnClick="btnKaydet_Click" AutoPostBack="false"></dx:ASPxButton>
        </div>
        <div class="col-md-11">
            <dx:ASPxLabel ID="lblUyari" runat="server" Theme="MaterialCompact"></dx:ASPxLabel>
        </div>
    </div>
    <hr />
    <div class="row">
        <div class="col-md-12">
            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Duyuru Başlık" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-12">
            <dx:ASPxTextBox ID="txtDuyuruBaslik" runat="server" Width="100%" Theme="MaterialCompact"></dx:ASPxTextBox>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-12">
            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Duyuru Açıklaması" Theme="MaterialCompact" Font-Bold="true"></dx:ASPxLabel>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-12">
            <dx:ASPxHtmlEditor ID="txtDuyuruAciklama" runat="server" Height="600px" Width="100%">
                <Settings AllowHtmlView="False" AllowPreview="False">
                </Settings>
                <SettingsHtmlEditing>
                    <PasteFiltering Attributes="class"></PasteFiltering>
                </SettingsHtmlEditing>

                <SettingsDialogs>
                    <InsertImageDialog>
                        <SettingsImageSelector>
                            <SettingsAdaptivity CollapseFolderContainerAtWindowInnerWidth="650"></SettingsAdaptivity>
                        </SettingsImageSelector>
                    </InsertImageDialog>

                    <InsertFlashDialog>
                        <SettingsFlashSelector>
                            <SettingsAdaptivity CollapseFolderContainerAtWindowInnerWidth="650"></SettingsAdaptivity>
                        </SettingsFlashSelector>
                    </InsertFlashDialog>

                    <InsertAudioDialog>
                        <SettingsAudioSelector>
                            <SettingsAdaptivity CollapseFolderContainerAtWindowInnerWidth="650"></SettingsAdaptivity>
                        </SettingsAudioSelector>
                    </InsertAudioDialog>

                    <InsertVideoDialog>
                        <SettingsVideoSelector>
                            <SettingsAdaptivity CollapseFolderContainerAtWindowInnerWidth="650"></SettingsAdaptivity>
                        </SettingsVideoSelector>
                    </InsertVideoDialog>

                    <InsertLinkDialog>
                        <SettingsDocumentSelector>
                            <SettingsAdaptivity CollapseFolderContainerAtWindowInnerWidth="650"></SettingsAdaptivity>
                        </SettingsDocumentSelector>
                    </InsertLinkDialog>
                </SettingsDialogs>
            </dx:ASPxHtmlEditor>
        </div>
    </div>
</asp:Content>
