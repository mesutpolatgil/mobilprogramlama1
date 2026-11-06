&nbsp;

---

<br>

&nbsp;

# BÖLÜM I: ÇOKTAN SEÇMELİ SORULAR

---

### SORU 1 — *Jestler, İşaretçi Olayları ve Hareket Arenası (Gesture Arena)*

Flutter mimarisinde dokunma, sürükleme ve hareket algılama süreçleri, donanım seviyesindeki **İşaretçi Olayları (Pointer Events)** ile uygulama seviyesindeki anlamsal **Jestler (Gestures)** arasında iki katmanlı bir yapıyla işletilir. İç içe widget hiyerarşilerinde veya birden fazla hareket tanıyıcının (`GestureRecognizer`) aynı işaretçi olayını dinlediği durumlarda olası çakışmalar **Hareket Arenası (Gesture Arena)** mekanizması ile çözümlenir (*gesture disambiguation*).

Dikey yönde kaydırılabilen bir `ListView` içerisinde yer alan bir kart bileşeni hem bir `HorizontalDragGestureRecognizer` (yatay sürükleme) hem de bir `TapGestureRecognizer` (tek dokunma) ile donatılmıştır. Kullanıcı parmağını ekrana koyup hafif çapraz bir eğimle sürüklemeye başladığında işletilen olay çözümleme süreciyle ilgili olarak;

**Flutter'ın Hareket Arenası (Gesture Arena) kuralları ve işaretçi yayılımı göz önüne alındığında, aşağıdaki ifadelerden hangisi KESİNLİKLE DOĞRUDUR?**

- **A)** Arenaya ilk kayıt yaptıran (*first to register*) jest tanıyıcı daima önceliklidir; ilk `PointerDownEvent` anında varsayılan olarak kazanır ve diğer tüm tanıyıcılar derhal iptal edilir.  
- **B)** Ham işaretçi olayları (`PointerEvent`) doğrudan `GestureDetector` tarafından tüketilir; bir alt widget olan `Listener`, arenada zafer ilan edilmeden önce gelen ham hareketleri (`PointerMoveEvent`) asla okuyamaz.  
- **C)** Bir `GestureRecognizer`, arena henüz karara varmadan önce kendi zafer eşik kriterini aşarsa (örneğin kaydırma eşik mesafesini geçmesi), arenaya zafer bildiriminde bulunabilir (`acceptGesture`); bu durumda arena diğer yarışmacı tanıyıcılara doğrudan yenilgi (`rejectGesture`) gönderir.  
- **D)** `GestureArenaManager`, aynı işaretçi akışı (`pointer stream`) için birden fazla tanıyıcının aynı anda zafer kazanmasını destekler; böylece hem dokunma (`onTap`) hem de sürükleme (`onHorizontalDragUpdate`) geri çağırmaları aynı anda eşzamanlı olarak tetiklenir.  
- **E)** Arenadaki tüm jest tanıyıcılar yenilgiyi kabul eder veya arenadan çekilirse, son işaretçi olayı (`PointerUpEvent`) işletim sistemi çekirdeğine (Android/iOS) geri iade edilerek yerel pencere yöneticisi tarafından native jest olarak işlenir.

---

### SORU 2 — *Shortcuts, Actions ve Intent Mimarisi*

Büyük ölçekli ve masaüstü/web uyumlu Flutter uygulamalarında; fiziksel klavye kısayollarını doğrudan `RawKeyboardListener` veya dağınık `onKey` fonksiyonlarıyla yakalamak yerine **`Shortcuts`**, **`Actions`** ve **`Intent`** katmanlarından oluşan ayrık mimari (decoupled architecture) tercih edilmektedir.

Bir kelime işlemci uygulamasında `Ctrl + S` (macOS'ta `Cmd + S`) tuş kombinasyonuyla belgenin kaydedilmesi istenmektedir. Aynı kaydetme işleminin hem bu klavye kısayoluyla hem de uygulama çubuğundaki (AppBar) "Kaydet" ikon butonuna basıldığında **tek bir merkezden ve kod tekrarı olmadan** tetiklenmesi hedeflenmektedir.

**Flutter dokümantasyonunda tanımlanan Shortcuts, Actions ve Intent mimari prensipleri dikkate alındığında, aşağıdaki ifadelerden hangisi YANLIŞTIR?**

- **A)** `Shortcuts` widget'ı, fiziksel klavye tuş kombinasyonlarını (örneğin `LogicalKeySet`) dinler ve bunları doğrudan iş mantığı çalıştırmak yerine mantıksal bir `Intent` nesnesine dönüştürür (*key-to-intent binding*).  
- **B)** `Intent`, gerçekleştirilmek istenen eylemin türünü ve varsa eylem için gereken argümanları taşıyan hafif bir veri modelidir (*payload/data class*); UI veya iş mantığı içermez.  
- **C)** `Action<T extends Intent>`, ilgili `Intent`'i kabul ederek `invoke(covariant T intent)` metodu içerisinde asıl iş mantığını yürüten ve eylemin o an yürütülebilir olup olmadığını (`isEnabled`) kontrol edebilen sınıftır.  
- **D)** Bir `IconButton`'ın `onPressed` geri çağırmasında klavyeden bağımsız olarak aynı eylemi tetiklemek için `Actions.invoke(context, SaveIntent())` yöntemi kullanılır.  
- **E)** `Actions` widget'ı, işletim sisteminden gelen ham donanım tuş tarama kodlarını (*scan codes*) doğrudan yakalamak için zorunlu olarak bir `FocusNode`'a sahip olmak zorundadır; `Shortcuts` widget'ı olmadan da fiziksel tuşları doğrudan eyleme bağlayabilir.

---

<br>

&nbsp;

# BÖLÜM II: KLASİK / AÇIK UÇLU KISA CEVAPLI SORULAR

---

### SORU 3 — *Formlar, Odak Sistemi ve Kaynak Yönetimi (dispose)*

Flutter'da kullanıcı etkileşimli bir form geliştirilirken metin girdilerini yönetmek ve odak akışını kontrol etmek amacıyla `TextEditingController` ve `FocusNode` sınıflarından yararlanılır. Bu nesneler genellikle bir `StatefulWidget`'ın `State` nesnesi içerisinde örneklenir.

**Soru:**  
Bir `StatefulWidget` içerisinde tanımlanan `TextEditingController` ve `FocusNode` nesnelerinin, State sınıfının `dispose()` yaşam döngüsü metodu içerisinde (`controller.dispose()`, `focusNode.dispose()`) açıkça temizlenmesi mimari açıdan **neden zorunludur?**  
Bu temizleme işlemi ihmal edildiğinde uygulama seviyesinde **ne tür bir teknik problem ortaya çıkar?** *(Cevabınızı en fazla 3-4 cümle ile açıklayınız.)*

---

### SORU 4 — *Dismissible Widget'ı, Key Mekanizması ve State Senkronizasyonu*

Flutter'da kaydırarak kapatma/silme listeleri oluşturulurken `Dismissible` widget'ı kullanılır. Flutter mimarisinde her bir `Dismissible` bileşenine benzersiz bir `key` (örneğin `ValueKey(item.id)`) atanması zorunludur.

**Soru:**  
Bir geliştirici, listedeki her bir `Dismissible` öğesinin `key` parametresine elemanın benzersiz veritabanı ID'si yerine liste indeksini (`Key(index.toString())`) atamıştır. Listeden aradaki bir öğe kaydırılarak silindiğinde, Flutter'ın **Widget — Element/State ağacı eşleştirme mantığından** ötürü arayüzde (UI) ve veri modelinde **nasıl bir senkronizasyon/görsel durum hatası meydana gelir?** *(Cevabınızı en fazla 3-4 cümle ile açıklayınız.)*

---

<br>
<br>

&nbsp;

# 📝 AYRINTILI CEVAP ANAHTARI VE DEĞERLENDİRME&nbsp;

---

### SORU 1 CEVAP ANAHTARI

* **Doğru Seçenek:** **C**  
* **Kapsam:** *Kısım III — Bölüm 9: Dokunmalar, Sürüklemeler ve Diğer Hareketler (Hareket Arenası & Jest Çözümleme)*  
* **Ayrıntılı Çözüm ve Analiz:**  
  - **C seçeneği DOĞRUDUR:** Flutter'ın `GestureArenaManager` mimarisinde bir jest tanıyıcı (`GestureRecognizer`), hareket eşiğini (drag slop / displacement threshold) aştığı anda arenaya zafer bildiriminde bulunur (`GestureArenaEntry.resolve(GestureDisposition.accepted)`). Arena kazananı ilan ettiği an, arenada bulunan diğer tüm rakip tanıyıcılara yenilgi bildirimi (`rejectGesture`) gönderilir ve dinleyicileri serbest bırakılır.  
  - **A seçeneği YANLIŞTIR:** İlk kayıt olan tanıyıcı otomatik kazanmaz. Tersine, hareketin türü (dokunma mı, kaydırma mı) belli olana kadar arena beklemede kalır (*disambiguation* süreci).  
  - **B seçeneği YANLIŞTIR:** `Listener` widget'ı, arenadan ve `GestureDetector`'dan bağımsız olarak ham işaretçi olaylarını (`PointerDownEvent`, `PointerMoveEvent`) en alt seviyede doğrudan dinleyebilir.  
  - **D seçeneği YANLIŞTIR:** Bir hareket arenası tek bir işaretçi için **yalnızca tek bir kazanan** (*eager win / default win*) belirler; birden fazla tanıyıcının aynı anda zafer kazanıp çakışan olayları eşzamanlı tetiklemesine izin verilmez.  
  - **E seçeneği YANLIŞTIR:** Olaylar çekirdeğe geri iletilmez; olay akışı Flutter mimarisi içinde sonlanır.

---

### SORU 2 CEVAP ANAHTARI

* **Doğru Seçenek:** **E** *(Yanlış ifade olduğu için işaretlenecek seçenek)*  
* **Kapsam:** *Kısım V — Bölüm 21: Eylemleri ve Kısayolları Kullanma (Shortcuts & Actions & Intent Mimarisi)*  
* **Ayrıntılı Çözüm ve Analiz:**  
  - **E seçeneği YANLIŞTIR (İşaretlenecek şık):** `Actions` widget'ı donanım tarama kodlarını doğrudan yakalamaz ve tek başına fiziksel tuşları çözümleyemez. Tuş vuruşlarını dinleme ve bunları semantik `Intent` nesnelerine dönüştürme sorumluluğu tamamen **`Shortcuts`** widget'ına aittir. `Actions` yalnızca gelen `Intent`'leri karşılar.  
  - **A, B, C ve D seçenekleri DOĞRUDUR:** Mimaride `Shortcuts` tuşları Intent'e eşler; `Intent` eylemi temsil eden veri taşıyıcıdır; `Action` ise iş mantığını yürüten ve `isEnabled` kontrolü yapabilen sınıftır. `Actions.invoke(context, Intent)` ile UI üzerindeki butonlar da aynı iş mantığını doğrudan tetikleyebilir.

---

### SORU 3 CEVAP ANAHTARI

* **Kapsam:** *Kısım IV — Bölüm 16: Metin Alanının Değerini Alma & Bölüm 18: Odak ve Metin Alanları*  
* **Örnek Model Cevap:**  
  > `TextEditingController` ve `FocusNode` nesneleri, arka planda yerel işletim sistemi metin servislerine (platform text input channel) ve Flutter odak ağacına bağlı çalışan `ChangeNotifier` tabanlı kaynaklardır. İlgili widget ağaçtan çıkarıldığında bu nesneler `dispose()` ile serbest bırakılmazsa, dinleyicileri (listeners) bellekte asılı kalmaya devam eder ve Çöp Toplayıcı (Garbage Collector) tarafından temizlenemez. Bu durum uygulamada **bellek sızıntısına (memory leak)** ve ekrandan kaldırılmış bir widget durumuna bildirim göndermeye çalışan **"zombi dinleyicilerin"** tetiklenmesine yol açar.

&nbsp;

---

### SORU 4 CEVAP ANAHTARI

* **Kapsam:** *Kısım III — Bölüm 14: Kaydırarak Kapatma / Silme Uygulama (Dismissible & Key Mimarisi)*  
* **Örnek Model Cevap:**

&nbsp;

Flutter, widget ağacı her güncellendiğinde widget türü ve `Key` değerine bakarak mevcut `Element` ve `State` nesnelerini korur veya yeniden kullanır. Liste indeksi key olarak verildiğinde (`Key(index.toString())`), aradan bir eleman silindiğinde altındaki elemanların indeksleri birer basamak yukarı kayar. Flutter aynı indeksi (örneğin `'1'`) ve aynı widget tipini görmeye devam ettiği için silinen elemana ait iç durumu (State, animasyon durumu veya seçim verisi), yeni kayan elemana yanlışlıkla aktarır; bu da veri modeli ile ekrandaki arayüz durumunun birbirinden kopmasına ve yanlış satırın silinmiş/değişmiş görünmesine neden olur.

&nbsp;

---

*Dokümantasyon Kaynağı: Flutter Resmi Dokümantasyon Çeviri Külliyatı (docs.flutter.dev)*