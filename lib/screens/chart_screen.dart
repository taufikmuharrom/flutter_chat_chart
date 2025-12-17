import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'dart:math';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  final Random _random = Random();

  // Generate random data for charts
  List<int> _generateRandomData(int count, int max) {
    return List.generate(count, (_) => _random.nextInt(max) + 10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Charts Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildChartCard('Line Chart', _buildLineChart()),
          _buildChartCard('Bar Chart', _buildBarChart()),
          _buildChartCard('Pie Chart', _buildPieChart()),
          _buildChartCard('Area Chart', _buildAreaChart()),
          _buildChartCard('Scatter Chart', _buildScatterChart()),
        ],
      ),
    );
  }

  Widget _buildChartCard(String title, Widget chart) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(height: 300, child: chart),
          ],
        ),
      ),
    );
  }

  Widget _buildLineChart() {
    final data = _generateRandomData(7, 100);

    return Echarts(
      option:
          '''
        {
          tooltip: {
            trigger: 'axis'
          },
          xAxis: {
            type: 'category',
            data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
          },
          yAxis: {
            type: 'value'
          },
          series: [{
            data: ${data.toString()},
            type: 'line',
            smooth: true,
            itemStyle: {
              color: '#5470c6'
            }
          }]
        }
      ''',
    );
  }

  Widget _buildBarChart() {
    final data = _generateRandomData(6, 150);

    return Echarts(
      option:
          '''
        {
          tooltip: {
            trigger: 'axis',
            axisPointer: {
              type: 'shadow'
            }
          },
          xAxis: {
            type: 'category',
            data: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun']
          },
          yAxis: {
            type: 'value'
          },
          series: [{
            data: ${data.toString()},
            type: 'bar',
            itemStyle: {
              color: '#91cc75'
            }
          }]
        }
      ''',
    );
  }

  Widget _buildPieChart() {
    final data = _generateRandomData(5, 100);

    return Echarts(
      option:
          '''
        {
          tooltip: {
            trigger: 'item'
          },
          legend: {
            orient: 'vertical',
            left: 'left'
          },
          series: [{
            name: 'Categories',
            type: 'pie',
            radius: '50%',
            data: [
              { value: ${data[0]}, name: 'Category A' },
              { value: ${data[1]}, name: 'Category B' },
              { value: ${data[2]}, name: 'Category C' },
              { value: ${data[3]}, name: 'Category D' },
              { value: ${data[4]}, name: 'Category E' }
            ],
            emphasis: {
              itemStyle: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
              }
            }
          }]
        }
      ''',
    );
  }

  Widget _buildAreaChart() {
    final data1 = _generateRandomData(7, 100);
    final data2 = _generateRandomData(7, 80);

    return Echarts(
      option:
          '''
        {
          tooltip: {
            trigger: 'axis',
            axisPointer: {
              type: 'cross'
            }
          },
          legend: {
            data: ['Series 1', 'Series 2']
          },
          xAxis: {
            type: 'category',
            data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
          },
          yAxis: {
            type: 'value'
          },
          series: [
            {
              name: 'Series 1',
              data: ${data1.toString()},
              type: 'line',
              areaStyle: {},
              itemStyle: {
                color: '#ee6666'
              }
            },
            {
              name: 'Series 2',
              data: ${data2.toString()},
              type: 'line',
              areaStyle: {},
              itemStyle: {
                color: '#5470c6'
              }
            }
          ]
        }
      ''',
    );
  }

  Widget _buildScatterChart() {
    // Generate random scatter data
    List<List<int>> scatterData = List.generate(
      50,
      (index) => [_random.nextInt(100), _random.nextInt(100)],
    );

    return Echarts(
      option:
          '''
        {
          tooltip: {
            trigger: 'item'
          },
          xAxis: {
            type: 'value',
            scale: true
          },
          yAxis: {
            type: 'value',
            scale: true
          },
          series: [{
            symbolSize: 10,
            data: ${scatterData.toString()},
            type: 'scatter',
            itemStyle: {
              color: '#fac858'
            }
          }]
        }
      ''',
    );
  }
}
