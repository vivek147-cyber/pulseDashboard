import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulsedashboard/application/provider/sensor_providers.dart';
import 'package:pulsedashboard/presentation/dashboard/widgets/common_dropdown.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../data/mock/mock_sensor_detail_data.dart';
import '../../domain/models/sensor_reading.dart';

class DetailsScreen extends ConsumerStatefulWidget {
  const DetailsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends ConsumerState<DetailsScreen> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      activationMode:
          ActivationMode.singleTap, // Ensures tooltip appears on tap
      tooltipPosition: TooltipPosition.auto, // Keeps it close to data points

      format: 'point.x : point.y', // You can customize this format
      builder: (data, point, series, pointIndex, seriesIndex) {
        return Container(
          width: 150, // Set max width
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
              ),
            ],
          ),
          child: Text(
            'X-axis: ${point.x} \n Y-axis: ${point.y}',

            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
            overflow: TextOverflow.ellipsis, // Avoid overflow
            maxLines: 10, // Set max lines to avoid overflow
          ),
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedMetric = ref.watch(detailsMetricProvider);

    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.blueAccent,
          title: const Text(
            'Sensor Details',
            style: TextStyle(color: Colors.white),
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 2,
              child: ListTile(
                title: const Text("Sensor ID: Sensor 1"),
                subtitle: const Text("Location: Line A"),
                trailing: Chip(
                  label: const Text("Anomaly: 25%"),
                  backgroundColor: Colors.yellow,
                ),
              ),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: SfCartesianChart(
                tooltipBehavior: _tooltipBehavior,
                title: ChartTitle(text: 'Temperature Over Time'),
                primaryXAxis: CategoryAxis(title: AxisTitle(text: "Time")),
                primaryYAxis: NumericAxis(title: AxisTitle(text: "°C")),
                series: <LineSeries<SensorReading, String>>[
                  LineSeries<SensorReading, String>(
                    dataSource: mockSensorReadings,
                    xValueMapper: (r, _) => r.time,
                    yValueMapper: (r, _) => r.temperature,
                    markerSettings: const MarkerSettings(isVisible: true),
                  ),
                ],
              ),
            ),

             const SizedBox(height: 16),

            SizedBox(
              width: 250,
              child: CommonDropdown(
                textFieldName: 'Select metric type',
                labelTextName: 'Select metric',
                list: ['humidity', 'pressure'],
                isFullLength: true,
                onChanged: (String? value) async {
                  ref.read(detailsMetricProvider.notifier).state = value ?? '';
                },
                isAlreadyFilled: false,
                status: '',
                errorMessage: null,
                remarks: '',
              ),
            ),

             const SizedBox(height: 16),

            Expanded(
              child: SfCartesianChart(
                tooltipBehavior: _tooltipBehavior,
                title: ChartTitle(
                    text: '${selectedMetric.capitalize()} Over Time'),
                primaryXAxis: CategoryAxis(title: AxisTitle(text: "Time")),
                primaryYAxis: NumericAxis(),
                series: <ColumnSeries<SensorReading, String>>[
                  ColumnSeries<SensorReading, String>(
                    dataSource: mockSensorReadings,
                    xValueMapper: (r, _) => r.time,
                    yValueMapper: (r, _) =>
                        selectedMetric == 'humidity' ? r.humidity : r.pressure,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Anomaly Legend
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _LegendDot(color: Colors.green, label: "0% (Normal)"),
                _LegendDot(color: Colors.yellow, label: "1–50% (Warning)"),
                _LegendDot(color: Colors.red, label: "51–100% (Critical)"),
                _LegendDot(color: Colors.grey, label: "Offline"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _LegendDot extends StatelessWidget {
  final Color color;
  final String label;
  const _LegendDot({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 6, backgroundColor: color),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

extension on String {
  String capitalize() => "${this[0].toUpperCase()}${substring(1)}";
}
