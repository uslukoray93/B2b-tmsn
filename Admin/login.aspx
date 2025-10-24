<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="GedizMakina.Admin.login" %>

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/login-form-02fonts/icomoon/style.css">

    <link rel="stylesheet" href="/login-form-02/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/login-form-02/css/bootstrap.min.css">

    <!-- Style -->
    <link rel="stylesheet" href="/login-form-02/css/style.css">

    <title>Yönetici Girişi</title>
</head>
<body>


    <div class="d-lg-flex half">
        <div class="bg order-1 order-md-2" style="background-image: url('/login-form-02/images/yonetici.jpg');"></div>
        <div class="contents order-2 order-md-1">

            <div class="container">
                <div class="row align-items-center justify-content-center">
                    <div class="col-md-7">
                        <h3>Yönetici <strong>Girişi</strong></h3>
                        <form id="form1" runat="server">
                            <div class="form-group first">
                                <label for="username">Kullanıcı Adı</label>
                                <input type="text" class="form-control" placeholder="Cari Kodunuzu Girin" id="txtKullaniciAdi" runat="server">
                            </div>
                            <div class="form-group last mb-3">
                                <label for="password">Parola</label>
                                <input type="password" class="form-control" placeholder="Parolanızı Girin" id="txtParola" runat="server">
                            </div>

                            <div class="d-flex mb-5 align-items-center">
                                <span class="ml-auto"><a href="#" class="forgot-pass">Forgot Password</a></span>
                            </div>

                            <button id="btnGiris" runat="server" type="button" class="btn btn-block btn-primary" onserverclick="btnGiris_ServerClick">Giriş</button>
                            <br />
                            <label id="lblUyari" runat="server"></label>
                        </form>
                    </div>
                </div>
            </div>
        </div>


    </div>



    <script src="/login-form-02/js/jquery-3.3.1.min.js"></script>
    <script src="/login-form-02/js/popper.min.js"></script>
    <script src="/login-form-02/js/bootstrap.min.js"></script>
    <script src="/login-form-02/js/main.js"></script>
</body>
</html>
