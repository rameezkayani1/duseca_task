import 'package:duseca_task/calenderScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'GraphScreen.dart';
import 'Widget/Appbar.dart';
import 'Widget/drawer.dart';

class MessageScreens extends StatelessWidget {
  const MessageScreens({super.key});

  @override
  Widget build(BuildContext context) {
    var imageicone = 'assets/avator.svg';
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: DrawerMenu(), // Adding the drawer here
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 16),

            // Pinned Section
            Text(
              'PINNED',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            MessageCard(
              name: 'Aishwarya',
              message: 'Hey, hello, how\'s it going?',
              imageUrl: imageicone,
              isPinned: true,
              hasNotification: true,
            ),
            MessageCard(
              name: 'Design Team',
              message: 'Can you send the latest design?',
              imageUrl: 'https://example.com/avatar2.jpg',
              isPinned: true,
              hasNotification: true,
            ),
            MessageCard(
              name: 'Dustin Villanueva',
              message: 'Check this out!',
              imageUrl: 'https://example.com/avatar3.jpg',
              isPinned: true,
            ),
            SizedBox(height: 16),

            // All Messages Section
            Text(
              'ALL MESSAGES',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  MessageCard(
                    name: 'Jess Wiston',
                    message: 'Hi! How are you, Steve?',
                    imageUrl: 'https://example.com/avatar4.jpg',
                  ),
                  MessageCard(
                    name: 'Branden Perry',
                    message: 'Just got home.',
                    imageUrl: 'https://example.com/avatar5.jpg',
                  ),
                  MessageCard(
                    name: 'Katherine Poe',
                    message: 'We have a meeting tomorrow.',
                    imageUrl: 'https://example.com/avatar6.jpg',
                  ),
                  MessageCard(
                    name: 'Nicole Hawkins',
                    message: 'See you soon!',
                    imageUrl: 'https://example.com/avatar7.jpg',
                    hasNotification: true,
                  ),
                  MessageCard(
                    name: 'Patrick Block',
                    message: 'That’s a party time.',
                    imageUrl: 'https://example.com/avatar8.jpg',
                  ),
                  MessageCard(
                    name: 'Phoebe Edwards',
                    message: 'I’ll bring the cake.',
                    imageUrl: 'https://example.com/avatar9.jpg',
                  ),
                  MessageCard(
                    name: 'Krista Moore',
                    message: 'Let’s catch up soon.',
                    imageUrl: 'https://example.com/avatar10.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageCard extends StatelessWidget {
  final String name;
  final String message;
  final String imageUrl;
  final bool isPinned;
  final bool hasNotification;

  const MessageCard({
    required this.name,
    required this.message,
    required this.imageUrl,
    this.isPinned = false,
    this.hasNotification = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  message,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          if (hasNotification)
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
