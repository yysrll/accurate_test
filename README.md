# User App

**User App** is a Flutter-based mobile application designed to enhance user interactions with intuitive features and a clean interface. The app leverages modern development practices and state management using Bloc to ensure a seamless user experience.

## Features:
1. Viewing the list of users
2. Searching for the desired user
3. Sorting users by name
4. Filtering users by city
5. Adding a new user

## Technical Stack
- **Flutter**: For building a cross-platform mobile application with a native look and feel.
- **Bloc**: For efficient state management and separation of business logic.
- **Dio**: For handling network requests with robust error handling.
- **Get It**: For dependency injection and service location.
- **Auto Route**: For advanced routing and navigation.
- **Dartz**: For functional programming patterns and handling failures.
- **Equatable**: For simplifying equality comparisons.
- **Injectable**: For dependency injection.
- **JSON Annotation**: For JSON serialization.
- **Skeletonizer**: For creating skeleton screens for loading states.

## Installation
To get started with User App, follow these steps:

### Prerequisites
Ensure you have Flutter installed on your machine. You can download Flutter from [here](https://docs.flutter.dev/get-started/install "here").

### Clone the Repository
```bash
git clone https://github.com/yysrll/accurate_test.git
cd accurate_test
```
### Install Dependencies
```bash
flutter pub get
```
### Generate Code
Some of the libraries used require code generation:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```
### Running the App
Connect a device or start an emulator, then run:
```bash
flutter run
```

## Usage
Here's a brief overview of how to use the app:
#### Viewing Users
When you open the app, you'll see a list of users. You can scroll through the list to view all users.

#### Searching for a User
Use the search bar at the top to find a specific user by name. The list will filter as you type.

#### Sorting Users
You can sort the users by name. Tap on the sort button to toggle between ascending and descending order.

#### Filtering Users by City
Use the filter option to narrow down the users based on their city.

#### Adding a New User
Click on the "Add User" button and fill in the necessary details to add a new user to the list.

### Why a Simple and Clean UI with One Screen for All Features
The decision to build a simple and clean UI with one screen for all features was guided by several key principles:

1. **User Experience**: A single screen interface ensures that users can access all features without navigating through multiple screens. This reduces complexity and makes the app more intuitive and user-friendly.
2. **Efficiency**: By consolidating features into one screen, users can perform actions quickly without the need for excessive navigation. This is particularly beneficial for users who want to accomplish tasks efficiently.
3. **Consistency**: A unified screen design promotes a consistent look and feel across the application. Users become familiar with the layout and interactions, enhancing their overall experience.
4. **Maintainability**: Having all features in one screen simplifies the development and maintenance process. It allows for easier updates and modifications without the need to manage multiple screens.

By focusing on a simple and clean UI with one screen for all features, User App aims to provide a streamlined and efficient user experience that meets the needs of its users in an intuitive manner.