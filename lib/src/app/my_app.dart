import 'package:anime_app/src/config/theme/theme.dart';
import 'package:anime_app/src/futures/auth/logic/authentication/authentication_bloc.dart';
import 'package:anime_app/src/futures/auth/pages/welcome_screen.dart';
import 'package:anime_app/src/futures/main/pages/home_screen.dart';
import 'package:anime_app/src/futures/settings/logic/language/language_cubit.dart';
import 'package:anime_app/src/futures/settings/logic/theme/theme_cubit.dart';
import 'package:anime_app/src/futures/sign_in/logic/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

class MyApp extends StatelessWidget {
  const MyApp(this.userRepository, {super.key});

  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthenticationBloc(userRepository: userRepository),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider(
          create: (context) => LanguageCubit(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(
              userRepository:
                  context.read<AuthenticationBloc>().userRepository),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          final themeMode = state;
          return MaterialApp(
              themeMode: themeMode,
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
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
              ));
        },
      ),
    );
  }
}
