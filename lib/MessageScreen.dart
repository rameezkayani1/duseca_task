import 'package:flutter/material.dart';

import 'Widget/Appbar.dart';
import 'Widget/drawer.dart';

class ChatScreen extends StatelessWidget {
  final List<Message> messages = [
    Message(
        sender: 'Jane Wilson',
        text: 'It looks amazing. The customer will be very satisfied. 😍',
        time: '09:15',
        isMe: false,
        avatarUrl: 'assets/jane_avatar.png'),
    Message(
        sender: 'Jacob Hawkins',
        text: '@Brandon, can you send me the Style Guide.',
        time: '11:48',
        isMe: true,
        avatarUrl: 'assets/jacob_avatar.png'),
    Message(
        sender: 'Brandon Pena',
        text: 'Brand Styles Guide',
        time: '11:50',
        isMe: false,
        avatarUrl: 'assets/brandon_avatar.png',
        isFile: true,
        fileName: 'Brand Styles Guide',
        fileSize: '570 KB'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: DrawerMenu(), // Adding the drawer here

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return _buildMessage(message);
              },
            ),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildMessage(Message message) {
    return Align(
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (!message.isMe) ...[
              CircleAvatar(
                backgroundImage: AssetImage(
                    message.avatarUrl ?? 'assets/default_avatar.png'),
                radius: 20,
              ),
              SizedBox(width: 8),
            ],
            Flexible(
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: message.isMe ? Colors.blue[100] : Colors.grey[200],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(message.isMe ? 15 : 0),
                    bottomRight: Radius.circular(message.isMe ? 0 : 15),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.sender,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    if (message.isFile)
                      _buildFileMessage(message.fileName!, message.fileSize!)
                    else
                      Text(message.text),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8),
            Text(
              message.time,
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFileMessage(String fileName, String fileSize) {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.insert_drive_file, color: Colors.orange),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fileName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  fileSize,
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInputArea() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.photo),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.insert_drive_file),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class Message {
  final String sender;
  final String text;
  final String time;
  final bool isMe;
  final bool isFile;
  final String? fileName;
  final String? fileSize;
  final String? avatarUrl; // Optional avatar URL or path

  Message({
    required this.sender,
    required this.text,
    required this.time,
    required this.isMe,
    this.isFile = false,
    this.fileName,
    this.fileSize,
    this.avatarUrl, // Constructor parameter for avatar URL
  });
}
