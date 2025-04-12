import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/mock/mock_sensor_data.dart';
import '../../domain/models/sensor.dart';

final sensorListProvider = Provider<List<Sensor>>((ref) => mockSensorData);

final selectedXAxisProvider = StateProvider<String>((ref) => 'time');
final selectedSizeMetricProvider = StateProvider<String>((ref) => 'humidity');

final detailsMetricProvider = StateProvider<String>((ref) => 'humidity');


final simulateOfflineProvider = StateProvider<bool>((ref) => false);
final simulateMissingDataProvider = StateProvider<bool>((ref) => false);




