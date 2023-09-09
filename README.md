# flutterbasecode

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

lib/
|-- main.dart
|-- core/
|   |-- routes/
|   |   |-- app_pages.dart
|   |   |-- app_routes.dart
|   |-- utils/
|-- domain/
|   |-- entities/
|   |   |-- counter_entity.dart
|   |-- repositories/
|   |   |-- counter_repository.dart
|   |-- usecases/
|   |   |-- counter_usecase.dart
|   |-- mappers/
|   |   |-- counter_mapper.dart
|-- data/
|   |-- repositories/
|   |   |-- counter_repository_impl.dart
|   |-- datasources/
|   |   |-- remote/
|   |   |   |-- counter_remote_datasource.dart
|   |   |-- local/
|   |   |   |-- counter_local_datasource.dart
|   |-- models/
|   |   |-- counter_model.dart
|-- presentation/
|   |-- counter/
|   |   |-- screens/
|   |   |   |-- counter_screen.dart
|   |   |-- controllers/
|   |   |   |-- counter_controller.dart
|   |   |-- state/
|   |   |   |-- counter_state.dart
|   |   |-- intents/
|   |   |   |-- counter_intents.dart
|   |   |-- views/
|   |   |   |-- counter_view.dart
|   |   |-- counter.dart
|-- main/
|   |-- dependencies.dart

