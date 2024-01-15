import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Feed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Proxima', // Set default font to Proxima Nova
      ),
      home: NewsFeedPage(),
    );
  }
}

class NewsTile {
  final String title;
  final String imagePath;
  final String publisher;
  bool isFollowed; // Added property to track follow state

  NewsTile({
    required this.title,
    required this.imagePath,
    required this.publisher,
    this.isFollowed = false, // Default follow state is false
  });
}

final List<NewsTile> newsTiles = [
  NewsTile(
    title:
        'Marcos wants PH fisheries code amendment to protect fisherfolk, resources',
    imagePath: 'assets/newsfeed/news1.png',
    publisher: 'Posted by: Rappler',
  ),
  NewsTile(
    title: 'Fish catch down 70 percent; destruction of corals blamed',
    imagePath: 'assets/newsfeed/news2.png',
    publisher: 'Posted by: PhilStar',
  ),
  NewsTile(
    title:
        'PHL fisheries get sustainability boost from Better Seafood Philippines and Mayani',
    imagePath: 'assets/newsfeed/news3.png',
    publisher: 'Posted by: Business Mirror',
  ),
  NewsTile(
    title: 'Fish supply enough, DA BFAR assures public',
    imagePath: 'assets/newsfeed/news4.png',
    publisher: 'Posted by: Philippine Information Agency',
  ),
  NewsTile(
    title: 'Filipinos fishing on the frontline of the West Philippine Sea',
    imagePath: 'assets/newsfeed/news5.png',
    publisher: 'Posted by: GMA Network',
  ),
];

class NewsFeedPage extends StatefulWidget {
  @override
  _NewsFeedPageState createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  List<bool> followedStates = List.filled(newsTiles.length, false); // Track follow state for each news tile

  int _currentIndex = 0;

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
                  Navigator.of(context).pop();
                },
              ),
              title: Text(
                'News Feed',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color:Color(0xFF196DFF),
                ),
              ),
            ),
          ),
        ),
      ),
      body: buildNewsList(),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: 50.0,
        items: <Widget>[
          Image.asset(
            'assets/bottomNav/communitybtn.png',
            width: 30,
            height: 30,
          ),
          Image.asset(
            'assets/bottomNav/marketplacebtn.png',
            width: 30,
            height: 30,
          ),
          Image.asset(
            'assets/bottomNav/accountbtn.png',
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

  String _truncatePublisherName(String publisher) {
    const int maxLength = 70; // Maximum characters before ellipsis

    if (publisher.length > maxLength) {
      return publisher.substring(0, maxLength) + '...';
    }
    return publisher;
  }

  Widget buildNewsList() {
    return ListView.builder(
      itemCount: newsTiles.length,
      itemBuilder: (BuildContext context, int index) {
        final newsTile = newsTiles[index];
        bool isFollowed = followedStates[index]; // Use stored follow state for this news tile

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 10.0),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  newsTile.imagePath,
                  width: MediaQuery.of(context).size.width,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                height: 50,
                child: Center(
                  child: Text(
                    newsTile.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              SizedBox(height: 5.0),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.remove_red_eye, size: 16.0),
                    SizedBox(width: 5.0),
                    Text('100 views'),
                    SizedBox(width: 15.0),
                    Icon(Icons.date_range, size: 16.0),
                    SizedBox(width: 5.0),
                    Text('Dec 25, 2023'),
                  ],
                ),
              ),
              SizedBox(height: 5.0),
              Center(
                child: Container(
                  constraints: BoxConstraints(minWidth: 200),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        IconData(0xe958, fontFamily: 'MaterialIcons'),
                        size: 16.0,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 5.0),
                      Flexible(
                        child: Text(
                          _truncatePublisherName(newsTile.publisher),
                          style: TextStyle(color: Colors.grey, fontFamily: 'Proxima'),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  // Toggle follow state for this news tile
                                  followedStates[index] = !followedStates[index];
                                });
                                print('Follow button tapped for ${newsTile.title}');
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(80, 30),
                                backgroundColor: Color(0xFF196DFF),
                              ),
                              child: Text(
                                followedStates[index] ? 'Followed' : 'Follow',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Proxima',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        );
      },
    );
  }
}
