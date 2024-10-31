import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // title: Text("title"),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        SizedBox(
          width: 20,
        ),
        IconButton(
          icon: Icon(
            Icons.settings,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        SizedBox(
          width: 20,
        ),
        IconButton(
          icon: Icon(
            Icons.notifications_active_rounded,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
        SizedBox(
          width: 40,
        ),
        CircleAvatar(
          backgroundColor: Colors.transparent,
          child: SvgPicture.asset(
            'assets/avator.svg', // Replace with your SVG asset path
            width: 40,
            height: 40,
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
      leading: IconButton(
        icon: Icon(Icons.dashboard), // Change this to any icon you want
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
