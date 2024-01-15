import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Directory App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            fontFamily: 'Proxima',
            fontWeight: FontWeight.normal,
            fontSize: 14.0,
          ),
          titleLarge: TextStyle(
            fontFamily: 'Proxima',
            fontWeight: FontWeight.bold,
            fontSize: 20.0, // Increased font size by 2 pixels
            color: Color(0xFF196DFF),
          ),
        ),
      ),
      home: DirectoryListScreen(),
    );
  }
}

class DirectoryListScreen extends StatefulWidget {
  @override
  _DirectoryListScreenState createState() => _DirectoryListScreenState();
}

class _DirectoryListScreenState extends State<DirectoryListScreen> {
  int _currentIndex = 0;

  final List<String> organizations = [
    'BFAR Region X',
    'PAMALAKAYA-Pilipinas',
    'Agricultural Productivity Operations Office - Cagayan de Oro',
    'Local Government Unit of Alubijid',
    'Local Government Unit of El Salvador',
    'Local Government Unit of Opol',
  ];

  final List<String> addresses = [
    'Julio Pacana St., Macabalan, Cagayan de Oro City',
    '56 K-9th Street, Brgy. West Kamias, Quezon City, Philippines',
    '2118 Thornridge Cir. Syracuse, Connecticut 35624',
    '9018 Misamis Oriental',
    '2118 Thornridge Cir. Syracuse, Connecticut 35624',
    '1901 Thornridge Cir. Shiloh, Hawaii 81063',
  ];

  // List of asset paths for communitylogo
  final List<String> communitylogo = [
    'assets/communitylogo/BFAR.png',
    'assets/communitylogo/PAMALAKAYA.png',
    'assets/communitylogo/APOO.png',
    'assets/communitylogo/LGUalub.png',
    'assets/communitylogo/LGUelsal.png',
    'assets/communitylogo/LGUopol.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
            child: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, size: 20.0),
                onPressed: () {
                  Navigator.of(context).pop(); // Add a back button
                },
              ),
              title: Text(
                'Directory',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF196DFF),
                  fontSize: 20.0, // Increased font size by 2 pixels
                ),
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
        child: ListView.builder(
          itemCount: organizations.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                ListTile(
                  leading: Image.asset(
                    communitylogo[index],
                    width: 40,
                    height: 40,
                  ),
                  title: Text(
                    organizations[index],
                    style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Proxima'),
                  ),
                  subtitle: Text(
                    addresses[index],
                    style: TextStyle(fontFamily: 'Proxima'),
                  ),
                  onTap: () {
                    // Implement action on tile tap if needed
                  },
                ),
                SizedBox(height: 20.0),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: 50.0,
        items: <Widget>[
          Image.asset(
            'assets/bottomNav/communitybtn.png', // Replace with your image path
            width: 30,
            height: 30,
          ),
          Image.asset(
            'assets/bottomNav/marketplacebtn.png', // Replace with your image path
            width: 30,
            height: 30,
          ),
          Image.asset(
            'assets/bottomNav/accountbtn.png', // Replace with your image path
            width: 30,
            height: 30,
          ),
        ],
        color: Color(0xFFE0ECF8),
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Color(0xFF196DFF),
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
