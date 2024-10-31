import 'package:duseca_task/Widget/Appbar.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'Widget/drawer.dart';

class OverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: CustomAppBar(),
      drawer: DrawerMenu(), // Adding the drawer here

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildProfileCard(),
              SizedBox(height: 16),
              _buildFollowersCard(),
              SizedBox(height: 16),
              _buildGenderCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage:
                  AssetImage('assets/logo.svg'), // Your profile image
              radius: 30,
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Michael Cooper",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("Facebook", style: TextStyle(color: Colors.grey)),
                Row(
                  children: [
                    Text("353.49K followers", style: TextStyle(fontSize: 16)),
                    SizedBox(width: 10),
                    Text("+1.42%", style: TextStyle(color: Colors.green)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFollowersCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Followers",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text("254.68K",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text("+2.53%", style: TextStyle(color: Colors.green)),
            SizedBox(height: 20),
            SizedBox(
              height: 100,
              child: BarChart(
                BarChartData(
                  barGroups: [
                    _buildBarChartGroup(0, 6),
                    _buildBarChartGroup(1, 8),
                    _buildBarChartGroup(2, 5),
                    _buildBarChartGroup(3, 10),
                    _buildBarChartGroup(4, 7),
                    _buildBarChartGroup(5, 9),
                    _buildBarChartGroup(6, 6),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BarChartGroupData _buildBarChartGroup(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
            toY: y, color: x == 3 ? Colors.orange : Colors.blue, width: 8),
      ],
    );
  }

  Widget _buildGenderCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Gender",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            SizedBox(
              height: 150,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      color: Colors.blue,
                      value: 42,
                      title: 'Male',
                      radius: 50,
                      titleStyle: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    PieChartSectionData(
                      color: Colors.orange,
                      value: 58,
                      title: 'Female',
                      radius: 50,
                      titleStyle: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
