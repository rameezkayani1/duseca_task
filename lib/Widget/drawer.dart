import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../GraphScreen.dart';
import '../MessageScreen.dart';
import '../calenderScreen.dart';
import '../MessageScreens.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                    leading: SvgPicture.asset(
                      'assets/logo.svg', // Replace with your SVG asset path
                      width: 32,
                      height: 32,
                    ),
                    title: Text("alpha",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.w700)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OverviewScreen()),
                      );
                    }),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                    leading: Icon(Icons.dashboard),
                    title: Text(
                      "Overview",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OverviewScreen()),
                      );
                    }),
                ExpansionTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text(
                    "E-Commerce",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  children: [
                    ListTile(
                      title: Text(
                        "Products",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text(
                        "Orders",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
                ListTile(
                    leading: Icon(Icons.calendar_today),
                    title: Text(
                      "Calendar",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CalendarScreen()),
                      );
                    }),
                ListTile(
                    leading: Icon(Icons.mail),
                    title: Text(
                      "Mail",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 10,
                      child: Text("8",
                          style: TextStyle(fontSize: 10, color: Colors.white)),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MessageScreens(),
                        ),
                      );
                    }),
                ListTile(
                    leading: Icon(Icons.chat),
                    title: Text(
                      "Chat",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChatScreen()),
                      );
                    }),
                ListTile(
                  leading: Icon(Icons.task),
                  title: Text(
                    "Tasks",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.folder),
                  title: Text(
                    "File Manager",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.note),
                  title: Text(
                    "Notes",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.contacts),
                  title: Text(
                    "Contacts",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {},
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("CALENDARS"), Icon(Icons.add)],
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.circle, size: 14, color: Colors.orange),
                  title: Text(
                    "Important",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.circle, size: 14, color: Colors.red),
                  title: Text(
                    "Meeting",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.circle, size: 14, color: Colors.green),
                  title: Text(
                    "Event",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.circle, size: 14, color: Colors.blue),
                  title: Text(
                    "Work",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.circle, size: 14, color: Colors.grey),
                  title: Text(
                    "Other",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
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
