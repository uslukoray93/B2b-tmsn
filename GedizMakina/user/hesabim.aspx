<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="hesabim.aspx.cs" Inherits="GedizMakina.user.hesabim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="ecommerce-form action-buttons-fixed">
        <div class="row">
            <div class="col">
                <section class="card card-modern card-big-info">
                    <div class="card-body">
                        <div class="tabs-modern row" style="min-height: 490px;">
                            <div class="col-lg-2-5 col-xl-1-5">
                                <div class="nav flex-column" id="tab" role="tablist" aria-orientation="vertical">

                                    <a class="nav-link active" id="genelbilgilertab" data-bs-toggle="pill" data-bs-target="#genelbilgiler" role="tab" aria-controls="general" aria-selected="true"><i class="bx bx-cog me-2"></i>Genel Bilgiler</a>

                                    <a class="nav-link" id="sifredegistirtab" data-bs-toggle="pill" data-bs-target="#sifredegistir" role="tab" aria-controls="usage-restriction" aria-selected="false"><i class="bx bx-block me-2"></i>Şifre Güncelle</a>

                                    <a class="nav-link" id="musteribilgitaleptab" data-bs-toggle="pill" data-bs-target="#musteribilgitalep" role="tab" aria-controls="usage-limits" aria-selected="false"><i class="bx bx-timer me-2"></i>Müşteri Bilgileri Talep Formu</a>
                                    <a class="nav-link" id="yeniadresekletab" data-bs-toggle="pill" data-bs-target="#yeniadresekle" role="tab" aria-controls="usage-limits" aria-selected="false"><i class="bx bx-timer me-2"></i>Yeni Adres Ekle</a>
                                </div>
                            </div>
                            <div class="col-lg-3-5 col-xl-4-5">
                                <div class="tab-content" id="tabContent">
                                    <div class="tab-pane fade show active" id="genelbilgiler" role="tabpanel" aria-labelledby="general-tab">
                                        <div class="form-group row align-items-center pb-3">
                                            <label class="col-lg-5 col-xl-3 control-label text-lg-end mb-0">Adres</label>
                                            <div class="col-lg-7 col-xl-6">
                                                <asp:TextBox ID="txtAdres" runat="server" CssClass="form-control form-control-modern" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group row align-items-center pb-3">
                                            <label class="col-lg-5 col-xl-3 control-label text-lg-end mb-0">Şehir</label>
                                            <div class="col-lg-7 col-xl-6">
                                                <asp:TextBox ID="txtSehir" runat="server" CssClass="form-control form-control-modern" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group row align-items-center pb-3">
                                            <label class="col-lg-5 col-xl-3 control-label text-lg-end mb-0">İlçe</label>
                                            <div class="col-lg-7 col-xl-6">
                                                <asp:TextBox ID="txtIlce" runat="server" CssClass="form-control form-control-modern" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group row align-items-center pb-3">
                                            <label class="col-lg-5 col-xl-3 control-label text-lg-end mb-0">Vergi Dairesi</label>
                                            <div class="col-lg-7 col-xl-6">
                                                <asp:TextBox ID="txtVergiDairesi" runat="server" CssClass="form-control form-control-modern" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group row align-items-center pb-3">
                                            <label class="col-lg-5 col-xl-3 control-label text-lg-end mb-0">Vergi No</label>
                                            <div class="col-lg-7 col-xl-6">
                                                <asp:TextBox ID="txtVergiNo" runat="server" CssClass="form-control form-control-modern" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group row align-items-center pb-3">
                                            <label class="col-lg-5 col-xl-3 control-label text-lg-end mb-0">Telefon</label>
                                            <div class="col-lg-7 col-xl-6">
                                                <asp:TextBox ID="txtTelefon" runat="server" CssClass="form-control form-control-modern" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group row align-items-center pb-3">
                                            <label class="col-lg-5 col-xl-3 control-label text-lg-end mb-0">E-Posta</label>
                                            <div class="col-lg-7 col-xl-6">
                                                <asp:TextBox ID="txtEposta" runat="server" CssClass="form-control form-control-modern" Enabled="false"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="sifredegistir" role="tabpanel" aria-labelledby="usage-restriction-tab">
                                        <div class="form-group row align-items-center pb-3">
                                            <label class="col-lg-5 col-xl-3 control-label text-lg-end mb-0">Eski Şifre</label>
                                            <div class="col-lg-7 col-xl-6">
                                                <asp:TextBox ID="txtEskiSifre" runat="server" CssClass="form-control form-control-modern" TextMode="Password"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group row align-items-center pb-3">
                                            <label class="col-lg-5 col-xl-3 control-label text-lg-end mb-0">Yeni Şifre</label>
                                            <div class="col-lg-7 col-xl-6">
                                                <asp:TextBox ID="txtYeniSifre" runat="server" CssClass="form-control form-control-modern" TextMode="Password"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group row align-items-center pb-3">
                                            <label class="col-lg-5 col-xl-3 control-label text-lg-end mb-0">Yeni Şifre Tekrar</label>
                                            <div class="col-lg-7 col-xl-6">
                                                <asp:TextBox ID="txtYeniSifreTekrar" runat="server" CssClass="form-control form-control-modern" TextMode="Password"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-10"></div>
                                            <div class="col-md-2">
                                                <asp:Button ID="btnKaydetSifre" runat="server" CssClass="btn btn-dark" Width="100%" Text="Kaydet" OnClick="btnKaydetSifre_Click" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <asp:Label ID="lblUyariSifre" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="musteribilgitalep" role="tabpanel" aria-labelledby="usage-restriction-tab">
                                        <div class="form-group row align-items-center pb-3">
                                            <label class="col-lg-5 col-xl-3 control-label text-lg-end mb-0">Adres</label>
                                            <div class="col-lg-7 col-xl-6">
                                                <asp:TextBox ID="txtKayitAdres" runat="server" CssClass="form-control form-control-modern"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group row align-items-center pb-3">
                                            <label class="col-lg-5 col-xl-3 control-label text-lg-end mb-0">Şehir</label>
                                            <div class="col-lg-7 col-xl-6">
                                                <asp:TextBox ID="txtKayitSehir" runat="server" CssClass="form-control form-control-modern"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group row align-items-center pb-3">
                                            <label class="col-lg-5 col-xl-3 control-label text-lg-end mb-0">İlçe</label>
                                            <div class="col-lg-7 col-xl-6">
                                                <asp:TextBox ID="txtKayitIlce" runat="server" CssClass="form-control form-control-modern"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group row align-items-center pb-3">
                                            <label class="col-lg-5 col-xl-3 control-label text-lg-end mb-0">Vergi Dairesi</label>
                                            <div class="col-lg-7 col-xl-6">
                                                <asp:TextBox ID="txtKayitVergiDairesi" runat="server" CssClass="form-control form-control-modern"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group row align-items-center pb-3">
                                            <label class="col-lg-5 col-xl-3 control-label text-lg-end mb-0">Vergi No</label>
                                            <div class="col-lg-7 col-xl-6">
                                                <asp:TextBox ID="txtKayitVergiNo" runat="server" CssClass="form-control form-control-modern"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group row align-items-center pb-3">
                                            <label class="col-lg-5 col-xl-3 control-label text-lg-end mb-0">Telefon</label>
                                            <div class="col-lg-7 col-xl-6">
                                                <asp:TextBox ID="txtKayitTelefon" runat="server" CssClass="form-control form-control-modern"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group row align-items-center pb-3">
                                            <label class="col-lg-5 col-xl-3 control-label text-lg-end mb-0">E-Posta</label>
                                            <div class="col-lg-7 col-xl-6">
                                                <asp:TextBox ID="txtKayitEposta" runat="server" CssClass="form-control form-control-modern"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="yeniadresekle" role="tabpanel" aria-labelledby="usage-restriction-tab">
                                        <div class="form-group row align-items-center pb-3">
                                            <label class="col-lg-5 col-xl-3 control-label text-lg-end mb-0">Adres Başlık</label>
                                            <div class="col-lg-7 col-xl-6">
                                                <asp:TextBox ID="txtYeniAdresBaslik" runat="server" CssClass="form-control form-control-modern"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group row align-items-center pb-3">
                                            <label class="col-lg-5 col-xl-3 control-label text-lg-end mb-0">Adres</label>
                                            <div class="col-lg-7 col-xl-6">
                                                <asp:TextBox ID="txtYeniAdres" runat="server" CssClass="form-control form-control-modern"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group row align-items-center pb-3">
                                            <label class="col-lg-5 col-xl-3 control-label text-lg-end mb-0">Şehir</label>
                                            <div class="col-lg-7 col-xl-6">
                                                <asp:TextBox ID="txtYeniSehir" runat="server" CssClass="form-control form-control-modern"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group row align-items-center pb-3">
                                            <label class="col-lg-5 col-xl-3 control-label text-lg-end mb-0">İlçe</label>
                                            <div class="col-lg-7 col-xl-6">
                                                <asp:TextBox ID="txtYeniIlce" runat="server" CssClass="form-control form-control-modern"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-10"></div>
                                            <div class="col-md-2">
                                                <asp:Button ID="btnKaydetYeniAdres" runat="server" CssClass="btn btn-dark" Width="100%" Text="Kaydet" OnClick="btnKaydetYeniAdres_Click" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <asp:Label ID="Label1" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</asp:Content>
