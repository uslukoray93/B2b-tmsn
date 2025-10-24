# TMSN B2B - Deployment Notlarım

## Proje Bilgileri
- **Repo:** https://github.com/uslukoray93/B2b-tmsn
- **Domain:** gedizmakina.com.tr
- **DB Server:** 185.139.5.125 (SQL Server)
- **DB Name:** gediz
- **Platform:** ASP.NET Web Forms 4.6.1
- **Hosting:** Plesk (Windows + IIS)

## Yapılan İşlemler

### 1. Proje Analizi
- ✅ Detaylı kod analizi yapıldı
- ✅ Güvenlik açıkları tespit edildi (SQL Injection, MD5)
- ✅ Mimari incelendi (Web Forms pattern)
- ✅ Veritabanı yapısı çıkarıldı

### 2. GitHub Hazırlığı
- ✅ .gitignore oluşturuldu
- ✅ Gereksiz dosyalar hariç tutuldu
- ⏳ GitHub'a push bekliyor

### 3. Deployment Planı
- GitHub → main branch
- Plesk otomatik pull (Git extension)
- Web.config sunucuda manuel düzenleme gerekecek

## Veritabanı Durumu
- **Lokal DB yok** (185.139.5.125'te hosted)
- Backup scripti gerekiyor (gelecekte)
- Migration planı lazım

## Kritik Notlar
- ⚠️ Web.config'de şifre var (GitHub'a gitmemeli)
- ⚠️ SA hesabı kullanılıyor (güvenlik riski)
- ⚠️ SQL Injection açıkları var (acil düzeltilmeli)

## Sonraki Adımlar
1. GitHub'a push
2. Plesk'ten pull
3. Web.config düzenle (connection string)
4. Test et
5. Güvenlik düzeltmeleri

---
*Not: Bu dosya sadece referans içindir, GitHub'a gitmiyor.*
