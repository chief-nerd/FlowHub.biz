import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/api/api_client.dart';
import 'core/db/database_service.dart';
import 'features/auth/data/repositories/auth_repository.dart';
import 'features/sync/data/repositories/goal_repository.dart';
import 'features/sync/data/repositories/todo_repository.dart';
import 'features/sync/data/repositories/work_session_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final databaseService = DatabaseService();
  await databaseService.init();

  final apiClient = ApiClient();
  
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthRepository(apiClient)),
        RepositoryProvider(create: (context) => GoalRepository(databaseService.isar)),
        RepositoryProvider(create: (context) => TodoRepository(databaseService.isar)),
        RepositoryProvider(create: (context) => WorkSessionRepository(databaseService.isar)),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlowHub',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlowHub'),
      ),
      body: const Center(
        child: Text('FlowHub is running'),
      ),
    );
  }
}
