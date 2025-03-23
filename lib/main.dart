import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'core/injection.dart';
import 'features/login/presentation/bloc/login_bloc.dart';
import 'features/login/presentation/screens/login_screen.dart';
import 'features/task_board/presentation/bloc/task_bloc.dart';
import 'features/task_board/presentation/screens/task_board_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => serviceLocator<LoginBloc>()),
        BlocProvider(create: (context) => serviceLocator<TaskBloc>()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("HELLOOOOO6");
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.amber,
          selectionColor:  Color.fromRGBO(254, 218, 104, 1),
          selectionHandleColor: Colors.amber,
        ),
      ),
      routerConfig: router,
    );
  }
}

final GoRouter router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
    GoRoute(
      path: '/task_board',
      builder: (context, state) => const TaskBoardScreen(),
    ),
  ],
);
