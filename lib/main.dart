import 'package:flutter/material.dart';
import 'chat.dart';
import 'Community.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF196DFF),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            padding: const EdgeInsets.only(top: 15),
            icon: const Icon(Icons.arrow_back_ios, size: 20.0),
            onPressed: () {
              // Add functionality to go back
            },
            color: Colors.white,
          ),
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/background.png',
                fit: BoxFit.cover,
              ),
            ),
            const communityLandingPage(),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class communityLandingPage extends StatelessWidget {
  static const IconData homeWorkOutlined =
      IconData(0xf109, fontFamily: 'Proxima');

  const communityLandingPage({super.key});

  @override
   Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.29,
          width: MediaQuery.of(context).size.width,
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35.0),
                topRight: Radius.circular(35.0),
              ),
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(25, 109, 255, 1),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/Vectorcommunity.png',
                      width: 50,
                      height: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Community',
                  style: TextStyle(
                    color: Color.fromRGBO(25, 109, 255, 1),
                    fontFamily: 'Proxima',
                    fontWeight: FontWeight.w700,
                    fontSize: 34,
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.only(
                      right: 30, left: 30),
                  child: Text(
                    'Strength in Unity: Building a Supportive\nCommunity for Fisherfolks and Beyond',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Proxima',
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(79, 79, 79, 1),
                      fontSize: 17,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                // Fishing Updates Button
                SizedBox(
                  width: 300,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DirectoryListScreen()));
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(color: Color.fromRGBO(25, 109, 255, 1)),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Fishing Updates',
                      style: TextStyle(
                        color: Color.fromRGBO(25, 109, 255, 1),
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Proxima',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Start Chat Button
                SizedBox(
                  width: 300,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(const Color.fromRGBO(25, 109, 255, 1)),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    child: const Text(
                      'Start Chat',
                       style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Proxima',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}