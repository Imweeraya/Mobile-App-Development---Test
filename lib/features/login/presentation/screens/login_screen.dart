import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    BlocProvider.of<LoginBloc>(context).add(ClearUser());
    super.initState();
  }
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Welcome, ${state.user.firstName}!"),
                backgroundColor: Colors.black,
              ),
            );
            context.replace('/task_board');
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.black,
              ),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(254, 218, 104, 1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 48),
                    Center(
                      child: Image.asset(
                        'lib/assets/images/mango_byte_logo.png',
                        height: 240,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(36),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20),
                            TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 24),
                                labelText: 'Username',
                                labelStyle: TextStyle(
                                  color: Color.fromRGBO(173, 173, 173, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                                filled: true,
                                fillColor: Color.fromRGBO(245, 245, 245, 1),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            TextField(
                              controller: passwordController,
                              obscureText: _isObscure,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(left: 24),
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  color: Color.fromRGBO(173, 173, 173, 1),
                                  fontWeight: FontWeight.bold,
                                ),
                                filled: true,
                                fillColor: Color.fromRGBO(245, 245, 245, 1),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  borderSide: BorderSide.none,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Color.fromRGBO(173, 173, 173, 1),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure = !_isObscure;
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(color: Colors.black54),
                              ),
                            ),
                            SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                ),
                                onPressed: () {
                                  if (emailController.text.trim().isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Please fill in Username",
                                        ),
                                        backgroundColor: Colors.black,
                                      ),
                                    );
                                  } else if (passwordController.text
                                      .trim()
                                      .isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "Please fill in Password",
                                        ),
                                        backgroundColor: Colors.black,
                                      ),
                                    );
                                  } else {
                                    BlocProvider.of<LoginBloc>(context).add(
                                      LoginSubmitted(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      ),
                                    );
                                  }
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        children: [
                          TextSpan(text: "Don't have an account? "),
                          WidgetSpan(
                            child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Sign UP',
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
