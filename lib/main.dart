import 'package:flutter/material.dart';

void main() => runApp(ShuaibJaameApp());

class ShuaibJaameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'شعیب جامع اسلامی ایپ',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'NotoSans',
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 1400));
    _controller.forward();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
    });
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF012244), Color(0xFF0B4F88)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ScaleTransition(
                scale: Tween(begin: 0.6, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut)),
                child: CircleAvatar(
                  radius: 56,
                  backgroundColor: Colors.white,
                  child: Text('ش', style: TextStyle(fontSize: 48, color: Color(0xFF0B4F88), fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(height: 16),
              Text('بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيم', style: TextStyle(color: Colors.white70, fontSize: 14)),
              SizedBox(height: 8),
              Text('Developed under guidance of Mufti Muhammad Shuaib Khan Alai', style: TextStyle(color: Colors.white70, fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String,String>> items = [
    {'u':'قرآن','e':'Quran','icon':'📖'},
    {'u':'تفسیر','e':'Tafseer','icon':'📚'},
    {'u':'حدیث','e':'Hadith','icon':'📜'},
    {'u':'فقہ','e':'Fiqh','icon':'⚖️'},
    {'u':'نماز','e':'Salah','icon':'🕋'},
    {'u':'روزہ','e':'Fasting','icon':'🌙'},
    {'u':'زکوٰۃ','e':'Zakat','icon':'💰'},
    {'u':'حج','e':'Hajj','icon':'🕋'},
    {'u':'فتاویٰ','e':'Fatawa','icon':'📘'},
    {'u':'سیرت النبی ﷺ','e':'Seerat','icon':'🌟'},
    {'u':'صحابہ کرامؓ','e':'Companions','icon':'👳‍♂️'},
    {'u':'بچوں کے لیے','e':'Child Education','icon':'👶'},
    {'u':'اخلاقیات','e':'Morality','icon':'💎'},
    {'u':'نورانی قاعدہ','e':'Noorani Qaida','icon':'📗'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيم', style: TextStyle(fontSize: 13, color: Colors.indigo[700])),
          SizedBox(height:4),
          Text('شعیب جامع اسلامی ایپ', style: TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height:2),
          Text('اسلامی علوم و اخلاق کی جامع رہنمائی', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
        ]),
        actions: [
          Padding(padding: EdgeInsets.only(right:12.0), child: CircleAvatar(backgroundImage: AssetImage('assets/images/author.png')))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:12.0, vertical:8),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3/2, crossAxisSpacing: 12, mainAxisSpacing: 12),
                itemCount: items.length,
                itemBuilder: (context, index){
                  final it = items[index];
                  return InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ContentPage(titleU: it['u']!, titleE: it['e']!))),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      elevation: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Color(0xFF0B4F88), Color(0xFF1E6FB3)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(it['icon']!, style: TextStyle(fontSize: 22)),
                            Spacer(),
                            Text(it['u']!, style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(height:4),
                            Text(it['e']!, style: TextStyle(color: Colors.white70, fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text('مفتی محمد شعیب خان آلائی', style: TextStyle(color: Colors.grey[700])),
          ),
          SizedBox(height:6),
          Text('© 2025 Shuaib Jaame Islamic App — All Rights Reserved', style: TextStyle(fontSize:10, color: Colors.grey[500])),
          SizedBox(height:10),
        ],
      ),
    );
  }
}

class ContentPage extends StatelessWidget {
  final String titleU;
  final String titleE;
  ContentPage({required this.titleU, required this.titleE});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titleU + ' — ' + titleE)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titleU + ' (' + titleE + ')', style: TextStyle(fontSize:18, fontWeight: FontWeight.bold)),
              SizedBox(height:10),
              Text('یہ placeholder متن ہے۔ یہاں آپ اصلی مواد (قرآن، تفسیر، حدیث، فتاویٰ، وغیرہ) ڈال سکتے ہیں۔', style: TextStyle(fontSize:15, height:1.6)),
              SizedBox(height:20),
              Text('مزید مواد جلد شامل کیا جائے گا۔', style: TextStyle(color: Colors.grey[600])),
            ],
          ),
        ),
      ),
    );
  }
}
