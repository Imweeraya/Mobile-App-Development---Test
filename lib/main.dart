import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'core/injection.dart';
import 'features/login/domain/usecase/check_login_status_use_case.dart';
import 'features/login/presentation/bloc/login_bloc.dart';
import 'features/login/presentation/screens/login_screen.dart';
import 'features/task_board/presentation/bloc/task_bloc.dart';
import 'features/task_board/presentation/screens/task_board_screen.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  final checkLoginStatus = serviceLocator<CheckLoginStatusUseCase>();
  final isLoggedIn = await checkLoginStatus.execute();

  final initialLocation = isLoggedIn ? '/task_board' : '/login';
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => serviceLocator<LoginBloc>()),
        BlocProvider(create: (context) => serviceLocator<TaskBloc>()),
      ],
      child: MyApp(scaffoldMessengerKey: scaffoldMessengerKey, initialLocation: initialLocation),
    ),
  );
}

class MyApp extends StatelessWidget {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;
  final String initialLocation;

   MyApp({super.key, required this.scaffoldMessengerKey, required this.initialLocation});

  @override
  Widget build(BuildContext context) {
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


late GoRouter router = GoRouter(
  initialLocation: initialLocation,
  routes: [
    GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
    GoRoute(
      path: '/task_board',
      builder: (context, state) => const TaskBoardScreen(),
    ),
  ],
);
}