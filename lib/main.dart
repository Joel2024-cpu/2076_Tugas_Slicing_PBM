import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HamaPage(),
    );
  }
}

class HamaPage extends StatelessWidget {
  final Color green = Color(0xFF0A8F2C);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F2),

      appBar: AppBar(
        backgroundColor: green,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.all(8),
          child: CircleAvatar(
            backgroundColor: Colors.white24,
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        ),
        title: Text(
          "Daftar Hama & Penyakit",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: false,
      ),

      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          itemCard(
              "Penyakit Patik",
              "assets/daun1.png",
              "24 laporan",
              ["Kebun 1 : 15 laporan", "Kebun 2 : 5 laporan", "Kebun 3 : 4 laporan"]),
          itemCard(
              "TLCV",
              "assets/daun2.png",
              "15 laporan",
              ["Kebun 1 : 10 laporan", "Kebun 2 : 5 laporan", "Kebun 3 : 0 laporan"]),
          itemCard(
              "Lanas",
              "assets/daun3.png",
              "10 laporan",
              ["Kebun 1 : 5 laporan", "Kebun 2 : 5 laporan", "Kebun 3 : 0 laporan"]),
          itemCard(
              "TEV",
              "assets/daun4.png",
              "5 laporan",
              ["Kebun 1 : 5 laporan", "Kebun 2 : 0 laporan", "Kebun 3 : 0 laporan"]),
        ],
      ),

      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: green,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            navItem(Icons.bar_chart, "Analisis", true),
            navItem(Icons.history, "Laporan", false),
            navItem(Icons.home, "Beranda", false),
            navItem(Icons.assignment, "Kinerja", false),
            navItem(Icons.chat, "Pesan", false),
          ],
        ),
      ),
    );
  }

  Widget itemCard(
      String title, String image, String laporan, List<String> data) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.green),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title + badge
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(laporan,
                    style: TextStyle(color: Colors.white, fontSize: 12)),
              )
            ],
          ),

          SizedBox(height: 10),

          Row(
            children: [
              // image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  width: 100,
                  height: 70,
                  fit: BoxFit.cover,
                ),
              ),

              SizedBox(width: 10),

              // text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Sebaran Lokasi",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    ...data.map((e) => Text(e)).toList(),
                  ],
                ),
              ),

              // arrow
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.arrow_forward, color: Colors.green),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget navItem(IconData icon, String text, bool active) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.white),
        Text(text, style: TextStyle(color: Colors.white, fontSize: 12))
      ],
    );
  }
}