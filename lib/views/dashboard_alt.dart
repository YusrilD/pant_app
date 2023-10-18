import 'package:flutter/material.dart';

import '../shared/donut_chart.dart';

class DashboardAlt extends StatelessWidget {
  const DashboardAlt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Donut Chart Example')),
      body: Center(
        child: CustomPaint(
          size: Size(200, 200),
          painter: DonutChartPainter(value: 0.21, color: Colors.blue),
        ),
      ),
    );
  }
}
