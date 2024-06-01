// ignore_for_file: library_private_types_in_public_api

import 'package:anime_app/src/api/get_anime_by_search_api.dart';
import 'package:anime_app/src/common/styles/paddings.dart';
import 'package:anime_app/src/futures/anime/widgets/anime_list_tile.dart';
import 'package:anime_app/src/models/anime.dart';
import 'package:anime_app/src/models/anime_node.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50),
            const Text(
              'Search for animes',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () {
                showSearch(context: context, delegate: AnimeSearchDelegate());
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  height: 70,
                  color: Colors.grey[300],
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(50, 10, 20, 10),
                      child: Text(
                        'Search',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimeSearchDelegate extends SearchDelegate<List<AnimeNode>> {
  Iterable<Anime> animes = [];

  Future searchAnime(String query) async {
    final animes = await getAnimesbySearchApi(query: query);

    this.animes = animes.toList();
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, []);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    searchAnime(query);
    return _buildSearchResults(context);
  }

  Widget _buildSearchResults(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Text('Enter search query'),
      );
    } else {
      return FutureBuilder<Iterable<Anime>>(
        future: getAnimesbySearchApi(query: query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final animes = snapshot.data ?? [];
            return SearchResultView(animes: animes);
          }
        },
      );
    }
  }
}

class SearchResultView extends StatelessWidget {
  const SearchResultView({super.key, required this.animes});

  final Iterable<Anime> animes;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Paddings.defaultPadding,
      child: ListView.builder(
        itemCount: animes.length,
        itemBuilder: (context, index) {
          final anime = animes.elementAt(index);

          return AnimeListTile(anime: anime);
        },
      ),
    );
  }
}
