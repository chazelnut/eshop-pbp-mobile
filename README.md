# eshop_pbp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# Tugas 7
1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
    - Widget tree adalah hirarki widget yang membentuk UI Flutter (root -> anak -> cucu -> ...). Untuk hubungan parent-child, setiap widget (parent) memuat child widget sebagai bagian dari build, parent menentukan layout/posisi dan child menangani isi. Perubahan state di subtree memicu rebuild hanya pada subtree tersebut.
2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
    - aterialApp: root app yang menyediakan tema, routing, localization.
    - ThemeData/ColorScheme: konfigurasi tema warna.
    - Scaffold: struktur halaman (AppBar, body, dsb).
    - AppBar: bar atas dengan judul.
    - Text: menampilkan teks.
    - Padding/SizedBox/Center/Column/Row: layout dan spacing.
    - GridView.count: menampilkan grid item (3 kolom).
    - Card/Container: kotak UI dengan padding/ukuran.
    - MediaQuery: mendapatkan ukuran layar.
    - Icon/IconData: ikon pada kartu.
    - Material: widget material yang bisa diberi warna & borderRadius.
    - InkWell: menangani gesture (tap) dengan efek ripple.
    - SnackBar/ScaffoldMessenger: menampilkan pesan sementara.
    - ItemCard, InfoCard, ItemHomepage, MyHomePage, MyApp: widget/custom class di proyek (menyusun UI dan data).
3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
    - MaterialApp menyediakan fundamental app-level features seperti tema (Theme), routing (Navigator), localization, dan koneksi ke Material Design. Widget ini sering dipakai sebagai root karena menginisialisasi behavior Material (style, visual density, default scaffold/snack behavior) sehingga widget Material lain berfungsi konsisten.
4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
    - StatelessWidget: tidak menyimpan state internal, build hanya bergantung pada konstruktor/props. Dipilih untuk UI statis atau yang menerima data dari luar.
    - StatefulWidget: punya State yang bisa berubah. Dipilih saat UI perlu berubah selama runtime (timer, input, network, setState).
    - Kesimpulannya: Pilih Stateless jika tidak perlu perubahan internal dan pilih Stateful jika butuh lifecycle dan setState.
5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
    - BuildContext adalah referensi posisi widget di widget tree. Penting untuk mengakses inherited widgets (Theme.of, MediaQuery.of, Navigator.of, ScaffoldMessenger.of). Di metode build, context dipakai untuk mengambil theme/screen size/navigator dan untuk menempatkan widget relatif ke tree. Hindari menyimpan BuildContext untuk penggunaan jangka panjang, gunakan yang diberikan method build atau didChangeDependencies.
6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
    - Hot reload: memasukkan perubahan kode Dart ke running app tanpa restart penuh sehingga mempertahankan state (good for UI/layout changes) dan dijalankan dengan lebih cepat.
    - Hot restart: memulai ulang app Dart VM, menginisialisasi ulang state aplikasi (state hilang), tapi lebih lengkap jika perubahan struktural memerlukan restart.

# Tugas 8
1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
    - Navigator.push() menambahkan halaman baru ke atas stack navigasi, sehingga pengguna bisa kembali ke halaman sebelumnya dengan tombol back.
    - Navigator.pushReplacement() menggantikan halaman saat ini dengan halaman baru, sehingga halaman sebelumnya dihapus dari stack dan tidak bisa kembali dengan tombol back.
    - Pada aplikasi Emyu Shop, saya menggunakan Navigator.push() untuk navigasi yang sifatnya drill-down (misalnya dari menu ke detail produk, agar bisa kembali). Saya menggunakan Navigator.pushReplacement() untuk navigasi utama seperti dari drawer (menu samping) ke halaman utama atau form, agar tidak menumpuk halaman yang sama di stack dan mencegah back ke halaman yang sudah tidak relevan.

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
    - Setiap halaman utama menggunakan Scaffold sebagai root, yang menyediakan struktur dasar (AppBar, body, Drawer).
    - AppBar digunakan di bagian atas setiap halaman untuk menampilkan judul aplikasi secara konsisten.
    - Drawer (menu samping) digunakan di semua halaman utama dengan mengimpor dan menambahkan widget LeftDrawer, sehingga navigasi antar halaman utama selalu tersedia dan tampilan tetap seragam di seluruh aplikasi.

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
    - Padding memberikan jarak antar elemen sehingga tampilan lebih rapi dan mudah dibaca.
        Contoh: Setiap TextFormField di form produk dibungkus Padding agar tidak menempel satu sama lain.
    - SingleChildScrollView memungkinkan seluruh form di-scroll jika konten melebihi tinggi layar, sehingga form tetap bisa diakses pada layar kecil.
        Contoh: Form di ProductFormPage dibungkus SingleChildScrollView agar user bisa mengisi semua field tanpa terpotong layar.
    - ListView (meski tidak digunakan di form, tapi sering dipakai untuk daftar dinamis) memungkinkan tampilan list yang bisa discroll secara efisien.

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
    - Warna tema diatur di <main.dart> menggunakan ThemeData dan ColorScheme, misal dengan primarySwatch: Colors.red dan secondary: Colors.redAccent.
    - Warna-warna utama seperti AppBar, tombol, dan drawer menggunakan warna yang konsisten dari tema.
    - Untuk elemen khusus (seperti tombol menu utama), warna juga diatur secara eksplisit (biru, hijau, merah) agar tetap harmonis dengan tema utama aplikasi.
    - Dengan cara ini, seluruh aplikasi memiliki nuansa warna yang seragam dan mudah dikenali sebagai identitas visual Emyu Shop.
  
# Tugas 9
1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
    - Perlu Model: Agar data yang kita olah lebih terstruktur dan aman (Type Safety). Kita bisa mendefinisikan tipe data yang pasti (String, int, bool) sehingga compiler bisa membantu mendeteksi kesalahan sebelum aplikasi dijalankan.
    - Konsekuensi tanpa Model:
        1. Rawan Error: Jika salah mengetik nama key dalam Map (misal data['nmae'] padahal harusnya data['name']), error baru akan muncul saat aplikasi berjalan (runtime error).
        2. Tidak ada Autocomplete: Kita harus hafal semua key dari JSON.
        3. Sulit di-maintain: Jika struktur data dari backend berubah, kita harus mencari dan mengganti manual setiap pemanggilan Map di seluruh kode, sedangkan dengan model kita hanya perlu mengubah satu file saja.

2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
    - http: Library dasar untuk melakukan request HTTP (GET, POST, dll) ke server. Namun, library ini bersifat stateless, artinya dia tidak menyimpan sesi login secara otomatis.
    - CookieRequest (pbp_django_auth): Wrapper atau pembungkus di atas http yang dimodifikasi untuk menangani cookies secara otomatis.
    - Perbedaan: http digunakan untuk request biasa yang tidak butuh sesi yang persisten, sedangkan CookieRequest wajib digunakan untuk fitur yang butuh autentikasi (Login/Logout/CRUD User) karena ia menyimpan sessionid dan token CSRF yang dikirim Django, sehingga server mengenali user yang sedang login.

3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
    - Karena CookieRequest menyimpan state login (cookies). Jika kita membuat instance baru di setiap halaman (new CookieRequest()), cookies-nya akan kosong dan server akan menganggap user belum login (anonymous). Dengan membagikan satu instance yang sama (singleton) menggunakan Provider ke seluruh aplikasi, status login pengguna akan tetap terjaga konsisten saat berpindah-pindah halaman.

4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
    - 10.0.2.2: Alamat IP khusus yang digunakan Emulator Android untuk mengakses localhost komputer. Tanpa ini di ALLOWED_HOSTS, Django akan menolak request dari emulator dengan error DisallowedHost.
    - CORS (Cross-Origin Resource Sharing): Memberi izin kepada browser/client dari domain berbeda untuk mengakses resource Django. Tanpa ini, request (terutama dari web build) akan diblokir oleh browser demi keamanan.
    - SameSite/Cookie: Mengatur agar cookie sesi aman tetapi tetap bisa dikirim antar-domain jika diperlukan. Jika salah set, cookie sesi mungkin tidak tersimpan di browser/client sehingga login selalu gagal.
    - Internet Permission: Izin wajib di AndroidManifest.xml agar aplikasi Android boleh menggunakan jaringan internet. Jika lupa, aplikasi akan error SocketException atau tidak bisa connect sama sekali.

5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
    - Input: Pengguna mengisi form di Flutter -> Validasi Form (client-side).
Kirim (POST): Data diubah jadi JSON -> Dikirim via CookieRequest ke endpoint Django.
    - Proses Server: Django menerima request -> Validasi serializer -> Simpan ke Database -> Return response JSON (sukses/gagal).
    - Fetch (GET): Halaman list di Flutter melakukan request GET ke endpoint JSON Django.
    - Tampil: Flutter menerima JSON -> Parsing ke Objek Model Dart -> Widget (seperti ListView atau FutureBuilder) di-rebuild untuk menampilkan data terbaru.

6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
    - Register: Input data -> POST ke /auth/register/ -> Django bikin User baru -> Return success.
    - Login: Input username/password -> POST ke /auth/login/.
    - Django memverifikasi akun. Jika benar, Django membuat sesi login dan mengirimkan cookie sessionid di header response.
    - Flutter (CookieRequest) menyimpan cookie tersebut di memori lokal aplikasi.
    - loggedIn state menjadi true, user diarahkan ke menu utama.
    - Request Berautentikasi: Saat Flutter minta data (misal item milik user), cookie sessionid ikut terkirim otomatis, jadi Django tahu siapa yang minta data.
    - Logout: Flutter request ke /auth/logout/ -> Django menghapus sesi di server -> Flutter menghapus cookie di memori -> User kembali ke halaman login.

7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
    - Persiapan Django: Menambahkan app authentication, corsheaders, dan membuat view login/register serta endpoint JSON untuk produk.
    - Model Dart: Saya copy JSON response dari Postman/Browser, lalu convert menjadi Dart class (Model) agar parsing data lebih mudah.
    - Provider Setup: Menambahkan Provider di root aplikasi (main.dart) untuk CookieRequest agar bisa diakses global.
    - Fitur Login/Register: Membuat halaman form yang memanggil fungsi login dan register dari CookieRequest. Jika login sukses, navigasi diarahken ke MyHomePage.
    - Menampilkan Data: Menggunakan FutureBuilder di halaman utama untuk mengambil data dari endpoint JSON Django, lalu mapping data tersebut ke dalam widget ItemCard yang sudah saya buat sebelumnya.
    - Filter User: Di view Django, saya ubah query-nya menjadi Item.objects.filter(user=request.user) agar data yang muncul hanya milik user tersebut.
    - Halaman Detail: Membuat page baru yang menerima parameter object Item, lalu menampilkannya secara lengkap. Navigasi menggunakan Navigator.push saat kartu ditekan.
