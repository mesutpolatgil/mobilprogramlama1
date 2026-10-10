# Dart Dil Rehberi – Sınav Soruları (2. Set)

**Takım:** 2. Takım · codemiks
**Konu:** Çıktı tahmini · Hata ayıklama · Dart'a özgü davranışlar
**Tarih:** 20 / 10 / 2026

---

## A. Çoktan Seçmeli Sorular

### Soru 1 (Fonksiyon eşitliği)

Aşağıdaki kod çalıştırıldığında ekrana sırasıyla ne yazdırılır?

```dart
class Sayac {
  void artir() {}
}
void yazdir() {}
void main() {
  var a = Sayac();
  var b = Sayac();
  var c = a;
  print(a.artir == c.artir);
  print(a.artir == b.artir);
  Function f = yazdir;
  print(f == yazdir);
}
```

- A) true, true, true
- B) false, false, true
- C) true, false, true
- D) true, false, false

### Soru 2 (Koruma ifadesi / guard)

Aşağıdaki kod çalıştırıldığında ekrana sırasıyla ne yazdırılır?

```dart
String tanimla(Object o) => switch (o) {
  int n when n > 10 => 'büyük',
  int n when n.isEven => 'çift',
  int n => 'tek: $n',
  _ => 'bilinmiyor',
};
void main() {
  print(tanimla(12));
  print(tanimla(8));
  print(tanimla(7));
}
```

- A) çift, çift, tek: 7
- B) büyük, bilinmiyor, bilinmiyor
- C) Derleme hatası
- D) büyük, çift, tek: 7

---

## B. Açık Uçlu Sorular

### Soru 3 (Hata ayıklama)

Aşağıdaki fonksiyon derlenmez.

```dart
List<String> komutSatiri(
  String calistirici,
  List<String> secenekler, [
  List<String>? ekSecenekler,
]) {
  return [
    calistirici,
    ...secenekler,
    ...ekSecenekler,
  ];
}
```

- a) Derleme hatasının nedenini açıklayın.
- b) Hatayı nasıl düzeltirsiniz? Düzeltilmiş satırı yazın.
- c) Düzeltmeden sonra `komutSatiri('dart', ['run'], null)` çağrısının sonucu ne olur? Koleksiyonun kendisi null olduğunda ile koleksiyonun içinde null elemanlar olduğunda null-farkındalıklı spread'in davranışı arasındaki farkı açıklayın.

### Soru 4 (Döngüler ve closure'lar)

Aşağıdaki iki kod parçasını inceleyin.

```dart
// Parça 1
var geriCagrilar = [];
for (var i = 0; i < 3; i++) {
  geriCagrilar.add(() => print(i * 10));
}
for (final c in geriCagrilar) {
  c();
}
```

```dart
// Parça 2
var adaylar = ['Ali', 'Veli'];
for (var aday in adaylar) {
  aday = 'Mehmet';
}
print(adaylar);
```

- a) Her iki parçanın çıktısını yazın ve nedenini açıklayın.
- b) Parça 1'in birebir karşılığı, klasik `var` ile yazılmış bir JavaScript döngüsünde ne yazdırırdı? Dart'ın bu davranışı hangi yaygın tuzaktan kaçınmayı sağlar?

---

## Cevap Anahtarı

*Öğretmen / değerlendirici için*

### Soru 1 – Doğru cevap: C

Çıktı: `true`, `false`, `true`. Aynı örneğe bağlı iki closure eşittir: `a` ve `c` aynı nesneyi gösterdiği için `a.artir == c.artir` değeri `true` olur. Farklı örneklere bağlı closure'lar eşit değildir: `a` ve `b` ayrı nesnelerdir, bu yüzden `a.artir == b.artir` değeri `false` olur. Üst düzey fonksiyonlar kendileriyle karşılaştırıldığında eşittir, dolayısıyla `f == yazdir` değeri `true` olur.

### Soru 2 – Doğru cevap: D

Case'ler yukarıdan aşağıya denenir. `tanimla(12)`: ilk case'in koruma ifadesi (`n > 10`) doğru olduğu için `'büyük'` döner. `tanimla(8)`: ilk guard yanlıştır, ancak koruma ifadesi `false` olduğunda çalışma switch'ten çıkmaz, bir sonraki case'e geçer; ikinci guard (`n.isEven`) doğru olduğundan `'çift'` döner. `tanimla(7)`: iki guard da yanlıştır, korumasız `int n` case'i eşleşir ve `'tek: 7'` döner. Yani guard'ın `false` olması `_` (varsayılan) case'ine düşmek anlamına gelmez.

### Soru 3 – Örnek cevap

- a) `ekSecenekler` parametresi `List<String>?` tipindedir, yani null olabilir. Null güvenliği nedeniyle null olabilecek bir değer üzerinde normal spread (`...`) kullanılamaz; bu derleme zamanı hatasıdır.
- b) Null-farkındalıklı spread elemanı kullanılır: `...?ekSecenekler,`
- c) Sonuç `[dart, run]` olur. Koleksiyonun kendisi null ise null-farkındalıklı spread hiçbir şey eklemez (koleksiyon yok sayılır). Koleksiyon null değilse ama içinde null elemanlar varsa, bu null elemanlar yine de sonuca eklenir. Örnek: `[0, ...?a, ...?b, 4]` ifadesinde `a` null ve `b = [1, null, 3]` ise sonuç `[0, 1, null, 3, 4]` olur.

### Soru 4 – Örnek cevap

- a) Parça 1 sırasıyla `0`, `10`, `20` yazdırır. Dart'ta `for` döngüsü içindeki closure'lar indeksin o yinelemedeki değerini yakalar. Parça 2 `[Ali, Veli]` yazdırır: for-in döngüsünde `aday` yerel bir değişkendir, ona yeniden değer atamak yalnızca o yinelemedeki yerel değişkeni değiştirir, orijinal `adaylar` listesini değiştirmez.
- b) Klasik `var` ile yazılmış JavaScript döngüsünde closure'lar aynı değişkeni paylaştığı için döngü bittikten sonraki değeri görür ve `30` üç kez yazdırılırdı (rehberdeki 2 yinelemelik örnekte `2` ve yine `2`). Dart bu sık karşılaşılan closure/döngü değişkeni tuzağından kaçınmayı sağlar.
