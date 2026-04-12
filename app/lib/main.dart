import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'core/api/api_client.dart';
import 'core/db/app_database.dart';
import 'features/auth/data/repositories/auth_repository.dart';
import 'features/sync/data/repositories/goal_repository.dart';
import 'features/sync/data/repositories/todo_repository.dart';
import 'features/sync/data/repositories/work_session_repository.dart';
import 'features/sync/data/repositories/tag_repository.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'shared/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final db = AppDatabase();

  final apiClient = ApiClient();
  
  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthRepository(apiClient)),
        RepositoryProvider(create: (context) => GoalRepository(db)),
        RepositoryProvider(create: (context) => TodoRepository(db)),
        RepositoryProvider(create: (context) => WorkSessionRepository(db)),
        RepositoryProvider(create: (context) => TagRepository(db)),
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
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
