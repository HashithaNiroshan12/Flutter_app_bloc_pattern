# flutter_app_bloc_pattern

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

This project is a mobile application that allows users to log in using a social login (Google), view a list of hotels fetched from a URL, and see details of each hotel including its location on a map.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Assumptions Made
- Assumed that the user has Flutter and Dart installed on their machine.
- Assumed that the backend service for fetching data is properly configured and running.
- Assumed that the Google Sign-In credentials are correctly set up in the Firebase console.
- Assumed that the project will be run on a android device/emulator with internet access.
- Assumed that the json images get failed. (HTTP request failed, statusCode: 429)
- Assumed that the images will show after the resolved server error, now show a assests image for that.
- Assumed that the app/gradle file is not issuse with duplicate kotlin versions.

## Improvements Made
- Implemented the BLoC pattern for state management.
- Added functionality for Google Sign-In.
- Included logout functionality that redirects to the login screen.
- Improved UI responsiveness and error handling.
- Enhanced code documentation and added comments for better readability.
- Added New color and text theme for better user Experience.

## Prerequisites
- Flutter SDK: [Installation Guide](https://flutter.dev/docs/get-started/install)
- Dart SDK: Included with Flutter (Flutter 3.22.2)
- Android Studio or Visual Studio Code (or any preferred IDE)
- Firebase Project with Google Sign-In enabled

# How to Test the Project

Fetch Data:

- Run the application.
- The home screen should display data fetched from the provided URL.
- Check for proper data rendering and error handling.

Login View:

- Run the application.
- The login screen should appear.
- Click the "Sign-In with Google" button and authenticate using your Google account.
- After successful login, you should be redirected to the list view.

List View:

- The home screen should display a list of hotels fetched from the provided URL.
- Check for proper data rendering and error handling.

Detail View and Map View:

- Click on any hotel in the list to view its details.
- The detail view should display the hotel's image, title, and description.
- Click the navigation button to open the map view and verify that the hotel's location is correctly marked on the map.

Logout:

- Click the logout button.
- Ensure that you are redirected back to the login screen.

# Install dependencies: 
- flutter pub get

# Configure Firebase:

- Download the google-services.json file from your Firebase console and place it in the android/app directory.

# Run the project:
- flutter run

# Troubleshooting
 If you encounter issues with Google Sign-In, ensure that your google-services.json  files are correctly placed and configured.
 Ensure that your Flutter SDK is up to date.
 Check for any dependency issues by running:
 - flutter doctor


