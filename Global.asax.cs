using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Routing;
using System.Web.UI.WebControls;
using System.IO.Compression;
using System.IO;

namespace GedizMakina
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            RouteAdd(RouteTable.Routes);
            DevExpress.XtraReports.Web.ASPxWebDocumentViewer.StaticInitialize();
            DevExpress.XtraReports.Web.ASPxWebDocumentViewer.StaticInitialize();
        }
        public void RouteAdd(RouteCollection route)
        {
            /////////KULLANICI SAYFALARI BAŞLANGIÇ/////////
            route.MapPageRoute("user-login", "giris/", "~/user/login.aspx");
            route.MapPageRoute("user-dashboard", "dashboard/", "~/user/dashboard.aspx");
            route.MapPageRoute("user-basket", "sepet/", "~/user/basket.aspx");
            route.MapPageRoute("user-bekleyen-siparisler", "bekleyen-siparisler/", "~/user/bekleyen-siparisler.aspx");
            route.MapPageRoute("user-cari-ekstre", "cari-ekstre/", "~/user/cari-ekstre.aspx");
            route.MapPageRoute("user-garanti-talebi", "garanti-talebi/", "~/user/garanti-talebi.aspx");
            route.MapPageRoute("user-garanti-takibi", "garanti-takibi/", "~/user/garnti-takibi.aspx");
            route.MapPageRoute("user-gecmis-odemeler", "gecmis-odemeler/", "~/user/gecmis-odemelerim.aspx");
            route.MapPageRoute("user-gecmis-siparisler", "gecmis-siparisler/", "~/user/gecmis-siparisler.aspx");
            route.MapPageRoute("user-havale-bildirimi", "havale-bildirimi/", "~/user/havale-bildirimi.aspx");
            route.MapPageRoute("user-hesap-bakiyesi", "hesap-bakiyesi/", "~/user/hesap-bakiyesi.aspx");
            route.MapPageRoute("user-iade-takibi", "iade-takibi/", "~/user/iade-takibi.aspx");
            route.MapPageRoute("user-iade-talebi", "iade-talebi/", "~/user/iade-talebi-yeni.aspx");
            route.MapPageRoute("user-kapatilmamis-faturalar", "kapatilmamis-faturalar/", "~/user/kapatilmamis-faturalar.aspx");
            route.MapPageRoute("user-merkezde-tamir-takibi", "merkezde-tamir-takibi/", "~/user/merkezde-tamir-takibi.aspx");
            route.MapPageRoute("user-merkezde-tamir-talebi", "merkezde-tamir-talebi/", "~/user/merkezde-tamir-talebi.aspx");
            route.MapPageRoute("user-online-odeme", "online-odeme/", "~/user/online-odeme.aspx");
            //route.MapPageRoute("user-urun-kategori-listesi", "kategori/{0}/{1}", "~/user/product-list.aspx");
            route.MapPageRoute("user-urun-urun-detay", "urun/{0}/", "~/user/urun-detay.aspx");
            route.MapPageRoute("user-vade-analizi", "vade-analizi/", "~/user/vade-analizi.aspx");
            route.MapPageRoute("user-urun-katalogu", "urun-katalogu/", "~/user/urun-katalogu.aspx");
            route.MapPageRoute("user-tkk-fiyat-listesi", "tkk-fiyat-listesi/", "~/user/tkk-fiyat-listesi.aspx");
            route.MapPageRoute("user-zirai-kredilendirme", "zirai-kredilendirme/", "~/user/zirai-kredilendirme.aspx");
            route.MapPageRoute("user-deney-raporlari", "deney-raporlari/", "~/user/deney-raporlari.aspx");
            route.MapPageRoute("user-ruhsatlar", "ruhsatlar/", "~/user/ruhsatlar.aspx");
            route.MapPageRoute("user-kampanyalar", "kampanyalar/", "~/user/kampanyalar.aspx");
            route.MapPageRoute("user-kampanya-detay", "kampanya/{0}/", "~/user/kampanya-detay.aspx");
            route.MapPageRoute("user-hesabim", "hesabim/", "~/user/hesabim.aspx");
            route.MapPageRoute("user-siparis-detay", "siparis/", "~/user/siparis-detay.aspx");
            //route.MapPageRoute("user-kredi-karti-odeme", "kredi-karti-odeme/", "~/user/kk.aspx");
            route.MapPageRoute("user-kredi-karti-odeme", "kredi-karti-odeme/", "~/user/kknew2.aspx");
            route.MapPageRoute("user-success", "success/", "~/user/success.aspx");
            route.MapPageRoute("user-siparis-basarili", "siparis-basarili/", "~/user/success-siparis.aspx");
            route.MapPageRoute("user-decline", "decline/", "~/user/decline.aspx");
            route.MapPageRoute("user-cikis", "cikis/", "~/user/logout.aspx");
            route.MapPageRoute("user-urunler-1", "urunler/", "~/user/yeni-urunler-1.aspx");
            route.MapPageRoute("user-urunler-2", "kategori/{0}", "~/user/urunler-2.aspx");
            route.MapPageRoute("user-urunler-3", "kategori/{0}/{1}", "~/user/urunler-3.aspx");
            route.MapPageRoute("user-marka-1", "marka/{0}/", "~/user/marka-urun.aspx");
            route.MapPageRoute("user-marka-urun-kategori1", "marka-kategori/", "~/user/marka-urun-kategori1.aspx");
            route.MapPageRoute("user-arama-sonuclari", "arama-sonuclari/", "~/user/search-results.aspx");
            route.MapPageRoute("user-dosyalar", "dokumanlar/", "~/user/dokumanlar.aspx");
            route.MapPageRoute("user-ciro-performansi", "ciro-performansi/", "~/user/ciro-performansi.aspx");
            route.MapPageRoute("user-duyurular", "duyurular/", "~/user/duyurular.aspx");
            route.MapPageRoute("user-duyuru-detay", "duyuru/{0}", "~/user/duyuru-detay.aspx");
            route.MapPageRoute("user-taksit-hesapla", "taksit-hesapla/", "~/user/taksit-hesapla.aspx");

            route.MapPageRoute("user-kart", "kart/", "~/kart.aspx");
            route.MapPageRoute("user-testsuccess", "testsuccess/", "~/testsuccess.aspx");
            route.MapPageRoute("user-odemeok", "odemeok/", "~/odemeok.aspx");
            route.MapPageRoute("user-anasayfa2", "anasayfa2/", "~/anasayfa2.aspx");
            route.MapPageRoute("user-siparisiniz-olusturuluyor", "siparisiniz-olusturuluyor/", "~/tamamlaniyor.aspx");
            /////////KULLANICI SAYFALARI BİTİŞ/////////
            ///

            /////////MÜŞTERİ TEMSİLCİSİ SAYFALARI BAŞLANGIÇ/////////
            route.MapPageRoute("mt-login", "mt/giris/", "~/Mt/login.aspx");
            route.MapPageRoute("mt-dashboard", "mt/dashboard/", "~/Mt/dashboard.aspx");
            route.MapPageRoute("mt-cari-listesi", "mt/cari-listesi/", "~/Mt/cari-listesi.aspx");
            route.MapPageRoute("mt-cari-detay", "mt/cari-detay/", "~/Mt/cari-detay.aspx");
            route.MapPageRoute("mt-garanti-listesi", "mt/garanti-listesi/", "~/Mt/garanti-listesi.aspx");

            route.MapPageRoute("mt-garanti-talebi-olustur", "mt/garanti-talebi-olustur/", "~/Mt/garanti-talebi-olustur.aspx");
            route.MapPageRoute("mt-iade-listesi", "mt/iade-listesi/", "~/Mt/iade-listesi.aspx");
            route.MapPageRoute("mt-iade-talebi-olustur", "mt/iade-talebi-olustur/", "~/Mt/iade-talebi-olustur.aspx");
            route.MapPageRoute("mt-siparis-detay", "mt/siparis-detay/", "~/Mt/siparis-detay.aspx");
            route.MapPageRoute("mt-siparis-olustur", "mt/siparis-olustur/", "~/Mt/siparis-olustur.aspx");
            route.MapPageRoute("mt-tum-siparisler", "mt/tum-siparisler/", "~/Mt/tum-siparisler.aspx");

            route.MapPageRoute("mt-takvim", "mt/takvim/", "~/Mt/takvim.aspx");
            route.MapPageRoute("mt-cikis", "mt/cikis/", "~/Mt/cikis.aspx");
            /////////MÜŞTERİ TEMSİLCİSİ SAYFALARI BİTİŞ/////////

            /////////ADMIN SAYFALARI BAŞLANGIÇ/////////
            route.MapPageRoute("admin-login", "yonetici/", "~/Admin/login.aspx");
            route.MapPageRoute("admin-cikis", "admin/cikis/", "~/Admin/cikis.aspx");
            route.MapPageRoute("admin-cari-detay", "admin/cari-detay/", "~/Admin/cari-detay.aspx");
            route.MapPageRoute("admin-cari-listesi", "admin/cari-listesi/", "~/Admin/cari-listesi.aspx");
            route.MapPageRoute("admin-dashboard", "admin/dashboard/", "~/Admin/dashboard.aspx");
            route.MapPageRoute("admin-doviz-kurlari", "admin/doviz-kurlari/", "~/Admin/doviz-kurlari.aspx");
            route.MapPageRoute("admin-garanti-listesi", "admin/garanti-listesi/", "~/Admin/garanti-listesi.aspx");
            route.MapPageRoute("admin-garanti-talebi-olustur", "admin/garanti-talebi-olustur/", "~/Admin/garanti-talebi-olustur.aspx");
            route.MapPageRoute("admin-garanti-talep-detay", "admin/garanti-talep-detay/", "~/Admin/garanti-talep-detay.aspx");
            route.MapPageRoute("admin-iade-listesi", "admin/iade-listesi/", "~/Admin/iade-listesi.aspx");
            route.MapPageRoute("admin-iade-talebi-olustur", "admin/iade-talebi-olustur/", "~/Admin/iade-talebi-olustur.aspx");
            route.MapPageRoute("admin-kategoriler", "admin/kategoriler/", "~/Admin/kategoriler.aspx");
            route.MapPageRoute("admin-markalar", "admin/markalar/", "~/Admin/markalar.aspx");
            route.MapPageRoute("admin-merkezde-tamir-listesi", "admin/merkezde-tamir-listesi/", "~/Admin/merkezde-tamir-listesi.aspx");
            route.MapPageRoute("admin-merkezde-tamir-talebi-olustur", "admin/merkezde-tamir-talebi-olustur/", "~/Admin/merkezde-tamir-talebi-olustur.aspx");
            route.MapPageRoute("admin-odeme-sekilleri", "admin/odeme-sekilleri/", "~/Admin/odeme-sekilleri.aspx");
            route.MapPageRoute("admin-sevkiyat-sekilleri", "admin/sevkiyat-sekilleri/", "~/Admin/sevkiyat-sekilleri.aspx");
            route.MapPageRoute("admin-siparis-olustur", "admin/siparis-olustur/", "~/Admin/siparis-olustur.aspx");
            route.MapPageRoute("admin-takvim", "admin/takvim/", "~/Admin/takvim.aspx");
            route.MapPageRoute("admin-tum-siparisler", "admin/tum-siparisler/", "~/Admin/tum-siparisler.aspx");
            route.MapPageRoute("admin-siparis-detay", "admin/siparis/", "~/Admin/siparis-detay.aspx");
            route.MapPageRoute("admin-urun-duzenle", "admin/urun-duzenle/", "~/Admin/urun-duzenle.aspx");
            route.MapPageRoute("admin-urun-ekle", "admin/urun-ekle/", "~/Admin/urun-ekle.aspx");
            route.MapPageRoute("admin-urun-listesi", "admin/urun-listesi/", "~/Admin/urun-listesi.aspx");
            route.MapPageRoute("admin-havale-bildirim", "admin/havale-bildirim/", "~/Admin/havale-bildirim.aspx");
            route.MapPageRoute("admin-dosyalar", "admin/dosyalar/", "~/Admin/dosyalar.aspx");
            route.MapPageRoute("admin-iade-nedenleri", "admin/iade-nedenleri/", "~/Admin/iade-nedenleri.aspx");
            route.MapPageRoute("admin-kampanyalar", "admin/kampanyalar/", "~/Admin/kampanyalar.aspx");
            route.MapPageRoute("admin-kampanya-detay", "admin/kampanya-detay/", "~/Admin/kampanya-detay.aspx");
            route.MapPageRoute("admin-raporlar", "admin/raporlar/", "~/Admin/raporlar.aspx");
            route.MapPageRoute("admin-duyurular", "admin/duyurular/", "~/Admin/duyuru-listesi.aspx");
            route.MapPageRoute("admin-duyuru-detay", "admin/duyuru-detay/", "~/Admin/duyuru-detay.aspx");
            route.MapPageRoute("admin-duyuru-ekle", "admin/duyuru-ekle/", "~/Admin/duyuru-ekle.aspx");
            route.MapPageRoute("admin-sozlesme", "admin/sozlesme/", "~/Admin/sozlesme.aspx");
            route.MapPageRoute("admin-ucret-iadesi", "admin/ucret-iadesi/", "~/Admin/iade-ucret.aspx");
            route.MapPageRoute("admin-mt-listesi", "admin/mt-listesi/", "~/Admin/mt-listesi.aspx");
            route.MapPageRoute("admin-mt-ekle", "admin/mt-ekle/", "~/Admin/mt-ekle.aspx");
            route.MapPageRoute("admin-mt-duzenle", "admin/mt-duzenle/", "~/Admin/mt-duzenle.aspx");
            route.MapPageRoute("admin-ticket-list", "admin/ticket-list/", "~/Admin/ticket-list.aspx");
            route.MapPageRoute("admin-ticket-enter", "admin/ticket-enter/", "~/Admin/ticket-enter.aspx");
            route.MapPageRoute("admin-pos-bilgi", "admin/pos-bilgi/", "~/Admin/sanal-pos-bilgi.aspx");
            route.MapPageRoute("admin-taksit-oran", "admin/taksit-oran/", "~/Admin/taksit-oran.aspx");
            /////////ADMIN SAYFALARI BİTİŞ/////////
        }
        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}