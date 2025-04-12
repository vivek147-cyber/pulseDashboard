import '../../domain/models/sensor.dart';

final mockSensorData = [
  Sensor(
    id: '1',
    location: 'Line A',
    time: '08:00',
    temperature: 30,
    humidity: 55,
    pressure: 1013,
    anomaly: 0,
  ),
  Sensor(
    id: '2',
    location: 'Line B',
    time: '09:00',
    temperature: 36,
    humidity: 60,
    pressure: 1009,
    anomaly: 25,
  ),
  Sensor(
    id: '3',
    location: 'Line C',
    time: '10:00',
    temperature: 28,
    humidity: 50,
    pressure: 1011,
    anomaly: 75,
  ),
  Sensor(
    id: '4',
    location: 'Line A',
    time: '11:00',
    temperature: 35,
    humidity: 40,
    pressure: 1000,
    anomaly: -1, 
  ),
];
