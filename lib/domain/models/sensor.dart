import 'package:freezed_annotation/freezed_annotation.dart';

part 'sensor.freezed.dart';
part 'sensor.g.dart';

@freezed
abstract class Sensor with _$Sensor {
  const factory Sensor({
    required String id,
    required String location,
    required String time,
    required double temperature,
    required double humidity,
    required double pressure,
    required int anomaly,
  }) = _Sensor;

  factory Sensor.fromJson(Map<String, dynamic> json) => _$SensorFromJson(json);
}
