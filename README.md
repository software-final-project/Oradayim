# Oradayim

Oradayim, kullanıcıların ziyaret ettikleri mekanları değerlendirip deneyimlerini paylaşabilecekleri bir mobil uygulamadır. Bu uygulama, Flutter ve Firebase teknolojileri kullanılarak geliştirilmiştir.

## Proje Ekibi
- İbrahim Yitiz
- Rıdvan Bekleviç
- Yusuf Duman

## Özellikler

### 1. Kullanıcı İşlemleri
- Kullanıcı kaydı ve girişi
- Profil yönetimi
- Arkadaş takip sistemi

### 2. Mekan İşlemleri
- Mekan ekleme ve düzenleme
- Konum bazlı mekan arama
- Mekan değerlendirme ve puanlama
- Fiyat, lezzet ve hizmet kalitesi değerlendirmesi

### 3. Sosyal Özellikler
- Deneyim paylaşımı
- Arkadaş aktivite akışı
- Yorum ve beğeni sistemi

### 4. Analitik ve Raporlama
- Kişisel harcama analizi
- Popüler mekanlar listesi
- Fiyat/performans sıralaması
- İstatistiksel raporlar

## Teknik Altyapı

### Kullanılan Teknolojiler
- Flutter (UI Framework)
- Firebase Authentication (Kullanıcı yönetimi)
- Firebase Firestore (Veritabanı)
- Firebase Storage (Medya depolama)
- Google Maps API (Konum servisleri)

## Kurulum Adımları

1. Flutter Kurulumu
```bash
flutter pub get
```

2. Firebase Yapılandırması
- Firebase Console'dan yeni proje oluşturun
- google-services.json ve GoogleService-Info.plist dosyalarını projeye ekleyin
- Firebase bağımlılıklarını pubspec.yaml'a ekleyin

3. Google Maps API Yapılandırması
- Google Cloud Console'dan API anahtarı alın
- API anahtarını AndroidManifest.xml ve AppDelegate.swift dosyalarına ekleyin

## Proje Yapısı

```
lib/
├── models/         # Veri modelleri
├── views/          # UI ekranları
├── controllers/    # İş mantığı
├── services/       # Firebase ve API servisleri
├── utils/          # Yardımcı fonksiyonlar
└── widgets/        # Yeniden kullanılabilir widget'lar
```

## Geliştirme Adımları

1. Temel Yapı
- [ ] Proje iskeletinin oluşturulması
- [ ] Firebase entegrasyonu
- [ ] Tema ve stil tanımlamaları

2. Kullanıcı İşlemleri
- [ ] Giriş/kayıt ekranları
- [ ] Profil yönetimi
- [ ] Kullanıcı ayarları

3. Mekan İşlemleri
- [ ] Mekan ekleme formu
- [ ] Mekan listeleme ve arama
- [ ] Değerlendirme sistemi

4. Sosyal Özellikler
- [ ] Arkadaş sistemi
- [ ] Aktivite akışı
- [ ] Bildirim sistemi

5. Analitik ve Raporlama
- [ ] Harcama takibi
- [ ] İstatistik görünümleri
- [ ] Mekan sıralamaları

## Katkıda Bulunma

1. Bu repository'yi fork edin
2. Yeni bir feature branch oluşturun (`git checkout -b feature/amazing-feature`)
3. Değişikliklerinizi commit edin (`git commit -m 'Add some amazing feature'`)
4. Branch'inizi push edin (`git push origin feature/amazing-feature`)
5. Pull Request oluşturun

## Lisans

Bu proje [MIT License](LICENSE) altında lisanslanmıştır.
