# Flutter Demo App (Chat and Chart)

## Project Overview

This Flutter demo application is designed for research and evaluation of Flutter's capabilities for building mobile applications with chat interfaces and data visualization features.

### System Requirements

* **Flutter SDK:** 3.38.1 


* **Android Studio:** Latest version 


* **Android SDK:** 36.1.0 

## Project Structure

The project follows a standard Flutter directory layout:

* **`android/`**: Android native code.
* **`ios/`**: iOS native code.
* **`lib/`**: Main application code.
* **`main.dart`**: Entry point and navigation logic.
* **`models/chat_message.dart`**: Data models for the chat system.
* **`screens/`**: UI screens including `chat_screen.dart` and `chart_screen.dart`.
* **`pubspec.yaml`**: Dependencies and project configuration.

## Implementation Details

### 1. Bottom Navigation

* **Implementation:** Material `BottomNavigationBar` featuring two tabs: Chat and Charts.

* **Key Logic:** Screen switching and active state highlighting are managed within `_MainScreenState`.



### 2. Chat Interface

* **UI Components:** Utilizes `ListView.builder` for efficient message history rendering and a fixed input footer.
* **Logic:** * **Controllers:** Employs `TextEditingController` for input and `ScrollController` for auto-scrolling.
* **Bot Behavior:** Features 15 pre-defined responses triggered with a 500ms "thinking" delay.
* **UX:** Right-aligned blue bubbles represent the User, while left-aligned grey bubbles represent the Bot.

### 3. Data Visualizations

* **Chart Types:**
* **Line & Area Charts:** Display weekly trends with smooth interpolation and dual-series comparisons.
* **Bar & Pie Charts:** Provide monthly comparisons and category distribution with interactive legends.
* **Scatter Chart:** Visualizes X-Y correlation using 50 dynamic data points.
* **Data Handling:**
* **Data Generation:** Randomly generated via Dart `Random` class (range: 10-150).
* **Interactivity:** Features hover tooltips and cross-axis pointers.

## Dependencies

The project primarily uses **`flutter_echarts (^2.5.0)`** for chart rendering.

### Why flutter_echarts?

* Integrates industry-standard Apache ECharts.
* Supports a wide variety of chart types with high-performance rendering.
* Highly customizable, interactive, and well-documented.

### Alternatives Considered

* **`charts_flutter`**: Discarded as it is no longer maintained by Google.
* **`fl_chart`**: Considered good but offered less chart variety.
* **`syncfusion_flutter_charts`**: Requires a license for commercial use.

[Chat Screen](./assets/fluuter_demo_app.webp)