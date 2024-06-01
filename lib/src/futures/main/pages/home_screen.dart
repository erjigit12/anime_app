import 'package:anime_app/src/futures/anime/pages/anime_screen.dart';
import 'package:anime_app/src/futures/categoties/pages/categories_screen.dart';
import 'package:anime_app/src/futures/search/pages/search_screen.dart';
import 'package:anime_app/src/futures/settings/pages/settings_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.index});

  final int? index;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    if (widget.index != null) {
      _selectedIndex = widget.index!;
    }
    super.initState();
  }

  final _destinations = [
    const NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
    const NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
    const NavigationDestination(
        icon: Icon(Icons.category), label: 'Categories'),
    const NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
  ];

  final _screens = [
    const AnimeScreen(),
    const SearchScreen(),
    const CategoriesScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('HomeScreen'),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         context.read<SignInBloc>().add(const SignOutRequired());
      //       },
      //       icon: const Icon(Icons.login),
      //     ),
      //   ],
      // ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        elevation: 12,
        backgroundColor: Theme.of(context).dialogBackgroundColor,
        selectedIndex: _selectedIndex,
        destinations: _destinations,
        onDestinationSelected: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
