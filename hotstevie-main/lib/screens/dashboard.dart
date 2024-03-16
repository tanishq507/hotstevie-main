import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Analytics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

  List<Map<String, dynamic>> inventoryItems = [
    {'name': 'Wheat', 'price': 10.0, 'quantity': 5},
    {'name': 'pickaxe', 'price': 20.0, 'quantity': 3},
    {'name': 'chicken', 'price': 15.0, 'quantity': 7},
    {'name': 'noodles', 'price': 30.0, 'quantity': 2},
    {'name': 'pasta', 'price': 25.0, 'quantity': 4},
  ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('REAL TIME DASHBOARD'),
        ),
        body: Column(
          children: [ 
            const Text("money distribution"),
            Container(
            width: double.infinity,
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: BarChart(
                BarChartData(
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barsSpace: 8,
                      barRods: [
                        BarChartRodData(
                          toY: 2,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barsSpace: 8,
                      barRods: [
                        BarChartRodData(
                          toY: 1,
                          color: Colors.green,
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barsSpace: 8,
                      barRods: [
                        BarChartRodData(
                          toY: 4,
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 3,
                      barsSpace: 8,
                      barRods: [
                        BarChartRodData(
                          toY: 2,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ],
                  borderData: FlBorderData(
              show: true,
            ),
            // titlesData: const FlTitlesData(
            //   show: true,
            //   ),
            ), 
            ), 
            )
            ),
            const Text("List of Items"),
             Expanded(
            child: ListView.builder(
              itemCount: inventoryItems.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(8.0),
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: ${inventoryItems[index]['name']}'),
                      Text('Price: ${inventoryItems[index]['price']}'),
                      Text('Quantity: ${inventoryItems[index]['quantity']}'),
                    ],
                  ),
                );
              },
            ),
          ),
          ],
        ),
  ),
  );
  }
}
