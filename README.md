# Flutter Mobile App Test

This is a simple Flutter app that allows users to log in and view their tasks by interacting with the provided API. The app includes two main screens: a **Login Screen** and a **Task Board Screen**.

## Features

- **Login Screen**: Allows the user to log in with their email and password using the provided API.
- **Task Display Screen**: After successful login, displays the user's tasks in a list format.
- **Session Expiry Handling**: If the session expires, the app will automatically redirect the user to the login screen.
- **Log Out**: on the task board screen user can log out by clicking on their profile to see their details and pressing the log out button.

## Dependencies and Required Versions

The following dependencies are required to build and run this Flutter project:

### Flutter
- **Version**: 3.29.2 (Stable Channel)
- **Installation**: Follow the installation instructions at [Flutter Install](https://flutter.dev/docs/get-started/install).

### Dart
- **Version**: 2.17.0 or higher (bundled with Flutter)
- **Installation**: Dart is automatically installed when you install Flutter.

### Android SDK
- **Version**: 34.0.0 or higher
- **Installation**: Install the Android SDK as part of the Android Studio installation process.


## Project Setup Instructions

1. **Clone the repository**:
    git clone https://github.com/Imweeraya/Mobile-App-Development---Test.git
2. **Install dependencies**:
    flutter pub get

## Usage

1. **Open the project in your preferred IDE (e.g., Visual Studio Code or Android Studio).**
2. **Make sure the emulator is running or a physical device is connected**.
    - **Suggested Emulator**: Use the **Pixel 4 API** emulator for testing the app. You can create and configure it in Android Studio:
        - Open Android Studio.
        - Go to **Tools > AVD Manager**.
        - Create a new virtual device and select **Pixel 4** as the device, and choose the **API level** that matches your target SDK.
        - Start the emulator and make sure it's running before running the app.
3. **Run the app**:
   flutter run

