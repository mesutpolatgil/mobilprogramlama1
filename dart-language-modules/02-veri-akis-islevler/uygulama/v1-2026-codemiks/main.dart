typedef Ogrenci = ({String ad, int numara, List<int> notlar});
typedef NotDonusturucu = String Function(double ortalama);

sealed class Sonuc {}

class Gecti implements Sonuc {
  Gecti(this.harf);
  final String harf;
}

class Kaldi implements Sonuc {
  Kaldi(this.sebep);
  final String sebep;
}

class Devamsiz implements Sonuc {}

class GecersizNotHatasi implements Exception {
  GecersizNotHatasi(this.not);
  final int not;

  @override
  String toString() => 'GecersizNotHatasi: $not, 0-100 aralığında değil';
}

class Depo<T> {
  final _kayitlar = <T>[];

  void ekle(T kayit) => _kayitlar.add(kayit);
  int get sayi => _kayitlar.length;
  Iterable<T> where(bool Function(T) kosul) => _kayitlar.where(kosul);
  List<T> get hepsi => List.unmodifiable(_kayitlar);
}

class Ders {
  Ders(this.ad, {this.gecmeNotu = 50});

  final String ad;
  final int gecmeNotu;
  double _katsayi = 1.0;

  double get katsayi => _katsayi;
  set katsayi(double deger) {
    if (deger <= 0) throw ArgumentError('Katsayı pozitif olmalı: $deger');
    _katsayi = deger;
  }
}

double ortalama(List<int> notlar) =>
    notlar.isEmpty ? 0 : notlar.reduce((a, b) => a + b) / notlar.length;

String harfNotu(double ort) => switch (ort) {
      >= 90 => 'AA',
      >= 80 && < 90 => 'BA',
      >= 70 && < 80 => 'BB',
      >= 60 && < 70 => 'CB',
      >= 50 && < 60 => 'CC',
      _ => 'FF',
    };

Sonuc degerlendir(Ogrenci ogrenci, Ders ders) {
  final (:ad, :numara, :notlar) = ogrenci;
  if (notlar.isEmpty) return Devamsiz();
  final ort = ortalama(notlar) * ders.katsayi;
  return switch (ort) {
    final o when o >= ders.gecmeNotu => Gecti(harfNotu(o)),
    final o => Kaldi('$ad ($numara) ortalaması ${o.toStringAsFixed(1)}'),
  };
}

String sonucMetni(Sonuc sonuc) => switch (sonuc) {
      Gecti(:final harf) => 'Geçti ($harf)',
      Kaldi(:final sebep) => 'Kaldı: $sebep',
      Devamsiz() => 'Devamsız',
    };

(int enYuksek, int enDusuk, double ort) istatistik(Iterable<int> notlar) {
  var enYuksek = notlar.first;
  var enDusuk = notlar.first;
  for (final n in notlar) {
    if (n > enYuksek) enYuksek = n;
    if (n < enDusuk) enDusuk = n;
  }
  return (enYuksek, enDusuk, ortalama(notlar.toList()));
}

void notKontrol(int not) {
  if (not < 0 || not > 100) throw GecersizNotHatasi(not);
}

Ogrenci? jsondanOgrenci(Object? veri) {
  if (veri case {'ad': String ad, 'numara': int numara, 'notlar': List<Object?> ham}) {
    final notlar = <int>[];
    for (final n in ham) {
      if (n case int not) {
        notKontrol(not);
        notlar.add(not);
      }
    }
    return (ad: ad, numara: numara, notlar: notlar);
  }
  return null;
}

Iterable<int> notAraligi(int baslangic, int bitis, {int adim = 10}) sync* {
  for (var n = baslangic; n <= bitis; n += adim) {
    yield n;
  }
}

Stream<String> canliDuyuru(List<Ogrenci> liste) async* {
  for (final o in liste) {
    await Future<void>.delayed(const Duration(milliseconds: 50));
    yield '${o.ad} notları sisteme işlendi';
  }
}

int Function() sayacOlustur() {
  var sayac = 0;
  return () => ++sayac;
}

void baslik(String metin, [String? konu]) {
  print('');
  print('=== $metin${konu == null ? '' : '  [$konu]'} ===');
}

Future<void> main() async {
  final depo = Depo<Ogrenci>();
  final ders = Ders('Mobil Programlama I', gecmeNotu: 50);

  baslik('1. Veriyi okuma', 'Types · Collections · Patterns · Error handling');
  final gelenVeri = <Object?>[
    {'ad': 'Ayşe', 'numara': 101, 'notlar': [85, 92, 78]},
    {'ad': 'Mert', 'numara': 102, 'notlar': [45, 52, 38]},
    {'ad': 'Deniz', 'numara': 103, 'notlar': <int>[]},
    {'ad': 'Selin', 'numara': 104, 'notlar': [99, 'devamsız', 95]},
    {'ad': 'Hatalı', 'numara': 105, 'notlar': [120]},
    'bozuk kayıt',
  ];

  for (final veri in gelenVeri) {
    try {
      final ogrenci = jsondanOgrenci(veri);
      if (ogrenci == null) {
        print('Atlandı (biçim uygun değil): $veri');
        continue;
      }
      depo.ekle(ogrenci);
      print('Eklendi: ${ogrenci.ad} -> ${ogrenci.notlar}');
    } on GecersizNotHatasi catch (e) {
      print('Reddedildi: $e');
    } finally {
      assert(depo.sayi <= gelenVeri.length);
    }
  }
  print('Toplam kayıt: ${depo.sayi}');

  baslik('2. Değerlendirme', 'Records · Sealed class · Switch expression · Guard');
  for (final ogrenci in depo.hepsi) {
    final sonuc = degerlendir(ogrenci, ders);
    print('${ogrenci.ad.padRight(6)}: ${sonucMetni(sonuc)}');
  }

  baslik('3. İstatistik', 'Functions · Records (çoklu dönüş) · Loops');
  final tumNotlar = [for (final o in depo.hepsi) ...o.notlar];
  final (enYuksek, enDusuk, genelOrt) = istatistik(tumNotlar);
  print('En yüksek: $enYuksek, en düşük: $enDusuk, ortalama: ${genelOrt.toStringAsFixed(2)}');

  final harfDagilimi = <String, int>{};
  for (final o in depo.hepsi) {
    if (o.notlar.isEmpty) continue;
    harfDagilimi.update(harfNotu(ortalama(o.notlar)), (n) => n + 1, ifAbsent: () => 1);
  }
  print('Harf dağılımı: $harfDagilimi');

  baslik('4. Koleksiyon elemanları', 'Collection if/for · Spread · Null-aware');
  String? onurOgrencisi;
  for (final o in depo.hepsi) {
    if (o.notlar.isNotEmpty && ortalama(o.notlar) >= 85) {
      onurOgrencisi = o.ad;
      break;
    }
  }
  final rapor = [
    'Ders: ${ders.ad}',
    if (depo.sayi > 2) 'Kalabalık sınıf' else 'Küçük sınıf',
    for (final o in depo.where((o) => o.notlar.isNotEmpty)) '${o.numara}: ${o.ad}',
    ?onurOgrencisi,
  ];
  rapor.forEach(print);

  baslik('5. Fonksiyonlar', 'Tear-off · Closure · typedef · Named/optional params');
  final NotDonusturucu donustur = harfNotu;
  print('72.5 -> ${donustur(72.5)}');
  final sayac = sayacOlustur();
  sayac();
  sayac();
  print('Sayaç (closure): ${sayac()}');
  print('Not aralığı (sync* üreteç): ${notAraligi(40, 100, adim: 20).toList()}');

  baslik('6. Getter / Setter', 'Error handling');
  ders.katsayi = 1.1;
  print('Yeni katsayı: ${ders.katsayi}');
  try {
    ders.katsayi = -1;
  } on ArgumentError catch (e) {
    print('Hata yakalandı: ${e.message}');
  }

  baslik('7. Etiketli döngü', 'Loops · Labels');
  dis:
  for (final o in depo.hepsi) {
    for (final n in o.notlar) {
      if (n < 50) {
        print('${o.ad} adlı öğrencinin 50 altı notu var: $n');
        break dis;
      }
    }
  }

  baslik('8. Asenkron duyurular', 'async* üreteç · Stream');
  await for (final duyuru in canliDuyuru(depo.hepsi)) {
    print(duyuru);
  }
}
