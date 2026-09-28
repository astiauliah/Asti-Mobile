import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pink Profile',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController npmController = TextEditingController();
  final TextEditingController jurusanController = TextEditingController();

  XFile? fotoProfile;

  String nama = '';
  String npm = '';
  String jurusan = '';

  Future<void> pilihFoto() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      setState(() {
        fotoProfile = image;
      });
    }
  }

  void simpanData() {
    if (namaController.text.trim().isEmpty ||
        npmController.text.trim().isEmpty ||
        jurusanController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color(0xFFE91E63),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: const Row(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              Text('Lengkapi semua data terlebih dahulu'),
            ],
          ),
        ),
      );
      return;
    }

    setState(() {
      nama = namaController.text.trim();
      npm = npmController.text.trim();
      jurusan = jurusanController.text.trim();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xFFD81B60),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        content: const Row(
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text('Profil berhasil disimpan!'),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    namaController.dispose();
    npmController.dispose();
    jurusanController.dispose();
    super.dispose();
  }

  Widget inputField({
    required String label,
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFFFE4EF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: const Color(0xFFE91E63),
              size: 21,
            ),
          ),
          filled: true,
          fillColor: const Color(0xFFFFF8FB),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 17,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Color(0xFFF6D5E2),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Color(0xFFE91E63),
              width: 2,
            ),
          ),
          labelStyle: const TextStyle(
            color: Color(0xFF777777),
          ),
        ),
      ),
    );
  }

  Widget infoItem(
    IconData icon,
    String title,
    String value,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7FA),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFFFDCE9),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xFFE91E63),
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xFF292929),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF5F9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // =========================
              // HEADER PINK
              // =========================
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(
                  24,
                  30,
                  24,
                  85,
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFE91E63),
                      Color(0xFFF06292),
                      Color(0xFFF48FB1),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(45),
                    bottomRight: Radius.circular(45),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 42,
                          height: 42,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.20),
                            borderRadius: BorderRadius.circular(13),
                          ),
                          child: const Icon(
                            Icons.favorite_rounded,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 13,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.20),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'STUDENT',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      'My Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 7),

                    Text(
                      'Create your personal student profile',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.90),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),

              // =========================
              // FOTO PROFIL
              // =========================
              Transform.translate(
                offset: const Offset(0, -60),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.withOpacity(0.20),
                        blurRadius: 25,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Container(
                        width: 135,
                        height: 135,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFFFE4EF),
                        ),
                        child: ClipOval(
                          child: fotoProfile != null
                              ? Image.network(
                                  fotoProfile!.path,
                                  fit: BoxFit.cover,
                                )
                              : const Icon(
                                  Icons.person_rounded,
                                  size: 75,
                                  color: Color(0xFFE91E63),
                                ),
                        ),
                      ),

                      Positioned(
                        bottom: 3,
                        right: 3,
                        child: GestureDetector(
                          onTap: pilihFoto,
                          child: Container(
                            width: 43,
                            height: 43,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE91E63),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 3,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.pink.withOpacity(0.25),
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // =========================
              // FORM
              // =========================
              Transform.translate(
                offset: const Offset(0, -30),
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.withOpacity(0.08),
                        blurRadius: 25,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.edit_note_rounded,
                            color: Color(0xFFE91E63),
                            size: 27,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Data Mahasiswa',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF292929),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 7),

                      const Text(
                        'Masukkan informasi diri kamu',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),

                      const SizedBox(height: 23),

                      inputField(
                        label: 'Nama Lengkap',
                        hint: 'Contoh: Firza Rizkya Nurazizah',
                        icon: Icons.person_outline_rounded,
                        controller: namaController,
                      ),

                      inputField(
                        label: 'NPM',
                        hint: 'Masukkan nomor NPM',
                        icon: Icons.badge_outlined,
                        controller: npmController,
                        keyboardType: TextInputType.number,
                      ),

                      inputField(
                        label: 'Jurusan',
                        hint: 'Contoh: Manajemen Informatika',
                        icon: Icons.school_outlined,
                        controller: jurusanController,
                      ),

                      const SizedBox(height: 5),

                      // =========================
                      // BUTTON SAVE
                      // =========================
                      SizedBox(
                        width: double.infinity,
                        height: 57,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFE91E63),
                                Color(0xFFF06292),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(17),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.pink.withOpacity(0.28),
                                blurRadius: 15,
                                offset: const Offset(0, 7),
                              ),
                            ],
                          ),
                          child: ElevatedButton.icon(
                            onPressed: simpanData,
                            icon: const Icon(
                              Icons.save_rounded,
                              size: 21,
                            ),
                            label: const Text(
                              'Simpan Profil',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.white,
                              shadowColor: Colors.transparent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // =========================
              // PROFIL TERSIMPAN
              // =========================
              if (nama.isNotEmpty)
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(
                    20,
                    0,
                    20,
                    20,
                  ),
                  padding: const EdgeInsets.all(22),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFFFE4EF),
                        Color(0xFFFFF7FA),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: const Color(0xFFF8C6D9),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.favorite_rounded,
                            color: Color(0xFFE91E63),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Profil Saya',
                            style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      if (fotoProfile != null)
                        Center(
                          child: Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFFE91E63),
                                width: 3,
                              ),
                            ),
                            child: ClipOval(
                              child: Image.network(
                                fotoProfile!.path,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),

                      if (fotoProfile != null)
                        const SizedBox(height: 18),

                      infoItem(
                        Icons.person_rounded,
                        'Nama',
                        nama,
                      ),

                      infoItem(
                        Icons.badge_rounded,
                        'NPM',
                        npm,
                      ),

                      infoItem(
                        Icons.school_rounded,
                        'Jurusan',
                        jurusan,
                      ),
                    ],
                  ),
                ),

              const SizedBox(height: 10),

              const Text(
                '♡ Student Profile App ♡',
                style: TextStyle(
                  color: Color(0xFFB76E88),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
