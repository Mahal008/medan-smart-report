import 'package:flutter/material.dart';

// ========== GLOBAL STORAGE — NO PACKAGES NEEDED ==========
List<Map<String, dynamic>> globalReports = [];

void main() {
  runApp(MedanApp());
}

class MedanApp extends StatefulWidget {
  @override
  _MedanAppState createState() => _MedanAppState();
}

class _MedanAppState extends State<MedanApp> {
  String selectedLanguage = "EN";

  void changeLanguage(String lang) {
    setState(() { selectedLanguage = lang; });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medan Smart Report',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomeScreen(selectedLanguage: selectedLanguage, changeLanguage: changeLanguage),
    );
  }
}

// ================= WELCOME SCREEN =================

class WelcomeScreen extends StatelessWidget {
  final String selectedLanguage;
  final Function(String) changeLanguage;
  WelcomeScreen({required this.selectedLanguage, required this.changeLanguage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(context),
      body: Builder(
        builder: (context) => Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1E3A8A), Color(0xFF2563EB), Color(0xFF3B82F6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Positioned(top: -60, right: -60,
              child: Container(width: 200, height: 200,
                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.05)))),
            Positioned(bottom: -80, left: -80,
              child: Container(width: 250, height: 250,
                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.05)))),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white38),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.1),
                      ),
                      child: Text(
                        selectedLanguage == "EN" ? "🏙️  City of Medan — Official Platform" : "🏙️  Kota Medan — Platform Resmi",
                        style: TextStyle(color: Colors.white70, fontSize: 12, letterSpacing: 0.5),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.15)),
                      child: Icon(Icons.location_city, size: 70, color: Colors.white),
                    ),
                    SizedBox(height: 24),
                    Text(
                      selectedLanguage == "EN" ? "Medan Smart Report" : "Laporan Pintar Medan",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 0.5),
                    ),
                    SizedBox(height: 12),
                    Text(
                      selectedLanguage == "EN"
                          ? "Empowering citizens to build a smarter,\nsafer, and more transparent Medan."
                          : "Memberdayakan warga untuk membangun\nMedan yang lebih cerdas dan transparan.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.white70, height: 1.5),
                    ),
                    SizedBox(height: 50),
                    Row(children: [
                      Expanded(child: Divider(color: Colors.white24)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          selectedLanguage == "EN" ? "USE THE MENU TO BEGIN" : "GUNAKAN MENU UNTUK MULAI",
                          style: TextStyle(color: Colors.white38, fontSize: 11, letterSpacing: 1),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.white24)),
                    ]),
                    SizedBox(height: 20),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Icon(Icons.arrow_back, color: Colors.white38, size: 16),
                      SizedBox(width: 6),
                      Text(
                        selectedLanguage == "EN" ? "Tap the menu icon above" : "Ketuk ikon menu di atas",
                        style: TextStyle(color: Colors.white38, fontSize: 13),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 40, right: 20,
              child: Row(children: [
                TextButton(
                  onPressed: () => changeLanguage("EN"),
                  child: Text("EN", style: TextStyle(color: Colors.white, fontWeight: selectedLanguage == "EN" ? FontWeight.bold : FontWeight.normal, fontSize: 14)),
                ),
                Text("|", style: TextStyle(color: Colors.white38)),
                TextButton(
                  onPressed: () => changeLanguage("ID"),
                  child: Text("ID", style: TextStyle(color: Colors.white, fontWeight: selectedLanguage == "ID" ? FontWeight.bold : FontWeight.normal, fontSize: 14)),
                ),
              ]),
            ),
            Positioned(
              top: 40, left: 10,
              child: Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.menu, color: Colors.white, size: 30),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF1E3A8A), Color(0xFF2563EB)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.transparent),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.15)),
                  child: Icon(Icons.location_city, size: 45, color: Colors.white),
                ),
                SizedBox(height: 10),
                Text("Medan Smart Report", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                Text("v1.0.0", style: TextStyle(color: Colors.white54, fontSize: 12)),
              ]),
            ),
            _drawerItem(context, icon: Icons.edit_note,
              label: selectedLanguage == "EN" ? "Start Reporting" : "Mulai Melapor",
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => UserInfoScreen(selectedLanguage: selectedLanguage, changeLanguage: changeLanguage),
                ));
              }),
            _drawerDivider(),
            _drawerItem(context, icon: Icons.track_changes,
              label: selectedLanguage == "EN" ? "Track Report Status" : "Cek Status Laporan",
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => TrackingScreen(selectedLanguage: selectedLanguage),
                ));
              }),
            _drawerDivider(),
            _drawerItem(context, icon: Icons.admin_panel_settings,
              label: selectedLanguage == "EN" ? "Official Portal" : "Portal Resmi",
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => OfficialLoginScreen(selectedLanguage: selectedLanguage),
                ));
              }),
            _drawerDivider(),
            _drawerItem(context, icon: Icons.info_outline,
              label: selectedLanguage == "EN" ? "About Medan Smart Report" : "Tentang Medan Smart Report",
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => AboutScreen(selectedLanguage: selectedLanguage),
                ));
              }),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("© 2025 Medan Smart Report\nCity of Medan",
                textAlign: TextAlign.center, style: TextStyle(color: Colors.white38, fontSize: 11)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(BuildContext context, {required IconData icon, required String label, required VoidCallback onTap}) {
    return ListTile(
      leading: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
        child: Icon(icon, color: Colors.white, size: 22),
      ),
      title: Text(label, style: TextStyle(color: Colors.white, fontSize: 15)),
      trailing: Icon(Icons.chevron_right, color: Colors.white38, size: 20),
      onTap: onTap,
    );
  }

  Widget _drawerDivider() => Divider(color: Colors.white12, indent: 16, endIndent: 16);
}

// ================= ABOUT SCREEN =================

class AboutScreen extends StatelessWidget {
  final String selectedLanguage;
  AboutScreen({required this.selectedLanguage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedLanguage == "EN" ? "About" : "Tentang"),
        backgroundColor: Color(0xFF1E3A8A), elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1E3A8A), Color(0xFF2563EB), Color(0xFF3B82F6)],
            begin: Alignment.topCenter, end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(children: [
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.15)),
                child: Icon(Icons.location_city, size: 70, color: Colors.white),
              ),
              SizedBox(height: 16),
              Text("Medan Smart Report", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white)),
              Text("v1.0.0", style: TextStyle(color: Colors.white54)),
              SizedBox(height: 28),
              _aboutCard(icon: Icons.flag_outlined,
                title: selectedLanguage == "EN" ? "Our Mission" : "Misi Kami",
                child: Text(
                  selectedLanguage == "EN"
                      ? "Empowering the citizens of Medan to build a smarter, safer city through instant, transparent reporting."
                      : "Memberdayakan warga Medan untuk membangun kota yang lebih cerdas dan aman melalui pelaporan yang instan dan transparan.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.6),
                )),
              SizedBox(height: 16),
              _aboutCard(icon: Icons.code,
                title: selectedLanguage == "EN" ? "Developed By" : "Dikembangkan Oleh",
                child: Column(children: [
                  _teamMember("Mahmud Lawan", Icons.person_outline),
                  _teamMember("Setyadi", Icons.person_outline),
                  _teamMember("Alena Aurelia Rohiman", Icons.person_outline),
                ])),
              SizedBox(height: 16),
              _aboutCard(icon: Icons.school_outlined,
                title: selectedLanguage == "EN" ? "Supervised By" : "Dibimbing Oleh",
                child: _teamMember("Mhd. Basri, S.Si, M.Kom", Icons.supervisor_account_outlined)),
              SizedBox(height: 30),
              Text("© 2025 Medan Smart Report\nUniversitas — Kota Medan",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white38, fontSize: 12, height: 1.6)),
              SizedBox(height: 20),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _aboutCard({required IconData icon, required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(children: [
        Icon(icon, color: Colors.white70, size: 28),
        SizedBox(height: 8),
        Text(title, style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
        SizedBox(height: 14),
        child,
      ]),
    );
  }

  Widget _teamMember(String name, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(children: [
        Icon(icon, color: Colors.white54, size: 20),
        SizedBox(width: 12),
        Text(name, style: TextStyle(color: Colors.white, fontSize: 15)),
      ]),
    );
  }
}

// ================= USER INFO SCREEN =================

class UserInfoScreen extends StatefulWidget {
  final String selectedLanguage;
  final Function(String) changeLanguage;
  UserInfoScreen({required this.selectedLanguage, required this.changeLanguage});

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  String get selectedLanguage => widget.selectedLanguage;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedLanguage == "EN" ? "Your Information" : "Informasi Anda"),
        backgroundColor: Color(0xFF1E3A8A), elevation: 0,
      ),
      body: Container(
        color: Color(0xFFF0F4FF),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                elevation: 8,
                shadowColor: Colors.blue.withOpacity(0.2),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(children: [
                    Icon(Icons.person_pin, size: 50, color: Color(0xFF2563EB)),
                    SizedBox(height: 10),
                    Text(selectedLanguage == "EN" ? "Enter Your Details" : "Masukkan Detail Anda",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E3A8A))),
                    SizedBox(height: 6),
                    Text(
                      selectedLanguage == "EN"
                          ? "Your information helps us process reports faster."
                          : "Informasi Anda membantu kami memproses laporan lebih cepat.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    SizedBox(height: 24),
                    _inputField(nameController, selectedLanguage == "EN" ? "Full Name" : "Nama Lengkap", Icons.person),
                    SizedBox(height: 16),
                    _inputField(phoneController, selectedLanguage == "EN" ? "Phone Number" : "Nomor Telepon", Icons.phone, isPhone: true),
                    SizedBox(height: 16),
                    _inputField(addressController, selectedLanguage == "EN" ? "Address (Optional)" : "Alamat (Opsional)", Icons.home),
                    SizedBox(height: 28),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF2563EB),
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          if (nameController.text.isEmpty || phoneController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(selectedLanguage == "EN" ? "Please fill all required fields" : "Harap isi semua kolom yang wajib diisi"),
                            ));
                          } else {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => ReportScreen(
                                selectedLanguage: selectedLanguage,
                                userName: nameController.text,
                                userPhone: phoneController.text,
                                userAddress: addressController.text,
                              ),
                            ));
                          }
                        },
                        child: Text(selectedLanguage == "EN" ? "Continue" : "Lanjutkan",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputField(TextEditingController controller, String label, IconData icon, {bool isPhone = false}) {
    return TextField(
      controller: controller,
      keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Color(0xFF2563EB)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFF2563EB), width: 2),
        ),
      ),
    );
  }
}

// ================= REPORT SCREEN =================

class ReportScreen extends StatefulWidget {
  final String selectedLanguage;
  final String userName;
  final String userPhone;
  final String userAddress;
  ReportScreen({required this.selectedLanguage, required this.userName, required this.userPhone, required this.userAddress});

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  String get selectedLanguage => widget.selectedLanguage;
  String? selectedIssue;
  String? severity;
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController manualAddressController = TextEditingController();
  String latitude = "3.5952";
  String longitude = "98.6722";
  String currentTime = "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} - ${DateTime.now().hour}:${DateTime.now().minute}";

  // ✅ INSTANT SUBMIT — no async, no waiting, no spinning!
  void submitReport() {
    if (selectedIssue == null || severity == null || descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(selectedLanguage == "EN" ? "Please complete all fields" : "Harap lengkapi semua kolom"),
      ));
      return;
    }

    String trackingId = "MSR-${DateTime.now().millisecondsSinceEpoch}";

    // Save instantly to global list — no async needed!
    globalReports.add({
      'id': trackingId,
      'reporter': widget.userName,
      'phone': widget.userPhone,
      'address': widget.userAddress,
      'issue': selectedIssue,
      'severity': severity!.toLowerCase(),
      'desc': descriptionController.text,
      'location': manualAddressController.text.isNotEmpty
          ? manualAddressController.text
          : "Medan, Sumatera Utara",
      'gps': "$latitude, $longitude",
      'date': currentTime,
      'status': 'pending',
      'savedAt': DateTime.now().millisecondsSinceEpoch,
    });

    // Show success immediately!
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(selectedLanguage == "EN" ? "Report Submitted ✅" : "Laporan Terkirim ✅"),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Icon(Icons.check_circle, color: Colors.green, size: 60),
          SizedBox(height: 16),
          Text(selectedLanguage == "EN" ? "Your Tracking ID:" : "ID Pelacakan Anda:"),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.blue.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
            child: SelectableText(trackingId,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF1E3A8A))),
          ),
          SizedBox(height: 10),
          Text(
            selectedLanguage == "EN"
                ? "Save this ID to track your report status."
                : "Simpan ID ini untuk melacak status laporan Anda.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
        ]),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: Text("OK", style: TextStyle(color: Color(0xFF2563EB), fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedLanguage == "EN" ? "Report Issue" : "Laporkan Masalah"),
        backgroundColor: Color(0xFF1E3A8A), elevation: 0,
      ),
      body: Container(
        color: Color(0xFFF0F4FF),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                elevation: 8,
                shadowColor: Colors.blue.withOpacity(0.2),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(children: [
                    Icon(Icons.report_problem_outlined, size: 50, color: Color(0xFF2563EB)),
                    SizedBox(height: 10),
                    Text(selectedLanguage == "EN" ? "Report an Issue" : "Laporkan Masalah",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1E3A8A))),
                    SizedBox(height: 6),
                    Text(
                      selectedLanguage == "EN"
                          ? "Your report will be sent directly to city officials."
                          : "Laporan Anda akan dikirim langsung ke pejabat kota.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    SizedBox(height: 24),
                    _dropdownField(
                      label: selectedLanguage == "EN" ? "Select Issue Type" : "Pilih Jenis Masalah",
                      icon: Icons.category_outlined,
                      items: [
                        DropdownMenuItem(value: "Road Damage", child: Text(selectedLanguage == "EN" ? "Road Damage" : "Kerusakan Jalan")),
                        DropdownMenuItem(value: "Garbage", child: Text(selectedLanguage == "EN" ? "Garbage" : "Sampah")),
                        DropdownMenuItem(value: "Flood", child: Text(selectedLanguage == "EN" ? "Flood" : "Banjir")),
                        DropdownMenuItem(value: "Street Light", child: Text(selectedLanguage == "EN" ? "Street Light" : "Lampu Jalan")),
                        DropdownMenuItem(value: "Fire Incident", child: Text(selectedLanguage == "EN" ? "Fire Incident" : "Insiden Kebakaran")),
                        DropdownMenuItem(value: "Other", child: Text(selectedLanguage == "EN" ? "Other" : "Lainnya")),
                      ],
                      onChanged: (value) => setState(() => selectedIssue = value),
                    ),
                    SizedBox(height: 16),
                    _dropdownField(
                      label: selectedLanguage == "EN" ? "Severity Level" : "Tingkat Keparahan",
                      icon: Icons.warning_amber_outlined,
                      items: [
                        DropdownMenuItem(value: "low", child: Text(selectedLanguage == "EN" ? "Low" : "Rendah")),
                        DropdownMenuItem(value: "medium", child: Text(selectedLanguage == "EN" ? "Medium" : "Sedang")),
                        DropdownMenuItem(value: "high", child: Text(selectedLanguage == "EN" ? "High" : "Tinggi")),
                        DropdownMenuItem(value: "critical", child: Text(selectedLanguage == "EN" ? "Critical" : "Kritis")),
                      ],
                      onChanged: (value) => setState(() => severity = value),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: descriptionController,
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelText: selectedLanguage == "EN" ? "Describe the problem" : "Jelaskan masalahnya",
                        prefixIcon: Padding(padding: const EdgeInsets.only(bottom: 60), child: Icon(Icons.description_outlined, color: Color(0xFF2563EB))),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Color(0xFF2563EB), width: 2)),
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Color(0xFF2563EB).withOpacity(0.08),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFF2563EB).withOpacity(0.2)),
                      ),
                      child: Row(children: [
                        Icon(Icons.gps_fixed, color: Color(0xFF2563EB)),
                        SizedBox(width: 10),
                        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(selectedLanguage == "EN" ? "GPS Location Captured" : "Lokasi GPS Terdeteksi",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E3A8A))),
                          Text("Lat: $latitude, Long: $longitude", style: TextStyle(fontSize: 12, color: Colors.grey)),
                        ])),
                        TextButton(
                          onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(selectedLanguage == "EN" ? "GPS Updated!" : "GPS Diperbarui!"),
                          )),
                          child: Text(selectedLanguage == "EN" ? "Refresh" : "Perbarui", style: TextStyle(color: Color(0xFF2563EB))),
                        ),
                      ]),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: manualAddressController,
                      decoration: InputDecoration(
                        labelText: selectedLanguage == "EN" ? "Landmark / Manual Address" : "Landmark / Alamat Manual",
                        hintText: selectedLanguage == "EN" ? "e.g. In front of Plaza Medan Fair" : "contoh: Di depan Plaza Medan Fair",
                        prefixIcon: Icon(Icons.place_outlined, color: Color(0xFF2563EB)),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Color(0xFF2563EB), width: 2)),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      selectedLanguage == "EN" ? "🕐  Reported at: $currentTime" : "🕐  Dilaporkan pada: $currentTime",
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF2563EB),
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: submitReport, // ✅ INSTANT — no async!
                        child: Text(
                          selectedLanguage == "EN" ? "Submit Report" : "Kirim Laporan",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _dropdownField({required String label, required IconData icon, required List<DropdownMenuItem<String>> items, required Function(String?) onChanged}) {
    return DropdownButtonFormField<String>(
      items: items,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Color(0xFF2563EB)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Color(0xFF2563EB), width: 2)),
      ),
    );
  }
}

// ================= TRACKING SCREEN =================

class TrackingScreen extends StatefulWidget {
  final String selectedLanguage;
  TrackingScreen({required this.selectedLanguage});

  @override
  _TrackingScreenState createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  String get selectedLanguage => widget.selectedLanguage;
  final TextEditingController trackingController = TextEditingController();
  Map<String, dynamic>? reportData;
  bool searched = false;

  void checkStatus() {
    if (trackingController.text.trim().isEmpty) return;
    final id = trackingController.text.trim();
    final found = globalReports.where((r) => r['id'] == id).toList();
    setState(() {
      searched = true;
      reportData = found.isNotEmpty ? found.first : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedLanguage == "EN" ? "Track Status" : "Lacak Status"),
        backgroundColor: Color(0xFF1E3A8A), elevation: 0,
      ),
      body: Container(
        color: Color(0xFFF0F4FF),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            SizedBox(height: 10),
            Text(
              selectedLanguage == "EN"
                  ? "Enter your Tracking ID to check the status of your report."
                  : "Masukkan ID Pelacakan untuk memeriksa status laporan Anda.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            SizedBox(height: 20),
            TextField(
              controller: trackingController,
              decoration: InputDecoration(
                labelText: selectedLanguage == "EN" ? "Enter Tracking ID" : "Masukkan ID Pelacakan",
                prefixIcon: Icon(Icons.search, color: Color(0xFF2563EB)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Color(0xFF2563EB), width: 2)),
                suffixIcon: IconButton(
                  icon: Icon(Icons.arrow_forward, color: Color(0xFF2563EB)),
                  onPressed: checkStatus,
                ),
              ),
              onSubmitted: (_) => checkStatus(),
            ),
            SizedBox(height: 30),
            if (searched && reportData == null)
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(children: [
                    Icon(Icons.search_off, color: Colors.grey, size: 44),
                    SizedBox(height: 12),
                    Text(selectedLanguage == "EN" ? "Report Not Found" : "Laporan Tidak Ditemukan",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1E3A8A))),
                    SizedBox(height: 8),
                    Text(
                      selectedLanguage == "EN"
                          ? "No report found. Please check your Tracking ID."
                          : "Laporan tidak ditemukan. Periksa ID Anda.",
                      textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ]),
                ),
              ),
            if (searched && reportData != null)
              Card(
                elevation: 6,
                shadowColor: Colors.blue.withOpacity(0.2),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(children: [
                    Icon(Icons.assignment_turned_in, color: Color(0xFF2563EB), size: 44),
                    SizedBox(height: 12),
                    Text(selectedLanguage == "EN" ? "Report Status" : "Status Laporan",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E3A8A))),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: _statusColor(reportData!['status']).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(_statusLabel(reportData!['status']),
                        style: TextStyle(fontSize: 15, color: _statusColor(reportData!['status']), fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(height: 14),
                    if (reportData!['issue'] != null)
                      _detailRow(selectedLanguage == "EN" ? "Issue" : "Masalah", reportData!['issue']),
                    if (reportData!['location'] != null)
                      _detailRow(selectedLanguage == "EN" ? "Location" : "Lokasi", reportData!['location']),
                    if (reportData!['date'] != null)
                      _detailRow(selectedLanguage == "EN" ? "Reported At" : "Dilaporkan", reportData!['date']),
                    SizedBox(height: 10),
                    Text(
                      selectedLanguage == "EN"
                          ? "Government officials have received your report and will process it soon."
                          : "Pejabat pemerintah telah menerima laporan Anda dan akan segera memprosesnya.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ]),
                ),
              ),
          ]),
        ),
      ),
    );
  }

  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("$label: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF1E3A8A))),
        Expanded(child: Text(value, style: TextStyle(fontSize: 13, color: Colors.grey))),
      ]),
    );
  }

  Color _statusColor(String s) {
    switch (s) {
      case 'pending': return Colors.orange;
      case 'in_progress': return Colors.blue;
      case 'resolved': return Colors.green;
      case 'rejected': return Colors.red;
      default: return Colors.orange;
    }
  }

  String _statusLabel(String s) {
    if (selectedLanguage == "EN") {
      switch (s) {
        case 'pending': return '⏳ Pending / Under Review';
        case 'in_progress': return '🔧 In Progress';
        case 'resolved': return '✅ Resolved';
        case 'rejected': return '❌ Rejected';
        default: return '⏳ Pending';
      }
    } else {
      switch (s) {
        case 'pending': return '⏳ Menunggu / Sedang Ditinjau';
        case 'in_progress': return '🔧 Sedang Diproses';
        case 'resolved': return '✅ Selesai';
        case 'rejected': return '❌ Ditolak';
        default: return '⏳ Menunggu';
      }
    }
  }
}

// ================= OFFICIAL LOGIN =================

class OfficialLoginScreen extends StatefulWidget {
  final String selectedLanguage;
  OfficialLoginScreen({required this.selectedLanguage});

  @override
  _OfficialLoginScreenState createState() => _OfficialLoginScreenState();
}

class _OfficialLoginScreenState extends State<OfficialLoginScreen> {
  final TextEditingController codeController = TextEditingController();
  bool isWrong = false;
  bool obscureText = true;
  final String officialCode = "MEDAN2025";

  void login() {
    if (codeController.text.trim().toUpperCase() == officialCode) {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => OfficialDashboardScreen(selectedLanguage: widget.selectedLanguage),
      ));
    } else {
      setState(() => isWrong = true);
      Future.delayed(Duration(seconds: 2), () {
        if (mounted) setState(() => isWrong = false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F2459), Color(0xFF1B4FD8), Color(0xFF2563EB)],
            begin: Alignment.topLeft, end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context)),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.1), border: Border.all(color: Colors.white24, width: 2)),
                  child: Icon(Icons.admin_panel_settings, size: 70, color: Colors.white),
                ),
                SizedBox(height: 24),
                Text(widget.selectedLanguage == "EN" ? "Official Portal" : "Portal Resmi",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white, letterSpacing: 0.5)),
                SizedBox(height: 8),
                Text(widget.selectedLanguage == "EN" ? "Authorized personnel only" : "Hanya untuk personel yang berwenang",
                  style: TextStyle(color: Colors.white60, fontSize: 14)),
                SizedBox(height: 40),
                Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Column(children: [
                      Icon(Icons.lock_outline, size: 40, color: Color(0xFF1E3A8A)),
                      SizedBox(height: 12),
                      Text(widget.selectedLanguage == "EN" ? "Enter Official Secret Code" : "Masukkan Kode Rahasia Resmi",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E3A8A))),
                      SizedBox(height: 6),
                      Text(
                        widget.selectedLanguage == "EN" ? "Restricted to government officials only." : "Khusus pejabat pemerintah.",
                        textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(height: 24),
                      TextField(
                        controller: codeController,
                        obscureText: obscureText,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 4),
                        decoration: InputDecoration(
                          hintText: "••••••••",
                          hintStyle: TextStyle(letterSpacing: 4),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Color(0xFF2563EB), width: 2)),
                          errorText: isWrong ? (widget.selectedLanguage == "EN" ? "Invalid code. Access denied." : "Kode salah. Akses ditolak.") : null,
                          suffixIcon: IconButton(
                            icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off, color: Colors.grey),
                            onPressed: () => setState(() => obscureText = !obscureText),
                          ),
                        ),
                        onSubmitted: (_) => login(),
                      ),
                      SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF1E3A8A),
                            padding: EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          onPressed: login,
                          child: Text(widget.selectedLanguage == "EN" ? "Access Dashboard" : "Akses Dasbor",
                            style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ]),
                  ),
                ),
                SizedBox(height: 20),
                Text("© 2025 Medan Smart Report — Official Use Only", style: TextStyle(color: Colors.white38, fontSize: 11)),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

// ================= OFFICIAL DASHBOARD =================

class OfficialDashboardScreen extends StatefulWidget {
  final String selectedLanguage;
  OfficialDashboardScreen({required this.selectedLanguage});

  @override
  _OfficialDashboardScreenState createState() => _OfficialDashboardScreenState();
}

class _OfficialDashboardScreenState extends State<OfficialDashboardScreen> {
  int _selectedIndex = 0;
  String get lang => widget.selectedLanguage;

  int get totalReports => globalReports.length;
  int get pendingReports => globalReports.where((r) => r['status'] == 'pending').length;
  int get resolvedReports => globalReports.where((r) => r['status'] == 'resolved').length;
  int get criticalReports => globalReports.where((r) => r['severity'] == 'critical' && r['status'] != 'resolved').length;
  String get resolutionRate => totalReports == 0 ? "0%" : "${(resolvedReports / totalReports * 100).toStringAsFixed(0)}%";
  int countByIssue(String issue) => globalReports.where((r) => r['issue'] == issue).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F4FF),
      appBar: AppBar(
        backgroundColor: Color(0xFF0F2459), elevation: 0,
        title: Row(children: [
          Icon(Icons.admin_panel_settings, color: Colors.amber, size: 22),
          SizedBox(width: 8),
          Text(lang == "EN" ? "Official Dashboard" : "Dasbor Resmi",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
        ]),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(color: Colors.green.withOpacity(0.2), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.green.withOpacity(0.4))),
            child: Row(children: [
              Container(width: 6, height: 6, decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle)),
              SizedBox(width: 4),
              Text("LIVE", style: TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.bold)),
            ]),
          ),
          IconButton(icon: Icon(Icons.logout, color: Colors.white70), onPressed: () => Navigator.pop(context)),
        ],
      ),
      body: IndexedStack(index: _selectedIndex, children: [_buildOverviewPage(), _buildAllReportsPage(), _buildAnalyticsPage(), _buildNotificationsPage()]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF0F2459),
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white38,
        selectedFontSize: 11, unselectedFontSize: 10,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: lang == "EN" ? "Overview" : "Ikhtisar"),
          BottomNavigationBarItem(
            icon: Stack(children: [
              Icon(Icons.assignment),
              if (pendingReports > 0) Positioned(right: 0, top: 0,
                child: Container(padding: EdgeInsets.all(2), decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  child: Text('$pendingReports', style: TextStyle(color: Colors.white, fontSize: 8)))),
            ]),
            label: lang == "EN" ? "Reports" : "Laporan",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: lang == "EN" ? "Analytics" : "Analitik"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: lang == "EN" ? "Alerts" : "Notifikasi"),
        ],
      ),
    );
  }

  Widget _buildOverviewPage() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: double.infinity, padding: EdgeInsets.all(20),
          decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF0F2459), Color(0xFF2563EB)]), borderRadius: BorderRadius.circular(16)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(lang == "EN" ? "Welcome, Official 👋" : "Selamat Datang, Pejabat 👋",
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(lang == "EN" ? "City of Medan — Government Control Center" : "Kota Medan — Pusat Kendali Pemerintah",
              style: TextStyle(color: Colors.white70, fontSize: 13)),
            SizedBox(height: 12),
            Text(lang == "EN" ? "Total reports: $totalReports" : "Total laporan: $totalReports",
              style: TextStyle(color: Colors.amber, fontSize: 13, fontWeight: FontWeight.w600)),
          ]),
        ),
        SizedBox(height: 20),
        Text(lang == "EN" ? "📊 Statistics" : "📊 Statistik",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F2459))),
        SizedBox(height: 12),
        GridView.count(
          crossAxisCount: 2, shrinkWrap: true, physics: NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1.4,
          children: [
            _statCard("📋", lang == "EN" ? "Total Reports" : "Total Laporan", "$totalReports", Color(0xFF2563EB)),
            _statCard("⏳", lang == "EN" ? "Pending" : "Menunggu", "$pendingReports", Colors.orange),
            _statCard("✅", lang == "EN" ? "Resolved" : "Selesai", "$resolvedReports", Colors.green),
            _statCard("🚨", lang == "EN" ? "Critical" : "Kritis", "$criticalReports", Colors.red),
          ],
        ),
        SizedBox(height: 20),
        Container(
          width: double.infinity, padding: EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Color(0xFFE2E8F0)), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)]),
          child: Row(children: [
            Container(width: 60, height: 60, decoration: BoxDecoration(color: Colors.green.withOpacity(0.1), shape: BoxShape.circle),
              child: Center(child: Text(resolutionRate, style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 16)))),
            SizedBox(width: 16),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(lang == "EN" ? "Resolution Rate" : "Tingkat Penyelesaian", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0F2459))),
              Text(lang == "EN" ? "Reports successfully resolved" : "Laporan berhasil diselesaikan", style: TextStyle(fontSize: 12, color: Colors.grey)),
            ]),
          ]),
        ),
        SizedBox(height: 20),
        Text(lang == "EN" ? "📂 Top Reported Categories" : "📂 Kategori Terbanyak Dilaporkan",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F2459))),
        SizedBox(height: 12),
        _issueBarsCard(),
        SizedBox(height: 20),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(lang == "EN" ? "🕐 Recent Reports" : "🕐 Laporan Terbaru",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F2459))),
          TextButton(onPressed: () => setState(() => _selectedIndex = 1),
            child: Text(lang == "EN" ? "View All" : "Lihat Semua", style: TextStyle(color: Color(0xFF2563EB)))),
        ]),
        SizedBox(height: 8),
        if (globalReports.isEmpty)
          _emptyCard(lang == "EN" ? "No reports yet.\nWaiting for citizens to submit reports." : "Belum ada laporan.\nMenunggu laporan dari warga.")
        else
          ...globalReports.reversed.take(3).map((r) => _reportCard(r, showActions: false)).toList(),
      ]),
    );
  }

  Widget _buildAllReportsPage() {
    return Column(children: [
      Container(color: Colors.white, padding: EdgeInsets.all(16),
        child: Row(children: [
          Icon(Icons.assignment, color: Color(0xFF2563EB)),
          SizedBox(width: 8),
          Text(lang == "EN" ? "All Reports ($totalReports)" : "Semua Laporan ($totalReports)",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF0F2459))),
        ])),
      Expanded(
        child: globalReports.isEmpty
            ? Center(child: _emptyCard(lang == "EN" ? "No reports yet." : "Belum ada laporan."))
            : ListView(padding: EdgeInsets.all(16), children: globalReports.reversed.map((r) => _reportCard(r, showActions: true)).toList()),
      ),
    ]);
  }

  Widget _buildAnalyticsPage() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(lang == "EN" ? "📈 Analytics & Trends" : "📈 Analitik & Tren",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F2459))),
        SizedBox(height: 20),
        _analyticsCard(title: lang == "EN" ? "📊 Status Distribution" : "📊 Distribusi Status",
          child: Column(children: [
            _analyticsBar(lang == "EN" ? "⏳ Pending" : "⏳ Menunggu", pendingReports, totalReports, Colors.orange),
            _analyticsBar(lang == "EN" ? "🔧 In Progress" : "🔧 Diproses", globalReports.where((r) => r['status'] == 'in_progress').length, totalReports, Colors.blue),
            _analyticsBar(lang == "EN" ? "✅ Resolved" : "✅ Selesai", resolvedReports, totalReports, Colors.green),
            _analyticsBar(lang == "EN" ? "❌ Rejected" : "❌ Ditolak", globalReports.where((r) => r['status'] == 'rejected').length, totalReports, Colors.red),
          ])),
        SizedBox(height: 16),
        _analyticsCard(title: lang == "EN" ? "⚠️ Severity Breakdown" : "⚠️ Rincian Keparahan",
          child: Column(children: [
            _analyticsBar(lang == "EN" ? "🔴 Critical" : "🔴 Kritis", globalReports.where((r) => r['severity'] == 'critical').length, totalReports, Colors.red),
            _analyticsBar(lang == "EN" ? "🟠 High" : "🟠 Tinggi", globalReports.where((r) => r['severity'] == 'high').length, totalReports, Colors.deepOrange),
            _analyticsBar(lang == "EN" ? "🟡 Medium" : "🟡 Sedang", globalReports.where((r) => r['severity'] == 'medium').length, totalReports, Colors.amber),
            _analyticsBar(lang == "EN" ? "🟢 Low" : "🟢 Rendah", globalReports.where((r) => r['severity'] == 'low').length, totalReports, Colors.green),
          ])),
        SizedBox(height: 16),
        _analyticsCard(title: lang == "EN" ? "🗂️ By Issue Type" : "🗂️ Per Jenis Masalah",
          child: Column(children: [
            _analyticsBar("🛣️ ${lang == "EN" ? "Road Damage" : "Kerusakan Jalan"}", countByIssue("Road Damage"), totalReports, Colors.red),
            _analyticsBar("🗑️ ${lang == "EN" ? "Garbage" : "Sampah"}", countByIssue("Garbage"), totalReports, Colors.orange),
            _analyticsBar("🌊 ${lang == "EN" ? "Flood" : "Banjir"}", countByIssue("Flood"), totalReports, Colors.blue),
            _analyticsBar("💡 ${lang == "EN" ? "Street Light" : "Lampu Jalan"}", countByIssue("Street Light"), totalReports, Colors.amber),
            _analyticsBar("🔥 ${lang == "EN" ? "Fire Incident" : "Kebakaran"}", countByIssue("Fire Incident"), totalReports, Colors.deepOrange),
            _analyticsBar("📌 ${lang == "EN" ? "Other" : "Lainnya"}", countByIssue("Other"), totalReports, Colors.grey),
          ])),
        SizedBox(height: 16),
        Container(
          width: double.infinity, padding: EdgeInsets.all(20),
          decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF0F2459), Color(0xFF2563EB)]), borderRadius: BorderRadius.circular(16)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(lang == "EN" ? "📋 Summary" : "📋 Ringkasan", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            _summaryRow(lang == "EN" ? "Total Reports" : "Total Laporan", "$totalReports"),
            _summaryRow(lang == "EN" ? "Resolution Rate" : "Tingkat Penyelesaian", resolutionRate),
            _summaryRow(lang == "EN" ? "Critical Pending" : "Kritis Menunggu", "$criticalReports"),
            _summaryRow(lang == "EN" ? "Awaiting Action" : "Menunggu Tindakan", "$pendingReports"),
          ]),
        ),
      ]),
    );
  }

  Widget _buildNotificationsPage() {
    final criticalList = globalReports.where((r) => r['severity'] == 'critical' && r['status'] == 'pending').toList();
    final pendingList = globalReports.where((r) => r['status'] == 'pending').toList();
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(lang == "EN" ? "🔔 Alerts & Notifications" : "🔔 Peringatan & Notifikasi",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F2459))),
        SizedBox(height: 16),
        if (criticalList.isNotEmpty) ...[
          _notifHeader("🚨 ${lang == "EN" ? "Critical — Immediate Action Required" : "Kritis — Butuh Tindakan Segera"}", Colors.red),
          ...criticalList.map((r) => _notifItem("🚨", "${r['issue']} — ${r['location']}", "Reporter: ${r['reporter']} | ID: ${r['id']}", Colors.red)).toList(),
          SizedBox(height: 16),
        ],
        if (pendingList.isNotEmpty) ...[
          _notifHeader("⏳ ${lang == "EN" ? "Pending Reports" : "Laporan Menunggu"}", Colors.orange),
          ...pendingList.map((r) => _notifItem("⏳", "${r['issue']}", "${lang == "EN" ? "Reporter" : "Pelapor"}: ${r['reporter']} | ${r['date']}", Colors.orange)).toList(),
          SizedBox(height: 16),
        ],
        _notifItem("✅", lang == "EN" ? "System Ready" : "Sistem Siap",
          lang == "EN" ? "Dashboard is active and monitoring all reports." : "Dasbor aktif memantau semua laporan.", Colors.green),
      ]),
    );
  }

  Widget _reportCard(Map<String, dynamic> report, {required bool showActions}) {
    Color sevColor = _getSeverityColor(report['severity'] ?? 'low');
    Color statColor = _getStatusColor(report['status'] ?? 'pending');
    return Card(
      elevation: 3, shadowColor: Colors.black12, margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(child: Text(report['issue'] ?? '—', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF0F2459)))),
            Container(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(color: sevColor.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
              child: Text((report['severity'] ?? 'low').toUpperCase(), style: TextStyle(color: sevColor, fontSize: 10, fontWeight: FontWeight.bold))),
          ]),
          SizedBox(height: 6),
          Text("👤 ${report['reporter'] ?? '—'}  |  📞 ${report['phone'] ?? '—'}", style: TextStyle(fontSize: 12, color: Colors.grey)),
          SizedBox(height: 4),
          Text("📍 ${report['location'] ?? '—'}", style: TextStyle(fontSize: 12, color: Colors.grey)),
          SizedBox(height: 4),
          Text("🕐 ${report['date'] ?? '—'}", style: TextStyle(fontSize: 12, color: Colors.grey)),
          SizedBox(height: 8),
          if (report['desc'] != null && report['desc'].isNotEmpty)
            Text("📝 ${report['desc']}", style: TextStyle(fontSize: 13, color: Color(0xFF334155)), maxLines: 2, overflow: TextOverflow.ellipsis),
          SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(color: statColor.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
              child: Text(_getStatusText(report['status'] ?? 'pending'), style: TextStyle(color: statColor, fontSize: 11, fontWeight: FontWeight.bold))),
            if (showActions) _actionButton(report),
          ]),
          SizedBox(height: 4),
          Text("ID: ${report['id'] ?? '—'}", style: TextStyle(fontSize: 10, color: Colors.grey)),
        ]),
      ),
    );
  }

  Widget _actionButton(Map<String, dynamic> report) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        setState(() => report['status'] = value);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(lang == "EN" ? "Status updated: ${_getStatusText(value)}" : "Status diperbarui: ${_getStatusText(value)}"),
          backgroundColor: _getStatusColor(value),
        ));
      },
      itemBuilder: (context) => [
        PopupMenuItem(value: 'pending', child: Text("⏳ ${lang == "EN" ? "Pending" : "Menunggu"}")),
        PopupMenuItem(value: 'in_progress', child: Text("🔧 ${lang == "EN" ? "In Progress" : "Diproses"}")),
        PopupMenuItem(value: 'resolved', child: Text("✅ ${lang == "EN" ? "Resolved" : "Selesai"}")),
        PopupMenuItem(value: 'rejected', child: Text("❌ ${lang == "EN" ? "Rejected" : "Ditolak"}")),
      ],
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(color: Color(0xFF2563EB), borderRadius: BorderRadius.circular(8)),
        child: Row(children: [
          Icon(Icons.edit, color: Colors.white, size: 14),
          SizedBox(width: 4),
          Text(lang == "EN" ? "Update" : "Perbarui", style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
        ]),
      ),
    );
  }

  Widget _statCard(String emoji, String label, String value, Color color) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
        border: Border(top: BorderSide(color: color, width: 3)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(emoji, style: TextStyle(fontSize: 24)),
        Text(value, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF0F2459))),
        Text(label, style: TextStyle(fontSize: 11, color: Colors.grey, fontWeight: FontWeight.w500)),
      ]),
    );
  }

  Widget _issueBarsCard() {
    final issues = [
      {"label": "🛣️ ${lang == "EN" ? "Road Damage" : "Kerusakan Jalan"}", "key": "Road Damage", "color": Colors.red},
      {"label": "🗑️ ${lang == "EN" ? "Garbage" : "Sampah"}", "key": "Garbage", "color": Colors.orange},
      {"label": "🌊 ${lang == "EN" ? "Flood" : "Banjir"}", "key": "Flood", "color": Colors.blue},
      {"label": "💡 ${lang == "EN" ? "Street Light" : "Lampu Jalan"}", "key": "Street Light", "color": Colors.amber},
      {"label": "🔥 ${lang == "EN" ? "Fire" : "Kebakaran"}", "key": "Fire Incident", "color": Colors.deepOrange},
      {"label": "📌 ${lang == "EN" ? "Other" : "Lainnya"}", "key": "Other", "color": Colors.grey},
    ];
    int maxCount = issues.map((i) => countByIssue(i['key'] as String)).fold(0, (a, b) => a > b ? a : b);
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)]),
      child: Column(children: issues.map((issue) {
        int count = countByIssue(issue['key'] as String);
        double pct = maxCount == 0 ? 0 : count / maxCount;
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(issue['label'] as String, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
              Text("$count", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF0F2459))),
            ]),
            SizedBox(height: 4),
            ClipRRect(borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(value: pct, backgroundColor: Color(0xFFE2E8F0),
                valueColor: AlwaysStoppedAnimation<Color>(issue['color'] as Color), minHeight: 8)),
          ]),
        );
      }).toList()),
    );
  }

  Widget _analyticsCard({required String title, required Widget child}) {
    return Container(
      width: double.infinity, padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF0F2459))),
        SizedBox(height: 16),
        child,
      ]),
    );
  }

  Widget _analyticsBar(String label, int count, int total, Color color) {
    double pct = total == 0 ? 0 : count / total;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(label, style: TextStyle(fontSize: 12)),
          Text("$count (${(pct * 100).toStringAsFixed(0)}%)", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: color)),
        ]),
        SizedBox(height: 4),
        ClipRRect(borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(value: pct, backgroundColor: Color(0xFFE2E8F0),
            valueColor: AlwaysStoppedAnimation<Color>(color), minHeight: 8)),
      ]),
    );
  }

  Widget _summaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(label, style: TextStyle(color: Colors.white70, fontSize: 13)),
        Text(value, style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
      ]),
    );
  }

  Widget _notifHeader(String title, Color color) {
    return Container(
      width: double.infinity, padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      margin: EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(8), border: Border.all(color: color.withOpacity(0.3))),
      child: Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 13)),
    );
  }

  Widget _notifItem(String emoji, String title, String desc, Color color) {
    return Container(
      margin: EdgeInsets.only(bottom: 10), padding: EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFFE2E8F0)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 6)]),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(emoji, style: TextStyle(fontSize: 20)),
        SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF0F2459))),
          SizedBox(height: 2),
          Text(desc, style: TextStyle(fontSize: 12, color: Colors.grey)),
        ])),
      ]),
    );
  }

  Widget _emptyCard(String message) {
    return Container(
      width: double.infinity, padding: EdgeInsets.all(30), margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: Color(0xFFE2E8F0))),
      child: Column(children: [
        Icon(Icons.inbox, size: 50, color: Colors.grey.shade300),
        SizedBox(height: 12),
        Text(message, textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 14, height: 1.5)),
      ]),
    );
  }

  Color _getSeverityColor(String s) {
    switch (s) {
      case 'critical': return Colors.red;
      case 'high': return Colors.deepOrange;
      case 'medium': return Colors.amber;
      case 'low': return Colors.green;
      default: return Colors.grey;
    }
  }

  Color _getStatusColor(String s) {
    switch (s) {
      case 'pending': return Colors.orange;
      case 'in_progress': return Colors.blue;
      case 'resolved': return Colors.green;
      case 'rejected': return Colors.red;
      default: return Colors.orange;
    }
  }

  String _getStatusText(String s) {
    if (lang == "EN") {
      switch (s) {
        case 'pending': return '⏳ Pending';
        case 'in_progress': return '🔧 In Progress';
        case 'resolved': return '✅ Resolved';
        case 'rejected': return '❌ Rejected';
        default: return '⏳ Pending';
      }
    } else {
      switch (s) {
        case 'pending': return '⏳ Menunggu';
        case 'in_progress': return '🔧 Diproses';
        case 'resolved': return '✅ Selesai';
        case 'rejected': return '❌ Ditolak';
        default: return '⏳ Menunggu';
      }
    }
  }
}
