# 📊 Pulseboard Dashboard

A responsive Flutter web dashboard visualizing real-time IoT sensor data using advanced bubble charts. Built with **Riverpod** for scalable state management and **Syncfusion Charts** for interactive data visualization.

---

🌐 Live Flutter Project: https://pulsedashboard-0765-4pesa8h-vivek147-cyber.globeapp.dev/

## 🚀 Getting Started

### ✅ Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (version 3.27.2 or later recommended)
- Chrome browser (for running the web version)
- Enable Flutter Web support:

```bash
flutter config --enable-web
📦 Install Dependencies
From the root directory, run:
flutter pub get

▶️ Run the Project
To run in the Chrome browser:
flutter run -d chrome


🧪 Running Tests
To execute all unit and widget tests:
flutter test
Test files should be placed inside the /test folder and follow the naming convention *_test.dart.

📁 Folder Structure
lib/
├── application/
│   └── provider/
│       └── sensor_providers.dart      # Riverpod providers for state and toggles
│
├── domain/
│   └── models/
│       └── sensor.dart                # Sensor model class
│
├── presentation/
│   ├── dashboard/
│   │   ├── dashboard_screen.dart      # Main dashboard UI
│   │   └── widgets/
│   │       └── common_dropdown.dart   # Reusable dropdown widget
│
├── main.dart                          # Application entry point


🎨 Design Decisions
Riverpod is used for state management due to its simplicity, testability, and modular design.

Syncfusion Flutter Charts is used for building bubble charts with tooltips and data mapping.

Dropdowns are extracted into CommonDropdown widgets for reusability and separation of concerns.

Tooltips are enhanced to display all relevant sensor details clearly on interaction.

Legends are manually built below the chart for clarity and color-coded context.

📊 Chart Legends
Below the chart, the following manual legends are displayed to represent data meaningfully:

Color	Description
🟢 Green	Normal sensor
🟡 Yellow	Mild anomaly
🔴 Red	Severe anomaly
⚪ Grey	Offline sensor
❓ Question Mark	Missing data

🛠 Features
Toggle X-Axis type: Time or Location

Choose bubble size metric: Humidity or Pressure

Interactive tooltips showing all sensor data

Simulate Offline Mode and Missing Data for testing edge cases

Responsive layout and color-coded data points

Clean and modular code architecture
