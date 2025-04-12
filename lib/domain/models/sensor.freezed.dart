// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Sensor {
  String get id;
  String get location;
  String get time;
  double get temperature;
  double get humidity;
  double get pressure;
  int get anomaly;

  /// Create a copy of Sensor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SensorCopyWith<Sensor> get copyWith =>
      _$SensorCopyWithImpl<Sensor>(this as Sensor, _$identity);

  /// Serializes this Sensor to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sensor &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.pressure, pressure) ||
                other.pressure == pressure) &&
            (identical(other.anomaly, anomaly) || other.anomaly == anomaly));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, location, time, temperature,
      humidity, pressure, anomaly);

  @override
  String toString() {
    return 'Sensor(id: $id, location: $location, time: $time, temperature: $temperature, humidity: $humidity, pressure: $pressure, anomaly: $anomaly)';
  }
}

/// @nodoc
abstract mixin class $SensorCopyWith<$Res> {
  factory $SensorCopyWith(Sensor value, $Res Function(Sensor) _then) =
      _$SensorCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String location,
      String time,
      double temperature,
      double humidity,
      double pressure,
      int anomaly});
}

/// @nodoc
class _$SensorCopyWithImpl<$Res> implements $SensorCopyWith<$Res> {
  _$SensorCopyWithImpl(this._self, this._then);

  final Sensor _self;
  final $Res Function(Sensor) _then;

  /// Create a copy of Sensor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? location = null,
    Object? time = null,
    Object? temperature = null,
    Object? humidity = null,
    Object? pressure = null,
    Object? anomaly = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _self.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
      pressure: null == pressure
          ? _self.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as double,
      anomaly: null == anomaly
          ? _self.anomaly
          : anomaly // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Sensor implements Sensor {
  const _Sensor(
      {required this.id,
      required this.location,
      required this.time,
      required this.temperature,
      required this.humidity,
      required this.pressure,
      required this.anomaly});
  factory _Sensor.fromJson(Map<String, dynamic> json) => _$SensorFromJson(json);

  @override
  final String id;
  @override
  final String location;
  @override
  final String time;
  @override
  final double temperature;
  @override
  final double humidity;
  @override
  final double pressure;
  @override
  final int anomaly;

  /// Create a copy of Sensor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SensorCopyWith<_Sensor> get copyWith =>
      __$SensorCopyWithImpl<_Sensor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SensorToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sensor &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity) &&
            (identical(other.pressure, pressure) ||
                other.pressure == pressure) &&
            (identical(other.anomaly, anomaly) || other.anomaly == anomaly));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, location, time, temperature,
      humidity, pressure, anomaly);

  @override
  String toString() {
    return 'Sensor(id: $id, location: $location, time: $time, temperature: $temperature, humidity: $humidity, pressure: $pressure, anomaly: $anomaly)';
  }
}

/// @nodoc
abstract mixin class _$SensorCopyWith<$Res> implements $SensorCopyWith<$Res> {
  factory _$SensorCopyWith(_Sensor value, $Res Function(_Sensor) _then) =
      __$SensorCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String location,
      String time,
      double temperature,
      double humidity,
      double pressure,
      int anomaly});
}

/// @nodoc
class __$SensorCopyWithImpl<$Res> implements _$SensorCopyWith<$Res> {
  __$SensorCopyWithImpl(this._self, this._then);

  final _Sensor _self;
  final $Res Function(_Sensor) _then;

  /// Create a copy of Sensor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? location = null,
    Object? time = null,
    Object? temperature = null,
    Object? humidity = null,
    Object? pressure = null,
    Object? anomaly = null,
  }) {
    return _then(_Sensor(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      temperature: null == temperature
          ? _self.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as double,
      humidity: null == humidity
          ? _self.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double,
      pressure: null == pressure
          ? _self.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as double,
      anomaly: null == anomaly
          ? _self.anomaly
          : anomaly // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
