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
|   |   |-- movie_entity.dart
|   |-- repositories/
|   |   |-- movie_repository.dart
|   |-- usecases/
|   |   |-- movie_usecase.dart
|   |-- mappers/
|   |   |-- movie_mapper.dart
|-- data/
|   |-- repositories/
|   |   |-- movie_repository_impl.dart
|   |-- datasources/
|   |   |-- remote/
|   |   |   |-- movie_remote_datasource.dart
|   |   |   |-- client/
|   |   |   |   |-- api_service.dart
|   |   |   |   |-- base_response.dart
|   |   |-- local/
|   |   |   |-- movie_local_datasource.dart
|   |-- models/
|   |   |-- movie_model.dart
|-- di/
|   |-- dependency/
|-- presentation/
|   |-- movie/
|   |   |-- bindings/
|   |   |   |-- movie_binding.dart
|   |   |-- screens/
|   |   |   |-- movie_screen.dart
|   |   |-- controllers/
|   |   |   |-- movie_controller.dart
|   |   |-- states/
|   |   |   |-- movie_state.dart
|   |   |-- intents/
|   |   |   |-- movie_intent.dart
|   |   |-- views/
|   |   |   |-- movie_view.dart
|-- main/
|   |-- dependencies.dart

