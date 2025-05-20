# ⏰ Flutter Alarm App (Softvence Task)

A simple and elegant Alarm App built with Flutter as part of the interview competition task for **Softvence**.  
This app allows users to set alarms, manage them, and use real-time location features — all built with modern Flutter architecture using **GetX** state management.

---

## 🚀 Features

- 📱 Onboarding screen with smooth page indicator
- ⏰ Add and manage alarms with custom time and date
- 🔕 Turn off alarms and receive local notifications
- 📍 Get user's current location using permissions
- 📌 Show selected location on a new screen
- 💾 Store alarm data locally using shared preferences
- 🔄 Fully reactive UI powered by GetX

---

## 🛠️ Tech Stack & Packages Used

| Package                    | Purpose                                                                 |
|---------------------------|-------------------------------------------------------------------------|
| `flutter`                 | Base SDK for cross-platform development                                 |
| `getx`                    | Lightweight state management, routing, and dependency injection         |
| `intl`                    | Date/time formatting and parsing                                        |
| `permission_handler`      | Request and manage user permissions (location access)                   |
| `geolocator`, `geocoding` | Fetch user’s real-time location and convert coordinates to address      |
| `shared_preferences`      | Local storage to persist alarm and onboarding state                     |
| `flutter_local_notifications` | Send and schedule local notifications for alarms                  |
| `smooth_page_indicator`   | Beautiful indicators for onboarding screens                             |

---

## 🖼️ Screenshots

_Add screenshots here if available (optional but recommended)._

---

## 🧪 Getting Started

### Prerequisites

- Flutter SDK
- Android Studio / VS Code
- Android device or emulator

### Run the project

```bash
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
flutter pub get
flutter run
