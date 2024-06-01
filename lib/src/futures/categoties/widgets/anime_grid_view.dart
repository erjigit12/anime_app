import 'package:anime_app/src/api/get_anime_by_ranking_type_api.dart';
import 'package:anime_app/src/core/screens/error_screen.dart';
import 'package:anime_app/src/core/widgets/loader.dart';
import 'package:anime_app/src/futures/categoties/widgets/animes_grid_list.dart';
import 'package:anime_app/src/models/anime_category.dart';
import 'package:flutter/material.dart';

class AnimeGridView extends StatelessWidget {
  const AnimeGridView({
    super.key,
    required this.category,
  });

  final AnimeCategory category;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAnimeByRankingTypeApi(
        rankingType: category.rankingType,
        limit: 100,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        }

        if (snapshot.data != null) {
          final animes = snapshot.data;

          return AnimesGridList(
            title: category.title,
            animes: animes!,
          );
        }

        return ErrorScreen(error: snapshot.error.toString());
      },
    );
  }
}
