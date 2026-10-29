# Flutter UI ve Widget Mimarisi — Sorular ve Cevaplar

## Klasik Sorular

<div style="background-color: rgba(31, 41, 55, 0.045); border: 1px solid rgba(75, 85, 99, 0.35); border-radius: 10px; padding: 16px 20px; margin: 18px 0;">

**Soru 1:** `FutureBuilder` ile `StreamBuilder` arasındaki temel fark nedir? Canlı borsa verisi veya anlık sohbet uygulaması geliştirirken hangisi tercih edilmeli ve neden?

**Cevap:** **StreamBuilder.** `FutureBuilder` tek seferlik istekleri dinler ve sonucu bir kez gösterir; `StreamBuilder` ise sürekli veri akışını dinleyip her yeni veride arayüzü günceller. Canlı borsa ve sohbet için sürekli akış gerektiğinden doğru seçim `StreamBuilder`'dır.

</div>

<div style="background-color: rgba(31, 41, 55, 0.045); border: 1px solid rgba(75, 85, 99, 0.35); border-radius: 10px; padding: 16px 20px; margin: 18px 0;">

**Soru 2:** Kullanıcıdan düz metin girişi almak için hangi widget kullanılır? Girilen verinin kurallara uygunluğunu denetlemek (form doğrulaması) için hangi gelişmiş sürüm tercih edilmelidir?

**Cevap:** **TextField** (giriş) ve **TextFormField** (doğrulama). `TextFormField`, `Form` ve `validator` ile birlikte çalışarak hatalı girişleri bildirir.

</div>

## Çoktan Seçmeli Sorular

<div style="background-color: rgba(31, 41, 55, 0.045); border: 1px solid rgba(75, 85, 99, 0.35); border-radius: 10px; padding: 16px 20px; margin: 18px 0;">

**Soru 3:** iOS cihazların doğal görünüm ve hissiyatını taşıyan, Apple'ın tasarım standartlarına uygun arayüz bileşenlerini (örneğin aç-kapat anahtarı) kullanmak isteyen bir geliştirici hangi widget kütüphanesini tercih etmelidir?

- **A)** Material Design
- **B)** Cupertino
- **C)** Sliver
- **D)** Semantic
- **E)** CustomScrollView

**Cevap:** **B) Cupertino.** iOS tasarım diline uygun hazır widget'lar (örneğin `CupertinoSwitch`) sunar.

</div>

<div style="background-color: rgba(31, 41, 55, 0.045); border: 1px solid rgba(75, 85, 99, 0.35); border-radius: 10px; padding: 16px 20px; margin: 18px 0;">

**Soru 4:** Uzun listelerde belleği korumak ve yüksek performans sağlamak için yalnızca ekranda görünen dilimleri (sliver) çizen kaydırma bileşeni hangisidir?

- **A)** SingleChildScrollView
- **B)** SliverList
- **C)** GridView
- **D)** CustomScrollView
- **E)** Stack

**Cevap:** **B) SliverList.** Yalnızca görünür öğeleri oluşturduğu için (lazy rendering) uzun listelerde bellek ve performans tasarrufu sağlar.

</div>
