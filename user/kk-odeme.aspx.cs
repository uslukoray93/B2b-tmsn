using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections.Specialized;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace GedizMakina.user
{
    public partial class kk_odeme : System.Web.UI.Page
    {
        App_Code.ConCs cn = new App_Code.ConCs();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                btnOdemeYap.InnerText = "₺ " + Session["sOdenecekTutar"].ToString();
            }
        }

        protected void btnOdemeYap_ServerClick(object sender, EventArgs e)
        {
            DataRow drCari = cn.DataRowGetir("Select Eposta, Yetkili, Adres1 + ' ' + Sehir + ' / ' + Ilce Adres, Telefon From Cariler Where CariId = " + Session["sLoginId"].ToString() + "");

            // ####################### DÜZENLEMESİ ZORUNLU ALANLAR #######################
            //
            // API Entegrasyon Bilgileri - Mağaza paneline giriş yaparak BİLGİ sayfasından alabilirsiniz.
            string merchant_id = "481671";
            string merchant_key = "D4ntjQTC2piBcXdq";
            string merchant_salt = "rNHrbNHPLq5q4U1b";
            //
            // Müşterinizin sitenizde kayıtlı veya form vasıtasıyla aldığınız eposta adresi
            string emailstr = drCari["Eposta"].ToString();
            //
            // Tahsil edilecek tutar.
            int payment_amountstr = Convert.ToInt32(Session["sOdenecekTutarKK"].ToString());
            //
            // Sipariş numarası: Her işlemde benzersiz olmalıdır!! Bu bilgi bildirim sayfanıza yapılacak bildirimde geri gönderilir.
            string merchant_oid = CreateSmsCode(7);
            //
            // Müşterinizin sitenizde kayıtlı veya form aracılığıyla aldığınız ad ve soyad bilgisi
            string user_namestr = drCari["Yetkili"].ToString();
            //
            // Müşterinizin sitenizde kayıtlı veya form aracılığıyla aldığınız adres bilgisi
            string user_addressstr = drCari["Adres"].ToString();
            //
            // Müşterinizin sitenizde kayıtlı veya form aracılığıyla aldığınız telefon bilgisi
            string user_phonestr = drCari["Telefon"].ToString();
            //
            // Başarılı ödeme sonrası müşterinizin yönlendirileceği sayfa
            // !!! Bu sayfa siparişi onaylayacağınız sayfa değildir! Yalnızca müşterinizi bilgilendireceğiniz sayfadır!
            // !!! Siparişi onaylayacağız sayfa "Bildirim URL" sayfasıdır (Bakınız: 2.ADIM Klasörü).
            string merchant_ok_url = "http://cbserver:8085/success";
            //
            // Ödeme sürecinde beklenmedik bir hata oluşması durumunda müşterinizin yönlendirileceği sayfa
            // !!! Bu sayfa siparişi iptal edeceğiniz sayfa değildir! Yalnızca müşterinizi bilgilendireceğiniz sayfadır!
            // !!! Siparişi iptal edeceğiniz sayfa "Bildirim URL" sayfasıdır (Bakınız: 2.ADIM Klasörü).
            string merchant_fail_url = "http://cbserver:8085/decline";
            //        
            // !!! Eğer bu örnek kodu sunucuda değil local makinanızda çalıştırıyorsanız
            // buraya dış ip adresinizi (https://www.whatismyip.com/) yazmalısınız. Aksi halde geçersiz paytr_token hatası alırsınız.
            string user_ip = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (user_ip == "" || user_ip == null)
            {
                user_ip = Request.ServerVariables["REMOTE_ADDR"];
            }
            //
            // ÖRNEK $user_basket oluşturma - Ürün adedine göre object'leri çoğaltabilirsiniz
            object[][] user_basket = {
            new object[] {"Örnek ürün 1", "18.00", 1}, // 1. ürün (Ürün Ad - Birim Fiyat - Adet)
            new object[] {"Örnek ürün 2", "33.25", 2}, // 2. ürün (Ürün Ad - Birim Fiyat - Adet)
            new object[] {"Örnek ürün 3", "45.42", 1}, // 3. ürün (Ürün Ad - Birim Fiyat - Adet)
            };
            /* ############################################################################################ */
            // Alabileceği değerler; advantage, axess, combo, bonus, cardfinans, maximum, paraf, world, saglamkart
            string card_type = "bonus";
            //
            // Hata mesajlarının ekrana basılması için entegrasyon ve test sürecinde 1 olarak bırakın. Daha sonra 0 yapabilirsiniz.
            string debug_on = "1";
            //
            // Mağaza canlı modda iken test işlem yapmak için 1 olarak gönderilebilir.
            string test_mode = "0";
            //
            // 3D'siz işlem
            string non_3d = "0";
            //
            // Non3d Test Failed
            string non3d_test_failed = "0";
            //
            // Taksit Sayısı
            string installment_count = "0";
            //
            // Ödeme türü
            string payment_type = "card";
            //
            // Post adresi
            string post_url = "https://www.paytr.com/odeme";
            //
            // Para birimi olarak TL, EUR, USD gönderilebilir. USD ve EUR kullanmak için kurumsal@paytr.com 
            // üzerinden bilgi almanız gerekmektedir. Boş gönderilirse TL geçerli olur.
            string currency = "TL";
            //
            //
            // Sepet içerği oluşturma fonksiyonu, değiştirilmeden kullanılabilir.
            JavaScriptSerializer ser = new JavaScriptSerializer();
            string user_basket_json = ser.Serialize(user_basket);
            //
            // Token oluşturma fonksiyonu, değiştirilmeden kullanılmalıdır.
            string Birlestir = string.Concat(merchant_id, user_ip, merchant_oid, emailstr, payment_amountstr.ToString(), payment_type, installment_count, currency, test_mode, non_3d, merchant_salt);
            HMACSHA256 hmac = new HMACSHA256(Encoding.UTF8.GetBytes(merchant_key));
            byte[] b = hmac.ComputeHash(Encoding.UTF8.GetBytes(Birlestir));
            //


            string MerchantId = merchant_id;
            string UserIp = user_ip;
            string MerchantOid = merchant_oid;
            string Email = emailstr;
            string PaymentType = payment_type;
            string PaymentAmount = payment_amountstr.ToString();
            string InstallmentCount = installment_count;
            string Currency = currency;
            string TestMode = test_mode;
            string Non3d = non_3d;
            string MerchantOkUrl = merchant_ok_url;
            string MerchantFailUrl = merchant_fail_url;
            string UserName = user_namestr;
            string UserAddress = user_addressstr;
            string UserPhone = user_phonestr;
            string UserBasket = user_basket_json;
            string Non3dTestFailed = non3d_test_failed;
            string DebugOn = debug_on;
            string CardType = card_type;
            string PostUrl = post_url;
            string PaytrToken = Convert.ToBase64String(b);
        }
        private string CreateSmsCode(int size)
        {
            char[] cr = "abcdefghijklmnopqrstuvwxyz".ToCharArray();
            string result = string.Empty;
            Random r = new Random();
            for (int i = 0; i < size; i++)
            {
                result += cr[r.Next(0, cr.Length - 1)].ToString();
            }
            return result;
        }

        //protected void btnOde_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("/success");
        //}

        //protected void btnOdeBasarisiz_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("/decline");
        //}
    }
}