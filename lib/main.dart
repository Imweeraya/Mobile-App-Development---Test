import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'core/injection.dart';
import 'features/login/presentation/screens/login_screen.dart';
import 'features/task_board/presentation/screens/task_board_screen.dart';

void main() {
  init(); // Initialize dependency injection
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: router,
    );
  }
}

final GoRouter router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/task_board',
      builder: (context, state) => const TaskBoardScreen(),
    ),
  ],
);
