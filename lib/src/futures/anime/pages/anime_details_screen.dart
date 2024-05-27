import 'package:anime_app/src/api/get_anime_details_api.dart';
import 'package:anime_app/src/common/extentions/extentions.dart';
import 'package:anime_app/src/common/styles/paddings.dart';
import 'package:anime_app/src/core/screens/error_screen.dart';
import 'package:anime_app/src/futures/anime/widgets/info_text.dart';
import 'package:anime_app/src/models/anime_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/widgets.dart';

class AnimeDetailsScreen extends StatelessWidget {
  const AnimeDetailsScreen({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAnimeDetailsApi(id: id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        }

        if (snapshot.data != null) {
          final anime = snapshot.data;

          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Image
                  _buildAnimeImageWidget(
                    imageUrl: anime!.mainPicture.large,
                  ),

                  Padding(
                    padding: Paddings.defaultPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Anime Tile
                        _buildAnimeTitle(
                          name: anime.title,
                          englishName: anime.alternativeTitles.en,
                        ),

                        const SizedBox(height: 20),

                        // Description
                        ReadMoreText(longText: anime.synopsis),

                        const SizedBox(height: 10),

                        // Anime Info
                        _buildAnimeInfo(anime: anime),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return ErrorScreen(error: snapshot.error.toString());
      },
    );
  }

  _buildAnimeImageWidget({
    required String imageUrl,
  }) =>
      Stack(
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            height: 400,
            width: double.infinity,
          ),
          Positioned(
            top: 30,
            left: 20,
            child: Builder(
              builder: (context) {
                return IosBackButton(
                  onPressed: Navigator.of(context).pop,
                );
              },
            ),
          ),
        ],
      );

  Widget _buildAnimeTitle({
    required String name,
    required String englishName,
  }) =>
      Builder(
        builder: (context) {
          return Text(
            englishName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).primaryColor,
            ),
          );
        },
      );

  Widget _buildAnimeInfo({
    required AnimeDetails anime,
  }) {
    String studios = anime.studios.map((studio) => studio.name).join(', ');
    String genres = anime.genres.map((genre) => genre.name).join(', ');
    String otherNames =
        anime.alternativeTitles.synonyms.map((title) => title).join(', ');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InfoText(label: 'Genres: ', info: genres),
        InfoText(label: 'Start date: ', info: anime.startDate),
        InfoText(label: 'End date: ', info: anime.endDate),
        InfoText(label: 'Episodes: ', info: anime.numEpisodes.toString()),
        InfoText(
          label: 'Average Episode Duration: ',
          info: anime.averageEpisodeDuration.toMinute(),
        ),
        InfoText(label: 'Status: ', info: anime.status),
        InfoText(label: 'Rating: ', info: anime.rating),
        InfoText(label: 'Studios: ', info: studios),
        InfoText(label: 'Other Names: ', info: otherNames),
        InfoText(label: 'English Names: ', info: anime.alternativeTitles.en),
        InfoText(label: 'Japanese Names: ', info: anime.alternativeTitles.ja),
      ],
    );
  }
}