# ParkingApp

## Overview
Smart Parking is a Flutter-based mobile application that allows users to view available parking spots, select one, and proceed to payment.  
The app focuses on providing a comfortable user experience to perform an exhausted process like booking and specially for a car spot, by providing a clean UI-first design with custom widgets, smooth navigation, and modular architecture. making it easy to extend with features like real‑time availability and payment integration.


## Features
-  login/signup option to keep his data.
-  View available parking spots in a grid layout.
-  Custom UI widgets for parking cards and booking forms.
-  Select reservation date and time.
-  showing the available spots for the time and date he choosed
-  preventing choosing unavailable spots by prevent the navigation to the payment screen 
-  Navigate to a payment screen after booking.
-  Booking history for past and upcoming reservations.
-  User profile with vehicle information and saved payment methods.

## Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/saramohamed36/Parking_App.git

2. **Navigate into the project folder**
   ```bash 
     cd parkingapp

3. **Install dependencies**
   ```bash
   flutter pub get

4. **Run the app**
   ```bash
   flutter run

**Prerequisites**
- Install Flutter SDK (latest stable version).
- Ensure you have Android Studio or VS Code with Flutter/Dart plugins.
- Set up an emulator or connect a physical device.

## Folder Structure
parkingapp/
├── android/
├── assets/
│   ├── images/
│   └── icons/
├── ios/
├── lib/
│   ├── Core/
│   │   ├── Routing/
│   │   │   ├── AppRouter.dart
│   │   │   └── Routes.dart
│   │   ├── Theme/
│   │   │   ├── AppAssets.dart
│   │   │   └── ColorManager.dart
│   │   └── Shared_Widgets/
│   │       ├── BottomNav.dart
│   │       └── CustomButton.dart
│   │
│   ├── Features/
│   │   ├── Auth/
│   │   │   ├── Data/
│   │   │   ├── Presentation/
│   │   │   └── View/
│   │   ├── Booking/
│   │   │   ├── Data/
│   │   │   │   └── Models/
│   │   │   ├── Presentation/
│   │   │   │   └── Widgets/
│   │   │   └── View/
│   │   ├── Home/
│   │   │   ├── Data/
│   │   │   ├── Presentation/
│   │   │   │   └── Manager/
│   │   │   └── Widgets/
│   │   ├── MyBooking/
│   │   │   ├── Data/
│   │   │   │   └── Models/
│   │   │   ├── Presentation/
│   │   │   │   └── Manager/
│   │   │   └── Widgets/
│   │   ├── Profile/
│   │   │   ├── Presentation/
│   │   │   │   └── Manager/
│   │   │   └── Widgets/
│   │   └── Splash/
│   │       ├── Presentation/
│   │       │   └── Manager/
│   │       └── View/
│   │
│   └── main.dart
│
├── test/
└── pubspec.yaml


## Tech Stack
- **Flutter** – Cross‑platform UI framework for building mobile apps.
- **Dart** – Programming language used by Flutter.
- **Hive** – Lightweight local database for storing booking history and user data offline.
- **Cubit (Bloc)** – State management solution for handling authentication, booking, and UI states.
- **State Management** – Clean separation of UI and logic using Cubit and custom providers.
- **Adaptive & Responsive UI** – Ensures the app works smoothly across different screen sizes and devices.
- **Firebase Authentication** – Secure user login and signup.
- **Firebase Firestore** – Cloud database for storing user profiles and parking data.
- **API Integration** – Connects to external services for parking availability and other features.
- **Git & GitHub** – Version control and collaboration.
- **Android Studio / VS Code** – Development environments with Flutter/Dart plugins.

## Future Improvements
-  Add user authentication (social login).
-  Real-time parking availability connected to a backend.
-  Payment gateway integration (Stripe, PayPal, etc.).
-  Push notifications for booking reminders.
-  Map-based spot selection with geolocation.
-  Admin dashboard for managing parking spots.
-  Dark mode.
-  Languages option (Arabic, French, Duetch).

## Contributing
Contributions are welcome! If you’d like to improve ParkingApp, please follow these steps:

1. **Fork the repository**  
   Create your own copy of the project.

2. **Create a feature branch**  
   ```bash
   git checkout -b feature-name

3. **Make your changes**  
    Add new features, fix bugs, or improve documentation

4. **Commit your changes**
   ```bash 
   git commit -m "Add new feature"

5. **push to ur branch**
     ```bash
    git push origin feature-name
6.**Open a Pull Request**  
     Submit your changes for review.
