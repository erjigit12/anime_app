// ignore_for_file: library_private_types_in_public_api

import 'package:anime_app/src/futures/categoties/widgets/anime_grid_view.dart';
import 'package:anime_app/src/models/anime_category.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final _animeTabs = animeCategories
      .map(
        (animeCategory) => Tab(text: animeCategory.title),
      )
      .toList();

  final _screens = animeCategories
      .map(
        (animeCategory) => AnimeGridView(category: animeCategory),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Anime Categories'),
          bottom: TabBar(
            tabs: _animeTabs,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 3,
            indicatorColor: Colors.red,
            labelColor: Colors.red,
          ),
        ),
        body: TabBarView(children: _screens),
      ),
    );
  }
}
