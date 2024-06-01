// ignore_for_file: library_private_types_in_public_api

import 'package:anime_app/src/common/styles/paddings.dart';
import 'package:anime_app/src/futures/settings/logic/language/language_cubit.dart';
import 'package:anime_app/src/futures/settings/logic/theme/theme_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: const Padding(
        padding: Paddings.defaultPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ThemeSwitchWidget(),
            SizedBox(height: 20),
            AnimeTitleLanguageSwitch(),
          ],
        ),
      ),
    );
  }
}

class ThemeSwitchWidget extends StatefulWidget {
  const ThemeSwitchWidget({super.key});

  @override
  State<ThemeSwitchWidget> createState() => _ThemeSwitchWidgetState();
}

class _ThemeSwitchWidgetState extends State<ThemeSwitchWidget> {
  bool isDarkMode = false;

  Future<void> toggleDarkMode(value) async {
    setState(() => isDarkMode = !isDarkMode);
    context.read<ThemeCubit>().changeTheme(isDarkMode: isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Is Dark Mode'),
        BlocBuilder<ThemeCubit, ThemeMode>(
          builder: (context, state) {
            isDarkMode = state == ThemeMode.dark;
            return CupertinoSwitch(
              value: isDarkMode,
              onChanged: toggleDarkMode,
            );
          },
        ),
      ],
    );
  }
}

class AnimeTitleLanguageSwitch extends StatefulWidget {
  const AnimeTitleLanguageSwitch({super.key});

  @override
  _AnimeTitleLanguageSwitchState createState() =>
      _AnimeTitleLanguageSwitchState();
}

class _AnimeTitleLanguageSwitchState extends State<AnimeTitleLanguageSwitch> {
  bool isEnglish = false;

  Future<void> toggleAnimeTitleLanguage(_) async {
    setState(() => isEnglish = !isEnglish);
    context.read<LanguageCubit>().changeAnimeTitleLanguage(
          isEnglish: isEnglish,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Is English'),
        BlocBuilder<LanguageCubit, bool>(
          builder: (context, state) {
            isEnglish = state;

            return CupertinoSwitch(
              value: isEnglish,
              onChanged: toggleAnimeTitleLanguage,
            );
          },
        ),
      ],
    );
  }
}
