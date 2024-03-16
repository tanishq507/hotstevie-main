import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hotstevie/screens/AddItem.dart';
import 'package:hotstevie/screens/custom_drop_down.dart';
import 'package:hotstevie/screens/plants_card.dart';
import 'package:hotstevie/screens/seed_card.dart';
import 'package:hotstevie/screens/tool_card.dart';
import 'package:hotstevie/screens/webview_page.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  "Namaste, Kisan",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 34,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddNewObjScreen()),
                    );
                    // Handle button press
                  },
                  child: Text('Add item'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage2()),
                    );
                    // Handle button press
                  },
                  child: Text('View Products'),
                ),
                Text(
                  "Balance your world",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 40),
                CustomDropDown(),
              ],
            ),
          ),
          SizedBox(height: 20), // Added space for better scrolling
          PlantsCard(),
          SizedBox(height: 20), // Added space for better scrolling
          SeedCard(),
          SizedBox(height: 20),
          ToolCard(),
          SizedBox(height: 20),
          // Added space for better scrolling
          SizedBox(
            height: 250,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: LineChart(mainData()),
            ),
          ),
          SizedBox(height: 20), // Added space for better scrolling
        ],
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: const FlGridData(
          show: true, drawHorizontalLine: false, drawVerticalLine: false),
      titlesData: const FlTitlesData(show: false),
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

List<Color> gradientColors = [Colors.white, Colors.white];
