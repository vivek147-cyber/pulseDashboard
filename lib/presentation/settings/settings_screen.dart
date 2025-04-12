import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pulsedashboard/application/provider/sensor_providers.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOffline = ref.watch(simulateOfflineProvider);
    final isMissing = ref.watch(simulateMissingDataProvider);

    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.blueAccent,
          title: const Text(
            'Settings',
            style: TextStyle(color: Colors.white),
          )),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 600,
                height: 240,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 250, 252, 255),
                    border: Border.all(width: 0.5, color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      SwitchListTile(
                        title: const Text("Simulate Offline Sensors"),
                        subtitle: const Text(
                            "Gray bubbles will appear for offline sensors."),
                        value: isOffline,
                        onChanged: (val) => ref
                            .read(simulateOfflineProvider.notifier)
                            .state = val,
                      ),
                      const Divider(),
                      SwitchListTile(
                        title: const Text("Simulate Missing Data"),
                        subtitle: const Text(
                            "Some sensors will have ? placeholders."),
                        value: isMissing,
                        onChanged: (val) => ref
                            .read(simulateMissingDataProvider.notifier)
                            .state = val,
                      ),
                      const Divider(),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () {
                          ref.read(simulateOfflineProvider.notifier).state =
                              false;
                          ref.read(simulateMissingDataProvider.notifier).state =
                              false;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Reset to defaults")),
                          );
                        },
                        icon:
                            const Icon(Icons.restart_alt, color: Colors.white),
                        label: const Text(
                          "Reset All",
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade400,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
