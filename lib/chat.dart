import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  List<Map<String, dynamic>> _messages = [];

  void _sendMessage(String text) {
    setState(() {
      _messages.add({
        'text': text,
        'sentByMe': true,
        'time': DateTime.now(),
      });
    });
    _textController.clear();
  }

  void _attachFile() {
    print('Attach file');
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inMinutes < 1) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return '${time.hour}:${time.minute}';
    }
  }

  Widget _buildMessageBubble(bool sentByMe, String text, DateTime time) {
  return Row(
    mainAxisAlignment:
        sentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
    children: [
      Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        decoration: BoxDecoration(
          color: sentByMe ? Color.fromARGB(255, 255, 255, 255) : Color(0xFF196DFF),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: sentByMe ? Radius.circular(12) : Radius.circular(12),
            bottomRight: sentByMe ? Radius.circular(0) : Radius.circular(12),
          ),
          border: Border.all(
            color: sentByMe ? const Color.fromARGB(255, 37, 37, 37) : Color(0xFF196DFF), // Border color
            width: 0.5, // Border width
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                color: sentByMe ? Colors.black : Colors.white,
                fontFamily: 'Proxima',
                fontSize: 18,
              ),
              softWrap: true,
            ),
            SizedBox(height: 4),
            Text(
              _formatTime(time),
              style: TextStyle(
                color: sentByMe ? Colors.grey : Colors.white,
                fontSize: 12,
                fontFamily: 'Proxima',
              ),
            ),
          ],
        ),
      ),
    ],
  );
}


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
                icon: const Icon(Icons.arrow_back_ios, size: 20.0),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              title: Text(
                'Flutter Chat',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(25, 109, 255, 1),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final bool sentByMe = message['sentByMe'];
                return _buildMessageBubble(
                  sentByMe,
                  message['text'],
                  message['time'],
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    _attachFile();
                  },
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF7F7FC),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextField(
                        controller: _textController,
                        style: TextStyle(fontSize: 16.0),
                        minLines: 1,
                        maxLines: null,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 15.0),
                          border: InputBorder.none,
                          hintText: 'Enter your message...',
                        ),
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, -5.0),
                  child: Transform.rotate(
                    angle: -40 * 3.14159 / 180,
                    child: IconButton(
                      icon: Icon(Icons.send, color: Color(0xFF196DFF)),
                      onPressed: () {
                        if (_textController.text.isNotEmpty) {
                          _sendMessage(_textController.text);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
