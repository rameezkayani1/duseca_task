import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'Widget/Appbar.dart';
import 'Widget/drawer.dart';

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: DrawerMenu(), // Adding the drawer here

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Calendar',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ToggleButtons(
                  borderRadius: BorderRadius.circular(10),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text("Month"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text("Week"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text("Day"),
                    ),
                  ],
                  isSelected: [
                    true,
                    false,
                    false
                  ], // Static selection for UI only
                  onPressed: (_) {},
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue, // Set your desired color
                    borderRadius:
                        BorderRadius.circular(10), // Set the border radius
                  ),

                  // color: Colors.blue,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 48,
                  ),
                )
              ],
            ),
            SizedBox(height: 16),
            Container(
              // Set desired height
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[200],
              ),
              // padding: EdgeInsets.all(16),
              child: TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: DateTime.now(),
                calendarFormat: CalendarFormat.month,
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  EventCard(
                    time: '08:00',
                    title: 'Breakfast and Quickcheck',
                    participants: [
                      'https://example.com/avatar1.jpg',
                      'https://example.com/avatar2.jpg',
                    ],
                    color: Colors.blue[100]!,
                  ),
                  EventCard(
                    time: '09:00',
                    title: 'App Development',
                    participants: [
                      'https://example.com/avatar1.jpg',
                      'https://example.com/avatar2.jpg',
                      'https://example.com/avatar3.jpg',
                    ],
                    color: Colors.green[100]!,
                  ),
                  EventCard(
                    time: '11:00',
                    title: 'Landing Page',
                    participants: [
                      'https://example.com/avatar1.jpg',
                      'https://example.com/avatar2.jpg',
                      'https://example.com/avatar3.jpg',
                      'https://example.com/avatar4.jpg',
                    ],
                    color: Colors.orange[100]!,
                  ),
                  EventCard(
                    time: '13:00',
                    title: 'Project "Rocket"',
                    participants: [
                      'https://example.com/avatar1.jpg',
                      'https://example.com/avatar2.jpg',
                    ],
                    color: Colors.purple[100]!,
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

class EventCard extends StatelessWidget {
  final String time;
  final String title;
  final List<String> participants;
  final Color color;

  const EventCard({
    required this.time,
    required this.title,
    required this.participants,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            time,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: participants
                              .map((image) => Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: CircleAvatar(
                                      radius: 12,
                                      backgroundImage: NetworkImage(image),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.more_vert),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
