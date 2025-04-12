// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Sensor _$SensorFromJson(Map<String, dynamic> json) => _Sensor(
      id: json['id'] as String,
      location: json['location'] as String,
      time: json['time'] as String,
      temperature: (json['temperature'] as num).toDouble(),
      humidity: (json['humidity'] as num).toDouble(),
      pressure: (json['pressure'] as num).toDouble(),
      anomaly: (json['anomaly'] as num).toInt(),
    );

Map<String, dynamic> _$SensorToJson(_Sensor instance) => <String, dynamic>{
      'id': instance.id,
      'location': instance.location,
      'time': instance.time,
      'temperature': instance.temperature,
      'humidity': instance.humidity,
      'pressure': instance.pressure,
      'anomaly': instance.anomaly,
    };
