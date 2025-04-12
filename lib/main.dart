import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/dashboard/dashboard_screen.dart';
import 'presentation/details/details_screen.dart';
import 'presentation/settings/settings_screen.dart';

void main() {
  runApp(const ProviderScope(child: PulseApp()));
}

class PulseApp extends StatelessWidget {
  const PulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pulseboard',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardScreen(),
        '/details': (context) => const DetailsScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
