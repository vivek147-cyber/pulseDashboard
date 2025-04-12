import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulsedashboard/application/provider/sensor_providers.dart';
import 'package:pulsedashboard/presentation/dashboard/widgets/common_dropdown.dart';
import 'package:pulsedashboard/presentation/dashboard/widgets/legend.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../domain/models/sensor.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
      tooltipPosition: TooltipPosition.auto,
      format: 'point.x : point.y',
      builder: (data, point, series, pointIndex, seriesIndex) {
        return Container(
          width: 150,
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
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
          ),
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final sensors = ref.watch(sensorListProvider);
    final xAxisType = ref.watch(selectedXAxisProvider);
    final sizeMetric = ref.watch(selectedSizeMetricProvider);

    final simulateOffline = ref.watch(simulateOfflineProvider);
    final simulateMissing = ref.watch(simulateMissingDataProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Pulseboard Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/details');
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 215, 235, 252),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.bar_chart,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          'Details',
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/settings');
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 215, 235, 252),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          'Settings',
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: CommonDropdown(
                    textFieldName: 'Select X-axis type',
                    labelTextName: 'X-axis',
                    list: ['time', 'location'],
                    isFullLength: true,
                    onChanged: (String? value) async {
                      ref.read(selectedXAxisProvider.notifier).state =
                          value ?? '';
                    },
                    isAlreadyFilled: false,
                    status: '',
                    errorMessage: null,
                    remarks: '',
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: CommonDropdown(
                    textFieldName: 'Select size type',
                    labelTextName: 'Size type',
                    list: ['humidity', 'pressure'],
                    isFullLength: true,
                    onChanged: (String? value) async {
                      ref.read(selectedSizeMetricProvider.notifier).state =
                          value ?? '';
                    },
                    isAlreadyFilled: false,
                    status: '',
                    errorMessage: null,
                    remarks: '',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Chart
            Expanded(
              child: SfCartesianChart(
                tooltipBehavior: _tooltipBehavior,
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(minimum: 0, maximum: 100),
                series: <BubbleSeries<Sensor, String>>[
                  BubbleSeries<Sensor, String>(
                    dataSource: sensors.map((sensor) {
                      if (simulateOffline && sensor.anomaly != -1) {
                        return sensor.copyWith(anomaly: -1);
                      }

                      if (simulateMissing) {
                        return sensor.copyWith(
                          temperature: sensor.temperature.isNaN
                              ? sensor.temperature
                              : double.nan,
                          humidity: sensor.humidity.isNaN
                              ? sensor.humidity
                              : double.nan,
                        );
                      }

                      return sensor;
                    }).toList(),
                    xValueMapper: (s, _) =>
                        xAxisType == 'time' ? s.time : s.location,
                    yValueMapper: (s, _) =>
                        s.temperature.isNaN ? 0 : s.temperature,
                    sizeValueMapper: (s, _) => sizeMetric == 'humidity'
                        ? (s.humidity.isNaN ? 0 : s.humidity)
                        : (s.pressure.isNaN ? 0 : s.pressure),
                    pointColorMapper: (s, _) => _getAnomalyColor(s.anomaly),
                    dataLabelMapper: (s, _) {
                      if (s.anomaly == -1) return '?';
                      if (s.temperature.isNaN ||
                          s.humidity.isNaN ||
                          s.pressure.isNaN) return '?';
                      return '';
                    },
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            Wrap(
              spacing: 24,
              runSpacing: 12,
              children: [
                buildLegendItem(
                    color: Colors.green, label: 'Normal (Anomaly ≤ 0)'),
                buildLegendItem(
                    color: Colors.yellow,
                    label: 'Mild Anomaly (0 < Anomaly ≤ 50)'),
                buildLegendItem(
                    color: Colors.red, label: 'Severe Anomaly (Anomaly > 50)'),
                buildLegendItem(color: Colors.grey, label: 'Offline / Unknown'),
                buildLegendItem(
                    color: Colors.blue, label: 'Temperature Bubble (Y-axis)'),
                buildLegendItem(
                    color: Colors.blueAccent,
                    label:
                        'Size by ${sizeMetric == 'humidity' ? 'Humidity' : 'Pressure'}'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getAnomalyColor(int anomaly) {
    if (anomaly == -1) return Colors.grey;
    if (anomaly <= 0) return Colors.green;
    if (anomaly <= 50) return Colors.yellow;
    return Colors.red;
  }
}
