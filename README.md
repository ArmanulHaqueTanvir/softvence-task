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
---
![WhatsApp Image 2025-05-21 at 5 45 09 AM (2)](https://github.com/user-attachments/assets/c5609a1d-9025-4c2b-b0ee-a5e16a265f89)

![WhatsApp Image 2025-05-21 at 5 45 09 AM](https://github.com/user-attachments/assets/43694e8e-9494-4d27-ae61-7c68c81bd8f3)

![WhatsApp Image 2025-05-21 at 5 45 09 AM (1)](https://github.com/user-attachments/assets/928a1933-1e57-4636-b695-426648c79cac)

![WhatsApp Image 2025-05-21 at 5 45 10 AM](https://github.com/user-attachments/assets/c457d6a3-033f-49d8-963d-387f880e453f)




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
