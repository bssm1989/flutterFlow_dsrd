import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'id', 'ms'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? idText = '',
    String? msText = '',
  }) =>
      [enText, idText, msText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // createAccount
  {
    'l2xxy1gf': {
      'en': 'Get Started',
      'id': 'Memulai',
      'ms': 'Mulakan',
    },
    '59g0bt96': {
      'en': 'Use the form below to get started.',
      'id': 'Gunakan formulir di bawah ini untuk memulai.',
      'ms': 'Gunakan borang di bawah untuk bermula.',
    },
    'seheok8a': {
      'en': 'Email Address',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
    },
    '0uknk55c': {
      'en': 'Enter your email here...',
      'id': 'Masukkan email Anda disini...',
      'ms': 'Masukkan e-mel anda di sini...',
    },
    'wwxuev1r': {
      'en': 'Password',
      'id': 'Kata sandi',
      'ms': 'Kata laluan',
    },
    'eextb60x': {
      'en': 'Enter your email here...',
      'id': 'Masukkan email Anda disini...',
      'ms': 'Masukkan e-mel anda di sini...',
    },
    'kx2trk1o': {
      'en': 'Confirm Password',
      'id': 'konfirmasi sandi',
      'ms': 'Sahkan Kata Laluan',
    },
    'k8c3y3u7': {
      'en': 'Enter your email here...',
      'id': 'Masukkan email Anda disini...',
      'ms': 'Masukkan e-mel anda di sini...',
    },
    '29ut49wi': {
      'en': 'Create Account',
      'id': 'Buat Akun',
      'ms': 'Buat akaun',
    },
    '07gxzzhq': {
      'en': 'Use a social platform to continue',
      'id': 'Gunakan platform sosial untuk melanjutkan',
      'ms': 'Gunakan platform sosial untuk meneruskan',
    },
    'ysqhbhpe': {
      'en': 'Already have an account?',
      'id': 'Sudah memiliki akun?',
      'ms': 'Sudah mempunyai akaun?',
    },
    'ud92zl8z': {
      'en': 'Log In',
      'id': 'Gabung',
      'ms': 'Log masuk',
    },
    'zuuuklky': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // forgotPassword
  {
    '3hcuc8v6': {
      'en': 'Forgot Password',
      'id': 'Tidak ingat kata sandi',
      'ms': 'Lupa kata laluan',
    },
    'sjjd1jb9': {
      'en':
          'Don\'t remember your password? Enter the email associated with your account below and we will send you a new link.',
      'id':
          'Tidak ingat kata sandi Anda? Masukkan email yang terkait dengan akun Anda di bawah ini dan kami akan mengirimkan tautan baru kepada Anda.',
      'ms':
          'Tidak ingat kata laluan anda? Masukkan e-mel yang dikaitkan dengan akaun anda di bawah dan kami akan menghantar pautan baharu kepada anda.',
    },
    'tzm5opaa': {
      'en': 'Email Address',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
    },
    'uvsotzng': {
      'en': 'Please enter a valid email...',
      'id': 'Tolong masukkan email yang benar...',
      'ms': 'Sila masukkan e-mel yang sah...',
    },
    '3sdzjivm': {
      'en': 'Send Reset Link',
      'id': 'Kirim Setel Ulang Tautan',
      'ms': 'Hantar Pautan Tetapan Semula',
    },
    '8p6xd6cl': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // Login
  {
    '3p97u62u': {
      'en': 'ยินดีต้อนรับ สู่ระบบ DSRD',
      'id': 'Selamat Datang kembali!',
      'ms': 'Selamat kembali!',
    },
    'xkz4xjo6': {
      'en': 'กรุณากรอกข้อมูลเข้าสู่ระบบ',
      'id': 'Gunakan formulir di bawah ini untuk mengakses akun Anda.',
      'ms': 'Gunakan borang di bawah untuk mengakses akaun anda.',
    },
    'k9u5spqi': {
      'en': 'User',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
    },
    'f4xxyrqv': {
      'en': 'กรอก user...',
      'id': 'Masukkan email Anda disini...',
      'ms': 'Masukkan e-mel anda di sini...',
    },
    'lfzvgi5q': {
      'en': 'รหัสผ่าน',
      'id': 'Kata sandi',
      'ms': 'Kata laluan',
    },
    'wt8sx5du': {
      'en': 'กรอกรหัสผ่านที่นี้...',
      'id': 'Masukkan kata sandi Anda di sini...',
      'ms': 'Masukkan kata laluan anda di sini...',
    },
    'm9klj9ah': {
      'en': 'เข้าสู่ระบบ',
      'id': 'Gabung',
      'ms': 'Log masuk',
    },
    'rih94ily': {
      'en': 'ลงทะเบียน',
      'id': 'Gabung',
      'ms': 'Log masuk',
    },
    'iha5socs': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // Home
  {
    '3bi54x5g': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    'nnv46x35': {
      'en': 'ข้อมูลสารสนเทศ',
      'id': 'Di bawah ini adalah ringkasan aktivitas tim Anda.',
      'ms': 'Di bawah ialah ringkasan aktiviti pasukan anda.',
    },
    'jqevo63s': {
      'en': 'จำนวนกลุ่มเปราะบาง',
      'id': 'pelanggan baru',
      'ms': 'pelanggan baru',
    },
    'd0r4w3cc': {
      'en': '30',
      'id': '24',
      'ms': '24',
    },
    '8vot9bzj': {
      'en': 'ผู้สูงอายุ',
      'id': 'Kontrak Baru',
      'ms': 'Kontrak Baru',
    },
    '463rfkem': {
      'en': '20',
      'id': '3.200',
      'ms': '3,200',
    },
    'saxskj92': {
      'en': 'คนพิการ',
      'id': 'Kontrak Kedaluwarsa',
      'ms': 'Kontrak Tamat',
    },
    '2wlrr5lg': {
      'en': '3',
      'id': '4300',
      'ms': '4300',
    },
    'yw99ji63': {
      'en': 'เด็กกำพร้า/เด็กด้อยโอกาส',
      'id': 'Kontrak Kedaluwarsa',
      'ms': 'Kontrak Tamat',
    },
    '9yw9b9ff': {
      'en': '5',
      'id': '4300',
      'ms': '4300',
    },
    'zubump1y': {
      'en': 'หญิงหม้าย',
      'id': 'Kontrak Kedaluwarsa',
      'ms': 'Kontrak Tamat',
    },
    'lq2f1ip3': {
      'en': '2',
      'id': '4300',
      'ms': '4300',
    },
    'kphqz3hi': {
      'en': 'สารสนเทศ',
      'id': 'Proyek',
      'ms': 'Projek',
    },
    'puy8obok': {
      'en': 'Contract Activity',
      'id': 'Aktivitas Kontrak',
      'ms': 'Aktiviti Kontrak',
    },
    'zlovh0zt': {
      'en': 'Below is an a summary of activity.',
      'id': 'Di bawah ini adalah ringkasan kegiatan.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
    },
    'g1uaaovn': {
      'en': 'Customer Activity',
      'id': 'Aktivitas Pelanggan',
      'ms': 'Aktiviti Pelanggan',
    },
    'e5q3ows1': {
      'en': 'Below is an a summary of activity.',
      'id': 'Di bawah ini adalah ringkasan kegiatan.',
      'ms': 'Di bawah ialah ringkasan aktiviti.',
    },
    'y24lcr13': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    '8wb15syg': {
      'en': 'เพิ่ม',
      'id': '',
      'ms': '',
    },
    'xdxbdj20': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // Main_Contracts
  {
    '4h88trkp': {
      'en': 'Contracts',
      'id': 'Kontrak',
      'ms': 'Kontrak',
    },
    'smh1o93d': {
      'en': 'Contracts',
      'id': 'Kontrak',
      'ms': 'Kontrak',
    },
    't967eizl': {
      'en': 'Projects',
      'id': 'Proyek',
      'ms': 'Projek',
    },
    'dpt94d56': {
      'en': 'No-Code Platform Design',
      'id': 'Desain Platform Tanpa Kode',
      'ms': 'Reka Bentuk Platform Tanpa Kod',
    },
    '2a7y5e2w': {
      'en': 'Design Team Docs',
      'id': 'Dokumen Tim Desain',
      'ms': 'Dokumen Pasukan Reka Bentuk',
    },
    'dlt46loo': {
      'en': 'Contracts',
      'id': 'Kontrak',
      'ms': 'Kontrak',
    },
    'sqmgdsam': {
      'en': 'ACME Co.',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    '8t72ssfn': {
      'en': 'Contracts for New Opportunities',
      'id': 'Kontrak untuk Peluang Baru',
      'ms': 'Kontrak untuk Peluang Baru',
    },
    'h9kiq8rj': {
      'en': 'Next Action',
      'id': 'Tindakan Selanjutnya',
      'ms': 'Tindakan Seterusnya',
    },
    '7mjz03wi': {
      'en': 'Tuesday, 10:00am',
      'id': 'Selasa, 10:00',
      'ms': 'Selasa, 10:00 pagi',
    },
    '8e820p1r': {
      'en': 'In Progress',
      'id': 'Sedang berlangsung',
      'ms': 'Sedang Berlangsung',
    },
    '7wcrhzda': {
      'en': 'HealthAi',
      'id': 'KesehatanAi',
      'ms': 'KesihatanAi',
    },
    'sen48p1q': {
      'en': 'Client Acquisition for Q3',
      'id': 'Akuisisi Klien untuk Q3',
      'ms': 'Pemerolehan Pelanggan untuk S3',
    },
    'fp6xlmv9': {
      'en': 'Next Action',
      'id': 'Tindakan Selanjutnya',
      'ms': 'Tindakan Seterusnya',
    },
    'k0rirjak': {
      'en': 'Tuesday, 10:00am',
      'id': 'Selasa, 10:00',
      'ms': 'Selasa, 10:00 pagi',
    },
    'nanoxp6w': {
      'en': 'In Progress',
      'id': 'Sedang berlangsung',
      'ms': 'Sedang Berlangsung',
    },
    'j08eiorc': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // Main_profilePage
  {
    'qrxn5crt': {
      'en': 'My Profile',
      'id': 'Profil saya',
      'ms': 'Profil saya',
    },
    'v1hh7jlp': {
      'en': 'โหมดกลางคืน',
      'id': 'Beralih ke Mode Gelap',
      'ms': 'Tukar kepada Mod Gelap',
    },
    'sh7q15l6': {
      'en': 'Switch to Light Mode',
      'id': 'Beralih ke Mode Cahaya',
      'ms': 'Tukar kepada Mod Cahaya',
    },
    'fyxsf6vn': {
      'en': 'Account Settings',
      'id': 'Pengaturan akun',
      'ms': 'Tetapan Akaun',
    },
    'abqf147c': {
      'en': 'ออกจากระบบ',
      'id': 'Keluar',
      'ms': 'Log keluar',
    },
    'o3dp9tss': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // myTeam
  {
    '8jlklje5': {
      'en': 'My Team',
      'id': 'Kelompok ku',
      'ms': 'Pasukan saya',
    },
    '9iuss6gl': {
      'en': 'Search for your customers...',
      'id': 'Cari pelanggan Anda...',
      'ms': 'Cari pelanggan anda...',
    },
    '5mtplc2u': {
      'en': 'Member Name',
      'id': 'Nama anggota',
      'ms': 'Nama ahli',
    },
    'xsqhz5g4': {
      'en': 'Email',
      'id': 'Surel',
      'ms': 'E-mel',
    },
    'xkijgi68': {
      'en': 'Last Active',
      'id': 'Aktif Terakhir',
      'ms': 'Aktif Terakhir',
    },
    'dtsi2m5j': {
      'en': 'Date Created',
      'id': 'Tanggal Diciptakan',
      'ms': 'Tarikh Dibuat',
    },
    'qriboqj2': {
      'en': 'Status',
      'id': 'Status',
      'ms': 'Status',
    },
    'yxvgnrrg': {
      'en': 'Alex Smith',
      'id': 'Alex Smith',
      'ms': 'Alex Smith',
    },
    'hbvgee7f': {
      'en': 'user@domainname.com',
      'id': 'pengguna@namadomain.com',
      'ms': 'pengguna@nama domain.com',
    },
    'cxqbcilh': {
      'en': 'user@domain.com',
      'id': 'pengguna@domain.com',
      'ms': 'pengguna@domain.com',
    },
    'mv4x7wmh': {
      'en': 'Status',
      'id': 'Status',
      'ms': 'Status',
    },
    'w2zw9cr7': {
      'en': 'Andrea Rudolph',
      'id': 'Andrea Rudolph',
      'ms': 'Andrea Rudolph',
    },
    '975lfxpw': {
      'en': 'user@domainname.com',
      'id': 'pengguna@namadomain.com',
      'ms': 'pengguna@nama domain.com',
    },
    'cr4tpu01': {
      'en': 'user@domain.com',
      'id': 'pengguna@domain.com',
      'ms': 'pengguna@domain.com',
    },
    '65466g2l': {
      'en': 'Status',
      'id': 'Status',
      'ms': 'Status',
    },
    '6wt4aamp': {
      'en': 'Andrea Rudolph',
      'id': 'Andrea Rudolph',
      'ms': 'Andrea Rudolph',
    },
    'l96eacgw': {
      'en': 'user@domainname.com',
      'id': 'pengguna@namadomain.com',
      'ms': 'pengguna@nama domain.com',
    },
    'l2l3xguz': {
      'en': 'user@domain.com',
      'id': 'pengguna@domain.com',
      'ms': 'pengguna@domain.com',
    },
    'j5fz217z': {
      'en': 'Status',
      'id': 'Status',
      'ms': 'Status',
    },
    'aa3kj1vf': {
      'en': 'Andrea Rudolph',
      'id': 'Andrea Rudolph',
      'ms': 'Andrea Rudolph',
    },
    'a34fke7r': {
      'en': 'user@domainname.com',
      'id': 'pengguna@namadomain.com',
      'ms': 'pengguna@nama domain.com',
    },
    'anzvwh88': {
      'en': 'user@domain.com',
      'id': 'pengguna@domain.com',
      'ms': 'pengguna@domain.com',
    },
    'pmybqcyj': {
      'en': 'Status',
      'id': 'Status',
      'ms': 'Status',
    },
    'ejpiipnj': {
      'en': 'Andrea Rudolph',
      'id': 'Andrea Rudolph',
      'ms': 'Andrea Rudolph',
    },
    'xhwmudov': {
      'en': 'user@domainname.com',
      'id': 'pengguna@namadomain.com',
      'ms': 'pengguna@nama domain.com',
    },
    '55rj4ws9': {
      'en': 'user@domain.com',
      'id': 'pengguna@domain.com',
      'ms': 'pengguna@domain.com',
    },
    '7fin6z7v': {
      'en': 'Status',
      'id': 'Status',
      'ms': 'Status',
    },
    '54fbheio': {
      'en': 'Andrea Rudolph',
      'id': 'Andrea Rudolph',
      'ms': 'Andrea Rudolph',
    },
    '5zdg3l5v': {
      'en': 'user@domainname.com',
      'id': 'pengguna@namadomain.com',
      'ms': 'pengguna@nama domain.com',
    },
    'pfrreymz': {
      'en': 'user@domain.com',
      'id': 'pengguna@domain.com',
      'ms': 'pengguna@domain.com',
    },
    'r47lqzrc': {
      'en': 'Status',
      'id': 'Status',
      'ms': 'Status',
    },
    'ym579y79': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    'smtxdnbn': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // Main_customerList
  {
    'n99lg1qh': {
      'en': 'กลุ่มเปราะบาง',
      'id': 'Pelanggan',
      'ms': 'Pelanggan',
    },
    'lvnskphp': {
      'en': '',
      'id': 'Semua',
      'ms': 'Semua',
    },
    'u0su8kte': {
      'en': 'James Wiseman',
      'id': 'James Wiseman',
      'ms': 'James Wiseman',
    },
    'nyfsg4hw': {
      'en': 'Account Manager',
      'id': 'Manajer Akuntansi',
      'ms': 'Pengurus akaun',
    },
    'gzwu4cjr': {
      'en': 'ผู้สูงอายุ',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    'v1ffzm93': {
      'en': 'Ignacious Rodriguez',
      'id': 'Rodriguez yang kejam',
      'ms': 'Ignacious Rodriguez',
    },
    '8jo402mn': {
      'en': 'Sales Manager',
      'id': 'Manajer penjualan',
      'ms': 'Pengurus jualan',
    },
    'r658c9dm': {
      'en': 'ผู้สูงอายุ',
      'id': 'Robin HQ',
      'ms': 'Robin HQ',
    },
    'l5cpbw6i': {
      'en': 'Elena Williams',
      'id': 'Elena Williams',
      'ms': 'Elena Williams',
    },
    '9ico69uv': {
      'en': 'Head of Product & Innovation',
      'id': 'Kepala Produk &amp; Inovasi',
      'ms': 'Ketua Produk &amp; Inovasi',
    },
    'i1898004': {
      'en': 'Robin HQ',
      'id': 'Robin HQ',
      'ms': 'Robin HQ',
    },
    's8kuamom': {
      'en': 'Greg Brown',
      'id': 'Greg Brown',
      'ms': 'Greg Brown',
    },
    'uu60i528': {
      'en': 'Account Manager',
      'id': 'Manajer Akuntansi',
      'ms': 'Pengurus akaun',
    },
    '6nuzim8s': {
      'en': 'Robin HQ',
      'id': 'Robin HQ',
      'ms': 'Robin HQ',
    },
    'lwflemu4': {
      'en': 'June Williamson',
      'id': 'Juni Williamson',
      'ms': 'June Williamson',
    },
    'rxejb1ds': {
      'en': 'Sr. Account Manager',
      'id': 'Manajer Akun Senior',
      'ms': 'Tuan Pengurus Akaun',
    },
    'k5yutyp7': {
      'en': 'HealthAi',
      'id': 'KesehatanAi',
      'ms': 'KesihatanAi',
    },
    'z6bqikmn': {
      'en': 'June Williamson',
      'id': 'Juni Williamson',
      'ms': 'June Williamson',
    },
    'rm4hba82': {
      'en': 'Sr. Account Manager',
      'id': 'Manajer Akun Senior',
      'ms': 'Tuan Pengurus Akaun',
    },
    'id05iiyh': {
      'en': 'HealthAi',
      'id': 'KesehatanAi',
      'ms': 'KesihatanAi',
    },
    'qh2ock0d': {
      'en': '',
      'id': 'Aktif',
      'ms': 'Aktif',
    },
    '1c1n7s8k': {
      'en': 'James Wiseman',
      'id': 'James Wiseman',
      'ms': 'James Wiseman',
    },
    '13p4ybb4': {
      'en': 'ผู้สูงอายุ',
      'id': 'Manajer Akuntansi',
      'ms': 'Pengurus akaun',
    },
    'y7tux8cs': {
      'en': 'ผู้สูงอายุ',
      'id': 'KesehatanAi',
      'ms': 'KesihatanAi',
    },
    's7xebw09': {
      'en': '',
      'id': 'Panggilan Dingin',
      'ms': 'Panggilan Dingin',
    },
    'qbof0y3o': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '2dhwatij': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'fcyoodds': {
      'en': 'Customers',
      'id': 'Pelanggan',
      'ms': 'Pelanggan',
    },
    '3ourv2w9': {
      'en': '__',
      'id': '__',
      'ms': '__',
    },
  },
  // editProfile
  {
    'mk8nnw94': {
      'en': 'Change Photo',
      'id': '',
      'ms': '',
    },
    '4no7ue4a': {
      'en': 'Your Name',
      'id': '',
      'ms': '',
    },
    '2rqce1pj': {
      'en': 'The email associated with this account is:',
      'id': '',
      'ms': '',
    },
    'rr8ksatz': {
      'en': 'Save Changes',
      'id': '',
      'ms': '',
    },
    '20uycztj': {
      'en': 'Edit Profile',
      'id': '',
      'ms': '',
    },
  },
  // userDetails
  {
    'obyrn1rb': {
      'en': 'กลุ่มเปราะบาง',
      'id': 'Nama Pelanggan',
      'ms': 'Nama Pelanggan',
    },
    'nxuoeukv': {
      'en': 'High Profile',
      'id': 'Kalangan atas',
      'ms': 'Profil tinggi',
    },
    'kl55bl1c': {
      'en': 'ที่อยู่',
      'id': 'Perusahaan',
      'ms': 'Syarikat',
    },
    'ecbeopja': {
      'en': 'วัน/เดือน/ปี เกิด',
      'id': 'Judul',
      'ms': 'Tajuk',
    },
    'dkyygm1d': {
      'en': 'แบบสอบถาม',
      'id': 'Catatan',
      'ms': 'Nota',
    },
    '6e82iglb': {
      'en': 'name@domain.com',
      'id': '',
      'ms': '',
    },
    '9t913b44': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // projectDetails
  {
    'olng4jgs': {
      'en': 'ACME Co.',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    'auzixtnu': {
      'en': 'Contracts for New Opportunities',
      'id': 'Kontrak untuk Peluang Baru',
      'ms': 'Kontrak untuk Peluang Baru',
    },
    'b5izv7nf': {
      'en': 'Next Action',
      'id': 'Tindakan Selanjutnya',
      'ms': 'Tindakan Seterusnya',
    },
    'vhaascws': {
      'en': 'Tuesday, 10:00am',
      'id': 'Selasa, 10:00',
      'ms': 'Selasa, 10:00 pagi',
    },
    'u5if4r56': {
      'en': 'In Progress',
      'id': 'Sedang berlangsung',
      'ms': 'Sedang Berlangsung',
    },
    'xmoxp4eg': {
      'en': 'Contract Details',
      'id': 'Detail Kontrak',
      'ms': 'Butiran Kontrak',
    },
    'nftjvt9b': {
      'en': '\$210,000',
      'id': '\$210.000',
      'ms': '\$210,000',
    },
    'gpz3q8k6': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'id':
          'Detail Tambahan seputar kontrak ini dan siapa yang mengerjakannya di kartu ini!',
      'ms':
          'Butiran Tambahan mengenai kontrak ini dan siapa yang mengusahakannya dalam kad ini!',
    },
    'yltv0mu8': {
      'en': 'Mark as Complete',
      'id': 'Tandai sebagai Selesai',
      'ms': 'Tandai sebagai Selesai',
    },
    'rqfytlxg': {
      'en': 'Contract Details',
      'id': 'Detail Kontrak',
      'ms': 'Butiran Kontrak',
    },
    'dlykg4gm': {
      'en': '\$120,000',
      'id': '\$120,000',
      'ms': '\$120,000',
    },
    'hsx3k6c4': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'id':
          'Detail Tambahan seputar kontrak ini dan siapa yang mengerjakannya di kartu ini!',
      'ms':
          'Butiran Tambahan mengenai kontrak ini dan siapa yang mengusahakannya dalam kad ini!',
    },
    'okb12i1r': {
      'en': 'Mark as Complete',
      'id': 'Tandai sebagai Selesai',
      'ms': 'Tandai sebagai Selesai',
    },
    'c0s3jdsy': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // projectDetailsHealthAi
  {
    'mxf4vrjw': {
      'en': 'HealthAi',
      'id': 'KesehatanAi',
      'ms': 'KesihatanAi',
    },
    'wsgonkz2': {
      'en': 'Client Acquisition for Q3',
      'id': 'Akuisisi Klien untuk Q3',
      'ms': 'Pemerolehan Pelanggan untuk S3',
    },
    'ynyuwhqo': {
      'en': 'Next Action',
      'id': 'Tindakan Selanjutnya',
      'ms': 'Tindakan Seterusnya',
    },
    'zk7z07v0': {
      'en': 'Tuesday, 10:00am',
      'id': 'Selasa, 10:00',
      'ms': 'Selasa, 10:00 pagi',
    },
    'lux9j0yp': {
      'en': 'In Progress',
      'id': 'Sedang berlangsung',
      'ms': 'Sedang Berlangsung',
    },
    'ry6jvd0g': {
      'en': 'Contract Details',
      'id': 'Detail Kontrak',
      'ms': 'Butiran Kontrak',
    },
    'hu32scl5': {
      'en': '\$125,000',
      'id': '\$125.000',
      'ms': '\$125,000',
    },
    'sfu6o269': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'id':
          'Detail Tambahan seputar kontrak ini dan siapa yang mengerjakannya di kartu ini!',
      'ms':
          'Butiran Tambahan mengenai kontrak ini dan siapa yang mengusahakannya dalam kad ini!',
    },
    '5sv9a4ka': {
      'en': 'Mark as Complete',
      'id': 'Tandai sebagai Selesai',
      'ms': 'Tandai sebagai Selesai',
    },
    'rrgcwkj1': {
      'en': 'Contract Details',
      'id': 'Detail Kontrak',
      'ms': 'Butiran Kontrak',
    },
    '8bwk4oui': {
      'en': '\$67,000',
      'id': '\$67.000',
      'ms': '\$67,000',
    },
    'p2hoxaq9': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'id':
          'Detail Tambahan seputar kontrak ini dan siapa yang mengerjakannya di kartu ini!',
      'ms':
          'Butiran Tambahan mengenai kontrak ini dan siapa yang mengusahakannya dalam kad ini!',
    },
    'ww95wm3k': {
      'en': 'Mark as Complete',
      'id': 'Tandai sebagai Selesai',
      'ms': 'Tandai sebagai Selesai',
    },
    '54l7ivhw': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // searchPage
  {
    'ao46xsuv': {
      'en': 'เพิ่มกลุ่มเปราะบาง',
      'id': 'Tambahkan Anggota',
      'ms': 'Tambah Ahli',
    },
    'g8rv8zhr': {
      'en': 'ค้นหาเลขบัตรประชาชน',
      'id': 'Cari anggota...',
      'ms': 'Cari ahli...',
    },
    'op7ngmsb': {
      'en': 'Option 1',
      'id': 'Pilihan 1',
      'ms': 'Pilihan 1',
    },
    'dc2t5yr7': {
      'en': 'เพิ่ม',
      'id': '',
      'ms': '',
    },
    'mvx2sb5k': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // offlinedata
  {
    'kcyudjrc': {
      'en': 'Hello World',
      'id': '',
      'ms': '',
    },
    '4zh6unvu': {
      'en': 'Page Title',
      'id': '',
      'ms': '',
    },
    's0v3nr2b': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // user
  {
    'dzw4hpuw': {
      'en': 'Label here...',
      'id': '',
      'ms': '',
    },
    'v0r5ahkt': {
      'en': 'Label here...',
      'id': '',
      'ms': '',
    },
    '0jfdqbda': {
      'en': 'Label here...',
      'id': '',
      'ms': '',
    },
    '1539du0v': {
      'en': 'Button',
      'id': '',
      'ms': '',
    },
    'v8kq46qh': {
      'en': 'ผู้ได้รับการเยียวยา',
      'id': '',
      'ms': '',
    },
    'nfe1hyyy': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // userEditDetailCopy
  {
    'xnu1lua6': {
      'en': 'อัพโหลดรูปภาพ',
      'id': '',
      'ms': '',
    },
    'cf806t2s': {
      'en': 'อัพโหลดรูป',
      'id': '',
      'ms': '',
    },
    'xlibhdt9': {
      'en': 'เลขบัตรประชาชน...',
      'id': '',
      'ms': '',
    },
    'gvjezo1a': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'wabref8m': {
      'en': 'ดช.',
      'id': '',
      'ms': '',
    },
    '7rgibkub': {
      'en': 'ดญ.',
      'id': '',
      'ms': '',
    },
    's2nbosok': {
      'en': 'นางสาว',
      'id': '',
      'ms': '',
    },
    '6yx4jqi2': {
      'en': 'นาย',
      'id': '',
      'ms': '',
    },
    '0ir2uxsd': {
      'en': 'นาง',
      'id': '',
      'ms': '',
    },
    '73iurztx': {
      'en': 'เลือกคำนำหน้า...',
      'id': '',
      'ms': '',
    },
    '0immzwgs': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'bjnhihsw': {
      'en': 'ชื่อ',
      'id': '',
      'ms': '',
    },
    'ykjkwyd6': {
      'en': 'นามสกุล',
      'id': '',
      'ms': '',
    },
    'hicyyrzu': {
      'en': 'วันที่เกิด (วัน/เดือน/ปี)',
      'id': '',
      'ms': '',
    },
    '4qubuvax': {
      'en': 'อายุ',
      'id': '',
      'ms': '',
    },
    'f9am3h2v': {
      'en': 'อายุ',
      'id': '',
      'ms': '',
    },
    '226zfg84': {
      'en': 'เพศ',
      'id': '',
      'ms': '',
    },
    '48975qwx': {
      'en': 'ชาย',
      'id': '',
      'ms': '',
    },
    'egws9gvr': {
      'en': 'หญิง',
      'id': '',
      'ms': '',
    },
    'jb9qkm4m': {
      'en': 'ไม่ระบุ',
      'id': '',
      'ms': '',
    },
    '2qyqau4n': {
      'en': 'อิสลาม',
      'id': '',
      'ms': '',
    },
    '9v5ixuch': {
      'en': 'พุทธ',
      'id': '',
      'ms': '',
    },
    't93widi4': {
      'en': 'คริสต์',
      'id': '',
      'ms': '',
    },
    'g5krhm8v': {
      'en': 'อื่น ๆ',
      'id': '',
      'ms': '',
    },
    'rwea9s2v': {
      'en': 'ศาสนา',
      'id': '',
      'ms': '',
    },
    'r1dl6cex': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    '0l5rge49': {
      'en': 'ไม่ระบุ',
      'id': '',
      'ms': '',
    },
    'qsx9ahae': {
      'en': 'โสด',
      'id': '',
      'ms': '',
    },
    'gfs244ij': {
      'en': 'สมรส/มีคู่',
      'id': '',
      'ms': '',
    },
    '3twzd9k5': {
      'en': 'หย่าร้าง/เลิกรา',
      'id': '',
      'ms': '',
    },
    'pce758vz': {
      'en': 'หม้าย',
      'id': '',
      'ms': '',
    },
    'uvi1l382': {
      'en': 'อื่น ๆ',
      'id': '',
      'ms': '',
    },
    'jeponazu': {
      'en': 'สภานภาพ',
      'id': '',
      'ms': '',
    },
    'cxd2589z': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    '4dgbhnvu': {
      'en': 'จำนวนบุตรที่มีชีวิตอยู่',
      'id': '',
      'ms': '',
    },
    'm0xgdxp6': {
      'en': 'จำนวนบุตรที่กำลังเรียนอยู่',
      'id': '',
      'ms': '',
    },
    '5o0x16of': {
      'en': 'กรุ๊ปเลือด',
      'id': '',
      'ms': '',
    },
    'm9dpg5lz': {
      'en': 'อาชีพหลัก',
      'id': '',
      'ms': '',
    },
    '1j9q5t89': {
      'en': 'อาชีพเสริม',
      'id': '',
      'ms': '',
    },
    '4vgor6sr': {
      'en': 'รายได้ต่อเดือน (บาท)',
      'id': '',
      'ms': '',
    },
    'zee74xur': {
      'en': 'ที่อยู่ตามสำเนาทะเบียนบ้าน',
      'id': '',
      'ms': '',
    },
    'pkawu2wz': {
      'en': 'บ้านเลขที่',
      'id': '',
      'ms': '',
    },
    'skqa5qgd': {
      'en': 'ถนน ซอย',
      'id': '',
      'ms': '',
    },
    'zl811127': {
      'en': 'ไม่มีผู้ดูแล',
      'id': '',
      'ms': '',
    },
    '5rh750bw': {
      'en': 'มีผู้ดูแล-สมาชิกในครอบครัว',
      'id': '',
      'ms': '',
    },
    '9l63ttvw': {
      'en': 'มีผู้ดูแล-จ้างคนนอกครอบครัวมาดูแล',
      'id': '',
      'ms': '',
    },
    'afjqzl8b': {
      'en': 'ท่านมีผู้ดูแลหรือไม่',
      'id': '',
      'ms': '',
    },
    '8x2m8vg4': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'hgrcqb7b': {
      'en': 'ไม่มีผู้ดูแล',
      'id': '',
      'ms': '',
    },
    'j4t6rvl7': {
      'en': 'มีผู้ดูแล-สมาชิกในครอบครัว',
      'id': '',
      'ms': '',
    },
    '8d7k4dkb': {
      'en': 'มีผู้ดูแล-จ้างคนนอกครอบครัวมาดูแล',
      'id': '',
      'ms': '',
    },
    'i2f92ybv': {
      'en': 'ท่านมีผู้ดูแลหรือไม่',
      'id': '',
      'ms': '',
    },
    '6atkx9hd': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    't7ndim4m': {
      'en': 'ไม่มีผู้ดูแล',
      'id': '',
      'ms': '',
    },
    'ulc70p8o': {
      'en': 'มีผู้ดูแล-สมาชิกในครอบครัว',
      'id': '',
      'ms': '',
    },
    '3q1wxjqa': {
      'en': 'มีผู้ดูแล-จ้างคนนอกครอบครัวมาดูแล',
      'id': '',
      'ms': '',
    },
    '07k9b7pu': {
      'en': 'ท่านมีผู้ดูแลหรือไม่',
      'id': '',
      'ms': '',
    },
    '4p66cbil': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'camza1uc': {
      'en': 'ไม่มีผู้ดูแล',
      'id': '',
      'ms': '',
    },
    '0nfy5qvz': {
      'en': 'มีผู้ดูแล-สมาชิกในครอบครัว',
      'id': '',
      'ms': '',
    },
    '087iyq3u': {
      'en': 'มีผู้ดูแล-จ้างคนนอกครอบครัวมาดูแล',
      'id': '',
      'ms': '',
    },
    'xnh21h9g': {
      'en': 'ท่านมีผู้ดูแลหรือไม่',
      'id': '',
      'ms': '',
    },
    'lwd721n7': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'd4oqpz2r': {
      'en': 'ที่อยู่ปัจจุบัน',
      'id': '',
      'ms': '',
    },
    'wz2ukwdc': {
      'en': '**คัดลอกจากที่อยู่ตามทะเบียนบ้าน',
      'id': '',
      'ms': '',
    },
    'a60o7yr1': {
      'en': 'บ้านเลขที่',
      'id': '',
      'ms': '',
    },
    'yzillpwd': {
      'en': 'ถนน ซอย',
      'id': '',
      'ms': '',
    },
    's02emz1a': {
      'en': 'ไม่มีผู้ดูแล',
      'id': '',
      'ms': '',
    },
    'tz67i9i2': {
      'en': 'มีผู้ดูแล-สมาชิกในครอบครัว',
      'id': '',
      'ms': '',
    },
    'j1d9dgxq': {
      'en': 'มีผู้ดูแล-จ้างคนนอกครอบครัวมาดูแล',
      'id': '',
      'ms': '',
    },
    'xm3dftej': {
      'en': 'ท่านมีผู้ดูแลหรือไม่',
      'id': '',
      'ms': '',
    },
    'm0oo8xeh': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    '9qh3e1gt': {
      'en': 'จังหวัด',
      'id': '',
      'ms': '',
    },
    'begygtf2': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'jup8dogj': {
      'en': 'อำเภอ',
      'id': '',
      'ms': '',
    },
    'ac3i7bb4': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    '8w3xbhpa': {
      'en': 'ตำบล',
      'id': '',
      'ms': '',
    },
    'e19ur11x': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'o92qzjdj': {
      'en': 'เบอร์โทรศัพท์',
      'id': '',
      'ms': '',
    },
    'p78za22k': {
      'en': 'ข้อมูลเชิงพื้นที่',
      'id': '',
      'ms': '',
    },
    'tmssepry': {
      'en': 'พิกัดบ้าน ลองจิจูด',
      'id': '',
      'ms': '',
    },
    'c9y6s82j': {
      'en': 'ไม่มีผู้ดูแล',
      'id': '',
      'ms': '',
    },
    'fy2fbu68': {
      'en': 'มีผู้ดูแล-สมาชิกในครอบครัว',
      'id': '',
      'ms': '',
    },
    'qf6r23og': {
      'en': 'มีผู้ดูแล-จ้างคนนอกครอบครัวมาดูแล',
      'id': '',
      'ms': '',
    },
    'gqscr5nu': {
      'en': 'ท่านมีผู้ดูแลหรือไม่',
      'id': '',
      'ms': '',
    },
    'heekz0rk': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'qcjo0mam': {
      'en': 'รูปภาพบ้าน',
      'id': '',
      'ms': '',
    },
    'oxr2otgz': {
      'en': 'รูปภาพบ้าน',
      'id': '',
      'ms': '',
    },
    'wyxoh0bl': {
      'en': 'ข้อมูลด้านสุขภาพ',
      'id': '',
      'ms': '',
    },
    'pbo8mjdt': {
      'en': 'ท่านมีโรคประจำตัวหรือปัญหาสุขภาพหรือไม่',
      'id': '',
      'ms': '',
    },
    'i0rgwook': {
      'en': 'ไม่มี',
      'id': '',
      'ms': '',
    },
    'roblbtym': {
      'en': 'มี',
      'id': '',
      'ms': '',
    },
    'k8jgk9m0': {
      'en': '1. ความดันโลหิตสูง',
      'id': '',
      'ms': '',
    },
    's0hlwg6n': {
      'en': '2. เบาหวาน',
      'id': '',
      'ms': '',
    },
    'evuiz2le': {
      'en': '3. โรคหัวใจ',
      'id': '',
      'ms': '',
    },
    'tsvksbxw': {
      'en': '4. อัมพฤกษ์/อัมพาต',
      'id': '',
      'ms': '',
    },
    'wa2shqz1': {
      'en': '5. โรคปอด/หอบหืด',
      'id': '',
      'ms': '',
    },
    '40aqbac7': {
      'en': '6. โรคมะเร็ง',
      'id': '',
      'ms': '',
    },
    'q6huninp': {
      'en': '7. เก๊าท์/ข้อเสื่อม',
      'id': '',
      'ms': '',
    },
    'zhi4pyjr': {
      'en': '8. อัลไซเมอร์/สมองเสื่อม',
      'id': '',
      'ms': '',
    },
    'kmelfc2o': {
      'en': '9. มีอาการทางจิตเวช',
      'id': '',
      'ms': '',
    },
    'imvh4p3v': {
      'en': '10. โรคอ้วน',
      'id': '',
      'ms': '',
    },
    'h6ngle7w': {
      'en': '11. โรคสมองและหลอดเลือด',
      'id': '',
      'ms': '',
    },
    'srek9jxo': {
      'en': '12. อื่นๆ ระบุ',
      'id': '',
      'ms': '',
    },
    'zlmhwcfn': {
      'en': 'ระบุ',
      'id': '',
      'ms': '',
    },
    'ao9xe80o': {
      'en': 'สิทธิการรักษาพยาบาล',
      'id': '',
      'ms': '',
    },
    'p1gnke99': {
      'en': '1. บัตรทอง',
      'id': '',
      'ms': '',
    },
    'ai57pv3e': {
      'en': '2. ประกันชีวิต',
      'id': '',
      'ms': '',
    },
    'v64g7y33': {
      'en': '3. ประกันสังคม',
      'id': '',
      'ms': '',
    },
    'hsk4xx73': {
      'en': '4. เบิกต้นสังกัด',
      'id': '',
      'ms': '',
    },
    'xdtrof8s': {
      'en': '5. จ่ายเอง',
      'id': '',
      'ms': '',
    },
    's240ltem': {
      'en': '6. อื่น ๆ ระบุ',
      'id': '',
      'ms': '',
    },
    '2kftmhw8': {
      'en': 'ระบุ',
      'id': '',
      'ms': '',
    },
    'jzd3l69a': {
      'en': 'สถานที่รักษา',
      'id': '',
      'ms': '',
    },
    'o5izpc2v': {
      'en': 'ท่านเคติดโรคโควิด (COVID-19) กี่ครั้ง',
      'id': '',
      'ms': '',
    },
    '3c4l6df5': {
      'en': 'ไม่มีผู้ดูแล',
      'id': '',
      'ms': '',
    },
    '0x3z40ry': {
      'en': 'มีผู้ดูแล-สมาชิกในครอบครัว',
      'id': '',
      'ms': '',
    },
    'zuvyd7fl': {
      'en': 'มีผู้ดูแล-จ้างคนนอกครอบครัวมาดูแล',
      'id': '',
      'ms': '',
    },
    '7h31dv0r': {
      'en': 'ท่านมีผู้ดูแลหรือไม่',
      'id': '',
      'ms': '',
    },
    'ea0ymbz6': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'wdsr07fn': {
      'en': 'ข้อมูลกลุ่มเปราะบาง',
      'id': '',
      'ms': '',
    },
    'z6l5e5ef': {
      'en': 'ไม่ระบุ',
      'id': '',
      'ms': '',
    },
    '3v4kp4j4': {
      'en': 'หญิงหม้าย',
      'id': '',
      'ms': '',
    },
    'akn1ma83': {
      'en': 'บุคคลทั่วไป',
      'id': '',
      'ms': '',
    },
    'l03bmnge': {
      'en': 'ผู้ด้อยโอกาส',
      'id': '',
      'ms': '',
    },
    'fflnwj0x': {
      'en': 'เด็กกำพร้า',
      'id': '',
      'ms': '',
    },
    'oasu5czw': {
      'en': 'ผู้พิการ',
      'id': '',
      'ms': '',
    },
    'c8dzg6wi': {
      'en': 'ผู้สูงอายุ',
      'id': '',
      'ms': '',
    },
    '21i17kyn': {
      'en': 'ประเภทกลุ่มเปราะบาง',
      'id': '',
      'ms': '',
    },
    '2njtn2fz': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'me0dpkht': {
      'en': 'ไม่มีผู้ดูแล',
      'id': '',
      'ms': '',
    },
    'okonr2v9': {
      'en': 'มีผู้ดูแล-สมาชิกในครอบครัว',
      'id': '',
      'ms': '',
    },
    'dczs4l87': {
      'en': 'มีผู้ดูแล-จ้างคนนอกครอบครัวมาดูแล',
      'id': '',
      'ms': '',
    },
    'fhztyvx3': {
      'en': 'ท่านมีผู้ดูแลหรือไม่',
      'id': '',
      'ms': '',
    },
    'b4cu802s': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'xitxrvf3': {
      'en': 'ไม่มีผู้ดูแล',
      'id': '',
      'ms': '',
    },
    '6ozs8rx3': {
      'en': 'มีผู้ดูแล-สมาชิกในครอบครัว',
      'id': '',
      'ms': '',
    },
    '9nxehfx1': {
      'en': 'มีผู้ดูแล-จ้างคนนอกครอบครัวมาดูแล',
      'id': '',
      'ms': '',
    },
    '7bw4fuba': {
      'en': 'ท่านมีผู้ดูแลหรือไม่',
      'id': '',
      'ms': '',
    },
    'xwubeyjr': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    '53abaw3p': {
      'en': 'ข้อมูลผู้ดูแล',
      'id': '',
      'ms': '',
    },
    'fyyoy4yi': {
      'en': 'ไม่มีผู้ดูแล',
      'id': '',
      'ms': '',
    },
    'h2d8fos6': {
      'en': 'มีผู้ดูแล-สมาชิกในครอบครัว',
      'id': '',
      'ms': '',
    },
    '9dm65xaw': {
      'en': 'มีผู้ดูแล-จ้างคนนอกครอบครัวมาดูแล',
      'id': '',
      'ms': '',
    },
    'q49snkv6': {
      'en': 'ท่านมีผู้ดูแลหรือไม่',
      'id': '',
      'ms': '',
    },
    '6th7y7ag': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    's30wjbxf': {
      'en': 'ชื่อผู้ดูแลหลัก',
      'id': '',
      'ms': '',
    },
    'j3byski0': {
      'en': 'ชื่อสกุลผู้ดูแลหลัก',
      'id': '',
      'ms': '',
    },
    '9kt51d4u': {
      'en': 'วันเดือนปีเกิด',
      'id': '',
      'ms': '',
    },
    '7n3ub31t': {
      'en': 'ไม่มีผู้ดูแล',
      'id': '',
      'ms': '',
    },
    'xb6w277a': {
      'en': 'มีผู้ดูแล-สมาชิกในครอบครัว',
      'id': '',
      'ms': '',
    },
    '2m3pkeg6': {
      'en': 'มีผู้ดูแล-จ้างคนนอกครอบครัวมาดูแล',
      'id': '',
      'ms': '',
    },
    'q5k0rrfx': {
      'en': 'ท่านมีผู้ดูแลหรือไม่',
      'id': '',
      'ms': '',
    },
    'bxubrxo1': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    't8bfuef9': {
      'en': 'ยกเลิก',
      'id': 'Hasilkan Penawaran',
      'ms': 'Hasilkan Petikan',
    },
    '1qqzb42h': {
      'en': 'บันทึก',
      'id': 'Lihat Perusahaan',
      'ms': 'Lihat Syarikat',
    },
    '96zh04f5': {
      'en': 'จังหวัด',
      'id': '',
      'ms': '',
    },
    'tw7ry97n': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'h65rhqrq': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // Evaluation-Form
  {
    'mrkfdnll': {
      'en': 'ข้อมูลแบบประเมินสุขภาวะผู้เปราะบาง',
      'id': '',
      'ms': '',
    },
    '55ygdsul': {
      'en':
          'คำชี้แจง: ขอความร่วมมือ ประเมินสุขภาวะผู้เปราะบางในช่วง 3 เดือนที่ผ่านมา โดยเลือกระดับคะแนนตามเ',
      'id': '',
      'ms': '',
    },
    '609socrd': {
      'en':
          'เกณฑ์การประเมิน\n0 คะแนน ไม่มีความเปราะบาง\n1-2 คะแนน เริ่มเปราะบาง\n3 คะแนนขึ้นไป มีภาวะเปราะบาง',
      'id': '',
      'ms': '',
    },
    'gnrbb53x': {
      'en':
          '1. จดจำวัน เวลา สถานที่ บุคคล ทวนคำ 3 คำได้ หลังจากบอกคำไปแล้ว 1 นาที เช่น หลานสาว สวรรค์ ภูเขา',
      'id': '',
      'ms': '',
    },
    'n6d03b78': {
      'en': '0 = ความจำดี',
      'id': '',
      'ms': '',
    },
    'axhyz6ms': {
      'en': '1 = ความจำพอใช้',
      'id': '',
      'ms': '',
    },
    'bujnhj76': {
      'en': '2 = ความจำไม่ดี',
      'id': '',
      'ms': '',
    },
    'j6vhq86b': {
      'en': 'Please select...',
      'id': '',
      'ms': '',
    },
    'rsdfcgvx': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'y6tm8q90': {
      'en': '2. มีความรู้สึกเหนื่อยล้าบ่อยครั้งใน 1 วัน',
      'id': '',
      'ms': '',
    },
    'o8zhpccf': {
      'en': '0 = ไม่มีเลย',
      'id': '',
      'ms': '',
    },
    'uwa3ka9t': {
      'en': '1 = มีบ้าง',
      'id': '',
      'ms': '',
    },
    '3h0zsxnl': {
      'en': '2 = บ่อยครั้ง',
      'id': '',
      'ms': '',
    },
    '78tved4y': {
      'en': 'Please select...',
      'id': '',
      'ms': '',
    },
    'cby3evcj': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'f2j0j3qg': {
      'en': '3. เดินขึ้นบันได 10 ขั้นได้หรือไม่',
      'id': '',
      'ms': '',
    },
    '79lembox': {
      'en': '0 = ได้ 10 ขั้น',
      'id': '',
      'ms': '',
    },
    'l70egzfx': {
      'en': '1 = ได้ 5 ขั้น',
      'id': '',
      'ms': '',
    },
    's0cyzar7': {
      'en': '2 = 0-4  ขั้น',
      'id': '',
      'ms': '',
    },
    'go5nta2m': {
      'en': 'Please select...',
      'id': '',
      'ms': '',
    },
    'slwd2i56': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    '16uc9nqb': {
      'en': '4. เดินไป-กลับ 20 ก้าว โดยไม่มีอุปกรณ์ข่วย',
      'id': '',
      'ms': '',
    },
    'wwi8x8ai': {
      'en': '0 = ได้ 20 ก้าว',
      'id': '',
      'ms': '',
    },
    'j0c83ayf': {
      'en': '1 = ได้ 10 ก้าว',
      'id': '',
      'ms': '',
    },
    '2izdnwgi': {
      'en': '2 = ได้น้อยกว่า 10 ก้าว',
      'id': '',
      'ms': '',
    },
    'fscibzug': {
      'en': 'Please select...',
      'id': '',
      'ms': '',
    },
    'epv5sncc': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'kyx7qbz0': {
      'en': '5. มีโรคประจำตัวน้อยกว่า 4 โรค',
      'id': '',
      'ms': '',
    },
    'onkywbx4': {
      'en': '0 = 0-3 โรค',
      'id': '',
      'ms': '',
    },
    'nog1281u': {
      'en': '1 = 4-6 โรค',
      'id': '',
      'ms': '',
    },
    'e302w8qs': {
      'en': '2 = 7 โรคขึ้นไป',
      'id': '',
      'ms': '',
    },
    '4diao26a': {
      'en': 'Please select...',
      'id': '',
      'ms': '',
    },
    'e0zu866h': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'sxzubzrh': {
      'en': '6. มีน้ำหนักลดหรือเพิ่มมากกว่าหรือเท่ากับ 5% ใน 1 ปี',
      'id': '',
      'ms': '',
    },
    'x96yy5d6': {
      'en': '0 = น้ำหนักคงที่',
      'id': '',
      'ms': '',
    },
    'mfozccg9': {
      'en': '1 = ลด หรือ เพิ่ม 0-4%',
      'id': '',
      'ms': '',
    },
    '8grrrumg': {
      'en': '2 = ลด หรือ เพิ่ม 5% ขึ้นไป',
      'id': '',
      'ms': '',
    },
    'pbuupukm': {
      'en': 'Please select...',
      'id': '',
      'ms': '',
    },
    '1dphbdnt': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    '8xsv4i6a': {
      'en': '7. มีความคิดเบื่อหน่าย ท้อใจ ว้าเหว่ อยากมีเพื่อนในสัปดาห์ก่อน',
      'id': '',
      'ms': '',
    },
    'rojlzck0': {
      'en': '0 = ไม่มีเลย',
      'id': '',
      'ms': '',
    },
    'is48kx7e': {
      'en': '1 = มีบ้าง',
      'id': '',
      'ms': '',
    },
    '2742lpou': {
      'en': '2 = บ่อยครั้ง',
      'id': '',
      'ms': '',
    },
    '84kpzj94': {
      'en': 'Please select...',
      'id': '',
      'ms': '',
    },
    'zfbo5r5w': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'pa7xlm9p': {
      'en': '8. มีความคิดฆ่าตัวตายในเดือนที่ผ่านมา',
      'id': '',
      'ms': '',
    },
    '3cucdezk': {
      'en': '0 = ไม่มีเลย',
      'id': '',
      'ms': '',
    },
    'n02d6kma': {
      'en': '1 = มีบ้าง',
      'id': '',
      'ms': '',
    },
    'rwarbkta': {
      'en': '2 = บ่อยครั้ง',
      'id': '',
      'ms': '',
    },
    'oflmdang': {
      'en': 'Please select...',
      'id': '',
      'ms': '',
    },
    'alb2zzwz': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'sh57gqgv': {
      'en': 'รวม',
      'id': '',
      'ms': '',
    },
    'ir5wuvey': {
      'en': 'Label here...',
      'id': '',
      'ms': '',
    },
    'fti0wktm': {
      'en': 'ข้อสังเกต / ความคิดเห็นอื่นๆ ',
      'id': '',
      'ms': '',
    },
    'vlywvoi8': {
      'en': 'Label here...',
      'id': '',
      'ms': '',
    },
    'p54rzz5n': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // Evaluation-Form2Copy
  {
    'v3c0pmix': {
      'en': 'แบบติดตามสุขภาวะผู้เปราะบาง',
      'id': '',
      'ms': '',
    },
    '0jnb6dvt': {
      'en': 'คำชี้แจง: แบบสำรวจนี้มีวัตถุประสงค์เพื่อสังเกตอาการในเบื้องต้น ',
      'id': '',
      'ms': '',
    },
    'vj69v6ad': {
      'en': 'คำชี้แจง: แบบสำรวจนี้มีวัตถุประสงค์เพื่อสังเกตอาการในเบื้องต้น ',
      'id': '',
      'ms': '',
    },
    't5nbpdfk': {
      'en': 'ข้อมูลทั่วไป',
      'id': '',
      'ms': '',
    },
    'k33poe5d': {
      'en': 'วันที่ทำแบบประเมิน',
      'id': '',
      'ms': '',
    },
    '2g8sgmbi': {
      'en': 'ครั้งที่',
      'id': '',
      'ms': '',
    },
    'vionurdk': {
      'en': 'ชื่อ-สกุล ผู้ประเมิน',
      'id': '',
      'ms': '',
    },
    '1d1tblwq': {
      'en': 'ไม่ระบุ',
      'id': '',
      'ms': '',
    },
    'e870l4un': {
      'en': 'นักสุขภาวะ',
      'id': '',
      'ms': '',
    },
    'loeids2u': {
      'en': 'เจ้าหน้าที่ ศวชต.',
      'id': '',
      'ms': '',
    },
    'vbh7scos': {
      'en': 'เจ้าหน้าที่ อสม.',
      'id': '',
      'ms': '',
    },
    '3lnjws3p': {
      'en': 'เจ้าหน้าที่ อบต. /อปท.',
      'id': '',
      'ms': '',
    },
    'xu3z3g98': {
      'en': 'เจ้าหน้าที่หน่วยงาน อื่นๆ ',
      'id': '',
      'ms': '',
    },
    'hfrgpdqk': {
      'en': 'เลือกตำแหน่ง',
      'id': '',
      'ms': '',
    },
    'gwojtdkr': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'uw6ndkky': {
      'en': 'ชื่อ-นามสกุล (ผู้ถูกประเมิน)',
      'id': '',
      'ms': '',
    },
    'haathmob': {
      'en': 'อายุ',
      'id': '',
      'ms': '',
    },
    'wasgeru6': {
      'en': 'ประเภทบุคคล',
      'id': '',
      'ms': '',
    },
    'ugxyeb1g': {
      'en': 'สังกัด อปท./อบต.',
      'id': '',
      'ms': '',
    },
    'qs8lenb1': {
      'en': 'น้ำหนัก (กก.)',
      'id': '',
      'ms': '',
    },
    '1ug4whpf': {
      'en': 'ส่วนสูง (ซม.)',
      'id': '',
      'ms': '',
    },
    '4kipavsh': {
      'en': 'รอบเอว (ซม.)',
      'id': '',
      'ms': '',
    },
    'fvbwkrnf': {
      'en': 'ค่าความดันโลหิต (ม.ม.ปรอท)',
      'id': '',
      'ms': '',
    },
    '2euyat4n': {
      'en': 'ข้อมูลด้านความช่วยเหลือ',
      'id': '',
      'ms': '',
    },
    'gkvobmdd': {
      'en': '1. อาชีพ',
      'id': '',
      'ms': '',
    },
    's4xyqmiy': {
      'en': '2. การศึกษาบุตร',
      'id': '',
      'ms': '',
    },
    'o7n6c37c': {
      'en': '3. ที่อยู่อาศัย',
      'id': '',
      'ms': '',
    },
    '6550p9fz': {
      'en': '4. ความปลอดภัย',
      'id': '',
      'ms': '',
    },
    '86nhd3kg': {
      'en': '5. อุปกรณ์ช่วยเหลือคนพิการ',
      'id': '',
      'ms': '',
    },
    'dwoe5jnj': {
      'en': '6. การรักษาพยาบาล',
      'id': '',
      'ms': '',
    },
    'x854fyki': {
      'en': '7. อื่น ๆ ระบุ',
      'id': '',
      'ms': '',
    },
    'gaisftut': {
      'en': 'ระบุ',
      'id': '',
      'ms': '',
    },
    '1ewhxb6k': {
      'en': 'ข้อมูลแบบประเมินสุขภาวะผู้เปราะบาง',
      'id': '',
      'ms': '',
    },
    '37gvb63w': {
      'en':
          'คำชี้แจง: ขอความร่วมมือ ประเมินสุขภาวะผู้เปราะบางในช่วง 3 เดือนที่ผ่านมา โดยเลือกระดับคะแนนตามเ',
      'id': '',
      'ms': '',
    },
    'g51h4wa4': {
      'en':
          'เกณฑ์การประเมิน\n0 คะแนน ไม่มีความเปราะบาง\n1-2 คะแนน เริ่มเปราะบาง\n3 คะแนนขึ้นไป มีภาวะเปราะบาง',
      'id': '',
      'ms': '',
    },
    'eqivxh2j': {
      'en':
          '1. จดจำวัน เวลา สถานที่ บุคคล ทวนคำ 3 คำได้ หลังจากบอกคำไปแล้ว 1 นาที เช่น หลานสาว สวรรค์ ภูเขา',
      'id': '',
      'ms': '',
    },
    '16j4e3p7': {
      'en': '0 = ความจำดี',
      'id': '',
      'ms': '',
    },
    '9nlmk168': {
      'en': '1 = ความจำพอใช้',
      'id': '',
      'ms': '',
    },
    'acovqs3t': {
      'en': '2 = ความจำไม่ดี',
      'id': '',
      'ms': '',
    },
    'roksx52j': {
      'en': 'Please select...',
      'id': '',
      'ms': '',
    },
    'rb644wmx': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'npi7sww9': {
      'en': '2. มีความรู้สึกเหนื่อยล้าบ่อยครั้งใน 1 วัน',
      'id': '',
      'ms': '',
    },
    'm9jwprom': {
      'en': '0 = ไม่มีเลย',
      'id': '',
      'ms': '',
    },
    'z0ba3l5p': {
      'en': '1 = มีบ้าง',
      'id': '',
      'ms': '',
    },
    'nv6z8dxv': {
      'en': '2 = บ่อยครั้ง',
      'id': '',
      'ms': '',
    },
    'nfgqfhkp': {
      'en': 'Please select...',
      'id': '',
      'ms': '',
    },
    'nornz7j8': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'nwwyrbrc': {
      'en': '3. เดินขึ้นบันได 10 ขั้นได้หรือไม่',
      'id': '',
      'ms': '',
    },
    'b4qu7kj9': {
      'en': '0 = ได้ 10 ขั้น',
      'id': '',
      'ms': '',
    },
    '45kpzdpb': {
      'en': '1 = ได้ 5 ขั้น',
      'id': '',
      'ms': '',
    },
    'wr6gns1g': {
      'en': '2 = 0-4  ขั้น',
      'id': '',
      'ms': '',
    },
    '54coql38': {
      'en': 'Please select...',
      'id': '',
      'ms': '',
    },
    'jb2krkxj': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'e24qwd1z': {
      'en': '4. เดินไป-กลับ 20 ก้าว โดยไม่มีอุปกรณ์ข่วย',
      'id': '',
      'ms': '',
    },
    'fboqlh57': {
      'en': '0 = ได้ 20 ก้าว',
      'id': '',
      'ms': '',
    },
    '1al1lfn4': {
      'en': '1 = ได้ 10 ก้าว',
      'id': '',
      'ms': '',
    },
    'xgvtwhgn': {
      'en': '2 = ได้น้อยกว่า 10 ก้าว',
      'id': '',
      'ms': '',
    },
    'okc3l7nq': {
      'en': 'Please select...',
      'id': '',
      'ms': '',
    },
    't5n240wu': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'kw4pylda': {
      'en': '5. มีโรคประจำตัวน้อยกว่า 4 โรค',
      'id': '',
      'ms': '',
    },
    'kdkcdyyo': {
      'en': '0 = 0-3 โรค',
      'id': '',
      'ms': '',
    },
    'bymd700o': {
      'en': '1 = 4-6 โรค',
      'id': '',
      'ms': '',
    },
    '85jkh44o': {
      'en': '2 = 7 โรคขึ้นไป',
      'id': '',
      'ms': '',
    },
    'jw0mfbsc': {
      'en': 'Please select...',
      'id': '',
      'ms': '',
    },
    'p9zfuqvh': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    't5oik45a': {
      'en': '6. มีน้ำหนักลดหรือเพิ่มมากกว่าหรือเท่ากับ 5% ใน 1 ปี',
      'id': '',
      'ms': '',
    },
    '9jd8upow': {
      'en': '0 = น้ำหนักคงที่',
      'id': '',
      'ms': '',
    },
    'ddon3be6': {
      'en': '1 = ลด หรือ เพิ่ม 0-4%',
      'id': '',
      'ms': '',
    },
    '9pv2pl0m': {
      'en': '2 = ลด หรือ เพิ่ม 5% ขึ้นไป',
      'id': '',
      'ms': '',
    },
    'vxpukx6j': {
      'en': 'Please select...',
      'id': '',
      'ms': '',
    },
    'eoppgs0u': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'cp1b6ple': {
      'en': '7. มีความคิดเบื่อหน่าย ท้อใจ ว้าเหว่ อยากมีเพื่อนในสัปดาห์ก่อน',
      'id': '',
      'ms': '',
    },
    'e3bkopih': {
      'en': '0 = ไม่มีเลย',
      'id': '',
      'ms': '',
    },
    '4m1g7lt6': {
      'en': '1 = มีบ้าง',
      'id': '',
      'ms': '',
    },
    'nyta9gfd': {
      'en': '2 = บ่อยครั้ง',
      'id': '',
      'ms': '',
    },
    'd1v7auoc': {
      'en': 'Please select...',
      'id': '',
      'ms': '',
    },
    'twe5zj5y': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'jq3ytso5': {
      'en': '8. มีความคิดฆ่าตัวตายในเดือนที่ผ่านมา',
      'id': '',
      'ms': '',
    },
    'ohgbmgyf': {
      'en': '0 = ไม่มีเลย',
      'id': '',
      'ms': '',
    },
    '82v0yw2t': {
      'en': '1 = มีบ้าง',
      'id': '',
      'ms': '',
    },
    'jizx4xyp': {
      'en': '2 = บ่อยครั้ง',
      'id': '',
      'ms': '',
    },
    '770uszz8': {
      'en': 'Please select...',
      'id': '',
      'ms': '',
    },
    'x6l9q4yx': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'h6k5j267': {
      'en': 'รวม',
      'id': '',
      'ms': '',
    },
    'upb6prqj': {
      'en': 'Label here...',
      'id': '',
      'ms': '',
    },
    'if9vgzcm': {
      'en': 'ข้อสังเกต / ความคิดเห็นอื่นๆ ',
      'id': '',
      'ms': '',
    },
    '4gowq5oe': {
      'en': 'Label here...',
      'id': '',
      'ms': '',
    },
    '1wad1cka': {
      'en': 'ยกเลิก',
      'id': 'Hasilkan Penawaran',
      'ms': 'Hasilkan Petikan',
    },
    'ycxhuokf': {
      'en': 'บันทึก',
      'id': 'Lihat Perusahaan',
      'ms': 'Lihat Syarikat',
    },
    'u7rq2noa': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // userEditDetail
  {
    'k6wl4qrj': {
      'en': 'อัพโหลดรูป',
      'id': '',
      'ms': '',
    },
    'ctjbpa5h': {
      'en': 'เลขบัตรประชาชน...',
      'id': '',
      'ms': '',
    },
    'hvq6zmz2': {
      'en': 'เลขบัตรประชาชน',
      'id': '',
      'ms': '',
    },
    'dhlwso0a': {
      'en': 'Label here...',
      'id': '',
      'ms': '',
    },
    '32oqg688': {
      'en': 'Label here...',
      'id': '',
      'ms': '',
    },
    'h5t7pg0j': {
      'en': 'Label here...',
      'id': '',
      'ms': '',
    },
    'mrjp52xv': {
      'en': 'Label here...',
      'id': '',
      'ms': '',
    },
    '507qoh47': {
      'en': 'Label here...',
      'id': '',
      'ms': '',
    },
    'yues8ywo': {
      'en': 'เพศ',
      'id': '',
      'ms': '',
    },
    'a953pmlz': {
      'en': 'ชาย',
      'id': '',
      'ms': '',
    },
    'frv0ykaf': {
      'en': 'หญิง',
      'id': '',
      'ms': '',
    },
    'xw6ke3z5': {
      'en': 'Option 1',
      'id': '',
      'ms': '',
    },
    'onppcq2g': {
      'en': 'Please select...',
      'id': '',
      'ms': '',
    },
    'oylndh10': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'sy2sil8x': {
      'en': 'ยกเลิก',
      'id': 'Hasilkan Penawaran',
      'ms': 'Hasilkan Petikan',
    },
    'w9b8gsdk': {
      'en': 'บันทึก',
      'id': 'Lihat Perusahaan',
      'ms': 'Lihat Syarikat',
    },
    's3snedm8': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // Signup
  {
    'f7t5hwdo': {
      'en': 'ยินดีต้อนรับ สู่ระบบ DSRD',
      'id': 'Selamat Datang kembali!',
      'ms': 'Selamat kembali!',
    },
    'al4wwlys': {
      'en': 'กรุณากรอกข้อมูลเข้าสู่ระบบ',
      'id': 'Gunakan formulir di bawah ini untuk mengakses akun Anda.',
      'ms': 'Gunakan borang di bawah untuk mengakses akaun anda.',
    },
    'g37f7b6p': {
      'en': 'ชื่อ',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
    },
    '0tkvv3lc': {
      'en': '',
      'id': 'Masukkan email Anda disini...',
      'ms': 'Masukkan e-mel anda di sini...',
    },
    'vk98isiv': {
      'en': 'นามสกุล',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
    },
    'rqd4m4g9': {
      'en': '',
      'id': 'Masukkan email Anda disini...',
      'ms': 'Masukkan e-mel anda di sini...',
    },
    'tg506xxo': {
      'en': 'User ( ภาษาอังกฤษ 6-8 ตัว)',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
    },
    'idsiivsx': {
      'en': '',
      'id': 'Masukkan email Anda disini...',
      'ms': 'Masukkan e-mel anda di sini...',
    },
    'm5tds2ei': {
      'en': 'รหัสผ่าน',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
    },
    'mzthgao0': {
      'en': '',
      'id': 'Masukkan email Anda disini...',
      'ms': 'Masukkan e-mel anda di sini...',
    },
    'dln65vul': {
      'en': 'เบอร์โทรศัพท์.',
      'id': 'Alamat email',
      'ms': 'Alamat emel',
    },
    'rd0peug2': {
      'en': '',
      'id': 'Masukkan email Anda disini...',
      'ms': 'Masukkan e-mel anda di sini...',
    },
    'jfcmtdba': {
      'en': 'เลือกตำบล',
      'id': '',
      'ms': '',
    },
    '37nvbbnd': {
      'en': 'Search for an item...',
      'id': '',
      'ms': '',
    },
    'k8ap17pe': {
      'en': 'ลงทะเบียน',
      'id': 'Gabung',
      'ms': 'Log masuk',
    },
    'tv1uj9b3': {
      'en': 'Home',
      'id': 'Rumah',
      'ms': 'Rumah',
    },
  },
  // MultiplePlacesPicker
  {
    'rmadcsfh': {
      'en': 'Locations',
      'id': '',
      'ms': '',
    },
    'y2rfc1zx': {
      'en': 'Home',
      'id': '',
      'ms': '',
    },
  },
  // modal_success
  {
    'kred63vb': {
      'en': 'Send Contract Confirmation',
      'id': 'Kirim Konfirmasi Kontrak',
      'ms': 'Hantar Pengesahan Kontrak',
    },
    'hywgg8eu': {
      'en': 'A new contract has been generated for:',
      'id': 'Kontrak baru telah dibuat untuk:',
      'ms': 'Kontrak baru telah dijana untuk:',
    },
    'kmp2gbpy': {
      'en': 'Randy Alcorn',
      'id': 'Randy Alcorn',
      'ms': 'Randy Alcorn',
    },
    'a7nc1dt4': {
      'en': 'Head of Procurement',
      'id': 'Kepala Pengadaan',
      'ms': 'Ketua Perolehan',
    },
    '2f2nxucv': {
      'en': 'ACME Co.',
      'id': 'ACME Co.',
      'ms': 'ACME Co.',
    },
    'vcm4fijj': {
      'en': 'Next Steps',
      'id': 'Langkah selanjutnya',
      'ms': 'Langkah seterusnya',
    },
    '60n0fqw5': {
      'en':
          'Send the information below. And we will send an email with details to the customer and allow you to manage it in your dashboard.',
      'id':
          'Kirim informasi di bawah ini. Dan kami akan mengirimkan email dengan detail kepada pelanggan dan memungkinkan Anda untuk mengelolanya di dasbor Anda.',
      'ms':
          'Hantar maklumat di bawah. Dan kami akan menghantar e-mel dengan butiran kepada pelanggan dan membenarkan anda mengurusnya dalam papan pemuka anda.',
    },
    'e408bhw6': {
      'en': 'Send Information',
      'id': 'Kirim Informasi',
      'ms': 'Hantar Maklumat',
    },
    'wo1onxhi': {
      'en': 'Never Mind',
      'id': 'Sudahlah',
      'ms': 'Tidak mengapa',
    },
  },
  // modal_Message
  {
    'wa4vkne2': {
      'en': 'Congratulations!',
      'id': 'Selamat!',
      'ms': 'tahniah!',
    },
    '3hf2ocig': {
      'en':
          'Now that a contract has been generated for this customer please contact them with the date you will send the signed agreement.',
      'id':
          'Sekarang kontrak telah dibuat untuk pelanggan ini, silakan hubungi mereka dengan tanggal Anda akan mengirim perjanjian yang ditandatangani.',
      'ms':
          'Memandangkan kontrak telah dijana untuk pelanggan ini, sila hubungi mereka dengan tarikh anda akan menghantar perjanjian yang ditandatangani.',
    },
    'q0jvi1lp': {
      'en': 'Okay',
      'id': 'Oke',
      'ms': 'baik',
    },
    'oo4y13nf': {
      'en': 'Continue',
      'id': 'Melanjutkan',
      'ms': 'teruskan',
    },
  },
  // modal_Welcome
  {
    '00flvi93': {
      'en': 'Congratulations!',
      'id': 'Selamat!',
      'ms': 'tahniah!',
    },
    'fmzceh74': {
      'en': 'A new contract has been generated for:',
      'id': 'Kontrak baru telah dibuat untuk:',
      'ms': 'Kontrak baru telah dijana untuk:',
    },
    'g8q2u55w': {
      'en': 'Continue',
      'id': 'Melanjutkan',
      'ms': 'teruskan',
    },
  },
  // createComment
  {
    'l2jlnhye': {
      'en': 'Create Note',
      'id': 'Buat Catatan',
      'ms': 'Cipta Nota',
    },
    'd6yfe8tj': {
      'en': 'Find members by searching below',
      'id': 'Temukan anggota dengan mencari di bawah',
      'ms': 'Cari ahli dengan mencari di bawah',
    },
    'p3rj5ra0': {
      'en': 'Ricky Rodriguez',
      'id': 'Ricky Rodriguez',
      'ms': 'Ricky Rodriguez',
    },
    '9gf6o5ss': {
      'en': 'Enter your note here...',
      'id': 'Masukkan catatan Anda di sini...',
      'ms': 'Masukkan nota anda di sini...',
    },
    'farrki57': {
      'en': 'Create Note',
      'id': 'Buat Catatan',
      'ms': 'Cipta Nota',
    },
  },
  // mobileNav
  {
    'sy0pxvma': {
      'en': 'Dashboard',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    't5c3aiuy': {
      'en': 'My Team',
      'id': 'Kelompok ku',
      'ms': 'Pasukan saya',
    },
    'nkz3c58a': {
      'en': 'Customers',
      'id': 'Pelanggan',
      'ms': 'Pelanggan',
    },
    '1mkyyjwj': {
      'en': 'Contracts',
      'id': 'Kontrak',
      'ms': 'Kontrak',
    },
    'eg79coc6': {
      'en': 'Profile',
      'id': 'Profil',
      'ms': 'Profil',
    },
  },
  // webNav
  {
    'xai8ocja': {
      'en': 'Search',
      'id': 'Mencari',
      'ms': 'Cari',
    },
    'yg07zi4c': {
      'en': 'แดชบอร์ด',
      'id': 'Dasbor',
      'ms': 'Papan pemuka',
    },
    '5s0d776i': {
      'en': 'ทีมงาน',
      'id': 'Kelompok ku',
      'ms': 'Pasukan saya',
    },
    'lbojdpxg': {
      'en': 'กลุ่มเปราะบาง',
      'id': 'Pelanggan',
      'ms': 'Pelanggan',
    },
    '9pjba90p': {
      'en': 'Contracts',
      'id': 'Kontrak',
      'ms': 'Kontrak',
    },
    '01nu9cy0': {
      'en': 'ข้อมูลผู้ใช้',
      'id': 'Profil',
      'ms': 'Profil',
    },
  },
  // commandPalette
  {
    'jt9g5o8v': {
      'en': 'Search platform...',
      'id': 'Cari platform...',
      'ms': 'Platform carian...',
    },
    'b3bd9y8w': {
      'en': 'Search',
      'id': 'Mencari',
      'ms': 'Cari',
    },
    'pw6kvl1f': {
      'en': 'Quick Links',
      'id': 'tautan langsung',
      'ms': 'Pautan Pantas',
    },
    'gckukxjv': {
      'en': 'Find Contract',
      'id': 'Temukan Kontrak',
      'ms': 'Cari Kontrak',
    },
    'zsq8vj02': {
      'en': 'Find Customer',
      'id': 'Temukan Pelanggan',
      'ms': 'Cari Pelanggan',
    },
    'iqxwv326': {
      'en': 'New Contract',
      'id': 'Kontrak baru',
      'ms': 'Kontrak Baru',
    },
    's60yfg0g': {
      'en': 'New Customer',
      'id': 'Pelanggan baru',
      'ms': 'Pelanggan baru',
    },
    'lwrh59bb': {
      'en': 'Recent Searches',
      'id': 'pencarian terkini',
      'ms': 'Carian Terkini',
    },
    'o6lqlfr1': {
      'en': 'Newport Financ',
      'id': 'Keuangan Newport',
      'ms': 'Kewangan Newport',
    },
    '6zpaywwg': {
      'en': 'Harry Styles',
      'id': 'Harry Styles',
      'ms': 'gaya Harry',
    },
  },
  // editProfilePhoto
  {
    '6bnefz1c': {
      'en': 'Change Photo',
      'id': '',
      'ms': '',
    },
    'yaxe7q8v': {
      'en':
          'Upload a new photo below in order to change your avatar seen by others.',
      'id': '',
      'ms': '',
    },
    're4x0sz7': {
      'en': 'Upload Image',
      'id': '',
      'ms': '',
    },
    'sr54fsk6': {
      'en': 'Save Changes',
      'id': '',
      'ms': '',
    },
  },
  // MapSelect
  {
    'c6yfux27': {
      'en': 'Change Photo',
      'id': '',
      'ms': '',
    },
    'obag4oik': {
      'en':
          'Upload a new photo below in order to change your avatar seen by others.',
      'id': '',
      'ms': '',
    },
    '1yz7pjsq': {
      'en': 'Upload Image',
      'id': '',
      'ms': '',
    },
    '4netni55': {
      'en': 'Save Changes',
      'id': '',
      'ms': '',
    },
  },
  // mapSelect2
  {
    'nf4jdcu5': {
      'en': 'ตกลง',
      'id': '',
      'ms': '',
    },
  },
  // Miscellaneous
  {
    'd9he7r3s': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'qu4aubrr': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'l4cfi6qf': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '65e2tfs2': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ddazihx4': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'db03cpjj': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'fdb9078p': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '80ouzj9q': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '6rzhptp9': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ce8c4ty0': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'bakfu3g6': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '4w15g0wt': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'sevjz2dk': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'kcvqa08x': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'dqrzd6sq': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'dpqtohyf': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'v01vf71s': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'gcv6def1': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'um9es99m': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'o4enbz4j': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '8z4tvfh7': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '2ybzla8x': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'd1wdf5i1': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'fdvcsmuu': {
      'en': '',
      'id': '',
      'ms': '',
    },
    '2py80kgi': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'p6lsrh2a': {
      'en': '',
      'id': '',
      'ms': '',
    },
    'ne8cclp9': {
      'en': '',
      'id': '',
      'ms': '',
    },
  },
].reduce((a, b) => a..addAll(b));
