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