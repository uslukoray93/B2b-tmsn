# TMSN-B2B - Teknik Dokümantasyon

## 📚 İçindekiler

1. [Kurulum ve Çalıştırma](#kurulum)
2. [Veritabanı Şeması Detayları](#veritabanı)
3. [API Endpoint'leri](#api)
4. [Sayfa Yapısı ve İş Akışları](#sayfalar)
5. [Kullanılan Teknolojiler](#teknolojiler)
6. [Sorun Giderme](#sorun-giderme)

---

## 🚀 Kurulum ve Çalıştırma {#kurulum}

### Sistem Gereksinimleri

- **İşletim Sistemi:** Windows Server 2012+ veya Windows 10+
- **Web Server:** IIS 7.5+
- **.NET Framework:** 4.6.1
- **Veritabanı:** SQL Server 2012+
- **Bellek:** Min 4 GB RAM
- **Disk:** Min 10 GB boş alan

### Adım Adım Kurulum

#### 1. IIS Yapılandırması

```powershell
# IIS kurulumu (PowerShell - Admin)
Enable-WindowsOptionalFeature -Online -FeatureName IIS-WebServerRole
Enable-WindowsOptionalFeature -Online -FeatureName IIS-ASPNET45
```

**IIS Application Pool Ayarları:**
- .NET CLR Version: v4.0
- Managed Pipeline Mode: Integrated
- Identity: ApplicationPoolIdentity (veya özel kullanıcı)

#### 2. Veritabanı Bağlantısı

**Web.config güncelleme:**
```xml
<connectionStrings>
  <add name="gediz"
       connectionString="Data Source=SUNUCU_ADI;
                        Initial Catalog=gediz;
                        User ID=KULLANICI_ADI;
                        Password=ŞİFRE;
                        Encrypt=False"
       providerName="System.Data.SqlClient" />
</connectionStrings>
```

⚠️ **ÖNEMLİ:** Production ortamda:
- SA hesabı kullanmayın
- Dedicated DB kullanıcısı oluşturun
- Connection string şifrelensin

#### 3. DevExpress Lisansı

**packages.config:**
```xml
<package id="DevExpress.Web" version="22.2.6" />
<package id="DevExpress.Data" version="22.2.6" />
```

**Lisans dosyası:** `bin/DevExpress.Web.v22.2.lic`

#### 4. Klasör İzinleri

```powershell
# IIS user'a dosya izinleri verme
icacls "C:\inetpub\wwwroot\GedizMakina" /grant "IIS_IUSRS:(OI)(CI)F" /T
```

**Yazma izni gereken klasörler:**
- `/Resimler/` - Ürün görselleri
- `/Dosyalar/` - Döküman uploads
- `/App_Data/` - Uygulama verileri

---

## 🗄️ Veritabanı Şeması Detayları {#veritabanı}

### Ana Tablolar

#### 1. Cariler Tablosu

```sql
CREATE TABLE Cariler (
    CariId INT PRIMARY KEY IDENTITY(1,1),
    CariKodu NVARCHAR(50) UNIQUE NOT NULL,
    CariUnvan NVARCHAR(255),
    Parola NVARCHAR(100), -- MD5 hash
    YetkiId BIGINT,
    Limit DECIMAL(18,2),
    LimitAc BIT,
    VergiNo NVARCHAR(20),
    Email NVARCHAR(100),
    Telefon NVARCHAR(20),
    Adres NVARCHAR(500),
    Il NVARCHAR(50),
    Ilce NVARCHAR(50),
    AktifMi BIT DEFAULT 1,
    KayitTarihi DATETIME DEFAULT GETDATE(),
    -- Diğer kolonlar...
)
```

**İlişkili Tablolar:**
- `CariBakiye` (1:N) - Hesap hareketleri
- `Siparisler` (1:N) - Verilen siparişler
- `Sepet` (1:N) - Aktif sepet

#### 2. Siparisler Tablosu

```sql
CREATE TABLE Siparisler (
    SiparisId INT PRIMARY KEY IDENTITY(1,1),
    CariId INT FOREIGN KEY REFERENCES Cariler(CariId),
    SiparisNo NVARCHAR(50),
    SiparisGuidNo UNIQUEIDENTIFIER,
    SiparisTarihi DATETIME DEFAULT GETDATE(),
    Tutar DECIMAL(18,2),
    Kdv DECIMAL(18,2),
    GenelTutar DECIMAL(18,2),
    SiparisDurumId INT,
    OdemeTurId BIGINT,
    TeslimatTurId INT,
    FaturaAdresId BIGINT,
    SevkiyatAdresId BIGINT,
    VadeTarihi DATETIME,
    OnaylanmaTarihi DATETIME,
    KargoTarihi DATETIME,
    TeslimTarihi DATETIME,
    IptalTarihi DATETIME,
    Aciklama NVARCHAR(MAX)
)
```

**Sipariş Durumları:**
- 1 - Beklemede
- 2 - Onaylandı
- 3 - Hazırlanıyor
- 4 - Kargoya Verildi
- 5 - Teslim Edildi
- 6 - İptal Edildi

#### 3. SiparisDetay Tablosu

```sql
CREATE TABLE SiparisDetay (
    SiparisDetayId INT PRIMARY KEY IDENTITY(1,1),
    SiparisId INT FOREIGN KEY REFERENCES Siparisler(SiparisId),
    UrunId BIGINT,
    Miktar INT,
    BirimFiyat DECIMAL(18,2),
    Iskonto DECIMAL(18,2),
    KdvOrani DECIMAL(5,2),
    KDV DECIMAL(18,2),
    Toplam DECIMAL(18,2),
    ToplamFiyat DECIMAL(18,2), -- KDV dahil
    CariId INT
)
```

#### 4. Urunler Tablosu

```sql
CREATE TABLE Urunler (
    UrunId BIGINT PRIMARY KEY IDENTITY(1,1),
    UrunKodu NVARCHAR(50),
    UrunAdi NVARCHAR(255),
    UrunAciklama NVARCHAR(MAX),
    KategoriId INT,
    MarkaId INT,
    BirimId INT,
    Fiyat DECIMAL(18,2),
    KdvOrani DECIMAL(5,2),
    StokMiktar INT,
    ResimYolu NVARCHAR(255),
    AktifMi BIT DEFAULT 1,
    EklemeTarihi DATETIME DEFAULT GETDATE()
)
```

#### 5. Sepet & Sepet2 Tabloları

```sql
CREATE TABLE Sepet (
    SepetId INT PRIMARY KEY IDENTITY(1,1),
    CariId INT,
    UrunId BIGINT,
    Miktar INT,
    Secili BIT DEFAULT 1,
    EklemeTarihi DATETIME DEFAULT GETDATE()
)

-- Sepet2: Yedekleme amaçlı (aynı yapı)
```

**Kullanım:**
- `Sepet`: Aktif sepet
- `Sepet2`: Backup / sipariş öncesi snapshot

#### 6. CariBakiye Tablosu

```sql
CREATE TABLE CariBakiye (
    CariBakiyeId INT PRIMARY KEY IDENTITY(1,1),
    CariId INT,
    SiparisId INT,
    BorcTutar DECIMAL(18,2),
    AlacakTutar DECIMAL(18,2),
    HareketTurId INT,
    HareketTarihi DATETIME DEFAULT GETDATE(),
    Aciklama NVARCHAR(255)
)
```

**Hareket Türleri:**
- 1 - Sipariş (Borç)
- 2 - Ödeme (Alacak)
- 3 - İade (Alacak)
- 4 - Limit Artırımı

#### 7. OdemeTurleri Tablosu

```sql
CREATE TABLE OdemeTurleri (
    TurId BIGINT PRIMARY KEY,
    TurAdi NVARCHAR(100),
    VadeGun INT,
    SN INT, -- Sıra numarası
    AktifMi BIT
)
```

**Mevcut Ödeme Türleri:**
- 1000000001 - Kredi Kartı (0 gün)
- 1000000005 - Havale (0 gün)
- 1000000006 - Vadeli 30 Gün
- 1000000007 - Vadeli 60 Gün
- 1000000013 - Artı Bakiye

#### 8. GarantiTalepleri Tablosu

```sql
CREATE TABLE GarantiTalepleri (
    GarantiId INT PRIMARY KEY IDENTITY(1,1),
    CariId INT,
    UrunId BIGINT,
    SiparisId INT,
    TalepTarihi DATETIME DEFAULT GETDATE(),
    Aciklama NVARCHAR(MAX),
    DurumId INT,
    CevapTarihi DATETIME,
    Cevap NVARCHAR(MAX)
)
```

#### 9. IadeTalepleri Tablosu

```sql
CREATE TABLE IadeTalepleri (
    IadeId INT PRIMARY KEY IDENTITY(1,1),
    CariId INT,
    SiparisId INT,
    UrunId BIGINT,
    IadeNedeniId INT,
    IadeMiktar INT,
    TalepTarihi DATETIME DEFAULT GETDATE(),
    DurumId INT,
    OnayTarihi DATETIME,
    RedTarihi DATETIME
)
```

### Stored Procedures

#### spSepetGetirAlt

**Amaç:** Sepet toplamlarını hesaplar

**Parametreler:**
- `@CariId INT` - Cari ID
- `@OdemeSekli BIGINT` - Ödeme türü ID

**Dönen Kolonlar:**
- `ToplamTutarKDVsiz DECIMAL(18,2)`
- `Iskonto DECIMAL(18,2)`
- `NetTutar DECIMAL(18,2)`
- `KdvTutar DECIMAL(18,2)`
- `GenelToplam DECIMAL(18,2)`
- `GenelToplam2 DECIMAL(18,2)` - Kuruş dahil

**Kullanım:**
```csharp
SqlCommand cm = new SqlCommand("spSepetGetirAlt", cn._Baglan());
cm.CommandType = CommandType.StoredProcedure;
cm.Parameters.AddWithValue("@CariId", cariId);
cm.Parameters.AddWithValue("@OdemeSekli", odemeTurId);
```

#### spMuhB2BCariAktar

**Amaç:** Muhasebe sisteminden cari aktarımı

**Parametreler:** Yok

**İşlev:**
- GEDIZLINK linked server'dan cari çeker
- Yeni carileri Cariler tablosuna ekler
- Mevcut carileri günceller

#### spMuhB2BCariAktarTek

**Amaç:** Tek bir cariyi aktarır

**Parametreler:**
- `@CariKod NVARCHAR(50)` - Cari kodu

**Kullanım Senaryosu:**
Login sırasında cari yoksa muhasebeden çekilir

### Fonksiyonlar

#### fncCariAnaSayfaBorc

**Amaç:** Vadesi geçmiş borç hesaplama

**Parametre:**
- `@CariId INT`

**Dönen Değer:**
- `DECIMAL(18,2)` - Vadesi geçmiş toplam borç

**Kullanım:**
```sql
SELECT dbo.fncCariAnaSayfaBorc(123) AS VadesiGecmisBorc
```

---

## 🌐 API Endpoint'leri {#api}

### AJAX Endpoint'leri

Proje Web Forms olduğu için REST API yok, AJAX callback'ler kullanılıyor.

#### 1. DevExpress Grid Callbacks

**URL Pattern:**
```
/DX.ashx?action=GRID_CALLBACK&gridId=gvSepet
```

**Örnek (Sepet Silme):**
```csharp
protected void gvSepet_CustomButtonCallback(object sender,
    ASPxGridViewCustomButtonCallbackEventArgs e)
{
    if (e.ButtonID == "btnSil")
    {
        int sepetId = (int)gvSepet.GetRowValues(e.VisibleIndex, "SepetId");
        cn.InsUpdDel("DELETE FROM Sepet WHERE SepetId = " + sepetId);
        gvSepet.DataBind();
    }
}
```

#### 2. Session Keep-Alive

**Endpoint:** `/KeepSessionAlive.aspx`

**Method:** GET

**Amaç:** Session timeout önleme

**Çağrı:**
```javascript
setInterval(function() {
    var img = new Image(1,1);
    img.src = '/KeepSessionAlive.aspx?' + Math.random();
}, 10000); // Her 10 saniye
```

#### 3. Kredi Kartı Callback

**Endpoint:** `/KK/callback.aspx` (varsayım)

**Method:** POST

**Parametreler:**
- `orderId` - Sipariş GUID
- `status` - success/fail
- `transactionId` - İşlem numarası
- `hash` - Güvenlik hash

---

## 📄 Sayfa Yapısı ve İş Akışları {#sayfalar}

### Kullanıcı (Bayi) Sayfaları

#### 1. Login Akışı (user/login.aspx)

**Adımlar:**
```
1. Kullanıcı cari kodu + parola girer
2. MD5 hash hesaplanır
3. Cariler tablosunda arama:
   - Bulunursa → Session set, dashboard'a yönlendir
   - Bulunamazsa → Muhasebeden çek (spMuhB2BCariAktarTek)
     - Başarılıysa → Session set, dashboard'a yönlendir
     - Başarısızsa → Hata mesajı göster
```

**Session Değişkenleri:**
```csharp
Session["sLoginId"] = cariId;
Session["sYetki"] = yetkiId;
```

#### 2. Dashboard (user/dashboard.aspx)

**Gösterilen Bilgiler:**
- Kalan kredi limiti
- Vadesi geçmiş borçlar
- Bekleyen siparişler
- Son siparişler
- Kampanyalar
- Duyurular

**SQL Sorguları:**
```sql
-- Vadesi geçmiş borç
SELECT dbo.fncCariAnaSayfaBorc(@CariId) AS Borc

-- Kalan limit
SELECT (Limit - (SELECT SUM(BorcTutar) FROM CariBakiye
        WHERE CariId = @CariId)) AS KalanLimit
FROM Cariler WHERE CariId = @CariId
```

#### 3. Ürün Katalogu (user/urun-katalogu.aspx)

**Filtreleme:**
- Kategoriye göre
- Markaya göre
- Fiyat aralığı
- Arama (ürün adı, kodu)

**DevExpress Grid:**
```aspx
<dx:ASPxGridView ID="gvUrunler" runat="server"
    AutoGenerateColumns="False">
    <Columns>
        <dx:GridViewDataTextColumn FieldName="UrunKodu" />
        <dx:GridViewDataTextColumn FieldName="UrunAdi" />
        <dx:GridViewDataTextColumn FieldName="Fiyat" />
        <dx:GridViewCommandColumn ButtonType="Image">
            <CustomButtons>
                <dx:GridViewCommandColumnCustomButton ID="btnSepeteEkle" />
            </CustomButtons>
        </dx:GridViewCommandColumn>
    </Columns>
</dx:ASPxGridView>
```

#### 4. Ürün Detay (user/urun-detay.aspx)

**URL:** `/urun/{UrunId}/`

**Kod:**
```csharp
protected void Page_Load(object sender, EventArgs e)
{
    string urunId = Page.RouteData.Values["0"].ToString();

    DataRow dr = cn.DataRowGetir(
        "SELECT * FROM Urunler WHERE UrunId = " + urunId);

    lblUrunAdi.Text = dr["UrunAdi"].ToString();
    lblFiyat.Text = dr["Fiyat"].ToString();
    imgUrun.ImageUrl = dr["ResimYolu"].ToString();
}
```

#### 5. Sepet (user/basket.aspx)

**İşlevler:**
- Ürün listeleme
- Miktar güncelleme
- Ürün silme
- Toplam hesaplama
- Ödeme şekli seçimi
- Kredi limiti kontrolü

**Miktar Güncelleme:**
```csharp
protected void gvSepet_CustomCallback(object sender,
    ASPxGridViewCustomCallbackEventArgs e)
{
    string[] args = e.Parameters.Split('|');
    int rowId = int.Parse(args[0]);
    int miktar = int.Parse(args[1]);
    int sepetId = (int)gvSepet.GetRowValues(rowId, "SepetId");

    cn.InsUpdDel("UPDATE Sepet SET Miktar = " + miktar +
                 " WHERE SepetId = " + sepetId);
    cn.InsUpdDel("UPDATE Sepet2 SET Miktar = " + miktar +
                 " WHERE SepetId = " + sepetId);
}
```

**Kredi Limiti Kontrolü:**
```csharp
if (odemeTurId == "1000000006" || odemeTurId == "1000000007") // Vadeli
{
    DataRow dr = cn.DataRowGetir(@"
        SELECT cr.LimitAc, cr.Limit,
               (SELECT SUM(cb.BorcTutar) FROM CariBakiye cb
                WHERE cb.CariId = cr.CariId) AS KullanilmisLimit
        FROM Cariler cr WHERE cr.CariId = " + cariId);

    decimal kalanLimit = Convert.ToDecimal(dr["Limit"]) -
                         Convert.ToDecimal(dr["KullanilmisLimit"]);
    decimal sepetToplam = Convert.ToDecimal(genelToplam);

    if (kalanLimit < sepetToplam)
    {
        btnGonder.Enabled = false;
        btnGonder.Text = "Kredi limitiniz yetersizdir";
    }
}
```

#### 6. Sipariş Oluşturma (basket.aspx → btnGonder_Click)

**Akış:**
```
1. Sepet → SiparisDetay kopyalama
2. SiparisDetay'dan Siparisler oluşturma (GUID ile)
3. SiparisDetay.SiparisId güncelleme
4. CariBakiye'ye borç kaydetme
5. Sepet temizleme
6. Ödeme türüne göre yönlendirme:
   - Kredi Kartı → /kredi-karti-odeme
   - Diğer → /siparis-basarili
```

**Kod:**
```csharp
protected void btnGonder_ServerClick(object sender, EventArgs e)
{
    string guidKey = Guid.NewGuid().ToString();

    // 1. Sepet → SiparisDetay
    cn.InsUpdDel(@"
        INSERT INTO SiparisDetay (CariId, UrunId, Miktar, BirimFiyat, ...)
        SELECT CariId, UrunId, Miktar, ... FROM Sepet
        WHERE CariId = " + cariId + " AND Secili = 'True'");

    // 2. Sipariş oluştur
    cn.InsUpdDel(@"
        INSERT INTO Siparisler (CariId, Tutar, Kdv, GenelTutar,
                                OdemeTurId, SiparisGuidNo, VadeTarihi)
        SELECT " + cariId + ", SUM(Toplam), SUM(KDV), SUM(ToplamFiyat),
               " + odemeTurId + ", '" + guidKey + "',
               DATEADD(DAY, (SELECT VadeGun FROM OdemeTurleri
                             WHERE TurId = " + odemeTurId + "), GETDATE())
        FROM SiparisDetay WHERE CariId = " + cariId + " AND SiparisId IS NULL");

    // 3. SiparisDetay güncelle
    int siparisId = (int)cn.DataRowGetir(
        "SELECT SiparisId FROM Siparisler WHERE SiparisGuidNo = '" + guidKey + "'")["SiparisId"];

    cn.InsUpdDel("UPDATE SiparisDetay SET SiparisId = " + siparisId +
                 " WHERE CariId = " + cariId + " AND SiparisId IS NULL");

    // 4. Cari bakiye kaydet
    decimal genelToplam = ...; // Hesaplanmış toplam
    cn.InsUpdDel(@"
        INSERT INTO CariBakiye (CariId, SiparisId, BorcTutar, HareketTurId)
        VALUES (" + cariId + ", " + siparisId + ", " + genelToplam + ", 1)");

    // 5. Sepeti temizle
    cn.InsUpdDel("DELETE FROM Sepet WHERE CariId = " + cariId);
    cn.InsUpdDel("DELETE FROM Sepet2 WHERE CariId = " + cariId);

    // 6. Yönlendirme
    if (odemeTurId == "1000000001") // Kredi kartı
    {
        Session["sSiparisId"] = siparisId;
        Response.Redirect("/kredi-karti-odeme");
    }
    else
    {
        Response.Redirect("/siparis-basarili");
    }
}
```

### Admin Sayfaları

#### 1. Sipariş Yönetimi (Admin/tum-siparisler.aspx)

**Filtreleme:**
- Sipariş durumu
- Tarih aralığı
- Cari
- Sipariş no

**Toplu İşlemler:**
- Sipariş onaylama
- Kargoya verme
- İptal etme

#### 2. Ürün Yönetimi (Admin/urun-listesi.aspx)

**İşlevler:**
- Ürün ekleme
- Ürün düzenleme
- Ürün silme
- Resim yükleme
- Toplu fiyat güncelleme

---

## 🛠️ Kullanılan Teknolojiler {#teknolojiler}

### Backend

| Teknoloji | Versiyon | Kullanım Alanı |
|-----------|----------|----------------|
| ASP.NET Web Forms | 4.6.1 | Ana framework |
| C# | 6.0 | Programlama dili |
| SQL Server | 2012+ | Veritabanı |
| DevExpress | 22.2.6 | UI kontrolleri |
| Newtonsoft.Json | - | JSON parsing |
| BCrypt.Net | - | Password hashing (önerilir) |

### Frontend

| Teknoloji | Versiyon | Kullanım Alanı |
|-----------|----------|----------------|
| Bootstrap | 3.x | CSS framework |
| jQuery | 3.x | JavaScript |
| Font Awesome | 5.x | İkonlar |
| Morris.js | 0.5.x | Grafikler |
| Select2 | 4.x | Dropdown'lar |
| Bootstrap Datepicker | - | Tarih seçici |

### DevExpress Kontrolleri

- **ASPxGridView:** Veri tabloları
- **ASPxPopupControl:** Modal pencereler
- **ASPxTextBox:** Gelişmiş input'lar
- **ASPxButton:** Butonlar
- **ASPxComboBox:** Dropdown'lar
- **ASPxDateEdit:** Tarih seçici
- **ASPxChart:** Grafikler
- **ASPxPivotGrid:** Pivot tablolar
- **ASPxWebDocumentViewer:** Rapor görüntüleyici

---

## 🔧 Sorun Giderme {#sorun-giderme}

### Yaygın Hatalar

#### 1. "Login failed for user 'sa'"

**Neden:** SQL Server bağlantı hatası

**Çözüm:**
```xml
<!-- Web.config güncelle -->
<add name="gediz"
     connectionString="Data Source=DOGRU_SUNUCU;
                      Initial Catalog=gediz;
                      User ID=DOGRU_KULLANICI;
                      Password=DOGRU_SIFRE" />
```

#### 2. "Could not load file or assembly 'DevExpress.Web.v22.2'"

**Neden:** DevExpress DLL'leri eksik

**Çözüm:**
```powershell
# NuGet package restore
nuget restore GedizMakina.sln
```

#### 3. Session timeout

**Neden:** IIS session ayarları

**Çözüm:**
```xml
<!-- Web.config -->
<system.web>
  <sessionState timeout="60" mode="InProc" />
</system.web>
```

#### 4. "Object reference not set to an instance"

**Neden:** Session değerleri null

**Çözüm:**
```csharp
// Her sayfada kontrol ekle
if (Session["sLoginId"] == null)
{
    Response.Redirect("/giris");
    return;
}
```

### Performance İyileştirme

#### 1. SQL Query Optimizasyonu

**Önce:**
```csharp
// N+1 query problemi
foreach (GridViewRow row in gvSiparisler.Rows)
{
    int siparisId = (int)row["SiparisId"];
    DataTable dt = cn.DataTableGetir(
        "SELECT * FROM SiparisDetay WHERE SiparisId = " + siparisId);
}
```

**Sonra:**
```csharp
// Tek sorgu
DataTable dt = cn.DataTableGetir(@"
    SELECT s.*, sd.*
    FROM Siparisler s
    LEFT JOIN SiparisDetay sd ON s.SiparisId = sd.SiparisId
    WHERE s.CariId = " + cariId);
```

#### 2. ViewState Optimizasyonu

```aspx
<!-- Gereksiz ViewState kapat -->
<dx:ASPxGridView EnableViewState="false" ... />
```

#### 3. Caching

```csharp
// Kategori listesi cache'le
if (Cache["Kategoriler"] == null)
{
    DataTable dt = cn.DataTableGetir("SELECT * FROM Kategoriler");
    Cache.Insert("Kategoriler", dt, null,
                 DateTime.Now.AddHours(1),
                 TimeSpan.Zero);
}
```

### Monitoring

#### 1. Error Logging

```csharp
// Global.asax.cs
protected void Application_Error(object sender, EventArgs e)
{
    Exception ex = Server.GetLastError();

    // Log to file
    string logPath = Server.MapPath("~/App_Data/Errors.log");
    File.AppendAllText(logPath,
        DateTime.Now + " - " + ex.Message + "\n" + ex.StackTrace + "\n\n");
}
```

#### 2. Performance Counters

```csharp
// Web.config
<system.diagnostics>
  <trace enabled="true" pageOutput="false" />
</system.diagnostics>
```

---

**Son Güncelleme:** 24 Ekim 2025
**Versiyon:** 1.0
