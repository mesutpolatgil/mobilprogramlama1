> **Uyarı:** Bu içerik, SCÜ Şarkışla UBYO Mobil Programlama I dersi kapsamında tamamen eğitim amaçlı çevrilmiş ve derlenmiştir. Orijinal dokümantasyon kaynakları (dart.dev, docs.flutter.dev) kendi orijinal lisanslarına (BSD-3-Clause, CC-BY 4.0) tabidir. Bu çalışmanın hiçbir ticari amacı yoktur.

# dApp Access Auditor – Sorular ve Cevaplar

**Mobil Programlama I · 2026 Güz · Takım: TAKIM-ADI**

Bu metin, derste hazırlanan 2 sayfalık Türkçe soru-cevap belgesinin GitHub için düzenlenmiş sürümüdür. Kod örnekleri mümkün olan yerlerde kopyalanabilir metne dönüştürülmüştür; görseller ve diğer kaynak örnekleri ise özgün belgedeki sıraları korunarak eklenmiştir.

**Konu:** WCAG 2, EN 301 549, VPAT, otomatik erişilebilirlik denetimi · **Düzey:** orta

## İçindekiler

1. [Bölüm A – Klasik sorular](#bolum-a)
2. [Bölüm B – Test soruları](#bolum-b)

<a id="bolum-a"></a>

## Bölüm A – Klasik sorular

### Soru 1

Renk kontrastı için WCAG’ın önerdiği asgari oranları normal metin ve büyük metin için belirtiniz. Beyaz zemin üzerindeki #999999 renkli bir metnin sorun yaratmasının nedenini açıklayıp çözüm öneriniz.

**Cevap:** Normal metin için en az 4,5:1, büyük metin için 3:1 gerekir. Beyaz üzerinde #999999 yaklaşık 2,85:1 verir, yani eşiğin altında kalır ve düşük görme kullanıcıları metni zor okur. Çözüm: daha koyu bir gri kullanmak (örneğin #767676 yaklaşık 4,54:1 verir).

### Soru 2

Otomatik erişilebilirlik tarayıcılarının sınırları nelerdir? dApp Access Auditor bu sınırları kullanıcıya dürüst biçimde yansıtmak için raporda ve uygulamada hangi mekanizmaları kullanır? Cüzdan bağlı ekranlar örneğiyle açıklayınız.

**Cevap:** Otomatik araçlar WCAG ölçütlerinin yalnızca bir kısmını yakalar; anlam, odak sırası ve bağlam insan incelemesi ister. Araç tam uygunluk iddia etmez, bu ölçütleri raporda “Değerlendirilmedi” olarak işaretler. Cüzdan bağlı ekranlar (bağlantı penceresi, işlem onayı) otomatik taranamadığı için kullanıcı o ekrana gider ve Manuel Tarama Modunda “Bu durumu tara” der.

<a id="bolum-b"></a>

## Bölüm B – Test soruları

### Soru 3

WCAG 2.2’ye göre dokunma (işaretçi) hedefleri için asgari boyut aşağıdakilerden hangisidir?

- A) 12 x 12 CSS px
- B) 24 x 24 CSS px
- C) 44 x 44 CSS px
- D) 48 x 48 CSS px

**Cevap:** B) 24 x 24 CSS px. Bu WCAG 2.2’nin asgari şartıdır; 44 (iOS) ve 48 (Android) platform önerileridir.

### Soru 4

Bir dApp’te işlem durumu (bekliyor, başarılı, hata) mesajlarının ekran okuyucu kullanıcılarına, odağı değiştirmeden duyurulması için en uygun yöntem hangisidir?

- A) Mesajı yalnızca yeşil veya kırmızı renkle göstermek
- B) Mesaj kutusuna `title` özniteliği eklemek
- C) Mesajı `aria-live` özniteliği olan bir bölgede göstermek
- D) Mesaj belirdiğinde odağı otomatik olarak sayfanın başına taşımak

**Cevap:** C) `aria-live` bölgesi. Mesaj odağı taşımadan ekran okuyucuya duyurulur (WCAG 4.1.3). Yalnızca renk kullanmak 1.4.1’e aykırıdır.
