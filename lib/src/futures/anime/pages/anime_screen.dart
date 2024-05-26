// ignore_for_file: library_private_types_in_public_api

import 'package:anime_app/src/futures/sign_in/logic/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/widgets.dart';

class AnimeScreen extends StatefulWidget {
  const AnimeScreen({super.key});

  @override
  _AnimeScreenState createState() => _AnimeScreenState();
}

class _AnimeScreenState extends State<AnimeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anime World'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: TopAnimeList(),
            ),
          ],
        ),
      ),
    );
  }
}
