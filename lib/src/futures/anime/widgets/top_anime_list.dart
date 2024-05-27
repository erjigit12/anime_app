import 'package:anime_app/src/api/get_anime_by_ranking_type_api.dart';
import 'package:anime_app/src/core/screens/error_screen.dart';
import 'package:anime_app/src/futures/anime/widgets/top_animes_image_slider.dart';
import 'package:anime_app/src/core/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TopAnimeList extends StatelessWidget {
  const TopAnimeList({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAnimeByRankingTypeApi(rankingType: 'all', limit: 5),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        }

        if (snapshot.data != null) {
          final animes = snapshot.data!.toList();
          // return data
          return TopAnimesImageSlider(animes: animes);
        }

        return ErrorScreen(error: snapshot.error.toString());
      },
    );
  }
}
