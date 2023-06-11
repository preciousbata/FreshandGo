# Fresh & Go

This project shows a demo for an online fruit juice order business

## Demo

https://github.com/preciousbata/FreshandGo/assets/42701343/19edcaaf-7b54-4bcc-8c69-221f49051844


## Packages

The following packages are used in this project:

### cloud_firestore

**Package description:** The `cloud_firestore` package provides a Flutter plugin that allows communication with the Cloud Firestore database service provided by Firebase. It enables developers to store, retrieve, and sync data in real-time across multiple devices and platforms.

**Usage:**

```dart
dependencies:
  cloud_firestore: ^version_number
```

### get_it

**Package description:** The `get_it` package is a simple service locator for Dart and Flutter projects. It allows for the easy management of dependency injection and provides a way to locate and retrieve instances of registered services or objects.

**Usage:**

```dart
dependencies:
  get_it: ^version_number
```

## Installation

1. Clone the repository:

   ```shell
   git clone https://github.com/your/repository.git
   ```

2. Change to the project directory:

   ```shell
   cd project_directory
   ```

3. Install the required packages:

   ```shell
   flutter pub get
   ```

## Configuration

1. Obtain the necessary credentials for Firebase Cloud Firestore and set up your project on the Firebase console.

2. Configure the Firebase SDK in your Flutter project by following the official Firebase documentation.

3. Add the Firebase configuration file to your project's `android/app/` and `ios/Runner/` directories as mentioned in the Firebase setup instructions.

## Usage

1. Import the necessary packages in your Dart files:

   ```dart
   import 'package:cloud_firestore/cloud_firestore.dart';
   import 'package:get_it/get_it.dart';
   ```

2. Set up the `cloud_firestore` plugin and initialize the Firebase app:

   ```dart
   void main() async {
     WidgetsFlutterBinding.ensureInitialized();
     await Firebase.initializeApp();
   }
   ```

3. Use `get_it` package to register and retrieve services or objects:

   ```dart
   // Register a service
   GetIt locator = GetIt.instance;
   locator.registerSingleton<MyService>(MyService());

   // Retrieve a service
   MyService service = locator<MyService>();
   ```

4. Utilize the `cloud_firestore` package to interact with the Cloud Firestore database:

   ```dart
   // Retrieve a Firestore collection
   CollectionReference usersRef = FirebaseFirestore.instance.collection('users');

   // Add a document to the collection
   usersRef.add({'name': 'John Doe', 'age': 30});

   // Query documents from the collection
   QuerySnapshot snapshot = await usersRef.get();

   // Iterate over the documents
   for (QueryDocumentSnapshot doc in snapshot.docs) {
     print(doc.data());
   }
   ```

## Contributing

Contributions are welcome! If you encounter any issues or would like to suggest improvements, please create a new issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
