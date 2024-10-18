import 'package:flutter/material.dart';

void main() {
  runApp(TravelECommerceApp());
}

class TravelECommerceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel E-Commerce',
      theme: ThemeData(
      ),
      home: HomePage(),
      routes: {
        '/details': (context) => DetailPage(),
        '/cart': (context) => CartPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel E-Commerce'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.airplane_ticket),
            title: Text('Liburan Ke Kota'),
            subtitle: Text('Nikmati destinasi pantai terbaik'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushNamed(context, '/details', arguments: 'Liburan Pantai');
            },
          ),
          ListTile(
            leading: Icon(Icons.flag),
            title: Text('Petualangan Gunung'),
            subtitle: Text('Jelajahi jalur pendakian terbaik'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushNamed(context, '/details', arguments: 'Petualangan Gunung');
            },
          ),
          ListTile(
            leading: Icon(Icons.flight),
            title: Text('Tur Kota'),
            subtitle: Text('Kunjungi kota-kota impian anda'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushNamed(context, '/details', arguments: 'Tur Kota');
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String? travelPackage = ModalRoute.of(context)!.settings.arguments as String?;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail $travelPackage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Paket $travelPackage',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Deskripsi: Nikmati pengalaman tak terlupakan dengan paket $travelPackage kami. Pesan sekarang untuk mendapatkan penawaran eksklusif!',
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
              child: Text('Tambahkan ke Keranjang'),
            ),
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart, size: 80, color: Colors.blue),
            SizedBox(height: 20),
            Text('Keranjang Anda kosong.', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Kembali ke Beranda'),
            ),
          ],
        ),
      ),
    );
  }
}
