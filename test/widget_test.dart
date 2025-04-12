import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulsedashboard/application/provider/sensor_providers.dart';

void main() {
  test('Simulate Offline Toggle works', () {
    final container = ProviderContainer();
    expect(container.read(simulateOfflineProvider), false);

    container.read(simulateOfflineProvider.notifier).state = true;
    expect(container.read(simulateOfflineProvider), true);
  });

  test('Simulate Missing Data Toggle works', () {
    final container = ProviderContainer();
    expect(container.read(simulateMissingDataProvider), false);

    container.read(simulateMissingDataProvider.notifier).state = true;
    expect(container.read(simulateMissingDataProvider), true);
  });
}
