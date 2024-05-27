// ignore_for_file: library_private_types_in_public_api

import 'package:anime_app/src/common/styles/paddings.dart';
import 'package:anime_app/src/futures/anime/widgets/top_anime_list.dart';
import 'package:anime_app/src/views/featured_animes.dart';
import 'package:flutter/material.dart';

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
            // Featured Animes (5)
            SizedBox(
              height: 300,
              child: TopAnimeList(),
            ),

            Padding(
              padding: Paddings.noBottomPadding,
              child: Column(
                children: [
                  // Top Animes
                  SizedBox(
                    height: 350,
                    child: FeaturedAnimes(
                      label: 'Top Ranked',
                      rankingType: 'all',
                    ),
                  ),

                  // Top Popular
                  SizedBox(
                    height: 350,
                    child: FeaturedAnimes(
                      label: 'Top Popular',
                      rankingType: 'bypopularity',
                    ),
                  ),

                  // Top Movies
                  SizedBox(
                    height: 350,
                    child: FeaturedAnimes(
                      label: 'Top Movies',
                      rankingType: 'movie',
                    ),
                  ),

                  // Top Favorited
                  SizedBox(
                    height: 350,
                    child: FeaturedAnimes(
                      label: 'Top Favorited',
                      rankingType: 'favorite',
                    ),
                  ),

                  // Top Upcoming
                  SizedBox(
                    height: 350,
                    child: FeaturedAnimes(
                      label: 'Top Upcoming',
                      rankingType: 'upcoming',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
