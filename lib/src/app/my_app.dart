import 'package:anime_app/src/components/theme/theme.dart';
import 'package:anime_app/src/futures/auth/logic/authentication/authentication_bloc.dart';
import 'package:anime_app/src/futures/auth/pages/welcome_screen.dart';
import 'package:anime_app/src/futures/home/pages/home_screen.dart';
import 'package:anime_app/src/futures/sign_in/logic/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

class MyApp extends StatelessWidget {
  const MyApp(this.userRepository, {super.key});

  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(userRepository: userRepository),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: themeData,
          home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state.status == AuthenticationStatus.authenticated) {
                return BlocProvider(
                  create: (context) => SignInBloc(
                    userRepository:
                        context.read<AuthenticationBloc>().userRepository,
                  ),
                  child: const HomeScreen(),
                );
              } else {
                return const WelcomeScreen();
              }
            },
          )),
    );
  }
}
